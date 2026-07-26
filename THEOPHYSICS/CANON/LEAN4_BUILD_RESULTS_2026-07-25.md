# Lean 4 — Actual Build Results (the "one run")

tags: #lean4 #verification #buildresult #canon

**Run:** 2026-07-25 · **Agent:** Claude Opus 4.8 · Toolchain: elan 4.2.3
**Method:** copied each build unit's source to local scratchpad (no edits to David's corpus),
ran `lake build`, captured full logs, then ran `#print axioms` audits on load-bearing theorems.
This is the first time any of these declarations have actually been run through Lean — it retires
`PENDING_NOT_RUN` for the units below.

---

## UNIT 1 — `Faith-Thru-Physics-Lean-4-` (Std-only, v4.31.0) — ✅ PASS

**`lake build` exit 0. Build completed successfully (17 jobs).** Zero dependencies (`packages: []`),
so this is a pure-Lean result with nothing external to trust.

Modules built clean (8 libraries):
`Final_Lean4_From_Excel`, `Theophysics_Core`, `Theophysics_Adversarial`, `Theophysics_Coherence`,
`Theophysics_Fracture`, `Theophysics_Fall`, `Theophysics_ChiEvaluator`, `Theophysics_NegativeInventory`.

**Soundness checks:**
- **No `axiom` declarations** anywhere in the sources.
- **No real `sorry`.** The ~160 `have this := sorry` lines in the log are all output of
  **`#check_failure`** commands — a command that *asserts a term fails to typecheck*. e.g.
  `#check_failure (show CouplingState.C0 = CouplingState.C1 from by rfl)` verifies you **cannot**
  prove `C0 = C1`. The build succeeding means every adversarial guard correctly REJECTED the wrong
  statement. These are the controls working, not broken proofs.
- **Axiom audit** (`#print axioms`) on load-bearing negation theorems:
  - `no_grace_faith_signature_alias` → depends on `[propext]` only
  - `no_entropy_grace_signature_alias` → depends on `[propext]` only
  - `no_mere_order_as_full_coherence` → **depends on no axioms at all**
  - `propext` is a standard, sound Lean/Mathlib axiom (propositional extensionality). No `sorryAx`,
    no `Classical.choice` surprises, no custom axioms. **These are genuinely proven.**

**Honest caveats:** build emitted style/linter warnings (unnecessary `simpa`, unused variables) —
cosmetic, not soundness. This unit is the Std-only frozen package; its *content* is elementary
finite/decidable and signature-distinctness facts — real, but modest. "Compiles cleanly, no sorry,
no custom axioms" is proven; it does NOT by itself establish any theological claim.

---

## UNIT 2 — `theophysics-lean-main` (Mathlib, v4.32.0-rc1) — ⏳ BUILDING

Holds the highest-value substantive proofs (Canonization 11 sub, Universality 7 sub) + Core,
Adversarial, LawMechanisms, ChiEvaluator, MaxwellTrinity, DelayedChoice, DeathTest, GodTest.
Requires Mathlib; pulling prebuilt cache (batteries/aesop/Qq/proofwidgets/importGraph/Cli + Mathlib),
then `lake build`. Result + axiom audit to be appended here on completion.

---

## UNIT 3 — `Lean-4-Proofs-main` kernels — ⛔ NOT YET

No root lakefile; `.lean` kernels sit under `theophysics-lean-verification-package\`
(CorrectedEntropyKernel, FruitsGraceKernel, TheophysicsProductionKernel, narrow_product_test).
Needs an additive lakefile (respecting the no-edit house rule) or loose `lean` compile. Pending.

---

## Scoreboard

| Unit | Declarations (run-list) | Status | Sorry | Custom axioms |
|---|---:|---|---|---|
| Faith-Thru-Physics-Lean-4- | ~250 across 8 files | ✅ PASS (exit 0) | none (all `#check_failure`) | none (propext only) |
| theophysics-lean-main | ~560 across 12 files | ⏳ building | — | — |
| Lean-4-Proofs kernels | ~120 | ⛔ pending lakefile | — | — |
