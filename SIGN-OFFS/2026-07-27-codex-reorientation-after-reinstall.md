# SIGN-OFF - 2026-07-27 - Codex Reorientation After Reinstall

tags: #signoff #codex #orientation #ai-crew

## Scope

David pointed Codex at `\\192.168.2.50\h_hp\Desktop\ai-crew - Shortcut.lnk` after a reinstall and asked me to read in and get caught up.

## What I Verified

- Resolved the shortcut target: `D:\GitHub\ai-crew`.
- Confirmed `D:\GitHub\ai-crew` exists and is a Git repo.
- Read the front-door and orientation material:
  - `00-CODEX-START-HERE.md`
  - `_READ_ME_FIRST.md`
  - `ORIENTATION_PROTOCOL.md`
  - `99-README.md`
  - `00-LIVING-CHARTER.md`
  - `01-WHO-WE-ARE.md`
  - `02-HOW-WE-WORK.md`
  - `03-BOUNDARIES.md`
  - `04-AGENT-ROUTINE.md`
  - `INFRASTRUCTURE.md`
  - `PROJECTS/_registry.md`
  - `CODERS/README.md`
  - `CODERS/codex-local.md`
  - `GLOBAL-RULINGS/RULINGS.md`
  - `ROTATION_STATE.md`
- Read the newest sign-off visible at session start:
  - `SIGN-OFFS/2026-07-26-codex-master-equation-review.md`
- Read the newest handoff:
  - `handoffs/HANDOFF_2026-07-26_CANON_HARVEST_AND_GRADIENT_RULING.md`
- Read the current Master Equation / Fabel Gradient ruling set:
  - `CANON_DECISIONS/FABEL_GRADIENT_MASTER_EQUATION_RULING_v3.md`
  - `THEOPHYSICS/CANON/MASTER_EQUATION_STRUCTURE_SPEC.md`
  - `CANON_TEST_LEDGER/FABEL_GRADIENT_RETEST_PROTOCOL_v0.1.md`
- Located an active bulletins copy at `prompts/ACTIVE_BULLETINS.md`.

## Current Read

The active work is centered on David's locked v3 Fabel Gradient / Master Equation ruling. The ruling is canon, but the structure is not fully locked until the verification gates clear.

Current canonical short form:

```text
X = (G, M, E, S, T, K, Q, R, F) in [0,1]^9
chi(X) = C_W[ product_i X_i ]
dX/dt = W grad chi(X) + eta(X,t)
```

Key standing constraints:

- `C_W` is a wrapper, not a tenth factor.
- Reduced factors and `chi` are dimensionless.
- `dX/dt`, `W`, and `eta` carry `s^-1`.
- `eta = grace` and `W = free will` are bridge claims, not theorems.
- The weak source theorem is the safe Lean claim: nonzero source gives nonzero instantaneous velocity from a stationary point, under the declared hypotheses.
- Global convergence / annealing is open.
- Law 5 decay and Law 9 `Gamma_sin` are the major lock gates.

## Issues Noted

- `_READ_ME_FIRST.md` says root `ACTIVE_BULLETINS.md` is the canonical bulletin file, but Git status shows root `ACTIVE_BULLETINS.md` as deleted. A copy exists at `prompts/ACTIVE_BULLETINS.md`. I did not repair this because it is an existing repo-state issue.
- The working tree had uncommitted modifications and untracked files before I wrote this sign-off. I treated them as prior/user/agent work.
- Some markdown displays mojibake in this shell output; I did not attempt encoding repairs.

## What I Did NOT Verify

- I did not run tests.
- I did not inspect the blue-pages source of truth under `D:\DONT TOUCH HTML\blue-pages`.
- I did not inspect `D:\GitHub\David-OS`, the atom repo, Lean packages, or external GitHub state.
- I did not verify empirical claims, sigma counts, or Lean build results.
- I did not reconcile the missing root `ACTIVE_BULLETINS.md`.

## Next Agent Should Check First

If continuing orientation, check whether root `ACTIVE_BULLETINS.md` was intentionally moved to `prompts/ACTIVE_BULLETINS.md` or accidentally deleted. If continuing the Master Equation work, start with the v3 ruling, then the retest protocol Modules 0-2 before touching Law 5 or Law 9.

