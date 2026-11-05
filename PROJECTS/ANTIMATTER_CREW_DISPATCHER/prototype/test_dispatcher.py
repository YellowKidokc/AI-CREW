from __future__ import annotations

import tempfile
import unittest
from pathlib import Path

from crew_dispatcher import DispatchError, Dispatcher, Store, sanitize_error_detail


class DispatcherTests(unittest.TestCase):
    def setUp(self) -> None:
        self.temp = tempfile.TemporaryDirectory()
        self.store = Store(Path(self.temp.name))
        self.config = {
            "max_message_chars": 1000,
            "max_rounds": 3,
            "providers": {
                "fake": {"kind": "fake", "enabled": True},
                "off": {"kind": "fake", "enabled": False},
            },
        }
        self.dispatcher = Dispatcher(self.config, self.store)

    def tearDown(self) -> None:
        self.temp.cleanup()

    def test_fake_round_trip_and_receipt(self) -> None:
        result = self.dispatcher.call("fake", "hello crew")
        self.assertEqual(result["status"], "completed")
        self.assertIn("hello crew", result["summary"])
        self.assertEqual(len(result["receipt"]["receipt_sha256"]), 64)

    def test_conversation_is_bounded(self) -> None:
        result = self.dispatcher.converse(["fake"], "test topic", rounds=2)
        self.assertEqual(len(result["transcript"]), 3)
        with self.assertRaises(DispatchError):
            self.dispatcher.converse(["fake"], "too many", rounds=4)

    def test_disabled_recipient_rejected(self) -> None:
        with self.assertRaises(DispatchError):
            self.dispatcher.call("off", "hello")

    def test_stop_all_blocks_calls(self) -> None:
        self.store.stop_all("test")
        with self.assertRaises(Exception):
            self.dispatcher.call("fake", "blocked")
        self.store.resume()
        self.assertEqual(self.dispatcher.call("fake", "works")["status"], "completed")

    def test_duplicate_event_rejected(self) -> None:
        self.assertTrue(self.store.remember_event("event-1"))
        self.assertFalse(self.store.remember_event("event-1"))

    def test_provider_error_redacts_api_key(self) -> None:
        cleaned = sanitize_error_detail("Incorrect API key: sk-abc123456789-secret")
        self.assertNotIn("abc123456789", cleaned)


if __name__ == "__main__":
    unittest.main()

