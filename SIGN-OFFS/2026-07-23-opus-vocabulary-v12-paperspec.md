# Sign-Off - 2026-07-23 - Opus - Vocabulary Layer, v12 Structure, Paper Spec

tags: #sign-off #handoff #theophysics #atoms #vocabulary #glyphs #v12 #validator

---

## Session Focus

Close the open loops from Codex's 2026-07-23 atom-architecture sign-off, build
the missing controlled vocabulary the atoms already referenced, and reconcile
the v12 bidirectional architecture against the paper/domain distinction.

## Codex's Six Open Loops - Status

| # | Loop | Status |
|---|---|---|
| 1 | Reconcile Unicode glyph collisions and fallbacks | **CLOSED** |
| 2 | Correct stale stage README rules (evidence, falsification, everyday/application) | **CLOSED** |
| 3 | Expand atom validation | **CLOSED** |
| 4 | Add claim-level completion reporting | OPEN |
| 5 | Implement atom builder, renderer, graph reader | PARTIAL - renderer only |
| 6 | Public and scholarly rendering from approved atoms | PARTIAL |

## What Changed

**The vocabulary layer (`_vocab/`) - this filled a declared dependency.**
Every atom's `@context` points at `faiththruphysics.com/vocab/context.jsonld`.
That URL had never resolved to anything. That absence is why FIS invented its
own domains and why `formal-derivation` drifted from `formal_derivation` on the
only atom in existence.

- `VOCABULARY.md` - six axes, human master
- `context.jsonld` - the real JSON-LD context, `@vocab`-bound
- `vocab.json` - enums: nodeType, status, audienceLevel, evidenceType, verifiedBy,
  paradigmRelation, edgeType, bridgeGrade (with propagation flags), claimClass
- `domains_and_tags.json` - 36 domains, 43 tags, each with a glyph
- `compressions.json` - see below
- `layers.json` - the vertical stack
- `stage_contracts*.json` - per-stage contracts, 9 sections each

**Glyph collisions were NOT bugs.** Five shared glyphs turned out to be
compression claims and are now declared with grades and kill conditions:
noether (invariant/symmetry/conservation), shannon (information/signal-noise/
channel-capacity), observer (witness/observer), moral-ledger (justice/
moral-conservation), curvature (sin/curvature). Real accidents fixed separately:
regress and repentance both on U+21BA, historical and prediction visually
confusable, verified and active visually confusable.

**`radiance` (coherence/glory/field) left UNGRADED deliberately.** It sits on the
binary's own pole glyph. Needs David. The validator warns every run.

**Layer stack ruling.** Coherence/decoherence is a CONSTRAINT-layer binary. It
describes behavior once a world exists; it does not select which world exists.
Placing it directly under God is a category error. Selection sits at `tpl:logos`.
Converged independently by GPT and Opus.

**Lexical layer added (Axis 6).** `tags`, `keywords`, `glyphs`, `mathFormNormal`.
Without it every edge must be hand-authored - the "atoms find each other" story
had no engine. `mathFormNormal` rewrites equations with role names instead of
domain names so cross-domain identity is computable. Matching order:
mathFormNormal > axiomRoot > tag overlap > embedding. Machine proposes as
`grade: ungraded, propagates: false`. **Human grades.**

**v12 structure.** 19 stages per domain. `17_doctoral_paper` REMOVED from the
domain template - a paper that is 70% education cannot live in `education/`
without lying about the other 30%. Papers moved to root `papers/`, referencing
claims by claimID across domains. Contract preserved in `papers/README.md`.

**Folder icons from real glyph artwork.** 80 `.ico` files built from the 56
designed PNGs, not Unicode fallbacks. Shape = stage, band colour = branch,
corner dot = state (gray empty / amber working / green done / red failed).
`build_stage_icons.py` regenerates, `set_folder_icons.py` scans and applies.

**Second atom minted.** `ME-01-002-selection-argument` - constraints cannot
select; selection requires an agent term. Graded structural_isomorphism.
Paper at `C:\theophysics\CANONICAL\_THESIS\01_architecture\`.

## What Was Verified

- Validator: 3 atoms, 0 errors, 1 warning (the deliberate `radiance` warning).
- The validator caught real drift on its FIRST run (`formal-derivation` hyphen)
  and again on a demo stub I had written myself (claim node missing claimID).
- Icon generation: 80 icons, 0 glyphs missing.
- All `_vocab/*.json` parse.
- Git: committed locally through `c902415`. **NOT PUSHED.**

## What Was NOT Verified

- Lean 4 content, scientific or theological conclusions.
- The deployed v1.0 atoms at `\\192.168.2.50\h_hp\Desktop\Files\claim-atom-standard-1.0\`
  have NOT been run through the new validator. They predate the vocabulary and
  use `formal-derivation` and `verificationStatus: machine-verified`, neither of
  which is currently legal. **This is the drift that will spread if left.**
- NAS/Windows copy synchronisation.
- Whether `radiance` should be graded.

## Prior Art Found - Act On This

Two external projects occupy our exact territory, both permissively licensed:

- **paper-spec** (MIT / CC-BY-4.0) - `paper.yaml` companion format. Claims with
  ids, acceptance criteria paired with falsification, typed dependencies with
  `critical: true`, limitations with severity. 24 real examples. Has three things
  we lack: **validation levels 0-4** (graduated adoption), **journal requirement
  profiles**, and the **30-minute rule** for new fields. Has no AI contribution
  declaration - we do.
- **living-paper** - verification without exposure. Two ideas worth taking:
  **challenging evidence as a required field** (not objections - evidence in your
  own data that cuts against the claim), and a **computed health indicator**
  (well-supported / contested / weak) the author cannot set.

**Recommendation:** adopt `paper.yaml` as the EXPORT format, keep atoms as source
of truth. Our atoms are a superset. "Our claims validate against an existing open
standard" defuses the credential attack in a way an invented format cannot.

## Current Open Loops

1. **Run the deployed v1.0 atoms through the new validator.** Highest priority -
   this is live drift.
2. Grade `radiance`.
3. Claim-level completion reporting (Codex loop 4, still open).
4. Atom builder and graph reader (Codex loop 5, partial).
5. Build the atom to `paper.yaml` exporter; validate against paper-spec's schema.
6. Three-part testing structure per stage: Python (deterministic) / NLP (local
   semantic) / API (judgment). **Where the three disagree is the finding.**
   Publishing all three plus their disagreements is the symmetry clause made real.

## Next Agent Should Start Here

Read `_vocab/VOCABULARY.md`, then run `python _scripts/validate_atoms.py` before
touching anything. The vocabulary is now the single place classification lives.
If a classifier invents a category, either the category is wrong or the
vocabulary is incomplete - those are the only two options.

## Personal Note

Two things worth passing on. First: I forked the schema within an hour of
starting, by writing a frontmatter format without checking that
`CLAIM_ATOM_NODE_TYPES.md` already existed. The architecture had already ruled -
jsonld is source of truth, folders and markdown are generated views. Check the
`_docs/` before designing.

Second, and more useful: the corpus at `C:\theophysics\CANONICAL` holds 752
markdown files and 4 carry metadata. `_DEMO_STRUCTURE/` holds eleven versions of
the folder proposal. The structure has been good enough to start filling since
about v8. Architecture generation is outrunning content migration by roughly
200:1. The bottleneck is not the design.
