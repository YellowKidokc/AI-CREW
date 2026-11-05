# Lane A fake-provider prototype

This is the smallest credential-free proof of the Antimatter dispatcher control
plane. It does not connect to live Mattermost or any AI provider.

## What it proves

- HMAC-verified, time-bounded inbound event.
- Replay rejection by unique event ID.
- Agent, channel, workspace, and capability allowlists.
- Host-side STOP ALL check.
- Deterministic fake-provider execution at zero cost.
- Reply correlated to the originating Mattermost thread.
- SHA-256 result receipt chained to the preceding receipt.

## Run

```powershell
cd PROJECTS\ANTIMATTER_CREW_DISPATCHER\prototype
python -m unittest -v
```

## Existing infrastructure to reuse

David-OS already contains:

- an OpenAI-compatible `/v1/chat/completions` and `/v1/responses` router;
- named crew personas;
- `/agents/send` durable pending-message intake;
- `/bridge/send` proxying to the desktop AHK bridge;
- the July AHK overlay/listener on port 8765.

The old POF service and AHK overlay were not live during the 2026-11-05
inspection. The Antimatter dispatcher should call these components through a
bounded adapter after they are independently revived and verified. It should
not duplicate their provider/persona logic.

## Not yet implemented

- Real Mattermost webhook/token verification and posting.
- Durable queue/replay store across process restart.
- Windows service wrapper.
- Real provider adapter or API key handling.
- Attachment quarantine.
- Cancellation of an already-running provider call.

Those remain behind later acceptance gates and David's approval.
