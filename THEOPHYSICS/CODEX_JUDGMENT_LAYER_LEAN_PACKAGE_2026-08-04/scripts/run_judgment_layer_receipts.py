from __future__ import annotations

import hashlib
import json
import re
import subprocess
from datetime import datetime, timezone
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
REPORTS = ROOT / "reports"
TESTS = [
    ROOT / "lean" / "EvaluationOperator.lean",
    ROOT / "lean" / "ChannelCapacityQualitative.lean",
    ROOT / "lean" / "JudgmentLayerBridgeSkeleton.lean",
]


def run(command: list[str], cwd: Path) -> subprocess.CompletedProcess[str]:
    return subprocess.run(command, cwd=cwd, text=True, capture_output=True, timeout=60)


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def count(pattern: str, text: str) -> int:
    return len(re.findall(pattern, text, flags=re.MULTILINE))


def main() -> int:
    REPORTS.mkdir(parents=True, exist_ok=True)
    stamp = datetime.now(timezone.utc).strftime("%Y%m%dT%H%M%SZ")
    receipt = REPORTS / f"judgment_layer_lean_receipts_{stamp}.jsonl"
    version = run(["lean", "--version"], ROOT)
    records = []
    for test in TESTS:
        text = test.read_text(encoding="utf-8")
        result = run(["lean", str(test)], ROOT)
        record = {
            "timestamp_utc": datetime.now(timezone.utc).isoformat(),
            "file": str(test),
            "sha256": sha256(test),
            "lean_version": version.stdout.strip(),
            "exit_code": result.returncode,
            "status": "pass" if result.returncode == 0 else "fail",
            "axioms": count(r"^\s*axiom\b", text),
            "constants": count(r"^\s*constant\b", text),
            "sorries_or_admits": count(r"\b(sorry|admit)\b", text),
            "theorems": count(r"^\s*theorem\b", text),
            "stdout": result.stdout.strip(),
            "stderr": result.stderr.strip(),
        }
        records.append(record)

    with receipt.open("w", encoding="utf-8") as f:
        for record in records:
            f.write(json.dumps(record, sort_keys=True) + "\n")

    print(receipt)
    for record in records:
        print(
            f"{Path(record['file']).name}: {record['status']} "
            f"axioms={record['axioms']} sorries={record['sorries_or_admits']} "
            f"theorems={record['theorems']}"
        )
    return 0 if all(record["exit_code"] == 0 for record in records) else 1


if __name__ == "__main__":
    raise SystemExit(main())
