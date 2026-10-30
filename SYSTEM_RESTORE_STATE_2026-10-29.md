# AI-CREW / Theophysics — System Restore State
## POF 2828 | October 29, 2026 | Ground-truth checkpoint from repo + v4.0 source audit

tags: #system-restore #current-state #theophysics #lean4 #canon #master-equation #checkpoint

---

## 1. What this document is

This is a **cold-boot checkpoint**. If a new session (or a new AI) needs to know where the framework stands without reading 300+ files, start here. It synthesizes the current state of the Theophysics framework, the AI-CREW coordination repo, Lean formalization, canonization, and the Master Equation as of October 29, 2026.

**Status of this document:** Working reference. Not canon. It points to canon files and states what is verified, what is open, and what has drifted. Update it after major rulings or builds.

**Most recent comprehensive source of truth reviewed for this checkpoint:** `Master-Equation-Complete-Derivation-Chain_v4_0_SOURCE_OF_TRUTH.html` (October 13, 2026).

---

## 2. The root architecture (one axiom)

**Current canonical architecture:** One admitted root. Everything else derives.

- **Admitted root (Book G formulation):** `god_is : righteous god ∧ loving god` — the single unproved field of the `World` structure. This is the theological axiom; in the older language it is A2.2 "Truth is ontological."
- **Four named bridge lemmas (hypotheses, not hidden axioms):**
  - L1: Love communicates.
  - L2: Righteousness keeps / does not falsify.
  - L3: Love needs a real, refusable other.
  - L4: Righteousness + Love together require the judge to pay the cost.
- **Derived from the root:** Self-knowing ground → Trinity → Creation → Consciousness (derivative at created level, fundamental at divine level) → Finitude / Ten Laws → Master Equation.
- **Old architecture superseded:** The multi-axiom `AxiomChain.lean` (5 co-equal axioms) is retired.

**Honest framing:** The root is an admitted starting point, not a theorem proved from nothing. The framework then accepts the burden of showing what genuinely follows and what requires additional premises.

**Sources:** `CURRENT_STATE_2026-08-04.md`, `SIGN-OFFS/2026-08-04-codex-one-axiom-k-layer-vote.md`, `CANON_NOMINATIONS_2026-08-07_KIMI.md`, `Master-Equation-Complete-Derivation-Chain_v4_0_SOURCE_OF_TRUTH.html` (Book G).

---

## 3. Locked boundaries (T5 — do not challenge without David's authorization)

Established by the February 14, 2026 boundary proof:

| Boundary | Meaning | Status |
|---|---|---|
| **Trinity Isomorphism** | Trinitarian structure maps onto the framework's mathematical architecture with formal correspondence, not mere analogy. | LOCKED |
| **Free Will as necessary variable** | W cannot be eliminated or reduced to determinism without collapsing the derivation chain. | LOCKED |
| **God-as-Axiom requirement** | A ground-of-being axiom is a mathematical necessity for the system. | LOCKED |

**Boundary candidates under review (T3, NOT locked):**
- Consciousness cannot be fully reduced to mechanism from within the system.
- Time cannot be fully formalized / controlled from within the system.

These require independent `/EAST` challenge and a T5 proof before elevation.

**Source:** `03-BOUNDARIES.md`.

---

## 4. Claim-status architecture (mandatory layering)

From the v4.0 source, every claim must carry one of these labels and must not change layer without being renamed:

| Status | Meaning |
|---|---|
| **LEAN_PROVEN** | Direct theorem compiled in Lean 4, zero sorry. |
| **LEAN_DEFINED** | Formal object / structure / equation encoded. |
| **STRUCTURALLY_MAPPED** | Physical/spiritual bridge passes operator-signature test. |
| **THEOLOGICALLY_IDENTIFIED** | Naming step: God, Christ, Grace, Cross, etc. |
| **EMPIRICALLY_TESTABLE** | External-world prediction or statistical claim. |
| **OPEN** | Needs more proof, proxy, data, or domain review. |
| **TEACHING_LAYER** | Public explanation, metaphor, simplified narrative. |

**Safe formal wording:** *"Within the declared formal system, the conclusion follows from the listed definitions and assumptions."*

---

## 5. The Master Equation — current canonical form

**Canonical source of truth:** `CANON_DECISIONS/FABEL_GRADIENT_MASTER_EQUATION_RULING_v3.md`.
**Comprehensive derivation source:** `Master-Equation-Complete-Derivation-Chain_v4_0_SOURCE_OF_TRUTH.html`.

