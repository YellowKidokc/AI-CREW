# Faith Through Physics HTML Handoff

Date: 2026-07-26
Agent: Codex
User intent: "Finish the HTML."

## What David Wants In Plain English

David wants the scattered Faith Through Physics HTML files turned into a clean,
usable site-data structure.

The next agent should infer this:

- Do not just hash files and stop.
- Do not blindly pick newest or largest.
- Manually inspect enough of each duplicate/near-duplicate family to choose the
  best full HTML version.
- "Best" means structurally better: fuller article, cleaner shell, complete
  content, working internal structure, fewer broken/generated fragments, better
  series fit, and no obvious truncation.
- Sort the winning HTML files into the correct series.
- Preserve alternates and source traceability.
- Do not delete originals.
- Do not move into the canonical `E:\Site` structure until the series map and
  canonical-candidate choices are defensible.

David also clarified an important system rule:

- Keep File Intelligence System tools generic.
- Do not add Faith Through Physics-specific logic inside FIS.
- FIS should be reusable for HTML, Python, documents, and other corpora.
- Project-specific priorities and interpretations belong in configs/reports,
  not hardcoded into reusable tools.

## Current State

JOB-01 and JOB-09 are done.

The HTML has been gathered and staged, but it has not yet been fully sorted into
series or promoted into canonical `E:\Site` folders.

Completed:

- Broad HTML scan across D drive site repos, H/Desktop, E/NAS folders, recycle
  bins, and the recovered old `Master HTML` handoff path.
- Candidate filtering down to likely Faith Through Physics / Theophysics HTML.
- Copy-only staging into one location.
- Clean inventory with source paths, copied paths, size, modified time, and
  SHA-256.
- Exact duplicate summary.
- FIS near-duplicate/family pass on priority sources.

Not completed:

- Series assembly.
- Canonical "best HTML per article" selection.
- Asset checklist spreadsheet.
- Markdown-to-HTML matching.
- Final canonical folder consolidation under `E:\Site`.

## Most Important Paths

Project board:

- `\\192.168.2.50\h_hp\Desktop\ai-crew\PROJECTS\faiththruphysics-site\STATUS.md`

Main aggregation report:

- `\\192.168.2.50\h_hp\Desktop\ai-crew\PROJECTS\faiththruphysics-site\JOB-01_HTML_AGGREGATION_REPORT.md`

FIS dedup pass report:

- `\\192.168.2.50\h_hp\Desktop\ai-crew\PROJECTS\faiththruphysics-site\FIS_DEDUP_PRIORITY_PASS_REPORT.md`

Staging root:

- `E:\Site\_staging\JOB-01-html-aggregation-20260726`

Clean inventory to use:

- `E:\Site\_staging\JOB-01-html-aggregation-20260726\inventory\html-inventory-clean.csv`

Staged copied HTML files:

- `E:\Site\_staging\JOB-01-html-aggregation-20260726\copies`

Exact duplicate hash summary:

- `E:\Site\_staging\JOB-01-html-aggregation-20260726\inventory\duplicate-hash-summary.csv`

FIS priority-source near-duplicate outputs:

- `E:\Site\_staging\JOB-01-html-aggregation-20260726\fis_neardup_priority_sources`

Key files inside that FIS output folder:

- `exact_dups.csv`
- `near_dups.csv`
- `families.csv`
- `scan_errors.log`

File Intelligence System:

- `D:\GitHub\David-OS\file-intelligence-system`

## Counts And Results So Far

JOB-01 aggregation:

- Raw HTML/HTM paths found: 258,495
- Filtered candidate paths: 47,574
- Unique source rows in clean inventory: 47,259
- Staged copied files on disk: 46,706
- Staged copy size: 2,769.34 MB
- Candidate paths not represented in clean inventory: 315
- Duplicate SHA-256 groups: 8,526
- Duplicate source rows inside duplicate groups: 38,146
- Highest duplicate count for one hash: 127

FIS priority-source pass:

- Files scanned: 9,137
- Files fingerprinted: 8,668
- Scan errors: 0
- Exact duplicate groups: 882
- Near-duplicate clusters: 957
- Article/file-family groups: 1,496

## Source Priority Guidance

Use this as a starting priority, not a blind rule:

1. `D:\GitHub\faiththruphysics-site-live`
2. `D:\GitHub\faiththruphysics-site-data`
3. `\\192.168.2.50\h_hp\Desktop\Folders\Master HTML`
4. `D:\GitHub\faiththruphysics-site-v2`
5. `D:\GitHub\genesis-to-quantum`
6. `E:\Faith Through Physics`
7. Desktop loose/named folders
8. Recycle-bin hits only if they clearly contain better/missing content

