# CANDIDATE — Capability Basis as Irredundant Adequacy Constraints

tags: #master-equation #chi #coherence #derivation #standing #unverified #breakthrough

**POF 2828 | 2026-08-03**  
**Status:** CANDIDATE — T2 overall. Logical distinctions are stronger than the physical instantiations.  
**Discovered by:** David Lowe + Claude Opus + GPT/Codex collaboration  
**Canon protection:** This file does **not** alter the ruled nine-factor equation in `CANON_DECISIONS/FABEL_GRADIENT_MASTER_EQUATION_RULING_v3.md`. No Lean theorem, factor count, or canonical dictionary is changed here.

---

## 1. The correction

Two failed test programs counted the wrong object:

1. The counterfactual-world run counted whether one physical feature could be absent while another remained.
2. The parameter-orthogonality rerun counted independently tunable physical handles.

Neither count answers the Master Equation's basis question if `X_i` is an **adequacy score against a world requirement**.

A single physical parameter can control several distinct requirements. Conversely, several parameters can contribute to one requirement. Therefore:

```text
number of physical knobs != number of irreducible world requirements
```

Minimal example:

```text
X_1(theta) = theta
X_2(theta) = 1 - theta
```

There is one physical knob and two competing adequacy requirements. Different signs or optima do not create a second physical degree of freedom, but they can create a second irreducible constraint.

---

## 2. Candidate formalization

Let `Theta` be the bare physical parameter / model space. It contains no viability requirement: no persistence, embodiment, observer, record, arrow, or public-history clause. Those clauses are the constraints under test and may not be smuggled into the domain.

Let `theta in Theta` be a dimensionless physical parameter vector and let each requirement have a separately defined adequacy function:

```text
X_i(theta) = A_i(theta; requirement_i)
```

For threshold `tau_i`:

```text
V_i(tau_i) = { theta in Omega | X_i(theta) >= tau_i }
W*(tau) = intersection_i V_i(tau_i)
```

The factors are provisionally interpreted as candidate **adequacy constraints**, not independent coupling constants.

### Robust leave-one-out witness

Requirement `i` is robustly irredundant only if there exists a candidate world `theta_i`, a positive margin `epsilon`, and an open band of threshold vectors such that:

```text
X_i(theta_i) <= tau_i - epsilon
X_j(theta_i) >= tau_j + epsilon    for every j != i
```

Plain reading: every other requirement is securely satisfied while this requirement securely fails. The witness must survive small threshold changes; knife-edge witnesses do not count.

This replaces the 36-pair basis test with **nine leave-one-out witness constructions**.

---

## 3. Three questions that must stay separate

### A. Physical degrees of freedom

How many independently variable physical handles exist?

Candidate method: a properly defined Jacobian over **dimensionless** parameters:

```text
J_(i,mu) = partial X_i / partial theta_mu
```

This is a sensitivity and identifiability question. It does not count world requirements.

### B. Irreducible requirements

How many distinct failure conditions are needed to specify `W_phys`?

Candidate method: robust leave-one-out witnesses and alternative-basis challenges.

### C. Aggregation

How should simultaneous adequacy be scored?

Product, minimum, geometric mean, weighted product, and other conjunction rules remain live. Neither pairwise separability nor parameter orthogonality selects the product.

---

## 4. R-1 and K witness status

### R-1 — one axis carrying content and lawful response

David's rulings converge on one M-axis carrying both sides:

\[
M = \text{physical content and lawful response}.
\]

Mass-energy supplies what is physically there; inertia supplies resistance; force, curvature, and the action govern response; motion is the resulting history. The axis is not Mass-energy alone, and Motion is not a separate tenth factor.

The open issue is now constructive rather than verbal:

- Can a world meet the other eight thresholds while containing physical content with no lawful response?
- Can a world meet the other eight thresholds while exhibiting lawful response with no physical content?

If either half can fail independently while the other remains adequate, M splits. If neither construction is coherent, the single combined constraint survives. R-1's vocabulary is settled; its irreducibility is assigned to the M witness.

### K — witness build in progress

The earlier ruling that K must be removed as a derived readout was made under the wrong criterion and remains withdrawn at candidate level.

K adequacy has four layers:

1. distinguishable states exist;
2. distinctions remain above the relevant noise floor;
3. distinctions persist over the relevant timescale;
4. distinctions are redundantly imprinted and independently recoverable.

Layer 1 is universal to structured physics and cannot carry K's irredundancy. K's candidate content is layers 2–4.

The primary construction is now **Witness A — the opaque world**: mediation exists, but the environment couples collectively rather than fragmenting into many independently accessible carriers, so no event becomes redundantly public. The March 2026 apparatus-versus-scrambler result is supporting system-level evidence, not by itself a completed world witness.

The required seam is explicit:

- E: a mediating interaction and signal propagation exist.
- K: distinctions survive that mediation and become multiply recoverable.

If E adequacy cannot be retained under opacity, the witness fails and K is likely entailed/readout. If all eight other thresholds hold, K is irredundant.

Build file:

- [WITNESS 01 — K / Publicly Recoverable Record Capacity](WITNESS-01-K-PUBLIC-RECORD-CAPACITY.md)

Current verdict: **OPEN — build authorized; no pass until the eight-threshold table is defended under the opaque-world construction.**
---

## 5. Irredundancy is not global minimality