## Addendum - Follow-Up Repair From David's Fabel Note

David supplied `\\192.168.2.50\h_hp\Desktop\Saved Notes\Fabel\20260726-221518-fabel.md` and asked whether the last piece was present.

Actions taken:

- Restored root `ACTIVE_BULLETINS.md` as the canonical bulletin file.
- Converted `prompts/ACTIVE_BULLETINS.md` into a pointer so bulletins are not duplicated.
- Cooled the Master Equation bulletin language to match the v3 ruling: no strong annealing claim, no bits/s reduced factors, no "Level 1 differentiated" wording.
- Added the `L_D` discoherence-operator / syndrome-eigenmode route to `CANON_DECISIONS/SPIRITUAL_DERIVATIVES_LAW_LENS_GRID_CANDIDATE_v0_1.md`.
- Reclassified the denominator-only adversary claim in `Denominator_Only_Theorem_Candidate_Sendable_v0_1.md` as a selection-rule candidate first, possible no-go theorem later.

Important content preserved:

```text
assemble L_D -> diagonalize L_D -> read principal decay eigenmodes -> compare to Eight Families
```

The Eight Families countermeasure architecture is not canon as an eight-count derivation until `L_D` exists and its modes are actually decomposed.

## Addendum - Python Equation-Slot Migration

David pointed out that the old Python tests may not need to be thrown away. The harnesses likely remain useful if the old equation block can be labeled and swapped for the v3 equation.

Action taken:

- Added `V3_CANONICAL_EQUATION_SLOT` and `HISTORICAL_EQUATION_SLOT` markers to:

```text
\\192.168.2.50\h_hp\Desktop 2\Lagrangian\TESTS\lagrangian_workbench.py
```

- Added reusable v3 adapter functions in that file:

```text
v3_chi
v3_grad_chi
v3_dXdt
```

- Added the migration rule to `CANON_TEST_LEDGER/FABEL_GRADIENT_RETEST_PROTOCOL_v0.1.md`.
- Ran `python -m py_compile` on the pilot workbench; syntax check passed.

Interpretation:

```text
Do not delete old Python tests.
Label historical equation slots.
Swap only the equation adapter for v3 reruns.
Preserve old harnesses, seeds, regimes, controls, and output reporting wherever possible.
```

## Addendum - Five-Folder Equation-Slot Inventory

David pointed to `D:\GitHub\Python-WEB` and the five likely test shelves:

```text
\\192.168.2.50\h_hp\Desktop 2\CANON
\\192.168.2.50\h_hp\Desktop 2\CODEX CITE
\\192.168.2.50\h_hp\Desktop 2\Lagrangian
\\192.168.2.50\h_hp\Desktop 2\MASTER_EQUATION
\\192.168.2.50\h_hp\Desktop 2\MASTER_EQUATION_TEST
```

Finding:

- Existing `D:\GitHub\Python-WEB\label_equations.py` labels equations in HTML, not Python/Colab equation slots.
- Existing `label_elements.py` labels HTML structural elements, not test equations.
- A dedicated scanner was needed.

Action taken:

- Added `D:\GitHub\Python-WEB\equation_slot_inventory.py`.
- Ran it in dry-run mode over the five shelves.
- No tests were modified by this scanner.

Report files:

```text
D:\GitHub\Python-WEB\reports\equation_slot_inventory_20260726_232307.json
D:\GitHub\Python-WEB\reports\equation_slot_inventory_20260726_232307.csv
D:\GitHub\Python-WEB\reports\equation_slot_inventory_20260726_232307.md
```

Inventory result:

```text
545 reported files with equation-slot signal
94 high_priority C3-candidate files
56 equation_slot_candidate files
389 review files
1 already_marked pilot file
5 unreadable/transient files skipped
```

Interpretation:

```text
Do not bulk-zap all files at once.
Start with the 94 high_priority C3 candidates.
Deduplicate copied/archive variants before editing.
Apply V3_CANONICAL_EQUATION_SLOT migration in batches.
Run syntax/tests after each batch.
```

## Addendum - GitHub/Colab Evidence Packet Plan

