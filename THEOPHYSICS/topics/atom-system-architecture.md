# Atom System Architecture

tags: #theophysics #atoms #claim-graph #descent #claim-burden #cross-domain #infrastructure #reference

Last inspected: 2026-07-23 by GPT Codex

---

## Source Of Truth

Repository: `YellowKidokc/Faith-through-physics-atoms`

Inspected branch: `OBS-Plugin-Final-Claude`

As inspected on 2026-07-23, that branch was also the repository default branch. Treat the repository as the implementation and specification authority for the atom system. Keep coordination memory here in AI-CREW; keep schemas, templates, vocabulary, scripts, and atoms in the atom repository.

Start there with:

1. `README.md`
2. `README_AI_START_HERE.md`
3. `_docs/GOVERNING_RULES_FINAL.md`
4. `_docs/THEOPHYSICS_ARCHITECTURE_v11_CANONICAL.md`
5. `_docs/ARCHITECTURE_FIXES_POST_REVIEW.md`
6. `_docs/CLAIM_ATOM_NODE_TYPES.md`
7. `_docs/ROOT_LAYER_SPEC.md`
8. `_vocab/VOCABULARY.md`
9. `_scripts/validate_atoms.py`
10. `_scripts/status_scan.py`

## Governing Sentences

```text
Artifacts enter where they belong.
Claims rise only as far as their burden requires.
Truth descends as far as people require.
```

These sentences resolve the apparent conflict between a fixed 14-folder workbench and content that naturally begins at different levels.

- The folders are stable work surfaces and sorting addresses.
- They are not a mandatory execution sequence.
- They are not the ontology of the system.
- The atom graph defines identity, support, dependency, challenge, descent, and verdict.
- The route profile determines which work surfaces an artifact needs.
- The claim burden determines what rigor each claim owes.

Do not replace this with a second linear or bidirectional folder tree unless David explicitly reopens the architecture. The two-direction insight is already represented by optional rigor ascent, mandatory public descent, route profiles, and graph edges.

## The 14 Workbench Folders

```text
00_inbox_working  EXPLORE   raw capture
01_canonical      CLAIM     claim atoms and current accepted statements
02_paradigm       REFRAME   what changes in prior thinking
03_synthesis      CONNECT   cross-domain bridge nodes
04_hypothesis     PREDICT   prospective predictions
05_evidence       COMPARE   supporting and challenging evidence
06_falsification  TEST      kill conditions and attempts
07_paper          PROVE     formal composite treatment
08_objections     DEFEND    steelmanned opposition
09_everyday       TRANSLATE meaning-preserving public expression
10_worldcheck     VERIFY    pressure test of the translation
11_articles       TELL      narrative treatment
12_audience       REACH     SEO, social, toolkits, and distribution
13_fulfilled      RESULT    what happened and what changes
```

Companion:

```text
_theological      GROUND    domain mapping to canonical Scripture and theology
```

The numbers are filesystem order, not proof order. Evidence may precede a hypothesis. Objections may precede a paper. Not every artifact needs every folder.

## Route Profiles

### Route A: Pastoral / Everyday

```text
theological grounding -> everyday -> article -> audience
```

No doctoral paper is required unless individual claims create a stronger burden.

### Route B: Explanatory Article

```text
canonical references -> evidence as needed -> everyday -> article -> audience
```

The article is primary. Its claims still receive linked support.

### Route C: Framework Argument

```text
canonical -> paradigm -> synthesis -> hypothesis -> evidence ->
falsification -> objections -> everyday -> article -> audience -> fulfilled
```

A paper is added when scope, novelty, or audience warrants it.

### Route D: Formal Paper

```text
canonical -> definitions/proof/method -> evidence -> falsification -> paper ->
objections -> translation -> application -> article -> audience -> fulfilled
```

The paper is a composite rendering, not the source of truth and not the endpoint.

## Naming And Identity

### Node identity

Every node receives a permanent `nodeID`.

Only claim nodes receive a `claimID`.

Example:

```text
claimID: tp:EDU/C0042
```

