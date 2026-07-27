# THE MASTER EQUATION — COMPLETE STRUCTURAL STACK
## One-page spec, every slot declared — RECONCILED against Fabel Gradient ruling v3
## POF 2828 | 2026-07-26

tags: #canon #master-equation #structure-spec #gradient

**RECONCILIATION (2026-07-26):** This document was originally written from Fabel's chat-session
stack description. It has been reconciled against the canonical ruling
(`CANON_DECISIONS/FABEL_GRADIENT_MASTER_EQUATION_RULING_v3.md`). Five retired claims were present in v1 and are now corrected.

---

## LEVEL 0 — THE FACTOR (one variable, three parts)

Each law factor is a triple structure:

```
Λ_i = Physical_i · Spiritual_i · AgencyOffset_i
```

These are **bridge-declared, not proven from physics.**

| Element | Classification |
|---------|---------------|
| Physical_i (parent equation) | imported physical model |
| Spiritual_i (reading) | bridge identification |
| AgencyOffset_i | modeling choice |

The nine factors, after normalization:

```
X_i = Λ_i / Λ_i_ref
X   = (G, M, E, S, T, K, Q, R, F) ∈ [0,1]^9
```

| Letter | Law (eponym) | Physical Parent | Spiritual Reading | Offset |
|--------|-------------|-----------------|-------------------|--------|
| G | Newton–Grace (Gravitation) | G·m₁m₂/r² | Grace | (1−R) |
| M | Einstein–Meaning (Mass-Energy) | E = mc² | Meaning | A |
| E | Maxwell–Truth (Electromagnetism) | ∇×E = −∂B/∂t | Truth | (1−B) |
| S | Yukawa–Agape (Strong Force) | V(r) = −αs/r + k·r | Love | P_will |
| T | Clausius–Judgment (Thermodynamics) | F = E − TS | Judgment | α |
| K | Shannon–Logos (Information) | C = A·log₂(1+T/D) | Logos | W |
| Q | Heisenberg–Faith (Quantum) | \|ψ⟩ = Σcᵢ\|aᵢ⟩ | Faith | Φ |
| R | Einstein–Frame (Relativity) | ds² = g_μν dx^μ dx^ν | Grace-Frame | frame |
| F | Fermi–Conservation (Weak Force) | ψ → ψ' + δ + ν_loss | Moral Conservation | directional |

Eponym note: the factor letters, physical parents, and spiritual readings above are canonical for this gradient/dictionary layer. Some eponym labels remain proposed in the v3 ruling until David ratifies them; do not use eponym names to override the factor dictionary.

**Units: dimensionless** (normalized to [0,1]). bits/s lives only in the Level-0 parent equations (Shannon layer), not in the gradient variables. The v1 claim "all nine factors carry bits/s" is **retired**.

---

## LEVEL 1 — THE STATIC MASTER EQUATION (the landscape)

```
χ(X) = C_W[ ∏_{i=1}^{9} X_i ]
```

- C_W is a wrapper/normalizer, NOT a tenth factor. **Pending explicit definition, C_W is taken as the identity map on [0,1].**
- No spacetime integral for now — the integral form is future work.
- The product is standard multiplication of dimensionless factors.
- The veto property is the zero property of ℝ: any X_i = 0 ⇒ χ = 0. No exotic operator.
- **χ is dimensionless** for now.

### Properties:
- **Zero-veto:** any X_i = 0 → χ = 0 (proven in Lean: `veto_collapse`)
- **Complementarity:** cross-partials positive
- **Bottleneck sensitivity:** smallest factor has largest marginal return

---

## LEVEL 2 — THE GRADIENT (motion on the landscape)

```
dX/dt = W ∇χ(X) + η(X,t)
```

**Level 2 is NOT "Level 1 differentiated."** Canonical wording: Level 1 defines a coherence landscape. Level 2 **postulates first-order open gradient dynamics** over that landscape. This form is a **chosen open-system model**, not the uniquely forced one. W and η occupy the mobility and source slots of the selected model.

| Symbol | Name | Role | Units |
|--------|------|------|-------|
| dX/dt | Rate of change | How fast the system moves | s⁻¹ |
| W | Mobility operator | State-dependent coupling | s⁻¹ |
| ∇χ | Gradient of χ | Direction of increasing coherence | dimensionless |
| η | Source term | External injection, state- and time-dependent | s⁻¹ |

