#!/usr/bin/env python3
"""Local-first AI Crew dispatcher with bounded multi-agent conversations.

No secret values are stored or logged. Provider keys and the Mattermost bot
token are read from named environment variables at call time.
"""

from __future__ import annotations

import argparse
import hmac
import hashlib
import json
import os
import re
import sqlite3
import sys
import threading
import time
import urllib.error
import urllib.parse
import urllib.request
import uuid
from dataclasses import dataclass
from contextlib import closing
from datetime import datetime, timezone
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer
from pathlib import Path
from typing import Any


PROJECT_DIR = Path(__file__).resolve().parent.parent
DEFAULT_CONFIG = PROJECT_DIR / "config.json"
EXAMPLE_CONFIG = PROJECT_DIR / "config.example.json"


def utc_now() -> str:
    return datetime.now(timezone.utc).isoformat()


def canonical_json(value: Any) -> str:
    return json.dumps(value, ensure_ascii=False, sort_keys=True, separators=(",", ":"))


def sha256_json(value: Any) -> str:
    return hashlib.sha256(canonical_json(value).encode("utf-8")).hexdigest()


def sanitize_error_detail(detail: str) -> str:
    """Remove credential-like material before an error reaches logs/receipts."""
    detail = re.sub(r"\bsk-[A-Za-z0-9_*.-]{8,}\b", "[REDACTED_API_KEY]", detail)
    detail = re.sub(r"(?i)(api[_ -]?key|token|authorization)(\s*[:=]\s*)[^\s,}\"]+",
                    r"\1\2[REDACTED]", detail)
    return detail[:1000]


def load_config(path: Path) -> dict[str, Any]:
    source = path if path.is_file() else EXAMPLE_CONFIG
    return json.loads(source.read_text(encoding="utf-8"))


class DispatchError(RuntimeError):
    pass


class DispatchRejected(DispatchError):
    pass


class StoppedError(DispatchError):
    pass


@dataclass
class ProviderResult:
    text: str
    provider_request_id: str | None = None
    usage: dict[str, Any] | None = None


@dataclass(frozen=True)
class Policy:
    policy_version: str
    webhook_secret: str
    allowed_agents: frozenset[str]
    allowed_channels: frozenset[str]
    allowed_workspaces: frozenset[str]
    allowed_capabilities: frozenset[str] = frozenset({"read", "write-draft"})
    freshness_seconds: int = 300


@dataclass
class LegacyTask:
    task_id: str
    agent_id: str
    root_post_id: str


@dataclass
class LegacyResult:
    status: str
    summary: str
    estimated_cost_usd: float
    result_sha256: str
    previous_receipt_sha256: str | None


def sign_event(secret: str, timestamp: str, raw: bytes) -> str:
    return hmac.new(secret.encode("utf-8"), timestamp.encode("ascii") + b"." + raw,
                    hashlib.sha256).hexdigest()


class FakeProvider:
    def invoke(self, agent: str, text: str) -> str:
        return f"FAKE[{agent}] received {len(text)} characters: {text[:120]}"


class InMemoryMattermost:
    def __init__(self) -> None:
        self.posts: list[dict[str, str]] = []

    def post(self, channel_id: str, root_post_id: str, message: str) -> str:
        self.posts.append({"channel_id": channel_id, "root_post_id": root_post_id,
                           "message": message})
        return f"fake-post-{len(self.posts)}"