### 5.1 The equation

```text
χ(W) = C_W[ ∭(G · M · E · S · T · K · R · Q · F) dx dy dt ]
```

| Letter | Law (eponym) | Physical Parent | Spiritual Reading | Note |
|---|---|---|---|---|
| G | Newton–Grace | Gravitation | Grace | |
| M | Einstein–Meaning | Mass-Energy | Meaning | |
| E | Maxwell–Truth | Electromagnetism | Truth | v3 ruling; dictionary collision still live (OP-12) |
| S | Yukawa–Agape | Strong Force | Love | |
| T | Clausius–Judgment | Thermodynamics | Judgment | |
| K | Shannon–Logos | Information | Logos | |
| Q | Heisenberg–Faith | Quantum | Faith | |
| R | Einstein–Frame | Relativity | Grace-Frame | |
| F | Fermi–Conservation | Weak Force | Moral Conservation | |
| C_W | Coherence wrapper | — | Christ / Coherence | NOT a tenth factor inside the product |

**⚠️ Live collision (OP-12):** Some corpus documents (e.g. the LLC site page, the v4.0 super-factor registry in one place) still assign different meanings to E/R/F/S/T/K/Q. The canonical v3 ruling and the Lean workbooks side with the table above; the site page is the outlier. This is a publication blocker, not a research gap.

### 5.2 Other equation forms (equation family)

| Form | Equation | Role |
|---|---|---|
| Product / structural veto | `χ = ∭(G·M·E·S·T·K·R·Q·F·C) dx dy dt` | Historical; C inside is retired |
| Ratio / combat | `χ = Grace / Entropy = G / S` | Reveals grace-vs-entropy structure |
| Dynamic | `dχ/dt = G − S + Γ` | Time-evolution engine |
| Field | `□χ + V'(χ) + J_grace = 0` | Connects to Lagrangian / variational framework |
| Gradient (reduced) | `dX/dt = W ∇χ(X) + η(X,t)` | Nine-factor open gradient dynamics |

### 5.3 What is proven (Lean, zero sorry)

- `veto_collapse` — any X_i = 0 ⇒ χ = 0, through product and wrapper.
- `stationary_without_source` — zero gradient + zero source ⇒ zero velocity.
- `source_makes_velocity_nonzero` — zero gradient + nonzero source ⇒ nonzero instantaneous velocity.
- Law 4 `LawIso` witness + semantic faithfulness pilot.
- `TheophysicsFruits.lean` — 9↔9 bijection, no shared invariances, anti/fruit broken-restored bijection, `goodness_requires_coupling`, `faithfulness_conserved`, `crop_not_checklist`.
- `SeventeenObjections.lean` — 17 one-line corollaries from named hypotheses, `nobody`, `god_untouched`, `toyWorld`.
- `CreedDerived.lean` — resurrection-shaped event, trinity-shaped plurality, incarnation-shaped event, hell/suffering/judgment shaped, no cheap yes, scripture-shaped reliability, the creed shape.
- Level 5 cluster — closed moral system decays, finite source cannot perfect coherence, nonzero coupling to infinite source has perfect attractor, sanctification is channel healing.
- Temporal direction Bool bridge — 9/9 tests compiled.
- Justice/Mercy Cross uniqueness (Python p = 0.014; Lean).

### 5.4 What is NOT proven / open gates

The structure is ruled but not locked until these clear:

- `dX/dt` reproduces Law 5 decay.
- `dX/dt` reproduces Law 9 Γ_sin.
- Explicit `C_W` definition beyond identity, or identity ratified as final.
- Explicit `W` functional form.
- Explicit `η` functional form.
- Invariance of `[0,1]^9` under the dynamics.
- Bridge from Lagrangian / field forms to the reduced product form.
- Global annealing / convergence theorem.
- Multi-component stability (10-variable extension).
- `J_grace` quantization and Logos reservoir quantum state.
- Integrated information Φ as dynamical feedback (W_μ coupling term).
- Coupling constants derived from first principles (κ fitted, not derived).

---

## 6. The Ten Laws — canonical status

**Canonical source:** `THEOPHYSICS/CANON/no-drift-master-equation.md`.