Claim identity is independent of canonical status. A draft, challenged, falsified, deprecated, or superseded claim remains the same claim and keeps the same ID.

### File naming

The builder specification uses:

```text
[DOMAIN]-[STAGE_NUM]-[AUTO_INCREMENT].jsonld
```

Examples:

```text
education-01-001.jsonld
physics-03-012.jsonld
```

The `.jsonld` atom is the source of truth. Generated `.html` is a rendering beside it and must not be edited directly.

### Human and machine signature

The vocabulary defines a maximum five-glyph signature in this fixed order:

```text
state | type | domain | evidence | concept
```

If a sixth semantic slot is needed, the atom is probably performing two jobs and should be split.

### Branch and handoff naming

AI-CREW handoffs use:

```text
THEOPHYSICS/trench/YYYY-MM-DD-short-topic.md
SIGN-OFFS/YYYY-MM-DD-agent-short-topic.md
```

Code and specifications remain in their source repository. AI-CREW stores status, decisions, links, risks, and next actions.

## Atom Semantics

Only claims are claims. Papers, evidence, bridges, translations, objections, articles, and results orbit claims.

Every atom is located by six independent axes:

1. `nodeType`: what it is.
2. `status`: epistemic state.
3. `domainType`: where it applies.
4. `audienceLevel`: for whom it is rendered.
5. Provenance: edges, evidence type, and verifier.
6. Lexical layer: tags, keywords, glyphs, and normalized mathematics.

The lexical layer lets atoms find candidate relationships. It does not prove them.

Matching order:

```text
identical normalized math       -> candidate identity
isomorphic normalized math      -> candidate isomorphism
shared axiom root               -> candidate dependency or sibling
controlled tag overlap          -> candidate bridge, ungraded
embedding or keyword similarity -> review candidate only
```

The machine proposes. A human grades. Candidate bridges begin `ungraded` and `propagates: false`.

## Claim Burden

Rigor is generated by claim class, not folder location or writing style.

| Claim class | Minimum obligation |
|---|---|
| Pastoral | Scripture/theological grounding; marked application |
| Textual biblical | Exact passage; translation and textual qualification |
| Theological interpretation | Scripture; interpretive premises; tradition |
| Historical | Primary or credible secondary sources; date and scope |
| Empirical | Observation; data; method; uncertainty |
| Statistical | Dataset; inclusion rule; denominator; reproducible calculation |
| Mathematical | Definitions; derivation/proof; domain and boundaries |
| Isomorphism | Explicit mapping; invariants; bidirectional test; boundaries |
| Causal | Competing explanations; identification logic; distinguishing evidence |
| Application | Source claims; added premises; boundaries; application kill condition |

The deterministic automation pattern is:

```text
classify claim
-> generate burden contract
-> inspect linked supporting nodes
-> report missing requirements
-> preserve the artifact's natural route
```

## Descent Invariant

Public descent is not complete merely because a plain-language file exists.

Each `descendsTo` edge records whether the transformation preserved:

- claim meaning;
- confidence;
- boundaries;
- kill condition;
- provenance;
- omitted material;
- added premises;
- review status.

Descent is complete only when at least one reviewed path reaches the `everyday` audience, every edge on that path passes review, and the reader can trace the rendering to the exact source claim.

## Translation And Application

These are separate operations.

- Translation restates the same meaning in simpler language.
- Application adds premises and moves from truth claim to proposed action.

An application may fail while the source claim remains true. Application nodes must identify their source claims, added premises, boundaries, risks, alternatives, and kill condition.

The `application` node is not another mandatory stage folder. It attaches where the inference occurs.

## Scoped Falsification

Do not propagate every failure globally.

| Failure type | Scope |
|---|---|
| Root logical contradiction | Global dependents |
| Invalid mapping | Bridge peers flagged |
| Boundary exceeded | Dependents reviewed |
| Measurement invalid | Local |
| Empirical instance failed | Dependents reviewed |
| Interpretation overreach | Local |
| Application failure | Application only |

Only root-level logical contradiction warrants automatic global propagation. Most empirical failures trigger review rather than automatic falsification.