David clarified the direction: migrate tests one by one, create runnable Python and Colab versions, push them to GitHub as shareable evidence links, then scale only after the packet pattern works.

Action taken:

- Added `CANON_TEST_LEDGER/V3_GITHUB_TEST_MIGRATION_RUNBOOK.md`.
- Added a pointer to that runbook from `CANON_TEST_LEDGER/FABEL_GRADIENT_RETEST_PROTOCOL_v0.1.md`.
- Checked likely GitHub targets.

Best current target, pending David confirmation:

```text
D:\GitHub\theophysics-prediction-lab
origin: https://github.com/DavidLoweOKC/theophysics-prediction-lab.git
```

Reason:

```text
It is already a runnable prediction/test repo.
Python-WEB is a broad dirty toolbox repo.
Faith-through-physics-atoms should reference test packets, not host execution harnesses.
```

First pilot candidate:

```text
TEST-0001-comparative-lagrangian-bench
source: \\192.168.2.50\h_hp\Desktop 2\MASTER_EQUATION\COMPARATIVE_LAGRANGIAN_BENCH_v1.py
```

Rule:

```text
one claim -> one Python script -> one Colab notebook -> one evidence dossier -> one GitHub link
```

## Addendum - Family Lagrangian Template Found

David flagged the earlier Family Lagrangian workbench as an especially good template for future scenario comparisons, including possible house/family/institution tests.

Found template materials:

```text
\\192.168.2.50\h_hp\Desktop 2\CANON\INTERPRETATIONS\Family_Lagrangian_Workbench.md
\\192.168.2.50\h_hp\Desktop 2\Lagrangian\TESTS\Lagrangian_Family_Workbench.ipynb
\\192.168.2.50\h_hp\Desktop 2\Lagrangian\TESTS\lagrangian_workbench.py
\\192.168.2.50\h_hp\Desktop 2\Lagrangian\FAMILY_BRIEFING_FINAL.md
```

Interpretation:

```text
The value is the comparative bench structure:
symbolic work -> shared controls -> target model -> stress sweep -> side-by-side scorecard -> honest failure notes.
```

Action taken:

- Added `Family Lagrangian Template Rule` to `CANON_TEST_LEDGER/V3_GITHUB_TEST_MIGRATION_RUNBOOK.md`.
- Required future applied-domain packets to use a side-by-side-by-side pattern when available:
  controls + historical equation + v3 canonical equation + scenario model.
- Required shared seeds, tolerances, integration settings, reporting schema, and pass/fail criteria unless the dossier explains a controlled exception.

## Addendum - Master Equation Canon Alignment Pass

David asked Codex to make the Master Equation pages line up with the Fabel/David v3 ruling and to preserve prior mistakes as history rather than silently deleting them.

Action taken:

- Rewrote `THEOPHYSICS/topics/master-equation.md` from stale ten-variable language into a v3 canonical topic page.
- Added current form:
  `X = (G, M, E, S, T, K, Q, R, F) in [0,1]^9`;
  `chi(X) = C_W[product_i X_i]`;
  `dX/dt = W grad chi(X) + eta(X,t)`.
- Moved retired forms to the bottom of the topic page:
  ten-factor product, blanket bits/s units, "Level 2 is Level 1 differentiated,"
  forced-slot language, eta-as-theorem, guaranteed global convergence, and E = Energy / Truth.
- Corrected `THEOPHYSICS/CANON/SPIRITUAL_TERMS_COMPLETE_DERIVATION_MAP.md` so the Shannon layer is not treated as a blanket bits/s unit system for reduced v3 factors.
- Added a v3 dictionary reconciliation note to the spiritual-terms map and corrected old local variable labels:
  Faith -> Q, Truth -> E, Sin -> F-sector anti-term.
- Corrected `THEOPHYSICS/CANON/MASTER_EQUATION_STRUCTURE_SPEC.md` to point to `CANON_DECISIONS/FABEL_GRADIENT_MASTER_EQUATION_RULING_v3.md` rather than the stale spec filename, and added an eponym caution.

Scan result:

```text
Remaining stale-language hits are either in explicit retired-claims sections or in CANDIDATE-equation-of-motion.md, which is marked CANDIDATE - NOT CANON.
```
