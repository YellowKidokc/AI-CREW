---
title: "Pitch: ground the Master Equation's weights in Landauer, not hand-picked numbers"
date: "2026-11-05"
status: "CANDIDATE_DRAFT — NOT ADMITTED (needs David's ruling)"
audience: "the crew — Claude, Codex, GPT, Gemini"
---

# The pitch, in one paragraph

Every number the test suite produces depends on weights nobody derived (Grace 1.05, Matter 0.8, Energy 1.2, Relation 0.5, ...). Worse, in the product form χ = ∭(G·M·E·S·T·K·R·Q·F·C), a weight on a factor only rescales χ by a constant; it cannot change how strongly any variable drives the result. So the suite's per-variable sensitivities come from the shapes we chose for each curve, not from physics. **Landauer's principle gives the one thing the equation lacks: a measured, universal exchange rate between information and energy, kT ln 2 per bit erased.** Measure each variable in bits, and every variable gets a physical cost in the same unit. The per-variable numbers then mean something, and they can be checked.

# Why Landauer and not Noether for this job

| | Noether (1918) | Landauer (1961) |
|---|---|---|
| What it gives | which quantity is conserved, given a symmetry | the minimum energy cost of erasing one bit |
| Gives a number per variable? | No: says *what* is conserved, not *how much it weighs* | Yes: kT ln 2 × bits, the same exchange rate for all ten |
| Direction | time-symmetric | one-directional: erasure is the irreversible step |
| Measured in a lab? | follows from the mathematics | yes: Bérut et al., *Nature* 2012; later nanomagnet and quantum tests |
| Fit with the series | Law 8 (Righteousness), symmetry pairs | Paper 2 (history only appends; erasure is the act physics charges for), F (one-directional entropy), the "lie as erasure/concealment" grade |

**Keep Noether for what it already does:** the symmetry pairs (G↔T, S↔F, E↔K, M↔Q, R↔C) and their conserved quantities. **Use Landauer for what Noether can't do:** the weights.

# How it enters the equation (the part that makes the numbers real)

Putting kT ln 2 inside the product would still be swallowed as a constant. It has to enter as a **cost term**, added and not multiplied:

    L = χ · (d/dt Σ primitives)²  −  S·χ  −  kT ln 2 · Σᵢ ΔIᵢ

where ΔIᵢ is the information (in bits) erased in variable i per step. That term has a different gradient for every variable, ∂L/∂(ΔIᵢ) = −kT ln 2, scaled by how many bits each variable actually erases. That is the per-variable number.

# What it requires (honest)

1. **A bit-count for each variable.** For example, F (Adversary) as bits destroyed, K (Justice) as bits of ledger kept, E (Truth) as mutual information between claim and fact. This is the real work; until it's defined, nothing is grounded.
2. **Landauer is a lower bound.** Real systems pay far more, so use it as a floor and a common unit, not a prediction of actual cost.
3. **The moral mapping is Layer 2.** "Concealment = erasure" is a bridge argued in the papers, not proven by Landauer. Say so in every receipt.

# The re-run plan

1. **Freeze one engine:** `OPUS_Master_EQ\ZZZ_Archive\DELETE\INBOX_01_CODE\JAX\` (the modular suite). The other ~500 scripts are copies or one-offs; list them, don't rerun them blindly.
2. **Add a weights switch:** `--weights hand` (today's numbers) vs `--weights landauer` (bit-counts × kT ln 2 cost term).
3. **Run all suite tests both ways** and save a side-by-side diff: which PASS/FAIL results change, and by how much.
4. **Add a Sobol sensitivity pass:** the share of χ's variation driven by each of the ten variables, under each weighting. That is the "statistical number on each variable."
5. **Register the prediction first** (02F): which variable we expect to dominate under Landauer weights, written down before the run.

# Ask of the crew

Before anyone writes code: propose a bit-count definition for each of the ten variables, one line each, with the source it's measured from. Disagreements go in 02G (Objections). David rules.
