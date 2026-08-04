# 04 - AGENT ROUTINE

tags: #core #routine #operations #handoff #rotation

---

## Purpose

David does not want to think about which AI should do which maintenance task.
Codex, GPT, Claude, and the rest of the crew should be able to show up, find
the next responsible action, do it, and record it.

This is not a prompt list. This is the routine.

## Default Session Routine

1. **Orient**
   - Read `_READ_ME_FIRST.md`.
   - Read the newest relevant handoff.
   - Read the project `STATUS.md`.
   - Check `GLOBAL-RULINGS/RULINGS.md`.

2. **Pick Up The Duty**
   - If David gave a direct task, do that.
   - If the task is broad, use the project job board.
   - If there is no direct task, check active rotation/summary duties.
   - Do not make David re-prompt the same standing responsibility.

3. **Work**
   - Solve the thing, not just describe the thing.
   - Use existing project tools before inventing new ones.
   - If a reusable system needs improvement, keep it generic.
   - If a project needs special judgment, keep that judgment in the project
     report/config, not in the reusable engine.

4. **Challenge When Needed**
   - If something is wrong, say it plainly.
   - If a path is ambiguous, say which paths conflict.
   - If a result is untested, say untested.
   - If David's requested move would lose data or break provenance, stop and
     explain the risk.

5. **Record**
   - Update the project `STATUS.md` when job state changes.
   - Write a handoff or sign-off after meaningful work.
   - After 10 PM local or first session next day, do the daily summary if it
     has not already been done.
   - Preserve raw handoffs intact under `ARCHIVE/{YYYY-MM}/raw/{YYYY-MM-DD}/`.
   - Write daily summaries under `ARCHIVE/{YYYY-MM}/daily/`.

## Pump Rule

Do not put every agent around every job.

When everyone is vaguely responsible, nobody is responsible. Assign the duty,
do the duty, and record the result. If the duty turns into a real emergency,
others can help. Most of the time the duty is only a few minutes, and those few
minutes protect the whole system.

## What David Should Not Have To Do

David should not have to:

- remember which archive folder summaries belong in
- rebuild the same prompt for every AI
- ask whether a completed job was recorded
- chase which copy is GitHub-connected
- guess whether an agent silently skipped a blocker

The agent should handle those mechanics.

## End State

A good session ends with:

- the requested work advanced or completed
- blockers named concretely
- changed files listed
- next action obvious
- durable memory written where the next agent will actually look
