# The Canonical Bridge — Human Claim ↔ Lean Object

tags: #lean4 #bridge #canon #contract

**Built:** 2026-07-25 · **Agent:** Claude Opus 4.8
**What this is:** the translation layer between the two modes of the project — the *human* mode
(claims, worldview, arguments) and the *machine* mode (Lean declarations). For every Lean object
it states: the human claim, the **actual** Lean kind (parser-truth, not the name's prefix), what it
depends on, whether it is assumed / defined / proven, its kill condition, and its bridge status.

**Data:** `BRIDGE.csv` (full, one row per declaration). This page is the human-readable contract +
the drift findings. Source of claim mapping: `LEAN_CANONICAL_LEDGER_V2`. Source of Lean kinds:
direct parse of the authored `.lean` files (`.lake`/Mathlib excluded).

---

## Headline finding: the project declares ZERO axioms

The human architecture is framed **axiomatically** (AX-001 “Existence,” AX-002 “Distinction,” …).
The Lean implementation contains **no `axiom` declarations at all.** Every foundation is realized
as a `def` / `structure` / `inductive`, and every claim is a `theorem` proved *from those definitions*.

| Actual Lean kind | Count (unique decls) |
|---|---:|
| `structure` | 38 |
| `inductive` | 44 |
| `def` | 226 |
| `theorem` | 506 |
| **total** | **814** |

**Why this matters for the bridge:** what the philosophy calls an “axiom” is, in Lean, a *definitional
choice* (a structure/def), and the force of the system comes from theorems *about* those choices.
That is stronger than an axiom (nothing is merely assumed) **but** it also means the “axioms” in the
human docs have no 1:1 `axiom` object — they map to definitions. The bridge below records that honestly
so researchers, Lean devs, and reviewers stop guessing which foundations are assumed vs. constructed.

---

## Coverage

- **814** unique authored declarations across 2 built units.
- **227** mapped to a human public-claim (via `LEAN_CANONICAL_LEDGER_V2`).
- **587** Lean-only declarations with no human claim yet — the backlog to caption.
- Per unit: Faith-Thru-Physics-Lean-4-=464, theophysics-lean-main=350

**Proof-status legend** (parser-derived, honest):
- `ASSUMED (axiom)` — a real `axiom`. (Count: 0.)
- `DEFINED` — a `def`/`structure`/`inductive`/`abbrev`: a construction, nothing proved yet.
- `PROVEN (compiles)` — a `theorem` in a unit that built exit-0 on 2026-07-25 (Faith-Thru-Physics-Lean-4-).
- `STATED (theorem, compile pending)` — a `theorem` in a unit not yet compiled (theophysics-lean-main).

**Bridge-status legend:** `Formal-internal candidate` = structural correspondence, not cashed out to
empirics; `Adversarial control` = a rejection guard; `Definition / scaffold` = machinery; `Formal-internal`
= proved inside the declared system only. None of these assert the theology by themselves.

---

## The contract table (showcase — foundations & mapped claims first)

Full set in `BRIDGE.csv`. `Depends On` and `Kill Condition` come from the ledger where present.

| Canonical ID | Human Claim | Lean Kind | Lean Name | Depends On | Proof Status | Kill Condition | Bridge Status |
|---|---|---|---|---|---|---|---|
| TPB-0253 | C0 â‰  C1 â€” the two coupling states are structurally distinct | `theorem` | `C0_ne_C1` | MISSING | PROVEN (compiles) | PLACEHOLDER | Formal-internal candidate (structural  |
| TPB-0254 | C1 â‰  C0 (symmetric direction) | `theorem` | `C1_ne_C0` | MISSING | PROVEN (compiles) | PLACEHOLDER | Formal-internal candidate (structural  |
| TPB-0119 | REJECTION: Command bypass â†’ Q = 0 | `theorem` | `law8_command_bypass_forces_Q_zero` | MISSING | PROVEN (compiles) | PLACEHOLDER | Formal-internal candidate (structural  |
| TPB-0120 | REJECTION: Missing eigenbasis â†’ Q = 0. No basis to collapse into. | `theorem` | `law8_missing_eigenbasis_forces_Q_zero` | MISSING | PROVEN (compiles) | PLACEHOLDER | Formal-internal candidate (structural  |
| TPB-0121 | REJECTION: Will refuses to measure â†’ Q = 0. Free will preserved but no collaps | `theorem` | `law8_control_refusal_forces_Q_zero` | MISSING | PROVEN (compiles) | PLACEHOLDER | Formal-internal |
| TPB-0256 | If Q = 0, then Ï‡ = 0 regardless of all other factors. Any single zero kills the | `theorem` | `Q_zero_collapses_chi` | MISSING | PROVEN (compiles) | PLACEHOLDER | Formal-internal candidate (structural  |
| TPB-0325 | Q=0 â†’ Ï‡=0 | `theorem` | `full_Q_zero_collapses` | MISSING | PROVEN (compiles) | PLACEHOLDER | Formal-internal candidate (structural  |
| TPB-0334 | Q=0 collapse survives substitution | `theorem` | `Q_zero_still_collapses_after_substitution` | MISSING | PROVEN (compiles) | PLACEHOLDER | Formal-internal candidate (structural  |
| TPB-0018 | Q > 0 does NOT guarantee Ï‡ > 0 (G = 0 still kills it). No single factor saves y | `theorem` | `Q_nonzero_not_sufficient_for_positive_chi` | MISSING | PROVEN (compiles) | PLACEHOLDER | Formal-internal candidate (structural  |
| TPB-0151 | REJECTION: C is NOT just another factor in the product. External integration, no | `theorem` | `chi_via_COp_is_not_plain_scalar_self_multiplication` | MISSING | PROVEN (compiles) | PLACEHOLDER | Formal-internal candidate (structural  |
| TPB-0506 | chi_ratio > 1 iff G > S (combat direction) | `theorem` | `chiRatio_gt_one_iff` | MISSING | STATED (theorem, compile pending) | PLACEHOLDER | Formal-internal candidate (structural  |
| TPB-0261 | Destructive polarity still kills Ï‡ under accountability-aware gate | `theorem` | `destructive_accountability_aware_M_collapses_chi` | MISSING | PROVEN (compiles) | PLACEHOLDER | Formal-internal candidate (structural  |
| TPB-0262 | Destructive polarity â†’ M gate = 0 â†’ Ï‡ = 0 | `theorem` | `destructive_strict_M_collapses_chi` | MISSING | PROVEN (compiles) | PLACEHOLDER | Formal-internal candidate (structural  |
| TPB-0276 | C_op converts accumulated negative burdens into positive coherence | `theorem` | `chi_via_COp_converts_two_negative_burdens` | MISSING | PROVEN (compiles) | PLACEHOLDER | Formal-internal candidate (structural  |
| TPB-0335 | Command bypass â†’ Ï‡ = 0. Truth bypass kills the whole system. | `theorem` | `law3_command_bypass_collapses_chi` | MISSING | PROVEN (compiles) | PLACEHOLDER | Formal-internal candidate (structural  |
| TPB-0336 | Phase inversion â†’ Ï‡ = 0 | `theorem` | `law3_phase_inversion_collapses_chi` | MISSING | PROVEN (compiles) | PLACEHOLDER | Formal-internal candidate (structural  |
| TPB-0338 | Bandwidth collapse â†’ Ï‡ = 0 | `theorem` | `law6_bandwidth_collapse_collapses_chi` | MISSING | PROVEN (compiles) | PLACEHOLDER | Formal-internal candidate (structural  |
| TPB-0340 | Frame lock â†’ Ï‡ = 0 | `theorem` | `law7_frame_lock_collapses_chi` | MISSING | PROVEN (compiles) | PLACEHOLDER | Formal-internal candidate (structural  |
| TPB-0341 | Relation bypass â†’ Ï‡ = 0 | `theorem` | `law7_relation_bypass_collapses_chi` | MISSING | PROVEN (compiles) | PLACEHOLDER | Formal-internal candidate (structural  |
| TPB-0343 | Command bypass â†’ Ï‡ = 0 | `theorem` | `law8_command_bypass_collapses_chi` | MISSING | PROVEN (compiles) | PLACEHOLDER | Formal-internal candidate (structural  |
| TPB-0344 | Control refusal â†’ Ï‡ = 0 | `theorem` | `law8_control_refusal_collapses_chi` | MISSING | PROVEN (compiles) | PLACEHOLDER | Formal-internal candidate (structural  |
| TPB-0134 | REJECTION: Heaviside vector-only product lacks coupling invariant | `theorem` | `vector_only_product_lacks_coupling_invariant` | MISSING | PROVEN (compiles) | PLACEHOLDER | Formal-internal candidate (structural  |
| TPB-0547 | Epsilon-form: for all eps exists Lambda0, Lambda>=Lambda0 implies C* > 1-eps | `theorem` | `nonzero_coupling_to_infinite_source_has_perfect_attractor` | MISSING | STATED (theorem, compile pending) | PLACEHOLDER | Formal-internal candidate (structural  |
| TPB-0550 | Dynamics depend on O*G only - faith gates, grace powers | `theorem` | `faith_is_coupling_not_source` | MISSING | STATED (theorem, compile pending) | PLACEHOLDER | Formal-internal |
| TPB-0255 | C0 â†’ C1 is one-way; C1 â†’ C0 has no constructor. The transition cannot be und | `theorem` | `coupling_modification_irreversible` | MISSING | PROVEN (compiles) | PLACEHOLDER | Formal-internal candidate (structural  |
| TPB-0304 | Bound state requires both excitation AND coupling (multi-parent) | `theorem` | `bound_state_requires_excitation_and_coupling` | PARTIAL | PROVEN (compiles) | PLACEHOLDER | Formal-internal candidate (structural  |
| TPB-0353 | Quaternion multiplication has scalar-vector coupling that vector-only product la | `theorem` | `full_quaternion_product_has_coupling_invariant` | MISSING | PROVEN (compiles) | PLACEHOLDER | Formal-internal candidate (structural  |
| TPB-0439 | Claim lattice: universality invalid without bridge coverage | `theorem` | `universality_invalid_without_bridge_coverage` | MISSING | PROVEN (compiles) | PLACEHOLDER | Formal-internal candidate (structural  |
| TPB-0318 | All 10 canonical bridge rows pass signature validation | `theorem` | `canonicalRows_all_valid` | MISSING | PROVEN (compiles) | PLACEHOLDER | Formal-internal candidate (structural  |
| TPB-0329 | Physicalâ†’spiritual substitution preserves signatures for all 10 factors | `theorem` | `canonical_substitution_preserves_signature` | MISSING | PROVEN (compiles) | PLACEHOLDER | Formal-internal |
| TPB-0330 | Every factor's canonical substitution row passes | `theorem` | `canonical_substitution_row_valid` | MISSING | PROVEN (compiles) | PLACEHOLDER | Formal-internal candidate (structural  |
| TPB-0332 | Ï‡(physical) = Ï‡(spiritual) under canonical map. The equation is the same in bo | `theorem` | `master_equation_invariant_under_canonical_substitution` | MISSING | PROVEN (compiles) | PLACEHOLDER | Formal-internal candidate (structural  |
| TPB-0024 | REJECTION: Swapping graceâ†”faith breaks the signature | `theorem` | `grace_swapped_with_faith_invalid` | MISSING | PROVEN (compiles) | PLACEHOLDER | Formal-internal candidate (structural  |
| TPB-0025 | REJECTION: Swapping entropyâ†”grace breaks the signature | `theorem` | `entropy_swapped_with_grace_invalid` | MISSING | PROVEN (compiles) | PLACEHOLDER | Formal-internal candidate (structural  |
| TPB-0026 | REJECTION: Kâ†”F swap rejected | `theorem` | `compression_swapped_with_communion_invalid` | MISSING | PROVEN (compiles) | PLACEHOLDER | Formal-internal candidate (structural  |
| TPB-0029 | REJECTION: Command bypass â†’ E = 0 (âˆ€ states). Bypassing command kills truth- | `theorem` | `law3_command_bypass_forces_E_zero` | MISSING | PROVEN (compiles) | PLACEHOLDER | Formal-internal candidate (structural  |
| TPB-0030 | REJECTION: Phase inversion â†’ E = 0 (âˆ€ states). Inverted alignment kills trut | `theorem` | `law3_phase_inversion_forces_E_zero` | MISSING | PROVEN (compiles) | PLACEHOLDER | Formal-internal candidate (structural  |
| TPB-0031 | REJECTION: Relation bypass â†’ R = 0. No relation, no frame translation. | `theorem` | `law7_relation_bypass_forces_R_zero` | MISSING | PROVEN (compiles) | PLACEHOLDER | Formal-internal candidate (structural  |
| TPB-0032 | REJECTION: Frame lock â†’ R = 0 | `theorem` | `law7_frame_lock_forces_R_zero` | MISSING | PROVEN (compiles) | PLACEHOLDER | Formal-internal candidate (structural  |
| TPB-0037 | REJECTION: But the coherence gate rejects them. Arithmetic sign â‰  moral sign. | `theorem` | `two_destructive_signs_do_not_pass_coherence_gate` | MISSING | PROVEN (compiles) | PLACEHOLDER | Formal-internal candidate (structural  |
| TPB-0038 | REJECTION: Burden coupling: negative + negative = negative. Accumulation does no | `theorem` | `burden_two_negatives_stay_negative` | MISSING | PROVEN (compiles) | PLACEHOLDER | Formal-internal candidate (structural  |
| TPB-0104 | No backward step from localization to pre. Irreversible. | `theorem` | `no_stage_step_back_to_pre_from_localization` | MISSING | PROVEN (compiles) | PLACEHOLDER | Formal-internal candidate (structural  |
| TPB-0105 | No backward step from confirmation to release | `theorem` | `no_stage_step_back_to_release_from_confirmation` | MISSING | PROVEN (compiles) | PLACEHOLDER | Formal-internal candidate (structural  |
| TPB-0106 | No backward step from redistribution to confirmation | `theorem` | `no_stage_step_back_to_confirmation_from_redistribution` | MISSING | PROVEN (compiles) | PLACEHOLDER | Formal-internal candidate (structural  |
| TPB-0107 | REJECTION: Câ†”R swap rejected | `theorem` | `coherence_swapped_with_consequence_lock_invalid` | MISSING | PROVEN (compiles) | PLACEHOLDER | Formal-internal candidate (structural  |

---

## How a Lean dev / reviewer uses this

Open `BRIDGE.csv`, filter:
- `proof_status = DEFINED` → **Define this** (machinery, no claim of truth).
- `lean_kind = theorem` + `proof_status = STATED` → **Prove / compile this** (in theophysics-lean-main).
- `proof_status = PROVEN (compiles)` → already verified exit-0; safe to cite *as a formal-internal fact*.
- `bridge_status = Formal-internal candidate` → **interpretation only** — do not present as empirical.
- `mapped_to_claim = no` → Lean object with no human caption yet → backlog to write the claim.

## Honest limits of this bridge
- Human-claim mapping covers the 227 declarations in V2; the other 587 are Lean-truth only.
- `Depends On` is the ledger's declared parent, not a full Lean-extracted dependency graph. A true
  transitive graph (from Lean's own import/term deps) is the next upgrade.
- theophysics-lean-main theorems are `STATED` until its Mathlib build finishes; statuses flip to
  `PROVEN` only after that compile + `#print axioms` audit.