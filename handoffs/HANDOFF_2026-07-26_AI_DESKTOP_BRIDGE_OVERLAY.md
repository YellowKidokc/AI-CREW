# AI CREW HANDOFF - AI Desktop Bridge Overlay

**Who:** Codex   **Date:** 2026-07-26   **Session focus:** David-OS AutoHotkey overlay for routing one hub into desktop AI apps.

## 1. Standard Log

- Worked on:
  - Research and architecture handoff for David's AI desktop bridge idea.
  - Target project: `D:\GitHub\David-OS`.
  - Relevant code: `D:\GitHub\David-OS\ahk\overlay`.
- Changed:
  - Added technical note: `D:\GitHub\David-OS\docs\AI_DESKTOP_BRIDGE_OVERLAY_RESEARCH_20260726.md`.
  - Added this AI crew handoff note.
  - Hardened `D:\GitHub\David-OS\ahk\overlay\bound_bridge_api_ready.ahk` into the first runnable tonight build.
  - Added launcher/test/troubleshooting scripts in `D:\GitHub\David-OS\ahk\overlay`.
- Verified:
  - Local repo layout inspected.
  - Existing overlay code identified.
  - Web research captured with source links.
  - AutoHotkey validation passes for `bound_bridge_api_ready.ahk`.
  - `http://localhost:8765/health` returns OK.
  - `POST /send` queues a message and the AHK overlay reads it from `_inbox`.
- Blocked:
  - No blocker. Implementation still needs a fresh coding pass.
- Next session should:
  - Start from the updated `D:\GitHub\David-OS\ahk\overlay\bound_bridge_api_ready.ahk`.
  - Preserve `D:\GitHub\David-OS\ahk\overlay\bridge_api.py`.
  - Live-test with Claude/ChatGPT/Kimi/Codex desktop open.
  - Lock each target and verify whether that app needs `enter`, `click`, or `ctrl-enter`.
  - Add OCR fallback after basic send is proven.

## 2. Breakthrough Check

YES. The important design decision is that this bridge should not depend on one fragile trick. Use UI Automation first, OCR second, and saved client-relative coordinates third. That gives David the click-through overlay he likes while still letting the system learn where each desktop AI app's input box and send button live.

## 3. Claim Ledger

| Claim | Evidence class | Kill condition | Backing added today |
|---|---|---|---|
| A click-through AutoHotkey overlay is a valid design for sitting over desktop AI apps without blocking normal mouse use. | Spec | Windows extended layered/transparent window behavior fails in target AHK implementation. | Microsoft Win32 window style documentation cited in `AI_DESKTOP_BRIDGE_OVERLAY_RESEARCH_20260726.md`. |
| UI Automation should be tried first for Electron/Chromium desktop apps, but not trusted as the only path. | Spec | Target apps expose no useful controls or names through UIA during live testing. | Electron accessibility and Microsoft UI Automation docs cited. |
| OCR plus saved relative coordinates is the right fallback chain for icon-only or poorly exposed send controls. | Spec | OCR cannot identify stable regions and coordinate replay fails after resize/move in testing. | AHK OCR/UIA library options and local overlay architecture noted. |

## 4. How We Got There

David described wanting one local hub to talk to multiple AI desktop apps without paying for API calls per message. He also emphasized that the overlay must not block typing or mouse use.

Local inspection showed that David-OS already has most of the foundation: `bound_bridge_api_ready.ahk`, `bridge_api.py`, UIA support, and an older controller script. That means the next step is hardening and integration, not a ground-up rewrite.

Research confirmed that Electron accessibility, Win32 click-through overlays, AutoHotkey UIA, and AutoHotkey OCR are all viable parts. The weak point is reliability across app updates, so the architecture needs fallback layers.

## 5. For Ollama / Permanent Record

- David wants the AI bridge because it lets him coordinate multiple AI desktop apps from one hub while avoiding unnecessary API costs.
- Preserve the click-through overlay behavior. It matters to the workflow.
- The system should support Claude, ChatGPT, Kimi, and Codex first, then add other targets by profile.
- The right implementation pattern is layered: UIA, then OCR, then saved client-relative coordinates.

## 6. File Trail

- Created: `D:\GitHub\David-OS\docs\AI_DESKTOP_BRIDGE_OVERLAY_RESEARCH_20260726.md`
- Created: `D:\GitHub\ai-crew\handoffs\HANDOFF_2026-07-26_AI_DESKTOP_BRIDGE_OVERLAY.md`
- Modified: `D:\GitHub\David-OS\ahk\overlay\bound_bridge_api_ready.ahk`
- Created: `D:\GitHub\David-OS\ahk\overlay\START_AI_DESKTOP_BRIDGE.bat`
- Created: `D:\GitHub\David-OS\ahk\overlay\SEND_TEST_TO_BRIDGE.bat`
- Created: `D:\GitHub\David-OS\ahk\overlay\TROUBLESHOOT_AI_DESKTOP_BRIDGE.bat`
- Created: `D:\GitHub\David-OS\ahk\overlay\README_AI_DESKTOP_BRIDGE_TONIGHT.md`

Source links are included in the David-OS research note.
