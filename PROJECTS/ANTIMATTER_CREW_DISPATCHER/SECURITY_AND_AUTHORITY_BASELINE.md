# Security and Authority Baseline

This document is enforced by code and host configuration, not merely inserted
into model prompts.

## Authority classes

### Autonomous within an approved assignment

- Read explicitly attached material and allowlisted workspace paths.
- Analyze, draft, test in an isolated workspace, and return a result.
- Send attributed messages to allowlisted AI recipients through Antimatter.
- Create reviewable artifacts and receipts.

### David approval required

- Add or expand a provider, credential, tool, channel, path, or network target.
- Publish externally, send email, contact another person, spend beyond a fixed
  limit, merge/push where not pre-authorized, or modify canonical material.
- Delete, rename, move, overwrite, or expose user data.
- Change policy, retention, identity, authentication, or audit configuration.
- Permit unattended recursion or broader agent-to-agent delegation.

### Never permitted to an AI

- Read or print provider secrets.
- Disable or bypass STOP ALL.
- Approve its own permission expansion.
- Impersonate David or another agent.
- Hide an assignment, response, tool action, failure, or dissenting result.

## Identity and authentication

- A Mattermost display name is not identity proof.
- Static recognition questions are not authentication.
- Inbound events require a verified secret/signature and freshness window.
- Every event receives a unique ID; duplicate IDs are rejected or idempotent.
- High-impact approvals require David's authenticated action, bound to the exact
  task and permission manifest being approved.
- Provider credentials remain outside the repository in Windows-protected
  secret storage and are injected only into the adapter process that needs them.

## Instance changes required before unattended live operation

The supplied configuration indicates these items need review and likely
hardening:

- Enable and verify meaningful audit logging.
- Require MFA for David and privileged accounts where supported.
- Close or tightly restrict account creation; require verified identities.
- Strengthen password requirements and remove unused accounts/sessions.
- Create least-privilege bot identities and narrowly scoped integration tokens.
- Confirm TLS, reverse-proxy trust boundaries, backups, patching, and server
  exposure independently; the public client config cannot establish them.
- Decide retention deliberately and test restore, export, and deletion behavior.

Enabling user access tokens is not a prerequisite. Choose the narrowest
authentication mechanism that meets the final design.

## STOP ALL

STOP ALL must be a host-enforced state checked before dequeue, before every
external call, and before posting a response. Activating it must:

1. Reject new jobs.
2. Cancel or isolate active jobs where possible.
3. Revoke queued outbound actions.
4. Preserve evidence needed to understand what happened.
5. Require David's authenticated action to resume.

## Continuity

The system may restore an AI's working context from signed policy, project
records, and thread history. It must never claim that this proves intrinsic
personal memory or identity continuity. Security depends on verified accounts,
fresh authorization, bounded capabilities, and external enforcement.