class Store:
    def __init__(self, data_dir: Path):
        data_dir.mkdir(parents=True, exist_ok=True)
        self.data_dir = data_dir
        self.stop_file = data_dir / "STOP_ALL"
        self.db_path = data_dir / "dispatcher.sqlite3"
        self._lock = threading.Lock()
        with closing(self.connect()) as db:
            db.executescript(
                """
                PRAGMA journal_mode=WAL;
                CREATE TABLE IF NOT EXISTS tasks (
                    task_id TEXT PRIMARY KEY,
                    created_at TEXT NOT NULL,
                    recipient TEXT NOT NULL,
                    origin TEXT NOT NULL,
                    root_post_id TEXT,
                    status TEXT NOT NULL,
                    input_sha256 TEXT NOT NULL,
                    output_sha256 TEXT,
                    error TEXT
                );
                CREATE TABLE IF NOT EXISTS receipts (
                    seq INTEGER PRIMARY KEY AUTOINCREMENT,
                    task_id TEXT NOT NULL,
                    completed_at TEXT NOT NULL,
                    payload_json TEXT NOT NULL,
                    previous_sha256 TEXT,
                    receipt_sha256 TEXT NOT NULL
                );
                CREATE TABLE IF NOT EXISTS seen_events (
                    event_id TEXT PRIMARY KEY,
                    seen_at TEXT NOT NULL
                );
                CREATE TABLE IF NOT EXISTS state (
                    key TEXT PRIMARY KEY,
                    value TEXT NOT NULL
                );
                """
            )

    def connect(self) -> sqlite3.Connection:
        return sqlite3.connect(self.db_path, timeout=10, isolation_level=None)

    def stopped(self) -> bool:
        return self.stop_file.exists()

    def stop_all(self, reason: str) -> None:
        self.stop_file.write_text(f"{utc_now()}\n{reason.strip()}\n", encoding="utf-8")

    def resume(self) -> None:
        if self.stop_file.exists():
            self.stop_file.unlink()

    def remember_event(self, event_id: str) -> bool:
        with self._lock, closing(self.connect()) as db:
            try:
                db.execute(
                    "INSERT INTO seen_events(event_id, seen_at) VALUES (?, ?)",
                    (event_id, utc_now()),
                )
                return True
            except sqlite3.IntegrityError:
                return False

    def create_task(self, task_id: str, recipient: str, origin: str,
                    root_post_id: str | None, text: str) -> None:
        with self._lock, closing(self.connect()) as db:
            db.execute(
                "INSERT INTO tasks VALUES (?, ?, ?, ?, ?, ?, ?, NULL, NULL)",
                (task_id, utc_now(), recipient, origin, root_post_id, "running",
                 hashlib.sha256(text.encode("utf-8")).hexdigest()),
            )

    def finish_task(self, task_id: str, result: dict[str, Any], status: str = "completed",
                    error: str | None = None) -> dict[str, Any]:
        completed_at = utc_now()
        output_hash = sha256_json(result)
        with self._lock, closing(self.connect()) as db:
            previous = db.execute(
                "SELECT receipt_sha256 FROM receipts ORDER BY seq DESC LIMIT 1"
            ).fetchone()
            previous_hash = previous[0] if previous else None
            receipt_payload = {
                "task_id": task_id,
                "status": status,
                "completed_at": completed_at,
                "output_sha256": output_hash,
                "previous_receipt_sha256": previous_hash,
            }
            receipt_hash = sha256_json(receipt_payload)
            db.execute(
                "UPDATE tasks SET status=?, output_sha256=?, error=? WHERE task_id=?",
                (status, output_hash, error, task_id),
            )
            db.execute(
                "INSERT INTO receipts(task_id, completed_at, payload_json, previous_sha256, receipt_sha256) VALUES (?, ?, ?, ?, ?)",
                (task_id, completed_at, canonical_json(receipt_payload), previous_hash, receipt_hash),
            )
        return {**receipt_payload, "receipt_sha256": receipt_hash}

    def get_state(self, key: str, default: str = "") -> str:
        with closing(self.connect()) as db:
            row = db.execute("SELECT value FROM state WHERE key=?", (key,)).fetchone()
        return row[0] if row else default

    def set_state(self, key: str, value: str) -> None:
        with self._lock, closing(self.connect()) as db:
            db.execute(
                "INSERT INTO state(key,value) VALUES (?,?) ON CONFLICT(key) DO UPDATE SET value=excluded.value",
                (key, value),
            )