## Root Layer

Conceptual hierarchy:

```text
GOD
-> coherence / decoherence classification
-> Master Equation
-> Ten Laws
-> domains
-> workbench stages
-> atoms
```

Filesystem hierarchy remains flat. Graph edges carry the conceptual hierarchy.

Every serious framework claim should be traceable through approved bridges toward the relevant Law and Master Equation root. The root layer owns canonical structures; domains own their applications and mappings.

The `_theological` companion follows the same anti-duplication rule: reference canonical Scripture and theology atoms rather than redefining doctrine independently in every domain.

## Website And Publishing Consequence

The atom is the data layer. The website is a generated view.

Preferred claim page:

```text
/claims/[stable-claim-slug]/
  overview
  everyday
  evidence
  objections
  technical
  history
```

A paper receives a separate stable URL because it is a composite artifact, but it points to the claims it assembles.

SEO may optimize titles, descriptions, examples, media, links, order, performance, and query fit. It may not optimize truth status, claim strength, uncertainty, bridge grade, falsification outcome, evidence quality, or authorship.

## Inspected Implementation State

Present on the inspected branch:

- controlled vocabulary and JSON-LD context;
- 14-stage template READMEs;
- theological companion template;
- domain creation scripts;
- vocabulary validator;
- folder-level status scanner;
- architecture, node, root-layer, and post-review specifications;
- one Master Equation claim atom.

Validator result on 2026-07-23:

```text
validated 1 atoms
0 errors, 0 warnings
```

## Implementation Gaps

These are wiring gaps, not reasons to redesign the architecture.

1. Documentation specifies `atom_builder.py`, `atom_renderer.py`, and `atom_graph.py`, but those tools were not present on the inspected branch.
2. `status_scan.py` reports folder occupancy, not claim-level burden or descent completion.
3. Three template READMEs retain pre-review language:
   - `05_evidence` treats LLM consensus too much like evidence;
   - `06_falsification` says falsification propagates to all dependents;
   - `09_everyday` embeds practical application inside translation.
4. The validator should add required fields by node type, edge-target existence, claim burden, canonical approval, Descent Invariant, application premises, failure-scope compatibility, and within-axis glyph uniqueness.
5. The publishing builder should generate claim pages, paper pages, Schema.org data, Theophysics JSON-LD, citation metadata, sitemaps, social metadata, and correction/supersession notices.

## Known Vocabulary Warning

The inspected human vocabulary still displayed several within-axis glyph collisions and near-identical glyphs. David supplied separate Unicode fallback work during the session, but this handoff did not verify whether those fallback decisions have been merged into `_vocab/`.

Do not assign final glyphs from memory. Reconcile the fallback documents, controlled JSON vocabulary, and uniqueness validator first.

## First Build Order

1. Reconcile post-review README language and Unicode vocabulary.
2. Expand `validate_atoms.py`.
3. Add claim-level reporting to `status_scan.py`.
4. Implement the already-specified atom builder, renderer, and graph reader.
5. Add supervised AI jobs for classification, claim extraction, burden generation, descent review, evidence, falsification, objections, and audience packaging.
6. Add graph matching and typed verdict propagation.
7. Build scholarly and public renderers.

## Do Not Drift

- Do not make a new folder system because one article does not use all 14 stages.
- Do not require a doctoral paper for pastoral or explanatory work.
- Do not let a public label hide a doctoral-strength claim.
- Do not call analogy isomorphism.
- Do not treat LLM agreement as decisive evidence.
- Do not merge translation with application.
- Do not let a nonempty folder stand in for claim-level completion.
- Do not let AI promote its own proposal, grade its own bridge, or verify its own claim.
- Do not hand-edit generated HTML.

## Compact Handoff

```text
Put the artifact in once.
Extract its claims.
Let claim class generate rigor.
Let route profile generate work surfaces.
Let edges generate dependencies.
Let the Descent Invariant protect public meaning.
Let humans approve consequential transitions.
Let reality supply typed verdicts.
Let the website render every view from the same atoms.
```
