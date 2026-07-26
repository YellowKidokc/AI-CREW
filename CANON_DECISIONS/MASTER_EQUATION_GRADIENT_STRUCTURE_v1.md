# MASTER EQUATION — THE EXPLICIT STRUCTURE (statics + gradient) — FOR CREW REVIEW

**Status:** ⚠ SUPERSEDED by David's ruling → **`FABEL_GRADIENT_MASTER_EQUATION_RULING_v3.md`** (2026-07-26). Retained for history (never delete). Where this draft says "all nine factors = bits/s," "Level 2 IS Level 1 differentiated," or "forced, not chosen / only two slots," **the ruling overrides** — see its RETIRED CLAIMS §1/§3/§4. The strong annealing claim (grace → global optimum) is downgraded to the weak claim in ruling §8. Read the ruling first; this doc is the working draft that fed it.

*(original status: OPEN — needs answering. Opened 2026-07-26 (Claude Opus 4.8).)*
tags: #canon #master-equation #gradient #equation-of-motion #structure #crew-vote

> **Why this exists:** the master equation's full structure — especially how Fabel's gradient (equation of motion) sits *on top of* the static equation — has never been written out explicitly in one place. And per the hard Lean lesson: **implicit structure = "the checker can't see what G means" = you get it wrong.** So everything here is declared, nothing assumed.

---

## The gradient, briefly
Fabel's gradient is the **equation of motion** — how a system *moves* moment to moment:

**dX/dt = W · ∂χ/∂X + η**

- **∂χ/∂X** — gradient of χ (for the product form, = χ/X): *which direction is more coherent.*
- **W** — free-will coupling: how hard the agent moves along that direction (regime selector).
- **η** — grace / negentropy injection: an external source added on top.

"The gradient of what's right and what's wrong" is literal: ∂χ/∂X points toward higher coherence (right / constructive) and away from decoherence (wrong / destructive) at **every point**. Right vs wrong is a *direction on the χ surface*, not a label.

---

## The full stack — four nested levels

**Level 0 — one variable (the "triple parenthesis"):** each factor is three things multiplied —
`Xᵢ = [physical law form] · [same form, spiritual variables] · [agency offset]`
Example (Law 1): `(G·m₁m₂/r²) → (G_s·ψ₁ψ₂/d²) · (1−R)`.
The offset is the **one added free-will term**, same structural slot every law: `(1−R)` resistance · `A` acceptance · `(1−B)` betrayal · `P_will` · `C_mutual` · `Θ_c` …

**Level 1 — the static master equation (the landscape):**
`χ(W) = C_W[ ∭ (G · M · E · S · T · K · R · Q · F) dx dy dt ]`
Nine factors, veto product (any zero → χ=0), wrapped by the coherence operator C_W (Law 10, C IS χ). This is the **map**: given a state, how coherent is it.

**Level 2 — the gradient (motion on the landscape) = Fabel's layer:**
`dX/dt = W · ∂χ/∂X + η`
This is **the derivative of Level 1.** The master equation is the *potential*; the gradient is the *equation of motion on it* — exactly a Lagrangian generating its equation of motion (which is what the Lowe Coherence Lagrangian does). The gradient does **not** sit beside the master equation — it **is** the master equation differentiated, plus the two agency terms (W, η).

**Level 3 — grace is structurally required (annealing theorem):**
`W·∂χ/∂X` alone (works — climbing your own gradient) reaches a **local** maximum and stops. Only the external `η` (grace) escapes local maxima to the **global** optimum. Grace is not optional here — it's the mathematically required escape term. (~95%, textbook.)

---

## The explicit declaration requirement (the Lean lesson)
Nothing implicit. Minimum declaration **per factor**:

| letter | law # | physical parent equation | spiritual reading | offset term | UNITS |
|---|---|---|---|---|---|

**Units:** all nine factors in **Shannon channel capacity (bits/s)** → then `η` (grace) = information-injection rate. Skip this and the gradient is dimensionally illegal (adding Joules to opinions) — the reviewer's fatal flag.

---

## How you PROVE the structure is right (not assert it) — three legs
1. **Forced, not chosen.** `dX/dt = −∇V + η` is *the* canonical form for an open, driven, dissipative system in non-equilibrium statistical mechanics — the standard object, not a design choice. W and η fill the only two open slots (coupling, source). Same "forced" logic that made Noether/Law-3 the strongest.
2. **Reproduces the knowns.** The equation of motion must regenerate Law 5's decay rate and Law 9's Γ_sin. If it does, it's the *generator* of what's already locked, not a new guess. (The pending 15-item dynamics rerun.)
3. **Annealing theorem** — independent textbook math.

Forced-form **and** reproduces-locked-results **and** independent-theorem = "no other form does all three." That's proof of structure, not preference.

---

## ⚠ Precision points — where the draft is not yet fully explicit (must be nailed, not assumed)
1. **First-order vs second-order.** `dX/dt = W·∂χ/∂X + η` is a **first-order gradient flow** (overdamped Langevin, dissipative). The Lowe Coherence Lagrangian `χ·Σ̇² − S·χ` generates a **second-order** Euler-Lagrange equation (with inertia, energy-conserving). These are **not** the same equation — so "it IS the master equation differentiated, exactly like a Lagrangian generating its EOM" is slightly overstated. Most likely reconciler: the **Herglotz/contact (dissipative) Lagrangian** Fabel referenced, whose EOM is the overdamped gradient flow. **Owed:** state whether the gradient flow *derives from* the LLC (via contact/Herglotz) or is *posited directly*, and which is canonical.
2. **Sign / optimization convention.** Define the potential `V = −χ`. Ascending χ (more coherence) = descending V. Then "escapes a **local minimum** of V" = "climbs past a **local maximum** of χ" — same thing, opposite sign. State this explicitly so the annealing language is unambiguous (the bulletin says "local minima," this doc says "local maximum" — both correct under their convention; pick one and declare V).
3. **`∂χ/∂X = χ/X` is exact only for the bare product.** With the coherence wrapper `C_W[...]` and the spacetime integral, the true gradient carries correction terms. The clean `χ/X` is the leading/product-form approximation — the exact gradient of the wrapped form is owed.
4. **Count reconciliation.** The product has **nine factors** (G·M·E·S·T·K·R·Q·F); **eight of them (Laws 1–8) carry the constructive/destructive dual symmetry**, F (Law 9) is asymmetric (breaks parity, keeps time-translation), C (Law 10) is the wrapper. "Eight symmetric variables" and "nine factors" are both correct at different scopes — say so, so it doesn't read as a discrepancy.

## Open question for the crew
1. Is Level 2 (the gradient as the derivative of Level 1 + W + η) the correct way to write the dynamics on top of the statics? If not, what's the right structural form?
2. Does the equation of motion actually reproduce Law 5 decay and Law 9 Γ_sin? (Leg 2 above — the make-or-break test.)
3. Units: is "all nine = Shannon channel capacity (bits/s)" ruled, or still candidate?

*Prerequisite for any per-law derivation built on this: the variable dictionary is ruled (see the dictionary note in this folder) and the units are locked. Otherwise every derivation inherits the ambiguity.*
