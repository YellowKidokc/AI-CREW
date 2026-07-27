# ACTIVE BULLETINS

tags: #bulletins #urgent #active

**Items here are URGENT. They override normal task flow. Check dates and remove when resolved.**
**This file is the single home for bulletins. `_READ_ME_FIRST.md` points here. Do not duplicate bulletins in both.**

---

### CANON - BIG DECISION, READ THIS (2026-07-26): THE CANONICAL ITEM STRUCTURE

**Every AI: read and VOTE.** We are settling the one question that blocks everything downstream: what is the canonical structure of a single item (claim / axiom / theorem / test)? The 6-AI panel paper is here:

`CANON_DECISIONS/CANON_ITEM_STRUCTURE_RATIFICATION_v1.md`

It carries decided verdicts (D1-D7) with confidence numbers and a `PANEL VOTES` block under each. Do not rubber-stamp. Check the files, then append your vote and reasoning. When all six have voted and David rules, the survivors become the spec and we rewrite to conform. Companion: the harvested test ledger in `CANON_TEST_LEDGER/`.

**Votes in so far:** Codex GPT-5 (all D1-D7), Claude Opus 4.8 (all D1-D7, 2026-07-27). Opus flagged D4 as a HARD BLOCKER on D1 (validator still enforces legacy fields → two sources of truth until fixed) and proposed the orthogonality test for D3 (can you hold logicalType fixed and vary evidenceType? if yes in >1 cell, they're separate axes → split). Awaiting the remaining panel AIs.

---

### BULLETIN 2026-07-26: MASTER EQUATION DYNAMICS RERUN

**Status:** ACTIVE - not started

**Canonical current form:**

```text
chi(X) = C_W[ product_i X_i ]
dX/dt = W grad chi(X) + eta(X,t)
```

**Important correction from the v3 ruling:** the earlier "all ten variables = bits/second" and "Level 2 is Level 1 differentiated" language is retired. Under the v3 ruling the reduced factors and `chi` are dimensionless; `dX/dt`, `W`, and `eta` carry `s^-1`; bits/s belongs only in the Level-0 parent/Shannon equations. See:

- `CANON_DECISIONS/FABEL_GRADIENT_MASTER_EQUATION_RULING_v3.md`
- `CANON_TEST_LEDGER/FABEL_GRADIENT_RETEST_PROTOCOL_v0.1.md`

**Current safe claims:**

- Complementarity and bottleneck sensitivity are product-gradient properties to verify under the reduced implementation.
- Zero-veto is Lean-verified in the declared formal system for the current wrapper assumptions.
- The source theorem is narrow: nonzero `eta` gives nonzero instantaneous velocity from a stationary point under the declared hypotheses.
- Global convergence / annealing is open. Do not cite it as proven.
- `W = free will` and `eta = grace` are bridge identifications, not theorems.

**CONSEQUENCE: Every prior test must be rerun or classified for version drift before it is cited under v3.**

Pick 2-3 from this list per session. Record evidence with the dossier format in the retest protocol.

| # | Test | Status | Completed by | Date |
|---|------|--------|-------------|------|
| 1 | Library intake and version-drift classification | PENDING | | |
| 2 | Canonical state validation: nine factors, `C_W` wrapper, normalized `X_i` | PENDING | | |
| 3 | Product-gradient algebra: analytic vs finite-difference gradient | PENDING | | |
| 4 | Source-term behavior: stationary with/without `eta` | PENDING | | |
| 5 | Mobility operator `W`: scalar, diagonal, matrix, PSD/non-PSD controls | PENDING | | |
| 6 | Boundary conditions: keep `X` inside `[0,1]^9` | PENDING | | |
| 7 | Field-to-reduced consistency: integral form to reduced product | PENDING | | |
| 8 | Law 5 lock gate: reproduce decay without hidden tuning | PENDING | | |
| 9 | Law 9 lock gate: reproduce `Gamma_sin` without hidden tuning | PENDING | | |
| 10 | Controls: wrong dictionary, `C_W` as factor, random `W`, no source, shuffled targets | PENDING | | |
| 11 | Lagrangian side-by-side: LLC/action model vs v3 reduced gradient model | PENDING | | |
| 12 | Evidence dossier builder and reproducibility commands | PENDING | | |

**Source session:** Fabel (Atoxor), 2026-07-24/25. Filed historically at `THEOPHYSICS/trench/2026-07-24-equation-of-motion-session.md`.

---

### BULLETIN 2026-07-27: `L_D` DISCOHERENCE OPERATOR IS THE NEXT MISSING OBJECT

**Status:** ACTIVE - candidate architecture, not canon

The Eight Families countermeasure framing is useful as an index, but by itself it does not derive eight channels. The stronger testable route is:

```text
assemble L_D -> diagonalize L_D -> read principal decay eigenmodes -> compare to Eight Families
```

If the decay operator yields eight principal modes that correspond to the families, the countermeasure architecture gains real evidential weight. If it yields six, eleven, or overlapping modes with no principled basis, the architecture redraws.

Related candidate file:

`CANON_DECISIONS/SPIRITUAL_DERIVATIVES_LAW_LENS_GRID_CANDIDATE_v0_1.md`

Immediate next work: define what belongs inside `L_D` from the Shannon/D terms, Law 5 decay, Law 9 `Gamma_sin`, adversarial perturbation, hidden drift, and boundary/admittance failures. Do not assume the eigenmode count is eight.
