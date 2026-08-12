# 2026-08-11 — Atlas / Nabla Integration Summary

## Purpose

This entry records the architecture work completed across the Consilience Atlas / Nabla / atom stack effort and why the resulting setup matters.

The guiding principle is now:

> **Classify once. Store canonical objects and typed edges once. Compute deterministically. Project many ways.**

This reduced a growing collection of separate ideas into one pipeline with distinct responsibilities.

---

## Core System We Converged On

```text
SOURCE DOCUMENT
    ↓
NABLA
    ↓
ATOM STACK
    ↓
WARRANT / DYNAMICS / ORIENTATION
    ↓
LOCAL / PAPER
    ↓
SERIES
    ↓
RESONANCE
    ↓
Φ COMPARISON
    ↓
GLOBAL
    ↓
REALITY MIRROR
```

The important distinction is that these are not competing systems.

- **Nabla** = semantic address / AI routing layer.
- **Atom Stack** = local evidence-bearing knowledge object.
- **Warrant** = why a claim presently stands.
- **Dynamics-7** = how an object/system maintains coherence, degrades, crosses thresholds, restores, etc.
- **Ascent / Translation / Descent** = independently produced evidence-side and framework-side structures plus the bridge membrane between them.
- **Local / Paper / Series / Global** = aggregation resolutions.
- **Resonance** = discovery of structurally nearby candidates.
- **Φ** = formal bridge adjudication; similarity alone is never enough.
- **Reality Mirror** = external constraint / independence check.

---

## Nabla Semantic Address

The frozen candidate address is:

```text
D/N/V/A/U/R :: G M E S T K R Q F C :: HASH
```

The ten Nabla variables are semantic coordinates:

```text
G = Ground / authority
M = Mechanism / action
E = Disorder in the artifact itself
S = Identity / self
T = Time / sequence
K = Knowledge / information
R = Relation / bond
Q = Experience / felt
F = Faith / trust
C = Coherence / synthesis
```

Permanent address values remain binary 0/3 with confidence stored separately.

Critical separation:

- Nabla `C` is a semantic coordinate.
- Canonical Master Equation `C_W` is a wrapper over nine factors.
- Never multiply the ten Nabla fields and call the result canonical χ.

This distinction was enforced in code through a separate Master Equation type wall.

---

## Dynamics Probe

The compact domain-neutral dynamics interrogation was frozen as seven visible questions:

1. What counts as coherence?
2. What counts as degradation?
3. How is it measured?
4. Is there a threshold?
5. Is the transition asymmetric?
6. What restores it?
7. Is there a counterexample?

Restoration may be split internally as:

```text
restoration.self
restoration.external
```

This preserves the canonical W / η seam where a domain distinguishes self-motion from an external source.

Counterexample belongs to the verification architecture, not directly to the differential stack.

---

## Periodic-15 Grammar

The baseline marker grammar remains invariant across resolution:

```text
01 Identity
02 Home Domain
03 Native Domains
04 Bridged Domains
05 Object Type
06 Claim Family
07 Function Kind
08 Source
09 Commitment
10 Standing
11 Dispute
12 Evidence Grade
13 Usage / Runs
14 Graph Degree
15 Alert State
```

The governing rule is:

> **Same core markers, richer aggregation.**

Local, Paper, Series, and Global do not learn different languages.

Cross-Series Φ is an operation, not a fourth stored resolution.

---

## Projection Principle

One of the strongest simplifications reached today:

> **Never reclassify an object for another mind map when the new view can be derived from the same canonical objects and typed edges.**

Example:

```text
EVD-219 --supports--> CLM-146
```

That same stored edge can appear in:

- Proof Graph
- Evidence Landscape
- Warrant View
- Blast Radius

The maps are projections, not separate databases or new truths.

This means the API / NLP system classifies primitive semantic facts once and Python derives graph memberships and statistics.

---

## Candidate vs Admitted Graph

Two graph states remain explicit:

### Candidate Graph

May contain:

- `ai_inference_unverified`
- candidate dependencies
- candidate bridges
- candidate anchors
- candidate classifications

### Admitted Graph