def http_json(method: str, url: str, *, headers: dict[str, str] | None = None,
              payload: dict[str, Any] | None = None, timeout: int = 90) -> tuple[dict[str, Any], dict[str, str]]:
    data = None if payload is None else json.dumps(payload).encode("utf-8")
    request = urllib.request.Request(url, data=data, method=method)
    request.add_header("Content-Type", "application/json")
    request.add_header("User-Agent", "AI-Crew-Dispatcher/0.1")
    for name, value in (headers or {}).items():
        request.add_header(name, value)
    try:
        with urllib.request.urlopen(request, timeout=timeout) as response:
            body = response.read().decode("utf-8", errors="replace")
            return (json.loads(body) if body else {}), dict(response.headers.items())
    except urllib.error.HTTPError as exc:
        raw_detail = exc.read().decode("utf-8", errors="replace")
        detail = "authentication rejected" if exc.code in (401, 403) else sanitize_error_detail(raw_detail)
        raise DispatchError(f"provider HTTP {exc.code}: {detail}") from exc
    except urllib.error.URLError as exc:
        raise DispatchError(f"provider connection failed: {exc.reason}") from exc


class Dispatcher:
    def __init__(self, config: dict[str, Any] | Policy, store: Store | FakeProvider,
                 sink: InMemoryMattermost | None = None):
        self._legacy = isinstance(config, Policy)
        if self._legacy:
            self.policy = config
            self.legacy_provider = store
            self.legacy_sink = sink
            self.legacy_seen: set[str] = set()
            self.legacy_stopped = False
            self.legacy_previous_hash: str | None = None
            self.config = {}
            self.store = None
        else:
            self.config = config
            if not isinstance(store, Store):
                raise TypeError("Store required for runtime dispatcher")
            self.store = store

    def verify_and_dispatch(self, raw: bytes, *, signature: str, timestamp: str,
                            now_epoch: int | None = None) -> tuple[LegacyTask, LegacyResult, str]:
        if not self._legacy:
            raise DispatchRejected("signed webhook interface is not configured")
        if self.legacy_stopped:
            raise DispatchRejected("STOP ALL is active")
        now_epoch = int(time.time()) if now_epoch is None else now_epoch
        try:
            event_epoch = int(timestamp)
        except ValueError as exc:
            raise DispatchRejected("invalid webhook timestamp") from exc
        if abs(now_epoch - event_epoch) > self.policy.freshness_seconds:
            raise DispatchRejected("stale webhook timestamp")
        expected = sign_event(self.policy.webhook_secret, timestamp, raw)
        if not hmac.compare_digest(expected, signature):
            raise DispatchRejected("invalid webhook signature")
        try:
            event = json.loads(raw)
        except json.JSONDecodeError as exc:
            raise DispatchRejected("invalid webhook JSON") from exc
        event_id = str(event.get("event_id", ""))
        if not event_id or event_id in self.legacy_seen:
            raise DispatchRejected("duplicate event")
        if str(event.get("channel_id")) not in self.policy.allowed_channels:
            raise DispatchRejected("channel is not allowlisted")
        if str(event.get("workspace_id")) not in self.policy.allowed_workspaces:
            raise DispatchRejected("workspace is not allowlisted")
        capabilities = set(event.get("requested_capabilities", []))
        denied = capabilities - set(self.policy.allowed_capabilities)
        if denied:
            raise DispatchRejected("capabilities denied")
        recipient = str(event.get("recipient", "")).lstrip("@").lower()
        if recipient not in self.policy.allowed_agents:
            raise DispatchRejected("recipient is not allowlisted")
        self.legacy_seen.add(event_id)
        task = LegacyTask(str(uuid.uuid4()), recipient,
                          str(event.get("root_post_id") or event.get("post_id") or ""))
        summary = self.legacy_provider.invoke(recipient, str(event.get("text", "")))
        result_payload = {"task_id": task.task_id, "status": "completed", "summary": summary,
                          "previous": self.legacy_previous_hash}
        result_hash = sha256_json(result_payload)
        result = LegacyResult("completed", summary, 0.0, result_hash, self.legacy_previous_hash)
        self.legacy_previous_hash = result_hash
        reply_id = self.legacy_sink.post(str(event["channel_id"]), task.root_post_id, summary)
        return task, result, reply_id

    def stop_all(self) -> None:
        if self._legacy:
            self.legacy_stopped = True
        else:
            self.store.stop_all("dispatcher stop_all")

    def resume(self) -> None:
        if self._legacy:
            self.legacy_stopped = False
        else:
            self.store.resume()

    @property
    def providers(self) -> dict[str, dict[str, Any]]:
        return self.config.get("providers", {})

    def available(self) -> dict[str, dict[str, Any]]:
        result: dict[str, dict[str, Any]] = {}
        for agent, cfg in self.providers.items():
            kind = cfg.get("kind")
            enabled = bool(cfg.get("enabled", False))
            credential_ready = True
            env_name = cfg.get("api_key_env")
            if env_name:
                credential_ready = bool(os.environ.get(str(env_name), "").strip())
            result[agent] = {
                "kind": kind,
                "enabled": enabled,
                "credential_ready": credential_ready,
                "ready": enabled and credential_ready,
                "model": cfg.get("model"),
            }
        return result

    def assert_running(self) -> None:
        if self.store.stopped():
            raise StoppedError("STOP ALL is active")

    def call(self, agent: str, text: str, *, system: str = "") -> dict[str, Any]:
        self.assert_running()
        if len(text) > int(self.config.get("max_message_chars", 24000)):
            raise DispatchError("message exceeds configured character limit")
        cfg = self.providers.get(agent)
        if not cfg or not cfg.get("enabled", False):
            raise DispatchError(f"recipient is not enabled: {agent}")
        task_id = str(uuid.uuid4())
        self.store.create_task(task_id, agent, "local", None, text)
        started = time.monotonic()
        try:
            kind = cfg.get("kind")
            if kind == "fake":
                provider_result = ProviderResult(
                    text=f"FAKE[{agent}] received {len(text)} characters: {text[:120]}"
                )
            elif kind == "openai-compatible":
                provider_result = self._call_openai_compatible(cfg, text, system)
            elif kind == "ollama":
                provider_result = self._call_ollama(cfg, text, system)
            elif kind == "anthropic":
                provider_result = self._call_anthropic(cfg, text, system)
            elif kind == "gemini":
                provider_result = self._call_gemini(cfg, text, system)
            else:
                raise DispatchError(f"unknown provider kind: {kind}")
            self.assert_running()
            result = {
                "schema": "ai-crew.result.v0.1",
                "task_id": task_id,
                "agent_id": agent,
                "status": "completed",
                "summary": provider_result.text,
                "usage": provider_result.usage or {},
                "provider_request_id": provider_result.provider_request_id,
                "runtime_ms": round((time.monotonic() - started) * 1000),
            }
            result["receipt"] = self.store.finish_task(task_id, result)
            return result
        except Exception as exc:
            failed = {"task_id": task_id, "agent_id": agent, "status": "failed"}
            self.store.finish_task(task_id, failed, "failed", str(exc)[:1000])
            raise

    def converse(self, agents: list[str], topic: str, rounds: int = 2) -> dict[str, Any]:
        self.assert_running()
        max_rounds = int(self.config.get("max_rounds", 4))
        if rounds < 1 or rounds > max_rounds:
            raise DispatchError(f"rounds must be between 1 and {max_rounds}")
        if not agents or len(agents) > 8 or len(set(agents)) != len(agents):
            raise DispatchError("agents must contain 1-8 unique recipients")
        transcript: list[dict[str, str]] = [{"speaker": "David", "text": topic}]
        for round_number in range(1, rounds + 1):
            for agent in agents:
                self.assert_running()
                context = "\n\n".join(
                    f"{item['speaker']}: {item['text']}" for item in transcript
                )
                prompt = (
                    f"You are {agent} in a visible AI crew discussion. This is round {round_number}. "
                    "Respond directly to the shared topic and the other agents. Preserve disagreements. "
                    "Do not assign new work or request another round.\n\nTRANSCRIPT:\n" + context
                )
                result = self.call(agent, prompt)
                transcript.append({"speaker": agent, "text": result["summary"]})
        return {"status": "completed", "rounds": rounds, "agents": agents, "transcript": transcript}

    @staticmethod
    def _secret(cfg: dict[str, Any]) -> str:
        env_name = str(cfg.get("api_key_env", ""))
        secret = os.environ.get(env_name, "").strip()
        if not secret:
            raise DispatchError(f"required credential environment variable is not set: {env_name}")
        return secret

    def _call_openai_compatible(self, cfg: dict[str, Any], text: str, system: str) -> ProviderResult:
        base = str(cfg["base_url"]).rstrip("/")
        messages = []
        if system:
            messages.append({"role": "system", "content": system})
        messages.append({"role": "user", "content": text})
        payload = {
            "model": cfg["model"],
            "messages": messages,
            "max_tokens": int(cfg.get("max_output_tokens", 1200)),
            "temperature": 0.2,
        }
        body, headers = http_json(
            "POST", f"{base}/chat/completions",
            headers={"Authorization": f"Bearer {self._secret(cfg)}"}, payload=payload,
        )
        try:
            content = body["choices"][0]["message"]["content"]
        except (KeyError, IndexError, TypeError) as exc:
            raise DispatchError("provider returned no assistant content") from exc
        return ProviderResult(str(content), headers.get("x-request-id"), body.get("usage", {}))

    def _call_ollama(self, cfg: dict[str, Any], text: str, system: str) -> ProviderResult:
        messages = []
        if system:
            messages.append({"role": "system", "content": system})
        messages.append({"role": "user", "content": text})
        body, _ = http_json(
            "POST", f"{str(cfg['base_url']).rstrip('/')}/api/chat",
            payload={"model": cfg["model"], "messages": messages, "stream": False,
                     "options": {"num_predict": int(cfg.get("max_output_tokens", 1200))}},
        )
        return ProviderResult(str(body.get("message", {}).get("content", "")), usage={
            "prompt_eval_count": body.get("prompt_eval_count"),
            "eval_count": body.get("eval_count"),
        })

    def _call_anthropic(self, cfg: dict[str, Any], text: str, system: str) -> ProviderResult:
        payload: dict[str, Any] = {
            "model": cfg["model"], "max_tokens": int(cfg.get("max_output_tokens", 1200)),
            "messages": [{"role": "user", "content": text}],
        }
        if system:
            payload["system"] = system
        body, headers = http_json(
            "POST", f"{str(cfg['base_url']).rstrip('/')}/v1/messages",
            headers={"x-api-key": self._secret(cfg), "anthropic-version": "2023-06-01"},
            payload=payload,
        )
        blocks = body.get("content", [])
        content = "\n".join(str(block.get("text", "")) for block in blocks if block.get("type") == "text")
        return ProviderResult(content, headers.get("request-id"), body.get("usage", {}))

    def _call_gemini(self, cfg: dict[str, Any], text: str, system: str) -> ProviderResult:
        key = urllib.parse.quote(self._secret(cfg), safe="")
        prompt = f"{system}\n\n{text}" if system else text
        url = f"{str(cfg['base_url']).rstrip('/')}/v1beta/models/{cfg['model']}:generateContent?key={key}"
        body, _ = http_json(
            "POST", url,
            payload={"contents": [{"parts": [{"text": prompt}]}],
                     "generationConfig": {"maxOutputTokens": int(cfg.get("max_output_tokens", 1200))}},
        )
        try:
            content = body["candidates"][0]["content"]["parts"][0]["text"]
        except (KeyError, IndexError, TypeError) as exc:
            raise DispatchError("Gemini returned no assistant content") from exc
        return ProviderResult(str(content), usage=body.get("usageMetadata", {}))


