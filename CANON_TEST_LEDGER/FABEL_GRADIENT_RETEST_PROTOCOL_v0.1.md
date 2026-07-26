# Fabel Gradient / Lagrangian Retest Thread

**v0.1 starter protocol | 2026-07-26 | POF 2828**
**STATUS: DRAFT FOR CREW SIGN-OFF.** Pending David's FINAL ruling (hoped today). Once ruled, this becomes the standing intro/outro test protocol.
tags: #canon #retest #gradient #lagrangian #harness #crew-signoff

> **Depends on:** the v3 ruling `../CANON_DECISIONS/FABEL_GRADIENT_MASTER_EQUATION_RULING_v3.md` and the dictionary `../CANON_DECISIONS/DICTIONARY_RULING_OP12.md`. Companion to the `THEOPHYSICS_TEST_LEDGER.xlsx` in this folder.
>
> **Daily operation once ruled:** every AI that comes through AI-crew for intro/outro picks **2–3 tests**, runs them **independently**, records the evidence-dossier row (§9), and **uploads results to GitHub** (grouped Python/Colab/Lean per the ledger). Low-friction, one AI at a time; it clears the corpus without anyone being blocked.
>
> **Path note:** `H:\Desktop 2\…` is the mapped drive for `\\192.168.2.50\h_hp\Desktop 2\…` — use whichever your environment exposes.

**Purpose:** set up the retesting program after the v3 Fabel Gradient / Master Equation reconciliation.

## 0. Source Shelves For This Thread

Use these local shelves as the starting library:

```text
H:\Desktop 2\OpenAI-LEAN4-GAP01
H:\Desktop 2\Lagrangian
H:\Desktop 2\LEAN 4
H:\Desktop 2\OpenAI-LEAN4-CALL
```

High-signal files/folders already found:

```text
H:\Desktop 2\Lagrangian\TESTS\lagrangian_workbench.py
H:\Desktop 2\Lagrangian\TESTS\Lagrangian_Family_Workbench.ipynb
H:\Desktop 2\Lagrangian\TESTS\README.md
H:\Desktop 2\Lagrangian\lagrangian_side_by_side.md
H:\Desktop 2\Lagrangian\lowe-coherence-lagrangian.canonical.md
H:\Desktop 2\Lagrangian\Lowe Coherence Lagrangian_Canonical.md
H:\Desktop 2\Lagrangian\FAMILY_BRIEFING_FINAL.md
H:\Desktop 2\LEAN 4\Google CoLab Python\_CLAIM_HUB\06_python_colab_readiness_packet
H:\Desktop 2\LEAN 4\MASTER_EQUATION\Theophysics_Core.lean
H:\Desktop 2\LEAN 4\MASTER_EQUATION\Final_Lean4_From_Excel.lean
```

Important first finding:

```text
The existing Lagrangian workbench already contains the right discipline:
it compares candidate models under one bench and says plainly that the harness
checks formal behavior, not final truth.
```

Second finding:

```text
Some existing Colab / master-equation artifacts still use older 10-variable
or C-as-factor language. The v3 retest must include version-drift checks
before treating old test results as current evidence.
```

## 1. Current Ruling

The new gradient equation does **not** automatically erase the old tests.

It does require a clean retest program because the canonical structure changed:

- the nine factors are normalized before multiplication;
- `C_W` is a wrapper/operator, not a tenth factor;
- the field form and reduced form are now explicitly separated;
- Level 2 dynamics is a model postulate, not merely "Level 1 differentiated";
- `eta` is an external source term, not a guaranteed global-convergence engine;
- theological identifications remain bridge claims.

So the status should be:

```text
Architecture canonical.
Old tests retained as evidence.
Retest harness required.
Lean 4 formalization last.
```

## 2. Side-By-Side Structures To Preserve

The test program must keep the older Lagrangian structure beside the new gradient equation.

### A. Master / Field Form

```text
chi[Lambda] = C_W[ integral_Omega product_i LambdaHat_i(z) dmu(z) ]
```

This is the canonical field/coherence functional.

### B. Reduced Gradient Form

```text
chi(X) = product_i X_i
dX/dt = W(X,t) grad chi(X) + eta(X,t)
```

This is the reduced state-space dynamics used for Python/Colab testing.

### C. Lowe Coherence Lagrangian Family

Older notes identify the Lagrangian as the action/dynamics form of the Master Equation:

```text
Master Equation -> Lagrangian terms -> Euler-Lagrange / Rayleigh dynamics
```

