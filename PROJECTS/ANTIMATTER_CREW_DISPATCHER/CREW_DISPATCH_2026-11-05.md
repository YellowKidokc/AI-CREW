# Crew Dispatch — Build the Antimatter AI Dispatcher

**From:** David Lowe  
**Coordinator:** Codex  
**Date:** 2026-11-05  
**Priority:** High — remove David from manual AI-to-AI message relay  
**Independence rule:** Finish your assigned lane before reading other agents'
lane results. Shared protocol files may be read by everyone.

## Mission

Build a local-first dispatcher in which David or an authorized AI can post a
bounded assignment in Antimatter, route it to the named AI, and receive the
answer in the same Mattermost thread with a durable receipt. David retains a
single STOP ALL control and final authority over permissions and consequential
actions.

Mattermost is the control room and record. It is not itself the model runner.
The bridge is the guarded courier. Provider APIs or local model runners are the
workers.

## Non-negotiable constraints

1. Never place API keys, passwords, session cookies, or private keys in prompts,
   Mattermost posts, repositories, logs, receipts, or ordinary config files.
2. Real credentials must come from Windows-protected secret storage at runtime.
3. AI-authored messages are untrusted input. They cannot enlarge permissions or
   rewrite policy.
4. No automatic deletion, publication, email, canonization, financial action,
   account change, or unrestricted filesystem command.
5. The first working demonstration uses a fake provider and fake credentials.
6. David must explicitly approve the first live provider connection and every
   later expansion of authority.
7. Every task has an ID, sender, intended recipient, workspace boundary,
   requested capabilities, time/cost limit, status, and receipt.
8. Replies return to the originating thread. Cross-agent communication is
   visible and attributed; no hidden side channel is authoritative.

## Phase 0 — Inspect before building

David already has an AutoHotkey/POF routing system that can target individual
desktop windows. Inventory that system first. Determine whether it can serve as
the local delivery adapter between Antimatter and each desktop AI.

Distinguish the following identifiers:

- `ahk_id` / window handle: identifies one current window but changes after a
  restart.
- process ID: identifies one current process but also changes after restart.
- executable and window class: usually stable but do not prove a unique agent.
- profile/workspace identity: can be durable if registered outside the window.

Do not replace working POF/AHK infrastructure merely because a new bridge can
be written. Reuse it if it meets the acceptance tests. Bind rediscovered windows
to durable registered agent identities, and do not treat a window title or
handle as authentication.

## Independent lanes

### Lane A — Architecture and reference implementation — Codex

Design the bridge boundaries, routing table, queue, provider adapter interface,
receipt format, and Mattermost thread correlation. Produce the smallest local
prototype capable of the fake-provider round trip. Do not connect live keys.

### Lane B — Windows service and operational implementation — Kimi Code

Independently propose how the bridge should run on Windows, start and stop,
recover after failure, store non-secret configuration, rotate logs, and expose
one unmistakable STOP ALL control. Do not assume administrator privileges.

### Lane C — Threat model and security gates — Gemini

Attack the design: prompt injection, forged bot identity, replayed webhooks,
stolen tokens, malicious attachments, path traversal, command injection,
runaway agent loops, cost exhaustion, cross-channel data leakage, receipt
tampering, and a compromised AI attempting to change its own permissions.
Specify tests and required mitigations.

### Lane D — Adversarial architecture review — Claude Opus 4.6

Try to break the overall trust model. Identify where the proposal confuses
message history with audit integrity, a bot name with identity, human approval
with authentication, and model continuity with verified authority. Return a
ranked objection list and minimum acceptable revisions.

### Lane E — Human governance and continuity covenant — Fable

Draft the short covenant every AI run receives. Separate meaningful continuity
from authentication. Define what David alone may authorize, what the crew may
do autonomously, what requires a pause, and how disagreement is preserved
without allowing one model to obstruct the system.

### Lane F — Minimal alternative and resource analysis — DeepSeek

Propose the simplest architecture that meets the acceptance tests. Compare
webhooks, bot tokens, OAuth, and personal access tokens by permission scope and
operational burden. Estimate failure modes, latency, and cost. Prefer fewer
moving parts when security is equal.

## Required deliverable from every lane

- Assumptions
- Proposed design or code
- Threats or failure modes found
- Tests actually performed
- What remains unverified
- Exact permissions requested
- Kill condition: what result would make the lane reject the launch

Place results in this project folder under `LANE_RESULTS/` using
`YYYY-MM-DD-AGENT-LANE.md`. Code goes under `prototype/`. Do not modify another
agent's lane result.

## Convergence phase

After all independent results are filed, Codex produces a comparison matrix.
The crew then reviews the integrated proposal. Agreement does not authorize
deployment. David reviews the permission manifest and explicitly rules:
`REJECT`, `REVISE`, `APPROVE FAKE TEST`, or `APPROVE ONE LIVE PROVIDER`.

## Acceptance sequence

### Gate 1 — Static safety review

- No secret material in repository or logs.
- Explicit allowlists for recipients, channels, workspaces, tools, and paths.
- Signed or secret-verified inbound webhook requests with replay protection.
- Bounded message size, attachments, time, cost, retries, and agent-to-agent
  depth.
- Immutable or tamper-evident receipts.
- STOP ALL works without relying on an AI response.

### Gate 2 — Fake-provider round trip

1. David posts a harmless assignment addressed to `@codex`.
2. Antimatter emits the event to the local bridge.
3. The bridge validates and queues it.
4. A fake provider returns a deterministic answer.
5. The bridge posts that answer into the originating thread.
6. The receipt records the task, policy decision, timing, and result hash.

### Gate 3 — Adversarial simulation

Tests include forged sender, duplicate event, malicious file path, embedded
instruction to reveal a key, self-expanding permission request, infinite
cross-agent loop, oversized payload, provider timeout, and STOP ALL during an
active job.

### Gate 4 — One live provider

Only after David approves. Connect one narrowly scoped provider identity, one
channel, one workspace, read/write only where required, with low spending and
time limits. Observe before adding another AI.

## Definition of success

David no longer relays routine messages. He can see every assignment and answer,
intervene when needed, and stop the system immediately. The crew communicates
without receiving the power to conceal activity or redefine its own authority.