class MattermostBridge:
    def __init__(self, config: dict[str, Any], dispatcher: Dispatcher):
        self.config = config
        self.dispatcher = dispatcher
        self.store = dispatcher.store
        self.stop_event = threading.Event()

    def credentials(self) -> tuple[str, str, str]:
        mm = self.config.get("mattermost", {})
        url = str(mm.get("url", "")).rstrip("/")
        token = os.environ.get(str(mm.get("token_env", "MATTERMOST_TOKEN")), "").strip()
        channel = os.environ.get(str(mm.get("channel_id_env", "MATTERMOST_CHANNEL_ID")), "").strip()
        if not url or not token or not channel:
            raise DispatchError("Mattermost URL, token, or channel ID is not configured")
        return url, token, channel

    def request(self, method: str, path: str, payload: dict[str, Any] | None = None) -> dict[str, Any]:
        url, token, _ = self.credentials()
        body, _ = http_json(method, f"{url}/api/v4{path}",
                            headers={"Authorization": f"Bearer {token}"}, payload=payload)
        return body

    def post(self, channel: str, message: str, root_id: str = "") -> dict[str, Any]:
        payload: dict[str, Any] = {"channel_id": channel, "message": message[:15000]}
        if root_id:
            payload["root_id"] = root_id
        return self.request("POST", "/posts", payload)

    def parse_command(self, message: str) -> tuple[list[str], int, str] | None:
        prefix = str(self.config.get("mattermost", {}).get("trigger_prefix", "!crew"))
        if not message.strip().lower().startswith(prefix.lower()):
            return None
        rest = message.strip()[len(prefix):].strip()
        parts = rest.split(maxsplit=1)
        if len(parts) != 2:
            raise DispatchError("usage: !crew agent1,agent2 [rounds=N] topic")
        agents = [item.strip().lower() for item in parts[0].split(",") if item.strip()]
        topic = parts[1].strip()
        rounds = 1
        if topic.lower().startswith("rounds="):
            first, _, remainder = topic.partition(" ")
            rounds = int(first.split("=", 1)[1])
            topic = remainder.strip()
        return agents, rounds, topic

    def poll_once(self) -> int:
        self.dispatcher.assert_running()
        _, _, channel = self.credentials()
        since = int(self.store.get_state("mattermost_since", "0"))
        query = urllib.parse.urlencode({"since": max(0, since)})
        page = self.request("GET", f"/channels/{channel}/posts?{query}")
        posts = page.get("posts", {})
        newest = since
        handled = 0
        for post_id in reversed(page.get("order", [])):
            post = posts.get(post_id, {})
            created = int(post.get("create_at", 0))
            newest = max(newest, created + 1)
            event_id = f"mattermost:{post_id}"
            if not self.store.remember_event(event_id):
                continue
            command = self.parse_command(str(post.get("message", "")))
            if command is None:
                continue
            agents, rounds, topic = command
            root_id = str(post.get("root_id") or post_id)
            try:
                result = self.dispatcher.converse(agents, topic, rounds)
                lines = [f"**AI-CREW completed — {', '.join(agents)}**"]
                for item in result["transcript"][1:]:
                    lines.append(f"\n**{item['speaker']}**\n{item['text']}")
                self.post(channel, "\n".join(lines), root_id)
            except Exception as exc:
                self.post(channel, f"**AI-CREW failed safely:** {str(exc)[:1000]}", root_id)
            handled += 1
        self.store.set_state("mattermost_since", str(newest))
        return handled

    def run(self) -> None:
        seconds = max(1, int(self.config.get("mattermost", {}).get("poll_seconds", 3)))
        while not self.stop_event.is_set():
            try:
                if not self.store.stopped():
                    self.poll_once()
            except Exception as exc:
                print(f"Mattermost poll warning: {exc}", file=sys.stderr)
            self.stop_event.wait(seconds)