### What the gradient IS:
- ∇χ points toward higher coherence at every point on the χ surface
- Right vs wrong is a **direction on the landscape**, not a label
- Sign convention: ascent (+∇χ). Coherence is climbed.
- ∇χ under the standard Euclidean metric on [0,1]^9, declared.

### Agency terms:
- **W (mobility):** identifies with free will as a **bridge claim, not a theorem.** W=0 → stationary. Functional form unspecified (§10 of ruling).
- **η (source):** identifies with grace as a **bridge claim, not a theorem.** External source term, state- and time-dependent.

---

## η AND STATIONARITY — the canonical weak claim

**Lean-verified (exact form):**

If ∇χ(X) = 0, and W annihilates the zero gradient (W·0 = 0), and η(X,t) ≠ 0, then the instantaneous velocity Ẋ is nonzero.

This says: **a nonzero source term produces motion from a stationary point.** That's it.

**What this does NOT say:**
- Nothing about trajectory existence
- Nothing about basin departure
- Nothing about finite displacement
- Nothing about global convergence to the global optimum

The global annealing theorem (Kirkpatrick 1983 style) requires unstated hypotheses — landscape regularity, source schedule, reachability. It is an **open theorem**, not a textbook application.

**Kill condition (still valid):** Show a product-form χ landscape where gradient ascent alone (η=0) reaches the global maximum from arbitrary initial conditions. If that exists, η is optional.

---

## PROOF STANDARD — three legs (AMENDED)

1. **Selected, with structural justification.** The gradient-dynamics form is a standard choice for open dissipative systems. It is not the ONLY choice — it is the structurally motivated one. (Retired: "forced, not chosen" / "uniquely dictated by physics.")

2. **Reproduces the knowns.** Must regenerate Law 5's decay and Law 9's Γ_sin. **Status: PENDING.** Note: Law 5 kill test recorded in ruling §9.5 — pure ascent on a product landscape is coherence-nondecreasing by construction. If decay requires arbitrary tuning, Level 2 fails leg 2.

3. **Stationarity escape is Lean-verified.** The weak claim (instantaneous velocity from stationary + source) is machine-checked. The strong claim (global convergence) is open.

---

## LEAN STATUS

Machine-verified (core Lean v4.21.0, `lake build`, zero sorry):
1. `veto_collapse` — any X_i = 0 ⇒ χ = 0, through product AND wrapper
2. `stationary_without_source` — zero gradient + zero source ⇒ zero velocity
3. `source_makes_velocity_nonzero` — zero gradient + nonzero source ⇒ nonzero instantaneous velocity

**Not yet verified:** gradChi ↔ wrapped chi for general C_W; [0,1]⁹ invariance; W functional form; Law 5 / Law 9 reproduction.

---

## OPEN ITEMS

- **FORK-1:** Three unreconciled equations of motion (F3, F4, F5). See CANDIDATE §11.1.
- **§10 verification gates:** Law 5 decay, Law 9 Γ_sin, C_W definition, W form, η form, [0,1]⁹ invariance — ALL must clear before structure locks.
- **BLOCK-2:** Lagrangian ↔ product-form bridge unclosed (OPEN_PROBLEM_001).
- **Eponym convention:** Person–SpiritualTerm governs this gradient/dictionary layer. The July 24 master doc uses a different convention and still needs reconciliation before eponyms are propagated there.

---

## RETIRED CLAIMS (corrected in this version)

These appeared in the v1 structure spec and are now removed:

1. ~~"All nine factors carry bits/s"~~ → factors are dimensionless
2. ~~"Level 2 is Level 1 differentiated"~~ → Level 2 postulates dynamics
3. ~~"W and η are the only two structural slots physics leaves open"~~ → chosen model, not uniquely forced
4. ~~"95%+ confidence, textbook annealing"~~ → weak claim only (instantaneous velocity); global convergence is open
5. ~~"η = grace" as structural fact~~ → bridge claim, not theorem

---

*Reconciled 2026-07-26 by Claude Opus 4.6 against the Fabel Gradient Canonical Spec (David's ruling).*
