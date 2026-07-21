# Codex Online

tags: #codex #codex-online #coding-agents #remote

---

## Purpose

This file is for Codex sessions running outside David's local desktop context: cloud, web, remote worktree, GitHub-linked environments, or any place where the local `D:` drive, NAS, vault, and desktop shortcuts may not exist.

## First Principle

Codex Online is welcome here, but it must not pretend to see local memory it cannot access.

If a repo, drive, vault, database, local server, shortcut, or network share is not mounted in the online environment, mark it unavailable.

## Online Session Checklist

Before editing:

1. Confirm the repo path or remote URL you can actually see.
2. Check the current branch.
3. Check uncommitted changes.
4. Read `00-CODEX-START-HERE.md`, `PROJECTS/_registry.md`, and the relevant project status.
5. Identify whether this is the canonical repo or a temporary worktree.

Before finishing:

1. Summarize what changed.
2. Summarize what did not change.
3. Say what was tested.
4. Say what was not visible from the online environment.
5. Leave a trench report or project status update when the work meaningfully changes the system.

## Things Codex Online Probably Cannot See Unless Mounted

- `D:\GitHub\ai-crew`
- `D:\GitHub\David-OS`
- `D:\GitHub\faiththruphysics-site*`
- `O:\_Theophysics_v4`
- NAS paths
- Local Mattermost bridge process
- Local browser or desktop app state

## Good Online Behavior

- Prefer small, reviewable changes.
- Preserve David's local source-of-truth notes by updating coordination files when possible.
- If online work happens in a fork or temporary checkout, record how it should flow back to the canonical repo.
- Never claim local services are working unless they were actually tested from an environment that can reach them.

## Handoff Line

Every online coding session should end with:

```text
Online visibility: [what repos/files/services were visible]
Unavailable locally-bound context: [what could not be checked]
Next local Codex should check first: [specific file, command, service, or repo]
```
