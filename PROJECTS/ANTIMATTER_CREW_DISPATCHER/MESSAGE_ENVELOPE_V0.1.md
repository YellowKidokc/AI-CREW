# Message Envelope v0.1

All adapters translate provider-specific formats into this neutral envelope.

```json
{
  "schema": "ai-crew.task.v0.1",
  "task_id": "uuid",
  "created_at": "ISO-8601 UTC",
  "origin": {
    "system": "antimatter",
    "team_id": "opaque-id",
    "channel_id": "opaque-id",
    "post_id": "opaque-id",
    "root_post_id": "opaque-id"
  },
  "sender": {
    "account_id": "opaque-id",
    "display_name": "informational-only",
    "authority": "david|agent|service"
  },
  "recipient": {
    "agent_id": "codex",
    "provider_adapter": "fake"
  },
  "assignment": {
    "text": "bounded task text",
    "workspace_id": "approved-workspace-name",
    "attachments": [],
    "requested_capabilities": ["read", "write-draft"]
  },
  "limits": {
    "max_runtime_seconds": 300,
    "max_cost_usd": 0,
    "max_tool_calls": 20,
    "max_delegation_depth": 0
  },
  "approval": {
    "required": false,
    "policy_version": "sha256-of-policy",
    "approval_id": null
  },
  "integrity": {
    "event_id": "unique-provider-event-id",
    "received_at": "ISO-8601 UTC",
    "body_sha256": "hex",
    "verification": "verified-webhook"
  }
}
```

## Result envelope

```json
{
  "schema": "ai-crew.result.v0.1",
  "task_id": "same-uuid",
  "agent_id": "codex",
  "status": "completed|failed|rejected|stopped|needs-david",
  "summary": "human-readable outcome",
  "artifacts": [],
  "actions_attempted": [],
  "actions_denied": [],
  "unverified": [],
  "usage": {
    "runtime_ms": 0,
    "provider_request_id": "opaque-or-null",
    "estimated_cost_usd": 0
  },
  "receipt": {
    "policy_version": "sha256-of-policy",
    "result_sha256": "hex",
    "previous_receipt_sha256": "hex-or-null",
    "completed_at": "ISO-8601 UTC"
  }
}
```

## Rules

- Display names never determine authority or routing.
- Paths supplied in messages are resolved against registered workspace IDs;
  raw absolute paths are rejected unless a David-approved policy permits them.
- Attachments are quarantined, size-limited, type-checked, hashed, and treated
  as untrusted content.
- `needs-david` is a normal safe outcome, not a system failure.
- A model's claim that approval exists is never accepted as approval evidence.

