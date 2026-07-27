# V3 GitHub Test Migration Runbook

tags: #canon #tests #github #python #colab #v3-migration

**Status:** Working runbook. Not a test result.
**Created:** 2026-07-26
**Purpose:** Migrate old Python/Colab tests to the v3 Master Equation baseline one at a time, preserving old evidence while creating runnable GitHub proof packets.

---

## Operating Principle

Do not bulk-zap the archive.

The old tests are valuable because of their harnesses: seeds, controls, regimes, stress sweeps, plots, tolerances, outputs, and failure reporting. The equation block is the part that may be stale.

Migration unit:

```text
one claim -> one Python script -> one Colab notebook -> one evidence dossier -> one GitHub link
```

Only after one unit is clean do we move to the next.

---

## Canon Baseline

Use the v3 ruling:

```text
X = (G, M, E, S, T, K, Q, R, F) in [0,1]^9
chi(X) = C_W[prod_i X_i]
dX/dt = W grad chi(X) + eta(X,t)
```

Current assumptions:

```text
C_W = identity unless explicitly tested otherwise
W and eta are injected adapters
X, chi, grad chi are dimensionless
dX/dt, W, eta carry s^-1
```

Do not cite old 10-variable / C-as-factor / bits-per-second reduced equations as v3 evidence.

---

## Migration Steps

For each candidate:

1. **Pick one test.**
   Use the equation-slot inventory. Start with non-archive `high_priority` files.

2. **Freeze provenance.**
   Record source path, old equation slot, old outputs if present, and whether the file is a duplicate/archive copy.

3. **Label, do not erase.**
   Mark old equation code:

   ```text
   HISTORICAL_EQUATION_SLOT
   ```

4. **Add the v3 adapter.**
   Add:

   ```text
   V3_CANONICAL_EQUATION_SLOT
   v3_chi
   v3_grad_chi
   v3_dXdt
   ```

5. **Preserve the harness.**
   Keep seeds, model comparisons, controls, parameter grids, result formatting, and output file names unless the test itself requires a controlled change.

6. **Run locally.**
   At minimum:

   ```text
   python -m py_compile <script>
   python <script>
   ```

7. **Write evidence dossier.**
   Record:

   ```text
   Defined:
   Formally proven:
   Numerically demonstrated:
   Empirically observed:
   Bridge interpretation:
   ```

8. **Package for GitHub.**
   Put the runnable Python version and outputs in a clean repo folder.

9. **Create Colab sibling.**
   Convert the same test into a notebook with the same claim ID and seed.

10. **Push only the packet.**
    Commit one test packet at a time.

---

## GitHub Target

Preferred target repo, pending David confirmation:

```text
D:\GitHub\theophysics-prediction-lab
origin: https://github.com/DavidLoweOKC/theophysics-prediction-lab.git
```

Reason:

```text
It is already a runnable prediction/test repo, separate from coordination memory and atom claims.
```

Do not use `D:\GitHub\Python-WEB` as the public proof target. It is a broad toolbox repo with a dirty working tree and many unrelated site-repair files.

Do not use `Faith-through-physics-atoms` as the primary test-code target. It is for claim atoms and ledgers; it can reference test packets but should not become the execution harness.

---

## Family Lagrangian Template Rule

The Family Lagrangian workbench is the preferred template for any migrated test that compares the canon equation against an applied scenario such as families, houses, institutions, or other domains.

Template references:

- `\\192.168.2.50\h_hp\Desktop 2\CANON\INTERPRETATIONS\Family_Lagrangian_Workbench.md`
- `\\192.168.2.50\h_hp\Desktop 2\Lagrangian\TESTS\Lagrangian_Family_Workbench.ipynb`
- `\\192.168.2.50\h_hp\Desktop 2\Lagrangian\TESTS\lagrangian_workbench.py`
- `\\192.168.2.50\h_hp\Desktop 2\Lagrangian\FAMILY_BRIEFING_FINAL.md` as narrative context only, not as the computational harness

Required side-by-side-by-side pattern:

1. Standard controls: harmonic oscillator, coupled oscillator, null/random baseline, or another established control appropriate to the claim.
2. Historical model: old equation form, clearly labeled `HISTORICAL_EQUATION_SLOT` when included.
3. V3 canonical model: current `V3_CANONICAL_EQUATION_SLOT`.
4. Scenario model: family, house, institution, or other applied test layer when relevant.

All compared models must share the same seeds, tolerances, integration settings, reporting schema, and pass/fail criteria unless the dossier explicitly justifies the difference. A result cannot be promoted as canon-supporting from a single-model run when a side-by-side template is available.

---

## Proposed Packet Layout

Inside the GitHub test repo:

```text
v3-tests/
  TEST-0001-comparative-lagrangian-bench/
    README.md
    claim.md
    provenance.json
    run.py
    requirements.txt
    outputs/
      results.json
      summary.csv
    colab/
      TEST-0001-comparative-lagrangian-bench.ipynb
```

Minimum `README.md` fields:

```text
Claim tested:
Canon version:
Source file:
Migration class:
What changed:
What did not change:
How to run:
Expected outputs:
Known limitations:
```

---

## First Pilot Candidate

From `equation_slot_inventory_20260726_232307.csv`:

```text
Source:
\\192.168.2.50\h_hp\Desktop 2\MASTER_EQUATION\COMPARATIVE_LAGRANGIAN_BENCH_v1.py

Status:
high_priority / C3-candidate

Why first:
Top non-archive candidate. It compares the Lowe Coherence Lagrangian against standard controls and already has a universal test battery.

Likely old slot:
LoweCoherenceLagrangian.chi_product(q)

Pilot test ID:
TEST-0001-comparative-lagrangian-bench
```

Pilot migration target:

```text
Create a v3 sibling model beside the historical L1 model.
Do not rewrite controls.
Do not delete historical L1.
Run the same battery against controls + historical L1 + v3 product-gradient model.
```

---

## Batch Rule

Batch size starts at one.

Increase only after:

```text
3 successful migrated packets
same failure modes understood
same test harness pattern repeats
GitHub packet structure holds
Colab conversion holds
```

Even then, keep commits small:

```text
one commit = one test packet
```

---

## What Makes The Case Strong

The case becomes hard to dismiss when each test is:

```text
source-traceable
version-labeled
runnable in Python
runnable in Colab
seeded/reproducible
control-tested
honest about failures
linked from GitHub
```

That is the path from "AI said it" to "anyone can rerun it."
