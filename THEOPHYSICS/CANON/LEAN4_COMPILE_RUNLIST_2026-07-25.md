# Lean 4 — Consolidated Compile Run-List

tags: #lean4 #verification #runlist #canon

**Built:** 2026-07-25 · **Agent:** Claude Opus 4.8
**Source of truth:** `\\192.168.2.50\h_hp\Desktop\LEAN 4 Master.xlsx` (MISSION CONTROL)
**Corpus root:** `H:\Desktop 2\LEAN 4\Google CoLab Python\_EXTRACTED_REPOS`
**Data files:** `RUNLIST\MASTER_RUNLIST.csv` (per-theorem), `RUNLIST\RUNLIST_BY_FILE.csv` (per-file)

---

## Purpose

One consolidated list of **every real Lean declaration** across the whole Theophysics corpus, so
they can be run through Lean in one pass and each recorded PASS / FAIL / SORRY. This closes the
workbook's central gap: **0 of 1567 declarations have ever been compiled — all are `PENDING_NOT_RUN`.**

The list is a *union of three recovery sources*, deduped by theorem name, so nothing forgotten
across past sessions is dropped:

| Source sheet | Rows in | Meaning |
|---|---|---|
| `LEAN_CANONICAL_LEDGER` | 887 | One canonical owner per declaration name |
| `Missing From Workbook` | 349 | Real theorems in the `.lean` files never entered in the workbook |
| `Recovered Missing Names` | 172 | Previously scoped-missing names resolved by the full 47-file scan |

**Union after dedupe by theorem name: 878 unique declarations** (from 1,404 raw rows).
**296 of them were recovered/forgotten** — present only because Missing + Recovered were folded
in (169 recovered-only, 127 missing-only, 2 both). A ledger-only view would have missed them.

> Honesty: this is a **static inventory**, not a compile result. Nothing here is claimed to
> compile. The binding rule still holds — *do not cite any theorem as public evidence until its
> exact statement, proof strength, and claim class are checked.*

---

## Build targets (what "one run" actually means)

The 878 declarations live in ~20 files across three build units. Two are lakefile+manifest ready;
one is loose files needing a lakefile.

| Build unit | Toolchain | Ready? | Notes |
|---|---|---|---|
| `theophysics-lean-main` | `leanprover/lean4:v4.32.0-rc1` | **YES** — lakefile.lean + manifest + **Mathlib vendored** | Holds the bulk (~600): Core, Adversarial, Canonization, Universality, LawMechanisms, ChiEvaluator, + test modules |
| `Faith-Thru-Physics-Lean-4--main` | `leanprover/lean4:v4.31.0` | **YES** — lakefile.lean + manifest, Std-only (no Mathlib) | NegativeInventory + Core/Adversarial/ChiEvaluator/Coherence/Fall/Fracture |
| `Lean-4-Proofs-main` | (none at root) | **NO** — needs a lakefile; `.lean` sit in `theophysics-lean-verification-package\...` | Entropy/Fruits/Production kernels + narrow_product_test |

**Proposed one-run command (per ready unit), no source edits:**
```
cd <unit>
lake build      # records exact pass/fail; capture full stdout+stderr to a log
```
For `Lean-4-Proofs-main`: either add a minimal `lakefile.lean` listing the kernels as a new
target (additive — respects the no-edit house rule), or compile each kernel loosely with `lean`.

---

## Run-list by file (highest-value proofs first)

`sub` = SUBSTANTIVE_OR_CASE_PROOF · `fin` = FINITE_DECIDABLE · `rec` = recovered (not in base ledger)

