# SIGN-OFF - 2026-07-27 - Codex AI Desktop Bridge Program Note

tags: #signoff #codex #ai-desktop-bridge #david-os #coordination

## Scope

David asked whether Codex had read the `ai-crew` desktop shortcut target and asked to write down, under the programs list, what we are trying to do with the current app/bridge work.

## What Changed

- Updated `_READ_ME_FIRST.md` under "PROGRAMS WE'RE WORKING ON" with a row for `AI Desktop Bridge / Command-Line Crew`.
- Updated `PROJECTS/_registry.md` with a matching registry row.

## Current Program Definition

The program is a local human-to-AI routing layer:

- Use the clean AutoHotkey overlay/API bridge for UI-only desktop targets when direct API/CLI access is not available.
- Use direct command-line Codex crew jobs through `D:\GitHub\David-OS\tools\ai-crew-cli` when UI injection is unnecessary.
- Keep Macro AI/CMD/API as front doors into the same local routing idea.

## What I Verified

- The desktop shortcut `\\192.168.2.50\h_hp\Desktop\ai-crew - Shortcut.lnk` points to `D:\GitHub\ai-crew`.
- The existing AI desktop bridge coordination note is present at `PROJECTS/david-os/AI_DESKTOP_BRIDGE_OVERLAY_RESEARCH_20260726.md`.
- The front-door program list did not previously name this bridge/CLI work as its own visible program.

## What I Did Not Verify

- I did not rerun the AutoHotkey overlay after this note.
- I did not run a live `codex exec` crew job.
- I did not resolve the existing `ACTIVE_BULLETINS.md` root-vs-prompts inconsistency.

## Next Agent Should Check First

If continuing the bridge work, start in `D:\GitHub\David-OS\ahk\overlay` for UI injection and `D:\GitHub\David-OS\tools\ai-crew-cli` for direct command-line agents. Treat Kimi as unreliable until retested; prioritize the clean overlay and Codex/CMD route.