Leave-one-out testing shows that nothing in the current description can simply be deleted. It does not show that no alternative description uses fewer constraints.

Indeed, arbitrary bundling can compress all constraints into one:

```text
g(theta) = min_i (X_i(theta) - tau_i)
W_phys = { theta | g(theta) >= 0 }
```

Therefore a bare target such as `|B| >= 9` is representation-dependent. Before a minimum count can be meaningful, the framework must define:

- admissible requirement;
- atomic failure mode;
- legitimate decomposition and bundling;
- equivalence under renaming and reparameterization;
- allowed constraint grammar.

Revised long-range target:

> Every faithful decomposition of `W_phys` into semantically and causally atomic failure conditions requires at least nine inequivalent conditions.

This target remains open.

---

## 6. Margin and integrated coherence are different quantities

Let the normalized signed margin for requirement `i` be:

```text
mu_i(theta) = (X_i(theta) - tau_i) / s_i
```

Nearest-boundary robustness:

```text
rho(theta) = min_i mu_i(theta)
```

- `rho > 0`: inside the viable region.
- `rho = 0`: on a constraint boundary.
- `rho < 0`: at least one requirement fails.

This gives a precise candidate meaning to **coherence as clearance from collapse**.

A product answers a different question:

```text
chi_product(theta) = product_i phi(mu_i(theta))
```

It measures distributed adequacy across all requirements and responds to surplus away from the nearest wall. The minimum measures only the nearest wall.

**Open ruling:** do not make one symbol perform both jobs until David decides whether `chi` means nearest-boundary resilience, integrated adequacy, or a declared relationship between the two.

---

## 7. Causal coupling was missed by both pairwise runs

The earlier tests examined nodes or tuning handles. They did not test whether combinations produce new physical events or capabilities.

Future work needs both:

```text
J_(i,mu) = partial X_i / partial theta_mu       -- sensitivity
H_(i,j)  = partial^2 Y / partial X_i partial X_j -- interaction/emergence
```

Equivalent finite contrasts are acceptable when derivatives are unavailable. Shared causes do not make two requirements redundant, and dependence can be predicted structure rather than a defect. But not every observed dependence counts as confirmation; predicted couplings and negative controls must be declared before testing.

---

## 8. Results retired or demoted by this session

The following statements are **not earned**:

- “All 36 pairs are separable.”
- “The product form is earned by pairwise independence.”
- “The nine form a matroid basis.”
- “About three independent capability dimensions remain.”
- “K is removed from the basis.”
- “7 + 2” or “Arena / Capability / Readout” as settled architecture.
- “G-E orthogonality is proved.”
- Any claimed Jacobian result from a run that never defined `X_i(theta)`, computed derivatives, reported rank, or tested robustness under reparameterization.

The qualitative dependency audit remains useful as a hypothesis generator, not as a calculated Jacobian result.

---

## 9. Current test program

1. Keep the leave-one-out criterion fixed; do not solicit a fifth methodology.
2. Use the ruled M = Mass-energy dictionary; keep Motion in dynamics/history.
3. Treat K as public-record capacity for the witness program; keep raw Shannon information at the formal/substrate layer.
4. K witness: constructed provisionally; world-scale embedding and `tau)-robustness remain pending.
5. Construct the other eight leave-one-out witnesses, one world and one verdict each.
6. Apply `tau)-robustness only to witnesses that survive construction.
7. Keep the global `|B| >= 9` target shelved until the geometry and atomic-requirement grammar are funded and characterized.
8. Separate nearest-boundary margin `rho` from integrated coherence `chi`.
9. Compare aggregation rules only after the survivor set is known.
10. Update Lean only after the mathematical object and claim are ruled.

---

## 10. Provenance record

- **David Lowe:** insisted that `X` measures adequacy rather than raw coupling; identified that pair dynamics may produce causal changes ignored by separability tests; held the framework above the test architecture.
- **Claude Opus:** ran and then withdrew two unsuitable criteria; identified requirement-specific response windows, threshold robustness, irredundancy versus minimality, and the possibility of `chi` as margin.
- **GPT/Codex:** separated physical degrees of freedom from irredundant adequacy requirements; supplied the constraint-removal witness, ambient-domain correction, arbitrary-bundling counterexample, and margin-versus-integrated-coherence split.

No one step is recorded as an independent discovery. The result emerged through challenge and correction across the collaboration.

---

## 11. Honesty statement

### Verified this session

- The logical counterexamples separating physical knobs, requirements, and arbitrary constraint bundling.
- The internal inconsistency of treating pairwise separability as a proof of product form or minimum basis size.
- The need for an ambient domain outside `W_phys` to construct failed-requirement witnesses.

### Not verified

- No nine operational adequacy functions were defined.
- No physical Jacobian or Hessian was calculated.
- No robust threshold bands were established.
- K Witness A is specified but not passed. The apparatus-versus-scrambler distinction supports the record/objectivity seam; the opaque-world eight-threshold construction remains to be defended.
- No Aczel-type aggregation characterization was proved.
- No Lean file was changed or rerun.
- No canonical factor was added, removed, or renamed.

---

## 12. Plain-language test

Three questions:

1. **What knobs can change?**
2. **What separate things must a viable world accomplish?**
3. **Can every other requirement work while this one still fails?**

Short name: **knobs, needs, failure witness**.
