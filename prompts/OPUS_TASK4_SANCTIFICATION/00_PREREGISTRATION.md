---
title: "Task 4 preregistration: sanctification as a stability problem"
date: "2026-11-05"
author: "Claude Opus 5.5"
status: "PREREGISTERED — written before any simulation was run"
---

# Independence statement

I read only the dispatch and the four context files it lists, plus files I read
earlier tonight. I did NOT open `CODEX_RECEIPT_REPENTANCE_RIVAL_2026-11-05.md`,
`CREW_INDEPENDENT_REVIEW_LANDAUER_GRACE_V2_2026-11-05.md`, or
`CREW_WORK_BREAKDOWN_LANDAUER_GRACE_2026-11-05.md`, which appeared after the
dispatch.

# The danger this test must avoid

The obvious model, "history pulls current toward -1, so without Grace current
falls," returns the predicted answer because the prediction was typed in as the
model. That would be the same true-by-construction problem as the placeholder
operators in the non-replaceability kernel.

So this test does not ask "does current fall?" It asks:

> **Which premises are necessary and sufficient for current = +1 to fail
> without ongoing input, and how large does each one have to be?**

The answer is reported as a boundary in parameter space, not as a yes/no.

# Model (fixed before running)

The discrete `current ∈ {-1, 0, +1}` is relaxed to a continuous orientation
`c ∈ [-1.5, 1.5]`, read back as -1 / 0 / +1 by thirds. `history = -1` and
`standing = paid` are held fixed (they are the post-salvation state).

```text
dc = [ κ(c − c³)      habit:  self-reinforcing orientation, wells at ±1
     − β               history tilt: the pull of history = -1
     + g(t) ] dt       Grace: external input, ≥ 0
     + σ dW            perturbation (temptation, circumstance), Gaussian
```

Maturity variant: κ splits into κ₊ (depth of the +1 well) that grows with time
spent at +1 toward a ceiling κ_max, and relaxes back when c ≤ 0.

Each term is a separate, removable premise:

| Premise | Symbol | Theological reading | Can be switched off |
|---|---|---|---|
| P1 history exerts a pull | β > 0 | Rom 7:21 "evil lies close at hand" | β = 0 |
| P2 orientation is self-reinforcing | κ > 0 | habit / character (Rom 6:16) | κ = 0 |
| P3 the world perturbs | σ > 0 | temptation (1 Cor 10:13) | σ = 0 |
| P4 Grace is ongoing | g(t) | "abide in me" (John 15:4) | g = 0, or one-time only |
| P5 maturity deepens the well | κ₊ grows | Heb 5:14, "trained by practice" | μ = 0 |

# Predictions (written before running)

**H1 (deterministic).** With σ = 0 and g = 0, +1 stays stable iff
β < (2 / 3√3)·κ ≈ 0.385κ. This is analytic: the +1 well is destroyed in a
saddle-node bifurcation when the tilt exceeds the peak of κ(c − c³). If β is
below that, the counter-test SUCCEEDS: current self-stabilizes with no Grace.

**H2 (noise, one-time Grace).** With σ > 0, β > 0, g = 0 after an initial set
to +1, every trajectory eventually leaves +1 (finite mean escape time), and the
long-run fraction of time at +1 is below 1/2. Escape time grows roughly
exponentially in (barrier height) / σ².

**H3 (ongoing Grace).** A constant g ≥ β cancels or reverses the tilt, and
long-run occupancy at +1 rises above 1/2. Intermittent Grace gives
intermediate occupancy that depends on the duty cycle.

**H4 (maturity).** With P5 on, the hazard of falling from +1 decreases with
accumulated time at +1, but stays positive unless κ_max is unbounded. Maturity
reduces the need for Grace; it does not remove it unless the ceiling is
infinite or σ = 0.

**H5 (dispatch prediction restated).** "Without ongoing Grace, current drifts
back" holds iff P1 AND P3 are both on (β > 0, σ > 0), or β exceeds the H1
threshold. Remove either and it fails.

# Kill conditions

- If simulation contradicts the H1 analytic threshold beyond discretization
  error, the code is wrong; fix the code, not the threshold.
- If H2 fails (some regime with β > 0, σ > 0, g = 0 holds +1 for the full
  horizon in > 99% of runs AND the long-run fraction exceeds 1/2), the
  dispatch prediction is false for that regime, and it is reported as such.
- If maturity reduces the hazard to zero at finite κ_max with σ > 0, H4 is
  false.

# Fixed settings

Euler–Maruyama, dt = 0.01, seed 2828, 2000 trajectories per scenario unless
stated. All parameter grids are listed in `sanctification_model.py` and were
not changed after the first run.
