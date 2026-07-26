# Axiom System

tags: #axioms #derivation-chain

**Source of truth files:** `Master_Axiom.xlsx`, `Axioms Derivation chain (1).xlsx`, `WORLDVIEW_AXIOMS_EXPANDED.xlsx`
**Local paths:** 22 public (D:\PUB_AXIOM_FOUNDATIONS\), 188 technical (D:\01_Axioms\_001-188\ + PostgreSQL)
**Map:** PUBLIC_TO_TECHNICAL_MAP.md

---

## Structure

- **22 public axioms** (v2.1) — externally facing
- **188 technical axioms** — internal framework architecture, stored in PostgreSQL

---

## 2026-07-25 — RECONCILIATION ("do axioms right")

The many counts were causing drift. They are different ALTITUDES, not contradictions. Settled:

| Count | What it actually is |
|---|---|
| **~191** | total canon nodes (`O:\_Theophysics_v5\00_AXIOMS`, v5, 208 files) — mostly derivations |
| **33** | Primitive-*classified* nodes (July-4 typed canon) |
| **22** | "public axioms" (v2.1) |
| **~1–2** | **TRUE axioms by the no-dependency test** — essentially just **Existence** ("something exists," self-refutation-proof) |
| **0** | literal Lean `axiom` declarations (the Lean corpus constructs everything) |

**The honest headline: ~1 floor axiom, ~187 derivations.** A node with any `depends_on` is NOT an
axiom — it's derived. Of the 33 "primitives," ~31 are mislabeled (they have deps). Existence is the
floor; Distinction and Information are its first two derivations; everything else traces up from there
in one connected tree.

**The typing rule** (from David's July-4 `lean4-lane4-plan.md`, re-derived 2026-07-25):
only true primitives → Lean axioms · definitions → def · theorems → proof targets · equations → typed
objects · **bridges/identifications → EXPLICIT assumptions, never silent derivations** · predictions /
evidence / protocols / falsification → OUT of the proof kernel as metadata.

**Artifacts:** `AXIOMS_vs_DERIVATIONS.xlsx`, `LEAN4_STRUCTURE/` (build order + skeleton), and the
July-4 lean-canon set at `C:\theophysics\CANONICAL\03_AXIOMS\01_canonical\lean-canon\`
(`typed-canon-reclassification.csv` has every node's `lean_kind`). Interactive: `full_axiom_graph.html`
(knockout / generativity views). See [[lean4-verification]] and the 2026-07-25 trench report.

**Open:** 6 broken dependency links (ID-scheme mismatch) + the P0/A1.1 Existence duplicate still to
merge; and confirm the single canonical set (source-pointer → `Kimi_Agent_Faith Physic\_ORGANIZED_BY_15_BUCKET_NARRATIVE`).

---

## Change Log

| Date | Change | Agent |
|------|--------|-------|
| 2026-07-25 | Reconciled axiom counts (~1 true axiom vs 191 nodes); recorded typing rule; built Excel + Lean build structure + interactive graph | Claude Opus 4.8 |