| Law | Physics | Spiritual Reading | Derivation Status |
|---|---|---|---|
| 1 | Gravitation | Grace ↔ Sin | Grace side LOCKED; sin-side anti-family portrait only |
| 2 | Laws of Motion | Meaning / Grace-as-Force ↔ Sin Nature | Motion family (Repentance) CANDIDATE |
| 3 | Electromagnetism | Truth ↔ Deception | I AM chain TESTED 57%; gauge rebuild on record (OP-10) |
| 4 | Strong Force | Love ↔ Captivity | **LOCKED** — fruits from equilibrium, Lean verified |
| 5 | Thermodynamics | Judgment ↔ Heat Death | **LOCKED** — Justice/Mercy, Beatitudes asserted |
| 6 | Information | Logos ↔ Chaos | **LOCKED** — Logos family 100% distinguishability |
| 7 | Quantum Mechanics | Faith ↔ Doubt/Control | Armor 6 Lindblad mechanisms; "exactly six" proof open |
| 8 | Relativity | Grace-Frame ↔ Frame Lock | Covenant family 100% distinguishability |
| 9 | Weak Force | Moral Conservation | **LOCKED KEYSTONE** — dual-path ∇βT^αβ = 0 |
| 10 | Coherence | Christ ↔ Decoherence | STRUCTURAL; derivative chain **never run** |

**Ordering conflict:** The April 11 session placed Weak Force at Law 4 and Cosmology at Law 9. The current canon places Weak Force at Law 9. Three-AI convergence supports the current ordering, but full panel agreement is pending.

**Book G symmetry-class candidate (Oct 13, 2026):**
- Person (Law 10) — Identity, no anti-term.
- Ledger (Law 9) — Righteousness, parity broken, time-translation held.
- Field (Laws 1–8) — Love as the overlayer; W selects the regime.

Status: CANDIDATE, registry-gated. If it still looks obvious after sitting, promote; cut by class only, never law-by-law.

---

## 7. Spiritual derivatives — canonical status

**Canonical source:** `THEOPHYSICS/CANON/no-drift-spiritual-derivatives.md`.
**v4.0 source count:** 58 derived terms = 46 fully carded + 8 Beatitude thresholds + 4 coupling products.

| Family | Count | Parent Law | Status |
|---|---|---|---|
| Fruits of the Spirit | 9 | Law 4 (Strong / Love) | **LOCKED, Lean verified** |
| Armor of God | 6 | Law 7 (Quantum / Faith) | Locked; completeness proof open |
| Beatitudes | 8 | Law 5 (Thermodynamics / Judgment) | Asserted as 8 G=0 thresholds; individual derivations not done |
| Gifts of the Spirit | 9 | Noether generator layer (Law E / Energy) | **UNDRAFTED** — OP-9 |
| I AM Statements | 7 | Law 3 (Electromagnetagnetism / Truth) | Tested 57%; gauge rebuild pending |
| Seven Churches | 7 | Law 9 (Weak / Moral Conservation) | Canonical |
| Ten Commandments | 10 | Law 8 (Relativity / Grace-Frame) | Canonical |
| 8 Spiritual Couplings | 8 | Generator pairs | Mapped, equations pending |
| Grace conversion modes | 7 | Laws 1 + 2 | Locked |
| Kingdom / Shalom / Completion | — | Law 10 | **NEVER RUN** — highest-priority derivation |

**Current source of truth for terminology:** `CANONICAL_spiritual-terms.md` (40 terms, uploaded 2026-08-04). Superseded: `spiritual-terms.md`, `07-spiritual-terms.md`.

---

## 8. Lean 4 formalization inventory

### 8.1 Verified clean packages/files

