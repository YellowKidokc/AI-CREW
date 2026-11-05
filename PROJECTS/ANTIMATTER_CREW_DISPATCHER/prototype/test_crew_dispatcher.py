import json
import time
import unittest

from crew_dispatcher import (
    DispatchRejected,
    Dispatcher,
    FakeProvider,
    InMemoryMattermost,
    Policy,
    sign_event,
)


class DispatcherTests(unittest.TestCase):
    def setUp(self):
        self.policy = Policy(
            policy_version="test-policy-sha256",
            webhook_secret="FAKE-TEST-SECRET-NOT-LIVE",
            allowed_agents=frozenset({"codex", "kimi"}),
            allowed_channels=frozenset({"channel-ai-crew"}),
            allowed_workspaces=frozenset({"ai-crew"}),
        )
        self.sink = InMemoryMattermost()
        self.dispatcher = Dispatcher(self.policy, FakeProvider(), self.sink)
        self.event = {
            "event_id": "event-001",
            "team_id": "team-test",
            "channel_id": "channel-ai-crew",
            "post_id": "post-001",
            "root_post_id": "thread-001",
            "sender_id": "david-test",
            "sender_authority": "david",
            "recipient": "@codex",
            "workspace_id": "ai-crew",
            "text": "Return the deterministic fake result.",
            "requested_capabilities": ["read", "write-draft"],
        }

    def dispatch(self, event=None, *, signature=None):
        raw = json.dumps(event or self.event, sort_keys=True).encode()
        timestamp = str(int(time.time()))
        signature = signature or sign_event(self.policy.webhook_secret, timestamp, raw)
        return self.dispatcher.verify_and_dispatch(
            raw, signature=signature, timestamp=timestamp, now_epoch=int(timestamp)
        )

    def test_fake_round_trip_returns_to_originating_thread(self):
        task, result, reply_post_id = self.dispatch()
        self.assertEqual(task.agent_id, "codex")
        self.assertEqual(result.status, "completed")
        self.assertEqual(result.estimated_cost_usd, 0.0)
        self.assertEqual(reply_post_id, "fake-post-1")
        self.assertEqual(self.sink.posts[0]["root_post_id"], "thread-001")
        self.assertIn("FAKE[codex]", self.sink.posts[0]["message"])

    def test_invalid_signature_is_rejected(self):
        with self.assertRaisesRegex(DispatchRejected, "invalid webhook signature"):
            self.dispatch(signature="0" * 64)

    def test_duplicate_event_is_rejected(self):
        self.dispatch()
        with self.assertRaisesRegex(DispatchRejected, "duplicate event"):
            self.dispatch()

    def test_unapproved_capability_is_rejected(self):
        event = dict(self.event, event_id="event-002", requested_capabilities=["shell"])
        with self.assertRaisesRegex(DispatchRejected, "capabilities denied"):
            self.dispatch(event)

    def test_wrong_workspace_is_rejected(self):
        event = dict(self.event, event_id="event-003", workspace_id="raw-c-drive")
        with self.assertRaisesRegex(DispatchRejected, "workspace is not allowlisted"):
            self.dispatch(event)

    def test_stop_all_rejects_new_work_and_resume_restores_service(self):
        self.dispatcher.stop_all()
        with self.assertRaisesRegex(DispatchRejected, "STOP ALL"):
            self.dispatch()
        self.dispatcher.resume()
        _, result, _ = self.dispatch()
        self.assertEqual(result.status, "completed")

    def test_receipts_form_a_hash_chain(self):
        _, first, _ = self.dispatch()
        second_event = dict(self.event, event_id="event-004", post_id="post-004")
        _, second, _ = self.dispatch(second_event)
        self.assertIsNone(first.previous_receipt_sha256)
        self.assertEqual(second.previous_receipt_sha256, first.result_sha256)


if __name__ == "__main__":
    unittest.main()