The important historical forms to keep side by side:

```text
LLC seed:        L = chi(t) * SigmaDot^2 - S * chi(t)
Field action:    C[chi] = integral sqrt(-g)[1/2(partial chi)^2 - V(chi) + L_int] d4x
LLC v2 note:     K(x,t) wraps the law-sum as Logos/information substrate
```

These should be treated as related action-layer models, not silently identical to the new gradient-flow model.

## 3. Lagrangian Tracks To Include

The current test matrix should track at least these five Lagrangian families:

| Track | Name | Role | Status Boundary |
|---|---|---|---|
| LAG-01 | Lowe Coherence Lagrangian | general action-form of Master Equation | compare to v3 gradient |
| LAG-02 | Spirit Lagrangian | spiritual coordinate / field proposal | speculative formal model unless bounded |
| LAG-03 | Anti-Lagrangian | collapse / entropy-only control | adversarial control |
| LAG-04 | Interaction Lagrangian | coupling terms, source terms, relational interactions | draft / testable |
| LAG-05 | Unified Field Lagrangian | full field-theoretic expansion | high-risk, high-scope model |
| APP-FAM | Family Lagrangian | application model for relational systems | new application, not yet canon |

Existing side-by-side language from the local library should be preserved:

```text
This harness does not decide whether the framework is true.
It checks whether each candidate behaves like a disciplined formal model
under the same test bench.
```

If "Family Lagrangian" is used, mark it as an application model:

```text
The proposed Family Lagrangian models a family as a coupled dynamical system with relational state variables, restoring forces, external inputs, and multiple possible equilibria. It is not yet evidence that real families literally obey this Lagrangian until variables are operationalized and tested against data and rival models.
```

## 4. Testing Principle

Every test must say what kind of evidence it creates. Use five separate lines:

```text
Defined:
Formally proven:
Numerically demonstrated:
Empirically observed:
Bridge interpretation:
```

Do not merge these categories.

## 5. Core Python / Colab Modules

### Module 0: Library Intake And Version Drift
Purpose: classify the old tests before rerunning them.
Inputs:
```text
H:\Desktop 2\Lagrangian\TESTS\lagrangian_workbench.py
H:\Desktop 2\Lagrangian\lagrangian_side_by_side.md
H:\Desktop 2\LEAN 4\Google CoLab Python\_CLAIM_HUB\06_python_colab_readiness_packet
H:\Desktop 2\LEAN 4\Google CoLab Python\_EXTRACTED_REPOS
```
Tests:
- identify whether each artifact uses nine factors or ten variables;
- identify whether `C` / `C_W` is a wrapper or a product factor;
- identify whether `K` is a variable or substrate wrapper in that artifact;
- identify whether `S` means Strong/Love or entropy/sin;
- identify whether `T` means Thermodynamics/Judgment or time/decay;
- identify whether `eta`/source is present, absent, or implicit;
- label every old result as `current`, `historical`, `needs migration`, or `do not cite for v3`.
Shows: the retest program knows which old results are valid under v3 and which are only historical.

### Module 1: Canonical State Validation
Purpose: prove the implementation uses the right v3 canon.
Tests:
- nine factors only inside the product;
- `C_W` wraps the nine factors and is not counted as factor ten;
- each `X_i` normalized to `[0,1]`;
- `chi(X)` stays in `[0,1]` for admissible states;
- any `X_i = 0` implies `chi = 0`;
- no residual `bits/s` units in the reduced dynamics.

### Module 2: Gradient Algebra
Purpose: check the reduced product gradient.
Tests:
- for `chi(X) = product_i X_i`, verify `partial chi / partial X_i = product_{j != i} X_j`;
- compare analytic gradient vs finite-difference gradient;
- test interior, boundary, near-zero, and random states;
- verify gradient vanishes in expected coordinates when enough factors are zero;
- test numerical stability near `X_i -> 0`.

### Module 3: Source-Term Behavior
Purpose: test the narrow source theorem honestly.
Tests:
- if `grad chi = 0` and `eta = 0`, velocity is zero;
- if `grad chi = 0` and `eta != 0`, unconstrained velocity is nonzero;
- test boundary projection separately;
- test constant, scheduled, stochastic, state-dependent `eta`;
- record whether `eta` initiates movement, NOT whether it guarantees global convergence.

