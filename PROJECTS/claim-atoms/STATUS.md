# Faith Through Physics Atom System — Status

tags: #claim-atoms #architecture #validation #status #jsonld

**Repo:** `D:\GitHub\Faith-through-physics-atoms` (GitHub: `YellowKidokc/Faith-through-physics-atoms`, branch `OBS-Plugin-Final-Claude`)
**Source of truth:** `_docs/GOVERNING_RULES_FINAL.md` · `_vocab/vocab.json` (v2.1.0)
**Last inspected:** 2026-07-26 — Claude Opus 5, full read of governing rules, post-review fixes, vocab, validator, status scan

---

## What It Is

The claim-atom layer. Every assertion in the framework becomes a JSON-LD atom
carrying its own identity, epistemic state, provenance, and the exact conditions
that would kill it. Folders organize human labor; atoms define what a thing
actually is and what it rests on.

**The three governing sentences (GPT Codex, July 23):**

> Artifacts enter where they belong.
> Claims rise only as far as their burden requires.
> Truth descends as far as people require.

### The five coordinates

Every atom declares five independent dimensions:

| # | Question | Field |
|---|----------|-------|
| 1 | What is it? | `nodeType` — claim, evidence, bridge, kill, paper, objection, translation, application, article, reach, result, question, series |
| 2 | Epistemic state? | `status` — captured, classified, proposed, active, verified, kernel_verified, weakened, falsified, deprecated, superseded |
| 3 | Where does it apply? | `domainType` + boundary conditions |
| 4 | For whom? | `audienceLevel` — specialist, doctoral, informed_adult, pastor, parent, policymaker, everyday, child |
| 5 | How derived? | `edges`, provenance, `bridgeGrade`, Descent Invariants |

Four views generated from one data layer: Canon (claims + provenance),
Workbench (the numbered folders), Graph (dependencies + propagation),
Public (descent renderings).

### The claim-burden principle

A claim's required support comes from its `claimClass`, **not** from the folder
it sits in. An isomorphism claim owes an explicit mapping, invariants, a
bidirectional test, and boundary conditions — wherever it lives. This is what
makes the system automatable: classify → generate required-node contract →
inspect linked support → report what's missing.

### Descent Invariant

Every transformation toward a broader audience records whether meaning survived:
`claimMeaningPreserved`, `confidencePreserved`, `boundariesPreserved`,
`killConditionPreserved`, `addedPremises`, `omittedMaterial`, `applicationLeap`.

A claim is descent-complete only when at least one reviewed path reaches an
ordinary-person artifact without changing meaning, confidence, boundaries, or
kill condition.

### Translation vs Application

Separate operations, separate node types. **Translation** is meaning-preserving
restatement. **Application** is an inferential leap that adds premises — and can
be wrong even when the source claim is right. Application nodes declare their
added premises so they can be challenged without touching the source.

---

## Current State — honest

**Architecture: strong. Population: near zero.**

`status_scan.py` output, 2026-07-26: twenty-four domains, every one reading
`empty:14 wip:1 done:0`. One `.jsonld` atom exists in the entire repo —
`demo-v12/02_claim_atoms/demo-claim.jsonld` — and it says of itself that it
"asserts nothing about the world."

This is not a criticism of the design. Fix 4 in `ARCHITECTURE_FIXES_POST_REVIEW.md`
already establishes that folder counts are the shallow human view and claim-level
coverage is the real measure. But both numbers are currently zero, and that is
the state of the project: a well-designed container awaiting contents.

**Known live fork.** `demo-v12` runs a different stage scheme (`01_middle_seed`,
`02_claim_atoms`, `10_technical_canon` … `31_revision_return`) than the twenty-four
production domains (`01_canonical` … `13_fulfilled` + `_theological`). The `_icons`
set is built for the v12 names. `_scripts` carries both `new_domain.py` and
`new_domain_v12.py`. `GOVERNING_RULES_FINAL.md` describes the v11 fourteen-folder
layout. Governance doc is pinned to the old side of the fork.

**Pointer not yet resolved.** `_docs/EVIDENCE_CONTRACT_POINTER.md` points at
`C:\theophysics\CANONICAL\_scripts\EVIDENCE_CONTRACT_SPEC.md` and notes that
`evidenceContract`, `evidenceObservations`, `supportAssessment`, and
`independenceGroup` still need to be written into `CLAIM_ATOM_NODE_TYPES.md`.
`independenceGroup` is the field that stops two evidence markers drawn from the
same source from being counted as two. Designed, not yet in the schema file.

---

## FIXED 2026-07-26 — the status ceiling

### The gap

Status can travel in three directions through the graph. Two were governed:

| Direction | Governed by | State before |
|---|---|---|
| Failure travelling **outward** | `propagationScope` | covered — 7 failure types, each with a scope |
| Confidence travelling **down** to a public audience | `descentInvariant.confidencePreserved` | covered |
| Status travelling **up** from dependencies | *nothing* | **unguarded** |

