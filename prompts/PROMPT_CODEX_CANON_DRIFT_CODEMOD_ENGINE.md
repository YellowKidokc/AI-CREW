# PROMPT - CODEX BUILD: CANON DRIFT + CODEMOD ENGINE

You are Codex working in David Lowe's Theophysics repositories.

Build a practical canon drift and codemod engine for Markdown and HTML documents.

The goal is not blind find-and-replace.
The goal is a weekly canon-maintenance tool that can detect older versions of definitions, equations, symbols, claims, citations, headings, bad encoding, emoji, and HTML render drift, then either:

1. auto-fix safe exact matches;
2. propose patches for near matches;
3. flag uncertain cases for human ruling.

The engine must preserve trust. Every change needs an audit trail.

This engine should also support canon auto-linking:

- if a document says "Trinitarian";
- if it says "Law 1";
- if it says "Master Equation";
- if it says "Terminus Sui";
- if it uses a registered symbol such as `chi`, `C_W`, or `eta`;

then the scanner should be able to attach a canon pill, tooltip, link, or transclusion tag pointing back to the approved definition, proof receipt, claim atom, or source page.

Do not over-link every repeated word. Use first-use-per-section, public-facing pages, and author-approved terms.

## Core Problem

Canonical forms change over time.

Example:

Old Master Equation forms may appear as:

```text
chi = G/S
dchi/dt = G - S + Gamma
chi = f(G,M,E,S,T,K,R,Q,F,C)
chi = product(G,M,E,S,T,K,R,Q,F,C)
chi = C * product(...)
spacetime integral forms
field / Lagrangian forms
```

Current canon may say:

```text
X = (G, M, E, S, T, K, Q, R, F) in [0,1]^9
chi(X) = C_W[ product_i X_i ]
dX/dt = W grad chi(X) + eta(X,t)
```

But old forms are not always wrong in the same way.

Some are:

- retired and should be replaced;
- narrative/character-level exploratory forms and should be marked, not replaced;
- older public translations that need updated wording;
- partial forms that are structurally related but not one-to-one;
- speculative forms that should be moved to deferred/candidate status;
- HTML-rendered versions of older Markdown.

The hard problem is inference:

How does the tool detect that a passage is "about" an old Master Equation form if the wording is not an exact string match?

Answer: use layered matching plus confidence thresholds, not one method.

## Required Matching Layers

Use all layers available, from safest to loosest:

### Layer 1 - Exact Match

Exact strings or regex patterns from a retired-form registry.

Safe for auto-fix when context matches.

### Layer 2 - Normalized Symbol Match

Normalize:

- Unicode and ASCII variants: `χ`, `chi`, `\chi`;
- `η`, `eta`;
- `Γ`, `Gamma`;
- `∏`, `product`, `prod`;
- `∇`, `grad`;
- whitespace;
- Markdown math delimiters;
- HTML entities;
- superscripts/subscripts.

Then compare normalized equation strings.

### Layer 3 - Equation Structure Match

Parse lightweight equation structure where possible:

- left-hand side;
- operators;
- variables;
- wrapper function;
- product vs ratio vs sum;
- derivative form;
- field/Lagrangian form.

This is where the tool should infer that:

```text
chi = C * product(G,M,E,S,T,K,R,Q,F)
```

is structurally close to:

```text
chi(X) = C_W[ product_i X_i ]
```

but not identical, because `C` inside/as multiplier is not necessarily the approved wrapper `C_W`.

### Layer 4 - Semantic Context Match

Look around the equation or claim for cue words:

- Master Equation;
- coherence function;
- ten laws;
- wrapper;
- veto;
- product form;
- ratio form;
- grace source;
- entropy term;
- retired;
- candidate;
- deferred;
- story form;
- public translation.

This helps decide whether the occurrence is canon, story, appendix, teaching layer, or raw fragment.

### Layer 5 - Embedding / LLM-Assisted Candidate Scoring

For fuzzy passages, optionally call an LLM or local embedding scorer.

The model must return structured JSON only:

```json
{
  "matchType": "old_master_equation_variant",
  "confidence": 0.0,
  "reason": "",
  "suggestedAction": "auto_fix | propose_patch | flag_only | ignore",
  "canonicalTarget": "tp:eq/master-equation/v3",
  "risk": "low | medium | high",
  "preserveAsHistorical": true
}
```

The LLM may classify and explain.
It must not directly rewrite files.

## Confidence Bands