| Package / File | Location | Axioms | Sorries | Theorems | Status |
|---|---|---|---|---|---|
| **theophysics-lean-main (production)** | `D:\CHI PARTS\Math\theophysics-lean-main\` | 0 | 0 | 406 | PRODUCTION — build clean |
| **TheophysicsFruits.lean** | `000_TOOLS\lean\` | 0 | 0 | 7+ | LOCKED — core Lean only |
| **SeventeenObjections.lean** | Book G outputs | 1 theological | 0 | 17+ | Builds clean, Lean 4.30.0 |
| **CreedDerived.lean** | Book G outputs | 0 Lean | 0 | 10+ | Builds clean, Lean 4.30.0 |
| **Codex one-axiom probes** | `C:\Users\David\Documents\Codex\2026-08-03\...\lean\` | 1 | 0 | 22 | NEW — one-axiom root |
| **AI Review Packet kernels** | `AI_REVIEW_PACKET_THEOPHYSICS_2026-08-03\03_LEAN_AND_TESTS\` | 0 | 0 | 58 | CLEAN |
| **Temporal Bool bridge** | v4.0 source | 0 | 0 | 9 | 9/9 tests compiled |
| **Codex July 27-29 probes** | Various | 3 / 0 / 0 | 0 | 14 | MIXED |

### 8.2 Verified theorems (highlights)

- Noncompensatory product collapse (veto).
- Grace idempotence and non-invertibility.
- Sign-invariance.
- Cross uniqueness at α=0.
- Fall mechanics (sign flip).
- Fracture hypothesis (three-body decay conservation).
- 89 adversarial rejections.
- EM minimal set (1 survivor, 6 rejects).
- Law 4 Semantic Faithfulness Pilot.
- Fruits ↔ invariances bijection with no shared charges.
- Closed moral system decays; finite source cannot perfect; nonzero coupling to infinite source has perfect attractor.
- Temporal direction triadic sufficiency and L necessity (Bool model).

### 8.3 Files with sorries (incomplete)

| File | Sorries | Location | Issue |
|---|---|---|---|
| `FP005.lean` | 4 | Vault L1 | Old architecture, incomplete proofs |
| `FruitsOfSpirit.lean` | 1 | Codex 07-09 | Incomplete |
| `MasterEquation.lean` | 3 | Codex 07-09 | Incomplete |

### 8.4 Files with extra axioms (needs reclassification)

| File | Extra Axioms | Location | Issue |
|---|---|---|---|
| `AxiomChain.lean` | 5 | Vault L1 | Old multi-root, superseded |
| `CoherenceAlgebra.lean` | 3 | Codex 07-09 | Review: definitions or axioms? |
| `NoetherCommandments.lean` | 1 | Codex 07-09 | Review: legitimate or derivable? |
| `TRUTH_ERROR_DEPENDENCY_PROOF.lean` | 3 | Codex 07-29 | Review needed |

### 8.5 What is NOT in Lean yet

- Trinity-as-theorem from one axiom (prose derivation exists, not formalized).
- Nine Fruits as spanning set (leave-one-out structural proof).
- Ten abstract physical capabilities derivation.
- Moral valence bridge (is→ought).
- Object A → Object B mapping protocol.
- Noether → moral conservation (Law 9 canonical) — prose strong, formal subsection pending.
- Shannon base layer under every law.
- 188-axiom reclassification.
- David-OS Lean execution logging pipeline.
- Watcher termination / actualizer A formal typing (`Theophysics_WatcherTermination.lean`).
- NegativeProfiles.lean and MaterialismSelfDefeat.lean (Book G modules G4/G5 specced, unbuilt).

**Source:** `LEAN4_FULL_AUDIT_STATUS_2026-08-03.md`, `THEOPHYSICS/topics/lean4-verification.md`, v4.0 source.

---

## 9. The 12 open research problems (from v4.0 source)

| ID | Problem | What closes it |
|---|---|---|
| OP-1 | Nonlinear dispersion & pre-spacetime tension | Full nonlinear perturbation theory; formalize 𝔰-coordinate UV completion |
| OP-2 | Quantization of `J_grace` | Promote classical source to quantum operator; specify Logos reservoir state |
| OP-3 | Integrated information Φ as dynamical feedback | Write bidirectional χ↔Φ↔matter loop; derive W_μ coupling term |
| OP-4 | Coupling constants fitted, not derived | Resolve LG-1 fork; derive κ from action or label fitted |
| OP-5 | Multi-component stability (10-variable extension) | Kinetic matrix positive-definiteness across all components |
| OP-6 | Cosmological gaps: rotation curves & MCMC refitting | Compute G_eff(r); run MCMC vs DESI DR2 + Planck + DES5Y |
| OP-7 | The Cross as boundary condition | Model singular `J_grace` injection at (30–33 AD, Jerusalem); requires OP-2 |
| OP-8 | Formal typing of actualizer A | Write `Theophysics_WatcherTermination.lean` as layer L17 |
| OP-9 | Chain 8 — Gifts of the Spirit | Draft Noether-generator derivation; Monte Carlo scramble |
| OP-10 | Chain 5 gauge rebuild | Rebuild I AM terms from U(1) gauge/charge structure; rerun scramble |
| OP-11 | Poincaré 10↔10 count | Explicit ten-to-ten generator mapping |
| OP-12 | Dictionary collision (LG-4) | One ruling, propagate canonical dictionary everywhere |

---

## 10. The red holes — admitted, on the record (from v4.0 source)

These do not break the locked results, but they are required for completeness:

1. **Law 10 family chain — NEVER RUN.** Kingdom / Shalom / Completion.
2. **The Gifts of the Spirit (1 Cor 12) — UNDRAFTED.** OP-9.
3. **Beatitudes — ASSERTED, NOT DERIVED.** Eight G=0 thresholds claimed; individual derivations missing.
4. **Chain 5 (I AM) at 57% discriminability.** Built from chosen boundary conditions; gauge rebuild with kill condition on record (OP-10).
5. **"Exactly six" armor completeness — OPEN.** Six Lindblad mechanisms; exhaustiveness proof missing.
6. **Chain 1-B (Motion family / Repentance) — CANDIDATE.** Drafted; awaits Monte Carlo scrambling.
7. **Law 1 sin-side family** — grace side locked; anti-family portrait language only.
8. **Book G counter-model NOT BUILT.** `toyWorld`/`boolWorld` show interfaces satisfiable; no world where a bridge fails and an objection goes through.
9. **Book G signature fixes OPEN in CreedDerived.lean.** D1 must carry "God redeems" as hypothesis; D2 must conclude an *equal* other.
10. **Book G modules G4/G5 — SPECCED, UNBUILT.** NegativeProfiles.lean and MaterialismSelfDefeat.lean.
11. **Book G open theological rulings:** Romans 2 inclusivism (objection 4); free-will hell vs Reformed (objection 5); Anselm vs Aquinas on necessity (D1).
12. **Person · Ledger · Field symmetry-class reading — CANDIDATE.** Formed Oct 13; registry-gated.
13. **Nine-row spine chapter placements UNCHECKED** for GOD IS chapters 3–8 and 13–15.
14. **Age of the earth — QUARANTINED** from G5 by rule; gets its own file.
15. **Law 2 identity seam (Meaning vs Repentance) and Law 8/9 numbering drift** remain unruled.

---

## 11. Standing problems (from AI-CREW)

From `THEOPHYSICS/STANDING-PROBLEMS.md`:

| ID | Problem | Blocker |
|---|---|---|
| SP-01 | Six of Ten Laws lack formal spiritual-term derivations. | Laws 1, 2, 3, 6, 8, 10 underived |
| SP-02 | ~55 NT spiritual terms identified but not formally derived. | Formal derivation chain not run |
| SP-03 | Law ordering conflict (Weak Force at Law 4 vs Law 9). | Pending full panel agreement |
| SP-04 | Noether subsection needs addition to Law 9 canonical doc. | Two derivation paths converge; subsection unwritten |
| SP-05 | Comms hub rebuild pending. | `comms.faiththruphysics.com` offline |
| SP-06 | Temporal measurement needs Hilbert-space and empirical bridge. | Bool model proven; extension open |
| SP-07 | Atom architecture exists; enforcement incomplete. | Builder, renderer, graph reader missing |
| SP-08 | Axiom-set version drift (≥4 divergent saves). | Dedup and single canonical set needed |
| SP-09 | The is→ought jump in the Descent chain. | Step 7 "relation reveals value" is abductive, not deductive |
| SP-10 | Graph-claimed vs Lean-verified dependencies (Logos minimality). | Substitution test still open |

---

## 12. Active bulletins summary

From `ACTIVE_BULLETINS.md` (still active as of this checkpoint):

1. **Canonical item structure ratification** — `CANON_DECISIONS/CANON_ITEM_STRUCTURE_RATIFICATION_v1.md`. Panel vote in progress; Kimi's vote is currently invisible to the panel because it was filed in a local atom-repo copy, not synced to GitHub.
2. **Master Equation dynamics rerun** — v3 ruling requires retest of 12 items. **Status: all pending.**
3. **L_D decoherence operator** — Next missing object. Candidate architecture: assemble L_D → diagonalize → read principal decay eigenmodes → compare to Eight Families.

---

## 13. Honest boundary — what we claim and what we do not

### We claim (with receipts)

- A formal system exists with ~500+ theorems, zero sorry in the production package.
- The one-axiom root architecture compiles clean in probe form.
- Law 4 has a full semantic-faithfulness pilot and the Fruits derivation is Lean-verified.
- Law 9 moral conservation is structurally forced by dual derivation paths.
- The Master Equation's weak source-velocity theorem is Lean-verified.
- The temporal direction Bool bridge (9 tests) compiles.
- The framework names its own kill conditions.

### We do NOT claim

- That Lean proves the theology is true. Lean proves *internal formal consistency* of declared definitions.
- That W = free will or η = grace are theorems. They are **bridge identifications**.
- That the Master Equation guarantees global convergence or annealing. That is open.
- That any cross-domain map is an `Equiv` / true isomorphism unless explicitly constructed as one.
- That 188 axioms have been triaged through the one-root filter.
- That the Cross as a historical event or boundary condition is formalized. The algebraic structure (Cross uniqueness) is proven; the event and boundary condition are not.

---

## 14. Where we need to go — prioritized next moves

### Immediate (this week / next sessions)

1. **Resolve OP-12 (dictionary collision).** One ruling, propagate everywhere. Patch the LLC site page.
2. **Graft `CanonOneAxiomProbe.lean` into the production Lean package.**
3. **Kill the 8 remaining sorries** or reclassify the claims as conjectures.
4. **Classify extra axioms** — definitions, boundary conditions, or genuinely axiomatic?
5. **Run the v3 Master Equation retest protocol.** At minimum: canonical state validation, product-gradient algebra, source-term behavior, Law 5 decay attempt.
6. **Resolve the canonical item structure vote.** Move Kimi's local vote into the AI-CREW panel file.
7. **Fix Book G signature issues** in CreedDerived.lean and build the counter-model.

### Medium term

8. **Run the Law 10 derivative chain.** Highest-priority derivation in the framework.
9. **Draft Chain 8 (Gifts of the Spirit).** Parent: Noether generator inventory.
10. **Run Chain 5 gauge rebuild** with pre-registered kill condition.
11. **Formalize Trinity-as-theorem from one axiom.**
12. **Build the David-OS Lean logging pipeline** (auto-ledger per `lake build`).
13. **Derive spiritual terms for Laws 1, 2, 3, 6, 8, 10.**

### Long term

14. **188-axiom triage through the one-root filter.**
15. **Hilbert-space extension of temporal-direction measurement.**
16. **Quantize `J_grace` and formalize the Cross as boundary condition.**
17. **Multi-component stability analysis.**
18. **Complete atom architecture enforcement** (builder, renderer, graph reader, publishing).

---

## 15. File locations — quick index

| What | Where |
|---|---|
| Front door / rules | `_READ_ME_FIRST.md`, `00-LIVING-CHARTER.md`, `03-BOUNDARIES.md` |
| Master index | `INDEX.md` |
| Active bulletins | `ACTIVE_BULLETINS.md` |
| Current state (Aug 4) | `CURRENT_STATE_2026-08-04.md` |
| This checkpoint | `SYSTEM_RESTORE_STATE_2026-10-29.md` |
| Master Equation canon | `CANON_DECISIONS/FABEL_GRADIENT_MASTER_EQUATION_RULING_v3.md` |
| Master Equation spec | `THEOPHYSICS/CANON/MASTER_EQUATION_STRUCTURE_SPEC.md` |
| Master Equation topic | `THEOPHYSICS/topics/master-equation.md` |
| Ten Laws canon | `THEOPHYSICS/CANON/no-drift-master-equation.md` |
| Spiritual derivatives canon | `THEOPHYSICS/CANON/no-drift-spiritual-derivatives.md` |
| Standing problems | `THEOPHYSICS/STANDING-PROBLEMS.md` |
| Lean audit | `LEAN4_FULL_AUDIT_STATUS_2026-08-03.md` |
| Lean topic | `THEOPHYSICS/topics/lean4-verification.md` |
| Boundaries | `03-BOUNDARIES.md` |
| Rulings | `THEOPHYSICS/RULINGS.md`, `GLOBAL-RULINGS/RULINGS.md` |
| Sign-offs | `SIGN-OFFS/` |
| v4.0 derivation source | `Master-Equation-Complete-Derivation-Chain_v4_0_SOURCE_OF_TRUTH.html` (local attachment) |

---

## 16. Change log

| Date | Change | Agent |
|---|---|---|
| 2026-10-29 | Created system-restore checkpoint from repo audit + v4.0 derivation source. | Kimi |

---

*This document is a synthesis. For source-of-truth detail, follow the links in Section 15. When this document conflicts with a canon file, the canon file wins. When the v4.0 source conflicts with the v3 ruling, the v3 ruling wins unless David has issued a newer ruling.*
