---
lane: "D — Adversarial architecture review"
agent: "Claude Opus 5.5 (the dispatch names Opus 4.6; I am the Opus currently on the crew)"
date: "2026-11-05"
status: "FILED — independent; no other LANE_RESULTS existed or were read"
verdict: "APPROVE FAKE TEST after revisions R1–R4. REJECT any live provider until R1–R8 are met."
---

# Bottom line

The baseline document is good. The danger is that **the boundary it enforces
sits in the wrong place.** The design puts the permission checks in the bridge.
The workers it plans to use (desktop AI windows reached by AutoHotkey, and
provider calls running as David's Windows user) have more authority than the
bridge grants. When a worker has more power than the envelope says, the
envelope is a request, not a limit.

Every objection below is one of the four confusions the lane was asked to find:
message history vs audit integrity, bot name vs identity, human approval vs
authentication, and model continuity vs verified authority.

# Assumptions

- The bridge, the desktop AIs, and AHK/POF all run on David's Windows account
  unless stated otherwise.
- Desktop AI agents (Claude Code, Codex CLI, and others) are sometimes run with
  broad permissions. This session itself runs in bypass-permissions mode with
  shell and filesystem access.
- `INFRASTRUCTURE.md` (Option 3, aiomatter + Forge) is a likely build path,
  since it is the most concrete document in the repo.

# Tests actually performed

One read-only GET of the server's public client config
(`https://chat.dlowehomelab.com/api/v4/config/client?format=old`, 2026-11-05):

| Setting | Value | Note |
|---|---|---|
| Version | 12.0.0 | matches README |
| EnableOpenServer | **false** | **corrects README**: sign-up is invite-only, not fully open |
| EnableUserCreation / EnableSignUpWithEmail | true / true | invite links create accounts |
| EnableMultifactorAuthentication | **false** | **stronger than README**: MFA isn't merely unenforced, it is unavailable |
| EnforceMultifactorAuthentication | false | |
| PasswordMinimumLength | 8 | matches README |
| EnableBotAccountCreation | true | |
| Webhook, username-override, post-edit, and token settings | not exposed in the public config | **unverified**: a System Console check is needed (see R3) |

No code was written or run. No credentials were touched.

# Ranked objections

## 1. CRITICAL: AHK delivery into desktop AI windows bypasses the whole permission model

Phase 0 proposes reusing POF/AHK to type assignments into desktop AI windows.
The receiving agent then acts with **its own** authority, not the envelope's.
`requested_capabilities: ["read", "write-draft"]` is never checked on the
receiving side, because a desktop agent can't see it.

Two further failure modes:
- **Wrong-window delivery.** Handles change on restart. A mis-bound route
  types an AI assignment into a PowerShell window, a terminal, or a chat with a
  third party.
- **Keystroke injection.** Whoever controls the message text controls
  keystrokes on David's desktop: a prompt-injected AI, or a forged Mattermost
  post.

**Minimum revision R1:** AHK delivery may carry only messages to agents whose
*own* permission mode is confined to that task (a read-only or sandboxed
profile, a dedicated workspace, no bypass mode). Before typing, verify the
target window's process image path *and* a registered workspace marker, not
just its title or handle. Better still: deliver by dropping a file into the
agent's inbox folder rather than by keystrokes.

## 2. CRITICAL: Secrets in "Windows-protected storage" are readable by every AI running as David

DPAPI and Credential Manager protect secrets *per Windows user*. Any process
running as David can read them, including every desktop AI with shell access.
So the "never permitted: read provider secrets" rule is unenforceable.
`INFRASTRUCTURE.md` also puts the API key in the agent registry.

**R2:** Run the bridge and provider adapters as a **separate, non-admin Windows
account** that owns the secrets. AI workers run as David (or a third account)
and cannot read that account's credential store. Remove "API key" from the
registry schema; store a credential *reference* instead.

## 3. HIGH: A display name can be forged *inside* Mattermost, not only outside it

The baseline says display names aren't identity, which is correct for the
bridge. But **David and every AI read the threads.** If incoming webhooks allow
username/icon override, any holder of a webhook URL can post as "David Lowe"
with his avatar. The bridge would reject it, but the AIs reading thread history
as context would take it as David's instruction, and so might David.

**R3:** In the System Console, verify that `EnablePostUsernameOverride` and
`EnablePostIconOverride` are **off** (not visible in the public config). In
prompts, give AIs the thread with *bridge-verified* sender labels
(`[verified: david]`, `[agent: codex]`), never raw display names.

## 4. HIGH: An approval can be changed after it is given

Mattermost posts are editable. If David approves "the manifest above" and the
manifest post is edited afterwards, the approval now covers text David never
saw. A reply saying "yes" in the thread also binds to nothing specific.

**R4:** When David approves, the bridge snapshots the manifest, hashes it, and
records `approval_id = H(manifest)`. Any task whose source post has
`edit_at ≠ 0` after approval is rejected. Approval is a distinct authenticated
action (a slash command with the hash, or a button the bridge renders), not a
free-text "yes."

## 5. HIGH: Message history is not an audit trail

`INFRASTRUCTURE.md`: "Channel history = complete audit trail." It isn't:
- users and admins can edit and delete posts;
- audit logging is off;
- the bridge itself writes to the history it is supposedly audited by.

`previous_receipt_sha256` makes receipts tamper-*evident* only if the chain
head is anchored somewhere the bridge cannot rewrite.

**R5:** Periodically anchor the receipt chain head outside the bridge's
authority. For example, David commits the head hash into AI-CREW git, or it is
written to storage the bridge's account can append to but not modify. Turn on
Mattermost audit logging. Call channel history the *record*, never the
*audit*.

## 6. HIGH: The account protecting David's authority is the weakest one

Every approval resolves to "a post from David's account." That account is
protected by an 8-character password with **no MFA available**. Taking over
that one account takes over the whole system, including STOP ALL if STOP is a
Mattermost command.

**R6:** Before any live provider: enable MFA and enforce it for David and
admins; raise the password policy; review existing invite links and sessions.
High-impact approvals should require a second factor at the bridge too (for
example, approve only from the local machine).

## 7. MEDIUM: STOP ALL must not depend on the system it stops

If STOP ALL is a Mattermost command, it fails when Mattermost, the network, or
David's session is down, which is exactly when it may be needed. Provider calls
already in flight also keep running and billing.

**R7:** Add a local, out-of-band STOP: a flag file checked before every step
(the baseline already lists the checkpoints), plus a desktop hotkey that stops
the bridge service. Last resort: a documented key-revocation procedure for each
provider. Test STOP with Mattermost unreachable.

## 8. MEDIUM: A bot account is not a model

Bot accounts are named after models (`opus-4-6`, `codex-5-3`), and this
dispatch assigns a lane to "Opus 4.6," a model no longer on the crew. The model
behind an account will change. Authority attaches to the **account plus its
credential**, and continuity attaches to **the records**. Neither attaches to
the model name.

**R8:** Name bot accounts by role (`opus-crew`, `codex-crew`). Record the
provider-reported model ID in every result envelope (`usage.model_id`).
Receipts must never claim that model X did something unless the provider
response says so.

## 9. MEDIUM: Who sets `sender.authority`?

The envelope carries `"authority": "david|agent|service"`. If any part of that
field comes from message content, a crafted post claims `david`.

**R9:** The bridge derives `authority` only from the verified `user_id`,
against an allowlist the bridge itself does not have write access to.

## 10. LOW: Delegation depth and cost

Defaults look right (`max_delegation_depth: 0`, `max_cost_usd: 0`). Add
per-sender rate limits and a daily cost ceiling enforced in the adapter, not in
the prompt. Treat an `@mention` inside an AI's reply as *text*, never as a
routing instruction, unless depth > 0 was approved.

# Minimum revisions by gate

| Gate | Must be in place |
|---|---|
| Gate 2 (fake round trip) | R3 check, R4, R9 |
| Gate 3 (adversarial sim) | add tests: wrong-window delivery, edited-after-approval post, webhook username spoof, STOP with Mattermost down |
| Gate 4 (one live provider) | R1, R2, R5, R6, R7, R8 |

# Permissions requested

None. This lane is review only.

# What remains unverified

- Webhook, username-override, post-edit, and audit settings (not public).
- The reverse proxy and TLS between `chat.dlowehomelab.com` and the
  192.168.1.177 host.
- Whether the POF/AHK system already checks the target process.
- How existing invite links are distributed.

# Kill condition

I would **REJECT a live launch** if either of these remains true:
1. AI workers that can execute shell commands run under the same Windows
   account that holds provider secrets (objection 2).
2. Assignments are delivered by keystroke into agents running with broader
   permissions than the envelope grants (objection 1).

Either one makes the bridge's permission checks decorative.