class ApiHandler(BaseHTTPRequestHandler):
    dispatcher: Dispatcher

    def log_message(self, fmt: str, *args: Any) -> None:
        print(f"{self.address_string()} - {fmt % args}")

    def send_json(self, status: int, body: dict[str, Any]) -> None:
        encoded = json.dumps(body, ensure_ascii=False).encode("utf-8")
        self.send_response(status)
        self.send_header("Content-Type", "application/json; charset=utf-8")
        self.send_header("Content-Length", str(len(encoded)))
        self.end_headers()
        self.wfile.write(encoded)

    def read_json(self) -> dict[str, Any]:
        length = int(self.headers.get("Content-Length", "0"))
        if length > 1_000_000:
            raise DispatchError("request body too large")
        return json.loads(self.rfile.read(length).decode("utf-8")) if length else {}

    def do_GET(self) -> None:  # noqa: N802
        if self.path == "/health":
            self.send_json(200, {"ok": True, "stopped": self.dispatcher.store.stopped(),
                                 "providers": self.dispatcher.available()})
        else:
            self.send_json(404, {"error": "not found"})

    def do_POST(self) -> None:  # noqa: N802
        try:
            body = self.read_json()
            if self.path == "/v1/dispatch":
                result = self.dispatcher.call(str(body.get("agent", "")), str(body.get("text", "")))
            elif self.path == "/v1/conversations":
                result = self.dispatcher.converse(
                    [str(a) for a in body.get("agents", [])], str(body.get("topic", "")),
                    int(body.get("rounds", 1)),
                )
            elif self.path == "/v1/stop":
                self.dispatcher.store.stop_all(str(body.get("reason", "manual stop")))
                result = {"stopped": True}
            elif self.path == "/v1/resume":
                self.dispatcher.store.resume()
                result = {"stopped": False}
            else:
                self.send_json(404, {"error": "not found"})
                return
            self.send_json(200, result)
        except StoppedError as exc:
            self.send_json(423, {"error": str(exc)})
        except (DispatchError, ValueError, json.JSONDecodeError) as exc:
            self.send_json(400, {"error": str(exc)})
        except Exception as exc:
            self.send_json(500, {"error": f"internal error: {str(exc)[:500]}"})