Every entry in `propagationScope` is a failure type. The table only fires when
something breaks. Nothing anywhere said a claim's status is capped by what it
depends on — so an atom could sit at `verified` with a `dependsOn` edge pointing
at something still at `proposed`, and both the vocabulary and the validator would
pass it clean. Not by decision. No rule had been written for that direction.

This is the same asymmetry found the same day in `HANDOFF_V2_TEMPLATE.md`, where
§4.3 logged claims weakened or killed and nothing logged claims strengthened.
Two independently built systems, same blind spot, same direction. Decay is loud
and gets caught. Unearned promotion is silent and compounds.

### The rule

```
status <= min( status of every dependsOn target,
               and of every bridgesTo target whose grade propagates )
```

Exception: `rederivation.artifact`. Status may exceed the ceiling only when the
atom names an independent re-derivation. **Citation, restatement, summary, and
compression are not re-derivation.**

Dead states (`falsified`, `deprecated`, `superseded`) are absolute ceilings — a
dependent of a dead node cannot hold any live status.

### Why the rule is shaped that way

The data processing inequality. `truth → source → restatement` is a Markov chain,
and post-processing cannot increase information about the source. Re-derivation
is precisely the case that breaks the Markov property — the agent went and looked
at the thing itself — which is why it is the only legal exception rather than an
arbitrary carve-out. One theorem yields both the rule and its exception.

This also puts the anti-drift rule inside Law 6 rather than in an admin policy.

### What changed on disk

**`_vocab/vocab.json`** — three edits:
- `propagationScope` gained a `_comment` stating it is failure-typed only, so
  nobody tries to file a status ceiling there. (I originally proposed adding it
  as an eighth entry in that table. That was wrong — the table maps
  *failureType → scope*, and a status ceiling is not a failure type.)
- New `statusRank` block — the confidence ladder ordered
  `captured 0 · classified 1 · weakened 1 · proposed 2 · active 3 · verified 4 ·
  kernel_verified 5`. `weakened` sits at 1 because it was knocked down from
  higher. Dead states are deliberately unranked; they are absolute ceilings.
- New `statusCeiling` block — rule, dead-state rule, exception, and the
  information-theoretic basis, with a pointer to the enforcing function.

**`_scripts/validate_atoms.py`** — added `check_status_monotonicity()` and made
the main loop two-pass. The original walked atoms one at a time, which cannot see
a dependency; the new version collects all atoms, indexes them by `nodeID` /
`@id` / `claimID`, then checks ceilings. Bridge edges impose a ceiling only when
their `bridgeGrade.propagates` is true, reusing the propagation flag already in
the vocabulary rather than inventing a second mechanism.

### Test evidence

Six synthetic atoms, one per rule path:

| Atom | Setup | Expected | Result |
|---|---|---|---|
| `base` | `proposed`, no edges | pass | pass |
| `violator` | `verified` → dependsOn `proposed` | ERROR | ERROR raised |
| `legal_rederived` | `verified` → dependsOn `proposed`, has `rederivation.artifact` | pass | pass |
| `dead_dep` | `active` → dependsOn `falsified` | ERROR | ERROR raised |
| `dead` | `falsified`, no edges | pass (imposes, doesn't inherit) | pass |
| `weak_bridge` | `verified` → bridgesTo `proposed`, grade `metaphorical` | pass (grade doesn't propagate) | pass |

Result: `2 errors` — exactly the two intended, no false positives.

Regression check against the real repo atom: `validated 1 atoms · 0 errors ·
1 warning`. The single warning is pre-existing and unrelated (compression class
`radiance` is ungraded).

### Consequence for existing work

Currently zero, because there is one atom and it has no edges. **The check should
be run the moment real atoms with `dependsOn` edges land.** It is cheap now and
expensive later — every atom written before the ceiling exists is an atom whose
status was never checked against its foundation.

---

## Open Items

1. **Resolve the v11/v12 fork.** Twenty-four domains on v11, one demo on v12,
   icons built for v12, governance doc describing v11.
2. **Land the evidence-contract fields.** `evidenceContract`,
   `evidenceObservations`, `supportAssessment`, `independenceGroup` into
   `CLAIM_ATOM_NODE_TYPES.md`. `independenceGroup` needs a validator check of its
   own — same-group evidence must not be counted as independent confirmation.
3. **Carry one domain end to end.** `master-equation` has three live folders and
   is the closest candidate. One domain through all fourteen stages would test
   whether the architecture works; twenty-four scaffolded ones cannot.
4. **Per-claim coverage in `status_scan.py`** — Fix 4 specifies it, not yet built.
5. **Grade the `radiance` compression class** (coherence, glory, field) or it
   cannot propagate.

---

## Change Log

| Date | Change | Agent |
|------|--------|-------|
| 2026-07-26 | Project file created. Status-ceiling rule added to `vocab.json` (`statusRank`, `statusCeiling`); `check_status_monotonicity()` added to `validate_atoms.py`; tested against 6 synthetic atoms + repo regression | Claude Opus 5 |