### Module 4: Mobility / Agency Operator W
Purpose: test whether `W` behaves like a valid mobility operator.
Tests:
- scalar `W`; diagonal `W`; full matrix `W`;
- PSD `W` should make `dot(grad chi, W grad chi) >= 0`;
- non-PSD `W` flagged as agency-modulated drift, not guaranteed ascent;
- test whether `W(R)` / `W(agency)` forms preserve admissibility.

### Module 5: Boundary Conditions
Purpose: keep `X` inside `[0,1]^9`.
Tests: clipping; reflecting; logistic reparameterization; soft barrier; compare whether each changes Law 5 / Law 9 reproduction; record boundary artifacts.

### Module 6: Field-To-Reduced Consistency
Purpose: connect the retained integral form to the reduced scalar form.
Tests:
- homogeneous field reduction `LambdaHat_i(z) = X_i`;
- verify field integral collapses to normalized product after `C_W`;
- test nonhomogeneous fields; compare averaged reduction choices;
- define exactly what `C_W` does in code;
- verify changing `Omega` scaling doesn't change normalized `chi` unless intended.

## 6. Reproduction Gates (the v3 LOCK GATES)

### Gate A: Law 5 Decay
Question: can `dX/dt = W grad chi + eta` reproduce the locked Law 5 decay behavior?
Minimum tests: define Law 5 coordinate `T = Thermodynamics / Judgment`; import old expected decay curve; run v3 dynamics under matched IC; compare fitted rate, residuals, stability, sensitivity; test whether hand-tuned `W`/`eta` is required; compare vs old Lagrangian/Rayleigh decay side by side.
Pass: reproduces Law 5 decay within declared tolerance **without hidden parameter fitting**.

### Gate B: Law 9 Gamma_sin
Question: can `dX/dt = W grad chi + eta` reproduce the locked Law 9 Gamma_sin behavior?
Minimum tests: define Law 9 coordinate `F = Weak Force / Moral Conservation`; import old `Gamma_sin` signature; test direction, sign, threshold, asymmetry; test anti-Lagrangian controls; test whether `eta` is required and whether that's structural or tuned.
Pass: reproduces the Law 9 Gamma_sin signature under declared assumptions.

## 7. Lagrangian Side-By-Side Tests
For every major test, run in parallel where possible:
```text
Old LLC / action model
v3 reduced gradient model
anti-Lagrangian control
null/random model
```
Keep the existing regimes (`balanced, resistance_drag, source_rich, sink_heavy, entropy_heavy`) and add v3 variants (`v3_balanced, v3_resistance_drag, v3_source_rich, v3_sink_heavy, v3_boundary_stall, v3_zero_factor, v3_wrong_dictionary_control`).
Compare: trajectories; equilibria; stability; conserved/monotone quantities; perturbation response; failure modes; parameter sensitivity. This prevents the new equation from winning just because it's the only model tested.

## 8. Controls And Kill Tests
Every positive test gets at least one rival. Controls: random factor permutation; wrong July dictionary; `C_W` as a tenth factor; unnormalized bits/s product; zero-source model; entropy-only/anti-Lagrangian; random mobility matrix; shuffled Law 5/9 target; non-PSD `W`; no-boundary model.
Kill examples:
```text
If the wrong dictionary performs equally well, the mapping is not load-bearing.
If C_W-as-factor performs equally well, the wrapper correction is not load-bearing.
If random W reproduces Law 5 and Law 9 equally well, the dynamics is underconstrained.
If eta can be arbitrary and still passes, the source term is not disciplined.
```

## 9. Evidence Dossier Format
Every notebook/test outputs the same record:

| Field | Meaning |
|---|---|
| Test ID | stable identifier |
| Canon version | e.g. Fabel Gradient v3.0 |
| Model tested | gradient / LLC / anti-Lagrangian / null |
| Claim tested | exact claim |
| Inputs | initial conditions, parameters, seed |
| Expected result | pass condition |
| Observed result | measured result |
| Tolerance | numeric tolerance |
| Pass/fail | result |
| Failure mode | if failed |
| Evidence level | formal / numerical / empirical / bridge |
| Repro command | how to rerun |
| Notebook/file | source |

## 10. Proposed Folder Layout
```text
tests/
  canon/            test_state_validation.py, test_units_and_normalization.py
  gradient/         test_product_gradient.py, test_source_term.py, test_mobility_operator.py, test_boundaries.py
  field_reduction/  test_CW_operator.py, test_field_to_reduced.py
  reproduction/     test_law5_decay.py, test_law9_gamma_sin.py
  lagrangian_compare/ test_llc_vs_gradient.py, test_anti_lagrangian_control.py, test_family_lagrangian_application.py
  controls/         test_dictionary_shuffle.py, test_CW_as_factor_failure.py, test_random_W.py
  reports/          build_evidence_dossier.py
```

