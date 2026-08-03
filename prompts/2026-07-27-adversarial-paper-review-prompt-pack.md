# Adversarial Paper Review Prompt Pack

tags: #prompts #paper-review #adversarial #probe #east #blindspot #theophysics

**Purpose:** A set of API-call prompts designed to expose a paper's weakest points so thoroughly that the author has no choice but to rewrite or patch.

**Workflow:** Run **per page**, then **per series**.

---

## Pass 1 — Per-page probes

Run these on each individual page/article before looking at the series as a whole.

### 1.1 Page claim audit
```
For this page:
- List every sentence that functions as a claim (not illustration, transition, or summary).
- For each claim, identify its claim class: definition, theorem, interpretation, application, testimony, pastoral, textual, etc.
- Does the page give the claim its required support before the next heading?
Return: any claim that is load-bearing but unsupported, with the exact sentence.
```

### 1.2 Page falsification
```
For each claim on this page, state the cheapest observation, experiment, or counter-argument that could kill it.
Then ask: is the kill condition concrete enough that a critic could actually use it?
Return: the claim with the strongest wording and the weakest kill condition.
```

### 1.3 Page scope check
```
Find every generalization on this page that is not earned by the evidence shown on this page.
Look for: "we," "always," "necessarily," "must," "proves," "shows that," "it follows."
Return: each overreach with the exact sentence and the missing intermediate step.
```

### 1.4 Page clarity
```
This page must reach its declared audience level.
For each technical term or formal move:
- Is it defined on this page or linked to a definition?
- Does the plain-language restatement preserve the meaning, or only sound right?
Return: the first three places where the plain version is vague, misleading, or absent.
```

### 1.5 Page structure
```
This page should contain, in some order: claim → support → objection → response → application → boundary.
Which slot is missing? Which is present but only rhetorical? Which is over-represented?
Return: the missing or underdeveloped slot that most weakens this page.
```

---

## Pass 2 — Per-series probes

Run these after you have page-level outputs. They catch cross-page drift and series-level incoherence.

### 2.1 Cross-page consistency
```
Across all pages in this series:
- Do any claims contradict each other?
- Do later pages assume claims that earlier pages only established as draft/proposed?
- Does the same term mean the same thing on every page?
Return: contradictions, dependency inversions, and term drift.
```

### 2.2 Series narrative arc
```
Treat the series as a single argument.
- Does the first page establish the problem the reader actually has?
- Does each page hand off a clear next question to the next page?
- Does the last page deliver the promised payoff?
Return: where the arc breaks, sags, or promises something it never pays off.
```

### 2.3 Bridge-grade consistency
```
For every cross-domain link in the series:
- Is the bridge grade the same across pages? (identity, isomorphism, analogy, metaphor)
- Does the grade match the confidence language used to describe it?
Return: any place where a bridge is sold harder than its grade allows.
```

### 2.4 Falsification propagation
```
If the weakest claim on each page were falsified, which downstream pages would be damaged?
Trace the failure through the series.
Return: the page whose collapse would break the most other pages, and what should be done about it.
```

### 2.5 Series blind spot
```
What assumption is shared across every page in this series but never defended?
What alternative framework would make the whole series look different?
Return: the unquestioned assumption and how it infects the series conclusion.
```

### 2.6 Series rewrite-or-patch
```
You have all page-level and series-level findings.
Can the series be fixed by patching individual pages, or is there a structural problem that requires reordering, adding a page, or rewriting the series thesis?
Return: the decision (patch vs. rewrite), the highest-priority fix, and the page that has to change first.
```

---

## Recommended running order

1. **Page level:** run 1.1, 1.2, 1.5 on every page first. They are cheap and catch the most common failures.
2. **Page level:** run 1.3 and 1.4 on pages that survive the first pass.
3. **Series level:** run 2.1, 2.2, 2.4 across the full series.
4. **Series level:** run 2.3 and 2.5.
5. **Final:** run 2.6 to decide whether to patch or rewrite.

---

## Mapping to ai-crew commands

| Probe | Command |
|---|---|
| 1.2, 2.4 | /PROBE |
| 1.5, 2.1, 2.3 | /CHAIN |
| 2.5 | /BLINDSPOT |
| 2.6 | /EAST applied to the whole series; final patch/rewrite verdict |
| 1.4, 2.2 | /CONNECT / descent check |

---

## Output discipline

Every probe should return:
- The exact sentence or passage in question.
- The named failure mode.
- The minimum fix required.
- Whether the fix is a patch or forces a rewrite.

*No generic praise. No hedging. If the paper survives, say exactly what should break it but does not.*