Use score bands:

```text
0.95-1.00 auto-fix eligible if registry says safe
0.80-0.94 propose patch, require approval
0.60-0.79 flag as possible drift
0.00-0.59 ignore unless exact risky term appears
```

Also support a "semantic distance" or "points off" field:

```json
{
  "canonicalSimilarity": 0.82,
  "distancePoints": 18,
  "threshold": 20,
  "decision": "propose_patch"
}
```

Anything under the threshold can be allowed but flagged for later verification.

## Canon Registry

Build or scaffold registries in machine-readable files.

Minimum:

```text
canon/
  atoms/
    equations/
      master-equation.v3.json
    symbols/
      chi.json
      C_W.json
      eta.json
    definitions/
    claims/
    objections/
  retired/
    master-equation-retired-forms.json
  drift-rules/
    master-equation.rules.json
  autolink/
    canon_autolink_terms.json
```

Each retired equation form should include:

```json
{
  "id": "tp:eq/master-equation/retired/ratio-G-over-S",
  "pattern": "chi = G/S",
  "normalizedPattern": "chi=G/S",
  "status": "retired | narrative_only | deferred | candidate | superseded",
  "canonicalReplacement": "tp:eq/master-equation/v3",
  "safeAutoFix": false,
  "allowedContexts": ["story_draft", "historical_note", "raw_fragment"],
  "forbiddenContexts": ["canon_summary", "public_teaching_layer", "equation_registry"],
  "replacementText": "",
  "reviewNote": "Ratio form may remain as narrative discovery order, but must not be quoted as canonical form."
}
```

The current Master Equation atom should include:

```json
{
  "id": "tp:eq/master-equation/v3",
  "status": "current",
  "canonicalForm": "chi(X) = C_W[ product_i X_i ]",
  "dynamicForm": "dX/dt = W grad chi(X) + eta(X,t)",
  "variables": ["G", "M", "E", "S", "T", "K", "Q", "R", "F"],
  "wrapper": "C_W",
  "domain": "[0,1]^9",
  "rules": [
    "C_W is identity for now",
    "C_W is zero-preserving",
    "if any X_i = 0, chi = 0",
    "E means Electromagnetism/Truth; E = Energy is retired"
  ]
}
```

## Document Types

The engine must handle:

- Markdown `.md`;
- raw text `.txt`;
- HTML `.html`;
- JSON registry files;
- optional CSV inventories.

For HTML:

- parse DOM, do not regex across raw HTML unless in scan-only mode;
- preserve tags and attributes;
- update visible text/math blocks safely;
- detect stale equation images or alt text;
- flag MathJax/KaTeX script blocks separately;
- write a patch/diff, not silent overwrite.

For Markdown:

- preserve frontmatter;
- preserve exact fragment blocks unless explicitly allowed;
- preserve code fences unless scanning code is enabled;
- handle math blocks separately;
- detect transclusion pills like `[[eq:master-equation/canonical]]`.
- optionally insert canon pills such as `[[def:trinitarian]]`, `[[claim:law-1]]`, or rendered links after first mention.

## Canon Auto-Link / Pill System

Build an optional auto-link layer.

Purpose:

When registered canon terms appear in Markdown or HTML, the tool can add a clickable pill, tooltip, link, or transclusion tag back to the proof/definition atom.

Examples:

```markdown
Trinitarian [[def:trinitarian]]
Law 1 [[claim:law-1]]
Master Equation [[eq:master-equation/v3]]
Terminus Sui [[def:terminus-sui]]
```

For HTML output, render something like:

```html
<a class="canon-pill" href="/proof/claims/law-1" data-canon-id="tp:claim/law-1">Law 1</a>
```

Each canon auto-link term should include:

```json
{
  "term": "Trinitarian",
  "aliases": ["Trinity", "triadic", "three-personal"],
  "canonId": "tp:def/trinitarian",
  "targetURL": "/canon/definitions/trinitarian",
  "proofURL": "/proof/definitions/trinitarian",
  "display": "Trinitarian",
  "pillLabel": "def",
  "tooltip": "Approved Theophysics definition of Trinitarian structure.",
  "allowedContexts": ["public", "canon", "story_teaching_layer"],
  "blockedContexts": ["code", "raw_fragment", "quote"],
  "firstUseOnly": true,
  "caseSensitive": false,
  "requiresHumanApproval": false
}
```

The auto-linker must:

- avoid code fences;
- avoid quoted source passages unless explicitly enabled;
- avoid exact raw fragment locks unless explicitly enabled;
- avoid already-linked text;
- avoid headings if the page renderer creates its own anchors;
- link first use per page or section by default;
- support denylisted phrases;
- produce a dry-run report before applying.

The auto-linker should support these modes:

```bash
canon-drift autolink <path> --dry-run
canon-drift autolink <path> --apply --first-use section
canon-drift autolink <path> --html --dry-run
```

Reports should show:

```text
Term found
Canon ID
Target proof/definition URL
Context
Already linked?
Suggested pill/link
Risk
Needs approval?
```

This matters because canon terms should not merely appear in documents. They should click backward into proof, definition, source, and status.

## No-Loss Rules

Never delete:

- raw fragments;
- exact fragment blocks;
- historical notes;
- character dialogue;
- intentionally retired examples.

Instead, mark them:

```markdown
> [!canon-note]
> This is a historical/narrative form of the Master Equation. Current canonical form: [[eq:master-equation/v3]].
```

Only replace directly when:

- the document context is canon/public teaching;
- the match is high confidence;
- the retired registry marks the replacement as safe.

## Output Modes

Build these modes:

```bash
canon-drift scan <path>
canon-drift report <path>
canon-drift fix <path> --dry-run
canon-drift fix <path> --apply --threshold 0.95
canon-drift html-scan <path>
canon-drift weekly <path> --markdown --html --json-report
```

Minimum reports:

```text
Current
Stale
Conflicting
Missing definition
Needs human ruling
Emoji / mojibake
HTML render drift
Exact fragment protected
```

Each finding should include:

```json
{
  "file": "",
  "line": 0,
  "column": 0,
  "contextType": "canon | public | story | raw_fragment | html | code | unknown",
  "findingType": "retired_equation | stale_definition | symbol_conflict | emoji | mojibake | html_render_drift",
  "matchedText": "",
  "canonicalTarget": "",
  "confidence": 0.0,
  "distancePoints": 0,
  "suggestedAction": "",
  "proposedPatch": "",
  "requiresHumanRuling": true
}
```

## Weekly Run Behavior

Weekly maintenance should:

1. scan Markdown, text, HTML, and registry files;
2. normalize encoding and detect mojibake/emoji;
3. detect retired Master Equation forms;
4. detect stale symbols and variable definitions;
5. detect public pages not using current canon pills;
6. generate JSON + Markdown reports;
7. generate patch files for safe changes;
8. never apply medium/high-risk changes without approval.

## Build Requirements

Use the existing repo's language and tooling if obvious.

If building from scratch, prefer Python because:

- Markdown/text scanning is straightforward;
- HTML can use BeautifulSoup or lxml;
- JSON reports are easy;
- later embedding/LLM scoring can be plugged in behind an interface.

Recommended structure:

```text
tools/canon_drift/
  canon_drift/
    __init__.py
    cli.py
    registry.py
    normalize.py
    scan_markdown.py
    scan_html.py
    score.py
    patches.py
    reports.py
  registries/
    master_equation.v3.json
    master_equation_retired_forms.json
    symbol_registry.json
  tests/
    test_master_equation_detection.py
    test_markdown_protection.py
    test_html_scan.py
```

## First Deliverable

Implement the smallest useful version:

1. registry for current Master Equation v3;
2. registry for retired/old Master Equation forms;
3. Markdown scanner;
4. HTML scanner;
5. mojibake/emoji detector;
6. confidence scoring;
7. dry-run JSON report;
8. dry-run Markdown report;
9. patch proposal generation;
10. tests with at least 10 old equation variants.

Do not mass-edit the repository on the first run.

Run it on a small target folder first, such as:

```text
C:\theophysics\_CANONICAL_STRIPPED_OUT_REVIEW_2026-07-26\Stories\[TX_A6.9] DUALITY_PROJECT
```

Then report:

- how many files scanned;
- how many stale Master Equation candidates found;
- how many are safe exact replacements;
- how many require human ruling;
- how many are protected raw/story fragments;
- how many emoji/mojibake issues were found;
- how many HTML pages need canon drift review.

## Most Important Guardrail

This tool must make uncertainty visible.

If it cannot infer the meaning confidently, it should not rewrite.
It should score, flag, explain, and wait for David's ruling.

The win is not automatic rewriting.
The win is turning invisible canon drift into a visible, scored maintenance queue.
