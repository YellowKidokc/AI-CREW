# CANON TEST LEDGER — does everybody agree with this list?

tags: #canon #tests #ledger #crew-vote

**Status:** OPEN FOR CREW REVIEW · opened 2026-07-26 · NOT definitive — a starting list.

---

## What this is

Every test/proof we've **already run** across the framework, harvested into one place from three folders on the NAS (`Desktop 2\CANON`, `Desktop 2\Axioms of GOd`, `Desktop 2\LEAN 4`) — **233 truth cards**, deduped by content. The condensed list lives in:

→ **`THEOPHYSICS_TEST_LEDGER.xlsx`**
- **TESTS** sheet — the **60 runnable tests** (18 Lean · 35 Colab · 5 Python · 1 Wolfram · 1 data), each with a `STATUS` you flip as it's re-verified.
- **CLAIMS_AXIOMS** sheet — the **173** axiom / derivation / formalization cards (the assertions, with an `AGREE?` column).
- **HOW_THIS_WORKS** sheet — the workflow, also below.

Full provenance for every row (original source path + detected finding): `Faith-through-physics-atoms\_INBOX_HARVEST_TRUTH_CARDS\MANIFEST.csv`.

## First ask to the crew

**Does everybody agree with this list?**
- If something's wrong, say so here.
- **What tests should we ADD?** This list is a floor, not a ceiling.

## The daily workflow (low-friction, one AI at a time)

1. Any AI reading AI-crew picks **one or two `UNVERIFIED`** tests from the TESTS sheet.
2. Re-run it **independently** (Lean compile / Colab / Python / Wolfram).
3. Set `STATUS = PASS` or `FAIL`; add your name + date run.
4. **PASS** → push the runnable test to the designated GitHub, **grouped by type** — all Python together, all Colab together, all Lean together. Goal: **one-click install per group ("here's the test")**.
5. **FAIL** → leave a note; flag for discussion *before* anything is changed. (A fail we find is a fail fixed.)

Over time this clears a large part of the corpus with almost no coordination cost — nobody's blocked, one or two tests get done, and it compounds.

## Grouping / GitHub targets (to be confirmed by David)

| Group | Contents | GitHub target |
|---|---|---|
| `LEAN` | 18 Lean proof cards (MasterEquation, GraceOperator, JusticeMercy, Isomorphism, Noether…) | _TBD_ |
| `PYTHON_COLAB` | 40 Colab/Python tests (hubble, galaxy rotation, χ-field, biblical-complexity, prophecy, master-equation solve/verify…) | _TBD_ |
| `WOLFRAM` | Wolfram gauntlet (ten-laws) | _TBD_ |

Related: the item-structure decision these tests will eventually be filed under is in `../CANON_DECISIONS/CANON_ITEM_STRUCTURE_RATIFICATION_v1.md`.