## 11. Lean 4 Comes Last
Recommended Lean order: (1) `State = Fin 9 -> Real`; (2) admissible `[0,1]^9`; (3) raw product `chi`; (4) zero/veto property; (5) product derivative theorem; (6) gradient model; (7) stationary-without-source theorem; (8) nonzero-source-moves-stationary-state (unconstrained); (9) then `LawIso`; (10) then Law 5 / Law 9 proof structures.

## 12. First Work Order
Build the harness in this order:
```text
1. Library intake and version-drift classification
2. Canon state validation
3. Product gradient tests
4. Source-term tests
5. W/mobility tests
6. Field-to-reduced C_W tests
7. Law 5 reproduction
8. Law 9 reproduction
9. Lagrangian side-by-side comparison
10. Controls and kill tests
11. Evidence dossier
12. Lean 4
```

## 12.1 Immediate File-Level Work Orders

### Work Order A: Audit The Existing Lagrangian Workbench
File: `H:\Desktop 2\Lagrangian\TESTS\lagrangian_workbench.py`
Tasks: preserve existing benchmark models; preserve Family-style tests; add v3 nine-factor reduced gradient model; add v3 `C_W` wrapper test; add v3 controls for wrong dictionary and `C_W` as factor; emit the standard evidence dossier row per test.

### Work Order B: Update The Side-By-Side Report Template
File: `H:\Desktop 2\Lagrangian\lagrangian_side_by_side.md`
Tasks: keep LLC v1 as historical compression form; keep Spirit and Anti as contrast models; keep LLC v2 as canonical Lagrangian-side candidate where current; add Fabel Gradient v3 as a new reduced-gradient candidate; add a version note wherever older `C` as factor or 10-variable language appears.

### Work Order C: Use The Python/Colab Readiness Packet
Folder: `H:\Desktop 2\LEAN 4\Google CoLab Python\_CLAIM_HUB\06_python_colab_readiness_packet`
Tasks: treat the variable registry as the first variable-control document; mark variables fixed/fitted/normalized/retired; add `X_i, C_W, W, eta, grad_chi, v3_chi`; identify high-leverage drift variables: `chi, lagrangian, W, Gamma9, chi10, K, S, T, C`.

### Work Order D: Lean Later, But Inventory Now
Files: `H:\Desktop 2\LEAN 4\MASTER_EQUATION\Theophysics_Core.lean`, `…\Final_Lean4_From_Excel.lean`
Tasks: do not rewrite Lean first; inventory existing defs for `CoherenceOperator`, product/veto property, LawIso-like structures; flag theorem names stronger than their formal statements; save a Lean migration list for after Python/Colab retesting.

## 13. Non-Negotiable Language
Use: "The implemented system exhibits the stated behavior across the tested parameter range." — Not: "Python proves the ontology."
Use: "Within the declared formal system, Lean verifies the stated theorem." — Not: "Lean proves the theology."
Use: "The theological identification is an explicit bridge claim carried by the model." — Not: "The source term mathematically proves grace."

## 14. One-Sentence Operating Rule
Preserve every old result as historical evidence, rerun every load-bearing result against v3, compare the gradient equation against the Lagrangian stack and controls, and only promote claims after the evidence dossier shows what was defined, tested, reproduced, and still left open.

---

## CREW SIGN-OFF (append your line)

Read the protocol + the v3 ruling it depends on, then sign. If you object, say what and why — a protocol nobody stress-tested is not ratified.

| AI | Date | SIGN-OFF (agree / changes) | Notes |
|---|---|---|---|
| Claude Opus 4.8 (1M) | 2026-07-26 | AGREE (filed; consistent with v3 ruling — bits/s retired, C_W wrapper, July dictionary) | See precision note below |
| | | | |

*Opus 4.8 note:* one thing to confirm during Module 0 — the July dictionary in this protocol (S=Strong/Love, T=Thermo/Judgment, F=Weak/Moral-Conservation) matches David's v3 ruling §2. My earlier `DICTIONARY_RULING_OP12.md` has been reconciled to that ruling (E=Energy, R=Grace-Frame, F=Moral-Conservation). Any artifact using the old letters is `do not cite for v3`.