Important: source priority does not override structural inspection. If a lower
priority copy is visibly fuller, cleaner, or less broken, flag it as the winner
or at least as a human-review conflict.

## What To Do Next

### Step 1: Continue JOB-10

Use:

- `html-inventory-clean.csv`
- `duplicate-hash-summary.csv`
- FIS `exact_dups.csv`
- FIS `near_dups.csv`
- FIS `families.csv`

Goal:

- Build a dedup/canonical candidate map.
- One row per article-family or near-duplicate cluster.
- Include all alternate source paths.
- Mark one recommended best HTML where clear.
- Mark unresolved conflicts where manual inspection is needed.

Suggested output:

- `E:\Site\_staging\JOB-01-html-aggregation-20260726\JOB-10_canonical_candidate_map.csv`
- `\\192.168.2.50\h_hp\Desktop\ai-crew\PROJECTS\faiththruphysics-site\JOB-10_CANONICAL_CANDIDATE_REPORT.md`

### Step 2: Do JOB-02 Series Assembly

Sort the winning HTML candidates into coherent series:

- GTQ / Genesis to Quantum
- Convergence
- Moral Decline / MDA
- Revolution of Truth / DRV
- Master Equation
- Formal Papers
- Cross Domain / Introduction to Theophysics
- Consciousness
- Blue / family briefing
- One-page stories
- Standalone articles
- Any other series visible from the filenames and paths

Suggested output:

- `SERIES_MAP.md`
- `series-map.csv`

Include:

- Series name
- Article order
- Article title
- Winning HTML source path
- Staged copy path
- SHA-256
- Alternates
- Notes/gaps/conflicts

### Step 3: Do Not Consolidate Until The Map Is Ready

Do not move final winners into canonical `E:\Site` folders until:

- The series map exists.
- The canonical candidate map exists.
- Obvious conflicts are flagged.
- The next agent can explain why each winner was selected.

When consolidation begins, copy or move according to the job board instruction
at that time. Current rule from JOB-01 was copy-only; originals must not be
deleted.

## FIS Notes For The Next Agent

Existing FIS tools are useful and should be used:

- `fis_near_dup.py` does shell-stripped normalized text, exact duplicates,
  MinHash near-duplicates, and family stems.
- `duplicate-finder\dup_scanner.py` does exact hash grouping and GUI support.
- `fis_cross_folder_scan.py` does structural fingerprints.
- `fis_normalize.py` handles generic filename normalization proposals.

But keep FIS generic:

- Do not hardcode Faith Through Physics series or source priorities into FIS.
- If adding anything, add a generic batch/profile runner.
- Project-specific rules belong in external config or in the site project
  reports.

Known issue:

- Full all-at-once `fis_near_dup.py` run on the entire 46k staged copy corpus
  exceeded the one-hour command window.
- The priority-source run succeeded.
- Recommended generic improvement is JOB-11: batch/profile runner for large
  mixed corpora.

## Current Open Jobs

From `STATUS.md`:

- JOB-02: Series Assembly
- JOB-03: Asset Inventory Excel
- JOB-04: Markdown Source Gathering
- JOB-05: Canonical Folder Consolidation, blocked by JOB-02 and JOB-03
- JOB-07: MDA tanh Phase-Transition Fit Test
- JOB-10: HTML Dedup And Canonical Candidate Selection
- JOB-11: Generic FIS Batch/Profile Runner

For "finish the HTML", focus on JOB-10, then JOB-02, then JOB-03/JOB-04, then
JOB-05.

## Cautions

- Use `html-inventory-clean.csv`, not the raw `html-inventory.csv`; the raw file
  contains duplicate rows from a timed-out copy pass plus resume.
- `move_plan_DRAFT.ps1` from FIS is fully commented out and should not be used
  directly as a site action plan.
- There are 315 candidate paths not in the clean inventory. Review
  `candidate-paths-not-in-clean-inventory.txt` before claiming total coverage.
- Several inherited status files have mojibake in old text. Do not "fix" that
  broadly unless asked; avoid unrelated churn.
- Some staged files are in `__long_path_flat` because preserving full source
  depth exceeded Windows path limits. Their original paths are still in the
  inventory.

## Bottom Line

The pile is gathered. The next real work is judgment:

1. Use FIS outputs to group duplicates and near-duplicates.
2. Manually inspect the important clusters.
3. Pick the structurally best full HTML per article.
4. Assemble the series map.
5. Only then place the winners into the canonical `E:\Site` structure.