Contains only objects meeting applicable admission rules and drives official standing / propagation / admitted bridge statistics.

No UI or aggregation layer may silently merge these states.

---

## Multi-Method Evaluation

The system now supports independent lanes over the same frozen source and grammar:

- **H** — human-executable rule lane
- **P** — Python / deterministic compute
- **A** — API / semantic intelligence
- **N** — optional independent NLP / second-model lane

Shared before commitment:

- source
- schema
- definitions
- rubric
- thresholds

Not shared before commitment:

- other lane conclusions
- reconciliation output

Agreement measures reproducibility, not truth.

Disagreement is preserved rather than averaged away.

---

## Repository Integration

### Faith-through-physics-atoms

PR #15 added the first Periodic Table / API rails integration spine:

- Periodic Table at Three Resolutions registry
- API classification schema
- deterministic `atlas_api_rails.py`
- Local / Series / Global beacon combination
- registry atoms for the architecture itself

The Python rail emits beacon groups and recombines them into a combined AtlasRecord.

### Nabla

The Nabla repo was expanded into the actual integration laboratory.

Current structure now includes:

```text
nabla/                 semantic core / station
atom_package/          provenance-preserving atom subtree
meta/                  orchestration facade
method_comparison/     independent local/API comparison
schemas/               shared contracts under meta/
gold/                  frozen specimens
templates/             Atlas Workbench
```

`atom_package/` is a squashed Git subtree of `Faith-through-physics-atoms`; `meta/` adapts it without rewriting its native meanings.

The common AtlasRecord schema now carries the major blocks:

- source
- Nabla
- Periodic-15
- Atom Stack
- evidence
- edges
- bridges
- anchors
- Reality Mirror
- Meta-Argument
- computed state
- audit
- unresolved

---

## Local GUI / Workbench

A local React/Vite Workbench was started on the Nabla repo in PR #1.

The intent is a local research application where an arbitrary paper can be loaded and run through:

```text
source freeze
→ local NLP
→ external API (DeepSeek/OpenAI)
→ comparison receipt
→ human review overlay
→ AtlasRecord / atom stack
→ expandable pills / views
```

The GUI is deliberately a Candidate sandbox.

It does not automatically admit claims, promote grades, or create accepted bridges.

The next integration target is converting arbitrary paper lane output into a full AtlasRecord / Atom Stack so the GUI can render claims, evidence, proofs, bridges, anchors, Dynamics, and orientation as deep expandable objects.

---

## Visual Architecture

The favored Atlas UI model became one full-screen Workbench rather than dozens of unrelated pages.

Two selectors govern the main canvas:

### Resolution

```text
LOCAL
PAPER
SERIES
GLOBAL
RESONANCE
```

### View

```text
Periodic
Dependency
Proof / Warrant
Dynamics
Ascent / Translation / Descent
Bridges
Reality Mirror
Dispute
Evolution
Blast Radius
Evidence Landscape
Topology
```

The selected object stays fixed while the projection changes.

This is the anti-disorientation rule.

---

## Pill / Drawer Interaction Rule

Every visible pill is a compressed address into a deeper canonical object.

```text
PILL
  ↓ hover
SHORT ORIENTATION
  ↓ click
DEEP OBJECT DRAWER
  ↓ deeper
FULL ATOM STACK / SOURCE / RECEIPTS
```

A claim pill should be able to expose:

- exact proposition
- source span
- components
- assumptions
- upstream/downstream
- evidence
- proof / derivation
- counterevidence
- kill conditions
- grades / standing / dispute
- open items
- method receipts

The same underlying object must open identically whether reached from Dependency, Proof, Blast Radius, Evolution, or Resonance.

Context changes; object identity does not.

---

## Ascent / Translation / Descent

This was promoted from a prose idea into a technical/visual graph contract.

```text
ASCENT                  TRANSLATION                  DESCENT
source                  PRESERVED                    reference
observation             LOST                         axiom/principle
evidence                INTRODUCED                   derivation
claim                   FORBIDDEN                    expected structure
structure                                            prediction
candidate invariant                                  test / observable
```

Important rule:

