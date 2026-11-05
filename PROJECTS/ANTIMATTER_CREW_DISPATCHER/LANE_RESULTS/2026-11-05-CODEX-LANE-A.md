# Lane A — Architecture and Working Dispatcher

**Agent:** GPT/Codex  
**Date:** 2026-11-05  
**Status:** LOCAL MULTI-AGENT ROUND TRIP PASSED; ANTIMATTER CREDENTIAL PENDING

## Implemented

- Local HTTP dispatcher on `127.0.0.1:8765`.
- Fake, DeepSeek/OpenAI-compatible, Ollama, Anthropic, and Gemini adapters.
- Bounded round-robin conversations in which each later agent receives the
  earlier agents' contributions.
- Mattermost polling bridge with same-thread responses.
- SQLite task ledger, replay protection, and hash-chained receipts.
- Recipient, capability, channel, workspace, message-size, and round limits.
- Host-enforced `data/STOP_ALL` checked before calls and outbound replies.
- Provider-error sanitization so credentials are not copied into logs.

## Tests performed

- 13 automated tests: PASS.
- Fake-provider same-thread round trip: PASS.
- DeepSeek API connection: PASS (`24` total tokens for the link test).
- Ollama local connection: PASS.
- DeepSeek-to-Ollama conversation: PASS; both turns completed with distinct
  output hashes and chained receipts.
- Local HTTP health endpoint: PASS on port `8765`.
- Antimatter public API ping: HTTP 200.
- Authenticated Antimatter integration controls observed in the browser.

## Provider state

- `deepseek`: enabled and live.
- `ollama`: enabled and live (`qwen3:4b-instruct`).
- `local-deepseek`: enabled and model present (`deepseek-r1:latest`).
- `codex`: disabled because the existing OpenAI credential was rejected.
- `claude`: adapter ready, credential absent, disabled.
- `gemini`: adapter ready, credential absent, disabled.

## Remaining external authorization

Antimatter has no `MATTERMOST_TOKEN` or `MATTERMOST_CHANNEL_ID` available to
the dispatcher process. Creating a narrowly scoped `crew-dispatcher` bot/token
is a persistent-access action and requires David's action-time confirmation.
After that credential is stored outside the repository, the final acceptance
test is:

```text
!crew deepseek,ollama rounds=1 <topic>
```

The dispatcher must reply in the originating Antimatter thread.

## Exact permissions requested

- One bot identity: `crew-dispatcher`.
- Read posts in one approved crew channel.
- Create replies in that same channel and originating threads.
- No administration, deletion, channel creation, user management, or file
  upload authority.

## Kill condition

Reject unattended launch if the bot cannot be limited to the approved channel,
if STOP ALL cannot prevent outbound replies, if credentials enter repository
files/logs, or if duplicate posts cause repeated provider calls.