| # | File | total | sub | fin | rec |
|---|---|---:|---:|---:|---:|
| 1 | theophysics-lean-main\Theophysics_Canonization.lean | 71 | 11 | 0 | 0 |
| 2 | Lean-4-Proofs...\narrow_product_test\NarrowProductTest\Basic.lean | 30 | 5 | 4 | 0 |
| 3 | Faith-Thru-Physics-Lean-4-\Theophysics_NegativeInventory.lean | 37 | 0 | 8 | 0 |
| 4 | Lean-4-Proofs...\FruitsGraceKernel.lean | 17 | – | 8 | 0 |
| 5 | theophysics-lean-main\Theophysics_Universality.lean | 65 | 7 | 0 | 0 |
| 6 | theophysics-lean-main\Final_Lean4_From_Excel.lean | 38 | – | 3 | 23 |
| 7 | theophysics-lean-main\Theophysics_Adversarial.lean | 133 | 0 | 2 | 78 |
| 8 | theophysics-lean-main\Theophysics_Core.lean | 137 | 0 | 0 | 130 |
| 9 | theophysics-lean-main\Theophysics_LawMechanisms.lean | 63 | 0 | 0 | 0 |
| 10 | theophysics-lean-main\Theophysics_ChiEvaluator.lean | 58 | 0 | 0 | 23 |
| 11 | Lean-4-Proofs...\CorrectedEntropyKernel.lean | 43 | 0 | – | 0 |
| 12 | theophysics-lean-main\Theophysics_DelayedChoice.lean | 29 | 0 | 0 | 0 |
| 13 | theophysics-lean-main\Theophysics_Coherence.lean | 28 | 0 | 0 | 13 |
| 14 | theophysics-lean-main\Theophysics_DeathTest.lean | 24 | 0 | 0 | 0 |
| 15 | theophysics-lean-main\Theophysics_Fracture.lean | 22 | 0 | 0 | 10 |
| 16 | theophysics-lean-main\Theophysics_Fall.lean | 21 | 0 | 0 | 11 |
| 17 | theophysics-lean-main\Theophysics_GodTest.lean | 20 | 0 | 0 | 0 |
| 18 | Lean-4-Proofs...\COPY_PASTE_LEAN4.lean | 17 | – | 0 | 10 |
| 19 | Lean-4-Proofs...\TheophysicsProductionKernel.lean | 16 | 0 | 0 | 0 |
| 20 | theophysics-lean-main\Theophysics_MaxwellTrinity.lean | 9 | 0 | 0 | 0 |

(Full per-theorem detail — name, exact file, line, proof strength, provenance — in `MASTER_RUNLIST.csv`.)

---

## Priority order for the run (from the workbook's own strength ranking)

1. **The 26 SUBSTANTIVE + 26 FINITE_DECIDABLE proofs** — the only rows carrying real formal weight.
   Concentrated in Canonization (11 sub), Universality (7 sub), NarrowProductTest (5 sub / 4 fin),
   NegativeInventory (8 fin). Run these first; they are what "verified" would actually mean.
2. **Load-bearing adversarial controls** — `heavisideVectorEM_invalid`, `modalism_invalid`,
   `relabeledRoleSystem_invalid` (REJECTION theorems). Real content; must pass.
3. **The rest**, to get a full PASS/FAIL board and retire the `PENDING_NOT_RUN` status.

**Do NOT** promote to public evidence: any `TRIVIAL_TRUE` (`: True := by trivial`) or
`DEFINITIONAL_RFL` row, and especially the `*_passes_if_*_guard_removed` pairs in Core.lean.

---

## Status of this artifact

- [x] Consolidated 878-declaration run-list built and deduped, provenance preserved.
- [x] Build-readiness of each target repo verified on disk (toolchains, lakefiles, Mathlib).
- [ ] **NOT YET RUN.** No `lake build` executed. Awaiting David's go to run the two ready units
      and capture logs (and to add the additive lakefile for `Lean-4-Proofs-main`).

## What is NOT covered here (deliberately, for the "get everything" decision later)

- `Embedded Add List` (42 rows) — source docs/repos proposed for the workbook but not yet Lean
  declarations (e.g. TEN_LAWS_CANONICAL_EQUATIONS, REFERENCE_OPUS). These are *content to formalize*,
  not existing theorems — a separate backlog.
- `atlas-lean` (D:\GitHub\atlas-lean) — a large Mathlib-based math corpus, appears unrelated to the
  apologetics case; flagged for David to confirm in/out of scope.
- Vault snapshots under `faiththruphysics-site-data\_LOCKED_FORMAL_VERIFICATION_VAULT_*` — older
  frozen copies; not merged to avoid duplicate/stale names.
