# Antimatter Crew Dispatcher

**Owner and final authority:** David Lowe  
**Status:** Crew design and prototype authorized; live credentials and unattended activation are not yet authorized.  
**Created:** 2026-11-05

Antimatter is David's branded Mattermost 12.0.0 instance at
`https://chat.dlowehomelab.com`. Mattermost supplies the visible control room:
channels, threads, bot identities, files, search, and an audit-friendly message
history. A separate local bridge must still authenticate requests, enforce
policy, invoke each AI provider, and return results to the originating thread.

## Read in this order

1. `CREW_DISPATCH_2026-11-05.md` — assignments and acceptance tests.
2. `SECURITY_AND_AUTHORITY_BASELINE.md` — rules no implementation may bypass.
3. `MESSAGE_ENVELOPE_V0.1.md` — shared task/result format.

## Governing principle

David remains the constitutional authority without becoming the manual
transport layer. The crew may design, criticize, implement, and test the
system. It may not grant itself permissions, expose credentials, enable live
providers, publish externally, delete data, or weaken David's override.

## Current instance facts supplied on 2026-11-05

- Bot account creation, incoming webhooks, outgoing webhooks, slash commands,
  OAuth service-provider support, plugins, and file attachments are enabled.
- User access tokens are disabled. They are not required for the first
  webhook-only prototype and must not be enabled merely for convenience.
- Audit logging, access-control audit logging, and MFA enforcement are off.
- Open email sign-up and user creation are enabled; email verification is off.
- Password minimum length is 8 with no complexity requirements.
- The feature flag named `FeatureFlagEnableAIPluginBridge` is off.
- Data-retention deletion is off; configured retention windows still require
  independent confirmation of actual server behavior.

These observations are configuration evidence, not a security certification.

## Prototype

The local dispatcher is in `prototype/crew_dispatcher.py`. It provides:

- allowlisted provider routing for fake, DeepSeek/OpenAI-compatible, Ollama,
  Anthropic, and Gemini adapters;
- bounded, visible round-robin AI conversations;
- SQLite task records and hash-chained receipts;
- replay protection for Mattermost event IDs;
- a host-enforced `data/STOP_ALL` control checked before every provider call;
- a polling Mattermost bridge that returns results to the originating thread;
- no secret values in configuration, logs, or repository files.

Create the local configuration and start the HTTP service:

```powershell
.\START_DISPATCHER.ps1
```

Health endpoint:

```text
GET http://127.0.0.1:8765/health
```

Start a bounded local conversation:

```powershell
python .\prototype\crew_dispatcher.py talk --agents fake --rounds 1 "Test topic"
```

For Antimatter, place `MATTERMOST_TOKEN` and `MATTERMOST_CHANNEL_ID` in the
service process environment, set `mattermost.enabled` to `true` in the ignored
`config.json`, and run:

```powershell
.\START_DISPATCHER.ps1 -MattermostWatch
```

Mattermost command syntax:

```text
!crew deepseek,codex rounds=2 Discuss this question and identify disagreements.
```

Live providers remain limited by `enabled`, the provider roster, output-token
caps, conversation-round caps, and available environment credentials.