> Do not draw one continuous arrow from evidence into framework. Translation is a membrane, not a bridge by default.

The two sides remain independently auditable and only meet after each produces its own result.

---

## Resonance vs Φ

A useful distinction was fixed:

### Resonance

Discovery only.

Finds structurally nearby objects using signals such as:

- Nabla proximity
- Dynamics similarity
- dependency pattern
- claim-family overlap
- graph motifs
- semantic similarity

### Φ

Adjudicates a selected candidate using:

```text
PRESERVED
LOST
INTRODUCED
FORBIDDEN
```

plus directionality, negative controls, ablation, independence, provenance distance, and bridge lifecycle.

High resonance is allowed to end in a rejected bridge.

---

## Reality Mirror

Reality Mirror remains outside the dynamics probe.

It asks whether a materially load-bearing path reaches a constraint the originating system did not manufacture.

Reference classes:

```text
N = Natural / physical / biological
F = Formal
H = Historical / trace
T = Claimed transcendent
none = not applicable
```

The system must preserve:

```text
internal coherence ≠ external warrant
external requirement ≠ specific theological identification
```

---

## Current Testing Strategy

Architecture work should now yield to specimen testing.

Recommended order:

1. Master Equation technical page
2. Grace cross-domain paper
3. narrative / pastoral artifact
4. pure mathematics artifact

For each blind classifier disagreement:

```text
MODEL_ERROR
HUMAN_GOLD_ERROR
RULE_AMBIGUITY
```

If the grammar is ambiguous, fix the grammar rather than coercing the model.

After local stability:

- verify projections are derivable without new semantic passes
- aggregate Paper → Series → Global
- test Resonance candidate generation
- then implement Φ adjudication

---

## Side Project — HTML-OBS

A separate quick design pass clarified the intended future of HTML-OBS:

> **Obsidian + VS Code/CodePen + an AI HTML collaborator**

Existing app already provides a useful local HTML notebook/viewer.

First milestone proposed:

```text
file tree
→ source editor
→ live preview
→ permanent right-hand AI panel
→ selection-aware proposed diff
→ apply/reject
```

Do not attempt every Obsidian-like feature at once.

---

## Why This Work Matters

Before this convergence, several strong systems existed but overlapped:

- file semantic classification
- atom registry
- argument compiler
- deterministic grading
- maps
- cross-domain comparison
- external-reference testing
- HTML templates

The risk was implementation fragmentation: each subsystem could invent its own object model and force repeated reclassification.

The current architecture removes that risk by giving each subsystem one job while requiring one interchange grammar.

The result is intended to support two related goals:

1. **Research rigor** — every visible claim can be opened into source, warrant, dependency, defeat conditions, provenance, and externality.
2. **AI-scale navigation** — a model can scan semantic addresses / AtlasRecords quickly, choose the right files, and reconstruct the same canonical graph without rereading the whole corpus blindly.

The architecture should now be treated as provisionally frozen at the primitive level.

Future work should be driven by actual specimens and failures, not new top-level categories.

---

## Immediate Next Actions

1. Finish arbitrary-paper → full AtlasRecord / Atom Stack adapter.
2. Run Gold-001 end-to-end.
3. Render expandable claims/evidence/proofs/bridges/anchors in the local Workbench.
4. Test a second independent semantic lane against the same DocumentPacket.
5. Only then scale Paper → Series → Resonance → Φ → Global.
6. Keep all failures and ambiguities visible as receipts/open items.

---

## Session Ruling

The system is no longer best understood as several unrelated projects.

It is one pipeline:

```text
SOURCE
→ NABLA
→ ATOM STACK
→ WARRANT
→ LOCAL/PAPER
→ SERIES
→ RESONANCE
→ Φ
→ GLOBAL
→ REALITY MIRROR
```

with:

```text
ONE CANONICAL INTERCHANGE CONTRACT
MULTIPLE INDEPENDENT INTERPRETERS
DETERMINISTIC COMPUTE
MULTIPLE PROJECTIONS
EXPLICIT EXTERNALITY
```

Build against the contract. Let real documents expose the remaining mistakes.
