# EVIDENCE MINING PROTOCOL
## Reusable Prompt for N AIs Against the Theophysics Corpus
### POF 2828 | August 4, 2026 | Authored: David Lowe + Claude Opus 4.6

---

## PURPOSE

You are being assigned a section of the Theophysics corpus. Your job is to mine it for **evidence** — passages, derivations, arguments, data points, citations, and structural claims that support (or challenge) the claims in the framework. Everything you find goes into a standardized evidence card. The cards accumulate into a shared argument repository.

This prompt works with 1 AI or 20. The division rule is simple.

---

## DIVISION RULE

The canonical corpus lives at:
```
\\192.168.2.50\h_hp\Downloads\CANONICAL_CONSOLIDATED_ALL
```

There are 21 consolidated papers (CONSOLIDATED_00 through CONSOLIDATED_21, skipping 19).

**If you are the ONLY AI:** Start at 00, work down. Do as many as you can.

**If there are 2 AIs:**
- AI-1: Papers 00–10 (top down)
- AI-2: Papers 21–11 (bottom up)
- You meet in the middle. If there's a remainder, the AI who finishes first picks it up.

**If there are 3 AIs:**
- AI-1: Papers 00–06
- AI-2: Papers 07–13
- AI-3: Papers 14–21

**If there are 4+ AIs:** Divide 21 by N, round up, assign sequentially. Remainder goes to whoever finishes first.

**ADDITIONAL SOURCE LOCATIONS** (assign to specific AIs as David directs):
- `O:\_Theophysics_v5\` — Main Obsidian vault (deepest content)
- `O:\` — Everything around the vault (supporting material)
- `Z:\` or other drives — As directed by David

---

## WHAT YOU'RE MINING FOR

### Primary Target: Evidence for the 24-Property Thesis
For each property in the list below, find any passage in your assigned papers that provides:
- A derivation or proof that physics requires this property
- A formal argument connecting this property to a divine attribute
- A scriptural or patristic citation grounding this property
- An experimental result or data point supporting this property
- A rival explanation and why it fails (or succeeds — be honest)

### Secondary Target: Any Strong Argument
If you find a passage that makes a strong structural claim — even if it doesn't map to the 24 properties — card it anyway. Tag it UNCATEGORIZED. David will sort it later.

### Tertiary Target: Six-Year-Old Protocol Check
For any argument you card, ask: could this be explained to a smart six-year-old? If yes, note the plain-language version. If no, note what makes it untranslatable. This is the Playground Protocol — translatability is a quality signal.

---

## THE 24 PROPERTIES (reference list)

1. Necessary  2. Eternal  3. Immutable  4. Simple  5. Consistent
6. Universal  7. Immaterial  8. Foundational  9. Self-Existent  10. Infinite
11. Perfect  12. True  13. Rational  14. Order-Giving  15. Law-Giving
16. Intelligible  17. Necessary for Knowledge  18. Invariant  19. Non-Local
20. Transcendent  21. Objective  22. Unified  23. Generative  24. Judging

---

## EVIDENCE CARD FORMAT

For every piece of evidence you find, output a card in this format:

```
## EVIDENCE CARD
- **ID:** [your-AI-name]-[paper-number]-[card-number] (e.g., CLAUDE-07-003)
- **Source Paper:** CONSOLIDATED_XX title
- **Source Location:** Section name, approximate position
- **Quote/Summary:** [exact quote if short, summary if long]
- **Supports Property #:** [number(s)] or UNCATEGORIZED
- **Claim Level:** HARD_REQUIREMENT | PHILOSOPHICAL_BRIDGE | THEOLOGICAL_READING | ANALOGY
- **Strength:** 1-5 (5 = airtight, 1 = suggestive only)
- **Rival Explanation:** [best counterargument in one sentence]
- **Six-Year-Old Version:** [plain language or "untranslatable: reason"]
- **Notes:** [anything else — connections to other properties, flags, questions]
```

---

## OUTPUT

When you finish your assigned papers, produce:
1. **All evidence cards** in order
2. **A summary:** how many cards total, strongest finds, biggest gaps (properties with NO evidence)
3. **Recommendations:** what needs more research, what's already airtight, what's overclaimed

Save your output to:
```
\\192.168.2.50\h_hp\Desktop\ai-crew\EVIDENCE_MINE\[YOUR-AI-NAME]_EVIDENCE_CARDS.md
```

If you can't write to that path, hand the output to David and he'll place it.

---

## RULES

1. **Do not editorialize.** Card what's there. Your opinion goes in Notes, not in the quote.
2. **Do not inflate.** If evidence is weak, rate it weak. A honest 2 is worth more than a generous 4.
3. **Do not skip hard cases.** If a passage CHALLENGES one of the 24 properties, card it with a note. David wants to know where the walls are thin.
4. **Cite precisely.** Section name, not "somewhere in the paper."
5. **Card everything that moves.** Over-card rather than under-card. David will triage. Your job is to find, not to filter.

---

## AFTER ALL AIS FINISH

David collects all card files into EVIDENCE_MINE. Then:
1. Merge and deduplicate
2. Sort by property number
3. Identify gaps (properties with < 3 cards)
4. Run targeted research on gaps
5. Build the argument repository: one file per property, all evidence stacked

This repository becomes the permanent backing store for every claim in the framework.

---

*"We say what we want to say. Then we back it up." — David Lowe*
