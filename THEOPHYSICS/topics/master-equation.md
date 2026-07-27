# Master Equation (chi)

tags: #master-equation #chi #core #canon

**Canonical source of truth:** `CANON_DECISIONS/FABEL_GRADIENT_MASTER_EQUATION_RULING_v3.md`
**One-page structural spec:** `THEOPHYSICS/CANON/MASTER_EQUATION_STRUCTURE_SPEC.md`
**Retest protocol:** `CANON_TEST_LEDGER/FABEL_GRADIENT_RETEST_PROTOCOL_v0.1.md`

---

## Current Canon

The Master Equation defines a coherence landscape over nine normalized factors. It does not currently use ten multiplied variables.

```text
X = (G, M, E, S, T, K, Q, R, F) in [0,1]^9
chi(X) = C_W[ product_i X_i ]
dX/dt = W grad chi(X) + eta(X,t)
```

`C_W` is the coherence wrapper. It is not a tenth factor inside the product. Pending a final non-identity definition, `C_W` is treated as identity on `[0,1]`.

---

## Nine Factors

| Letter | Physical Parent | Spiritual Reading | Canonical Note |
|---|---|---|---|
| G | Gravitation | Grace | normalized factor |
| M | Mass-Energy | Meaning | normalized factor |
| E | Electromagnetism | Truth | retired old `Energy / Truth` wording |
| S | Strong | Love | normalized factor |
| T | Thermodynamics | Judgment | normalized factor |
| K | Logos / Information | Logos | normalized factor |
| Q | Quantum | Faith | normalized factor |
| R | Relativity | Grace-Frame | normalized factor |
| F | Weak | Moral-Conservation | normalized factor |

Law 10 / Coherence lives at the `C_W` wrapper level. It is not another multiplicative factor.

---

## Units

```text
X       dimensionless
chi     dimensionless
grad chi dimensionless
dX/dt   s^-1
W       s^-1
eta     s^-1
```

`bits/s` belongs to the Level-0 Shannon parent layer where applicable. It is not the unit of the reduced nine-factor product.

---

## Dynamics

Level 1 defines the static landscape. Level 2 postulates first-order open gradient dynamics over that landscape:

```text
dX/dt = W grad chi(X) + eta(X,t)
```

This is a chosen open-system model, not a uniquely forced derivation from physics. `W` is the mobility operator. `eta` is an external source term. The readings `W = free will` and `eta = grace` are bridge claims, not theorems.

The verified weak claim is narrow:

```text
If grad chi(X) = 0, W annihilates the zero gradient, and eta(X,t) != 0,
then the instantaneous velocity dX/dt is nonzero.
```

This does not prove global convergence, finite basin escape, or full annealing.

---

## What Has Been Checked

- Lean status: core zero/source/veto theorems are recorded in the canonical ruling.
- Python status: `TEST-0000-v3-equation-smoke` passed on 2026-07-27.
- GitHub packet: `https://github.com/DavidLoweOKC/theophysics-prediction-lab/tree/main/v3-tests/TEST-0000-v3-equation-smoke`
- Ledger row: `T061` in `CANON_TEST_LEDGER/THEOPHYSICS_TEST_LEDGER.xlsx`.

The smoke test checks the executable v3 equation adapter only: nine-factor domain, product `chi`, analytic gradient, zero-veto precision, `dX/dt` wiring, and rejection of the old ten-factor shape.

---

## Open Gates

The structure is ruled but not fully locked until the verification gates clear:

- Law 5 decay reproduction.
- Law 9 `Gamma_sin` reproduction.
- explicit `C_W` definition beyond identity, or identity ratified as final.
- explicit `W` functional form.
- explicit `eta` functional form.
- invariance of `[0,1]^9` under the dynamics.
- bridge from Lagrangian/field forms to the reduced product form.

---

## Retired / Historical Forms

These are preserved for audit history but must not be cited as current canon:

1. `chi` as a ten-factor product with `C` multiplied inside.
2. "The Master Equation integrates ten variables."
3. "All nine factors carry bits/s."
4. "Level 2 is Level 1 differentiated."
5. "`W` and `eta` are the only two structural slots physics leaves open."
6. "`eta = grace` as a theorem."
7. "`eta` guarantees global convergence."
8. E = Energy / Truth.

Old work may still be useful as a harness, benchmark, or failure record. When reused, label the old equation as `HISTORICAL_EQUATION_SLOT` and add the current `V3_CANONICAL_EQUATION_SLOT` beside it.

---

## Change Log

| Date | Change | Agent |
|---|---|---|
| 2026-07-27 | Reconciled topic page to v3 canon; moved ten-variable/bits/s/strong-annealing language to retired history. | Codex |
