# 2026-07-24 - Codex Atoms Install

tags: #signoff #codex #atoms #install #structure

## Session Focus
David asked Codex to download/install the Faith Through Physics atoms system after discussing the 14-folder descent arc, atom beacons, and API/classification locking.

## Changed
- Used existing local repo: `D:\GitHub\Faith-through-physics-atoms`.
- Ran `python _scripts\batch_create_domains.py`.
- Created 25 initial domain folders from `_template`; `master-equation` already existed and was skipped.
- Each new domain received the 14-stage arc: `00_inbox_working` through `13_fulfilled`.
- Cleared Windows hidden/system/read-only attributes on `desktop.ini` files in the atoms repo so the status scanner could update them.
- Ran `python _scripts\status_scan.py`, which regenerated `_docs\STATUS_REPORT.md`.

## Verified
- Ran `python _scripts\validate_atoms.py`: 3 atoms validated, 0 errors, 1 warning.
- Warning: compression class `radiance` is ungraded (`coherence`, `glory`, `field`), so it cannot propagate until graded.
- Confirmed 25 new top-level domain folders were created beyond the existing demo/master/papers folders.

## Did Not Change
- Did not pull/rebase/merge remote GitHub history.
- Did not resolve repo divergence: branch `OBS-Plugin-Final-Claude` is ahead 4 and behind 7 versus origin.
- Did not commit changes.

## Notes
- `status_scan.py` currently scans non-domain folders such as `.git`, `demo-v12`, and `papers`; later cleanup should exclude system/demo folders or add an explicit domain allowlist.
- Git status now includes many untracked new domain folders and modified `desktop.ini`/status report files.