def build(path: Path) -> tuple[dict[str, Any], Store, Dispatcher]:
    config = load_config(path)
    data_dir = Path(config.get("data_dir", "data"))
    if not data_dir.is_absolute():
        data_dir = PROJECT_DIR / data_dir
    store = Store(data_dir)
    return config, store, Dispatcher(config, store)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--config", type=Path, default=DEFAULT_CONFIG)
    sub = parser.add_subparsers(dest="command", required=True)
    sub.add_parser("health")
    call = sub.add_parser("call")
    call.add_argument("agent")
    call.add_argument("text")
    talk = sub.add_parser("talk")
    talk.add_argument("--agents", required=True)
    talk.add_argument("--rounds", type=int, default=1)
    talk.add_argument("topic")
    stop = sub.add_parser("stop")
    stop.add_argument("reason", nargs="?", default="manual stop")
    sub.add_parser("resume")
    sub.add_parser("serve")
    sub.add_parser("mattermost-once")
    sub.add_parser("mattermost-watch")
    args = parser.parse_args()
    config, store, dispatcher = build(args.config)

    if args.command == "health":
        print(json.dumps({"stopped": store.stopped(), "providers": dispatcher.available()}, indent=2))
    elif args.command == "call":
        print(json.dumps(dispatcher.call(args.agent, args.text), indent=2, ensure_ascii=False))
    elif args.command == "talk":
        agents = [a.strip() for a in args.agents.split(",") if a.strip()]
        print(json.dumps(dispatcher.converse(agents, args.topic, args.rounds), indent=2, ensure_ascii=False))
    elif args.command == "stop":
        store.stop_all(args.reason)
        print("STOP ALL active")
    elif args.command == "resume":
        store.resume()
        print("Dispatcher resumed")
    elif args.command == "mattermost-once":
        print(json.dumps({"handled": MattermostBridge(config, dispatcher).poll_once()}))
    elif args.command == "mattermost-watch":
        MattermostBridge(config, dispatcher).run()
    elif args.command == "serve":
        handler = type("ConfiguredApiHandler", (ApiHandler,), {"dispatcher": dispatcher})
        server = ThreadingHTTPServer((str(config.get("listen_host", "127.0.0.1")),
                                      int(config.get("listen_port", 8765))), handler)
        print(f"AI-CREW dispatcher listening on http://{server.server_address[0]}:{server.server_address[1]}")
        if config.get("mattermost", {}).get("enabled", False):
            threading.Thread(target=MattermostBridge(config, dispatcher).run, daemon=True).start()
        server.serve_forever()
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

