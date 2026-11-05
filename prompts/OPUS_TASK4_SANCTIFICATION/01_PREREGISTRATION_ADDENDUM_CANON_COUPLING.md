---
title: "Task 4 addendum preregistration: maturity coupled to Grace, per the canon"
date: "2026-11-05"
author: "Claude Opus 5.5"
status: "PREREGISTERED — written after the first receipt, before this run"
---

# Why this run is allowed

The first receipt said: do not make maturity depend on Grace (μ ∝ g) unless an
independent source for that coupling exists first. David then pointed the crew
to `THEOPHYSICS/GRACE_REFERENCE_DOCS/`, which already defines sanctification
(written months before this task):

- `Grace_Derivation.csv`, Grace Modes: *Corrupted Habit → Sanctification:
  "Field gradually realigns the attractor basin — trajectory shifts over time."*
  In this model, that is Grace deepening the +1 well (κ₊ grows while g > 0).
- `GRACE_EXPLICIT_DERIVATION_C4.md` / `GRACE_EXPLICIT_ELIMINATION.md`:
  *Sanctification: "D ↓, A ↑ — channel capacity grows."* In this model, that is
  Grace lowering the perturbation σ.
- `GRACE_DERIVATION_CANONICAL_v1.1.md` Part III: *"moral effort without grace
  trends toward pride, legalism, exhaustion, or despair."* This is stated as a
  tendency; it does not say whether built maturity decays.

The canon fixes the *direction* of the coupling. It does **not** say whether
maturity built under Grace decays once Grace stops. So that is run both ways.

# Variants (β = 0.2, σ = 0.4, g = 0.4 for t < 100, then withdrawn, T = 600)

| Variant | Maturity growth | Maturity decay | Noise |
|---|---|---|---|
| 2a | dκ₊/dt = μ·(g/0.4)·(κ_max − κ₊) while c at +1 | only while fallen (as before) | σ |
| 2b | same as 2a | toward κ₀ at rate λ whenever g = 0 | σ |
| 2c | none (κ = 1) | — | σ·(1 − 0.5·g/0.4): Grace halves noise (C4) |
| 2d | 2b + 2c together | | |

μ = 0.05, κ_max = 5, λ = 0.05, seed 2828, 1000 trajectories.

# Predictions

- **2a:** maturity built during the Grace period persists, so most runs stay
  at +1 after withdrawal (like post-hoc B, κ_max = 5). Prediction: > 90% never
  fall after withdrawal.
- **2b:** κ₊ decays with time constant 1/λ = 20 units. Once it is too shallow
  to hold against β and σ, runs fall. Prediction: > 90% fall within 500 units,
  with the falls delayed relative to the no-maturity control.
- **2c:** without a deeper well, halving noise only while Grace is on gives no
  protection after withdrawal. Prediction: > 95% fall, timing close to the
  no-maturity control (post-hoc B row 1).
- **2d:** behaves like 2b.

# What would change the conclusion

If 2a also falls, maturity cannot carry anyone without ongoing Grace in this
model, whatever the coupling, and the dispatch prediction is restored in full.
If 2b holds, decay is too slow to matter on this horizon, and the
John 15:4 reading needs a faster decay than λ = 0.05.
