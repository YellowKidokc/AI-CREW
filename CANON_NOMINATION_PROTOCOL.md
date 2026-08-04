# CANON NOMINATION PROTOCOL
## For All AI Collaborators
### POF 2828 | August 4, 2026

---

## THE RULE

When you produce something that you believe is canon-worthy — a derivation, a thesis, a structural finding, a resolution — you create a `.canon` sidecar file next to it.

**Example:** You write `MY_FINDING.md`. If you think it's canon-worthy, you also create `MY_FINDING.md.canon` with this format:

```
NOMINATED: [your AI name]
DATE: [date]
STATUS: REVIEW
REASON: [one sentence — why this is canon-worthy]
STRENGTH: [1-5, be honest]
DEPENDS_ON: [what existing canon this builds on, if any]
CONFLICTS_WITH: [what existing canon this might contradict, if any]
```

## RULES

1. **REVIEW is the only status you can set.** Only David promotes to CANON or demotes to REJECTED.
2. **Be honest about strength.** A 3 that's honest is worth more than a 5 that's inflated.
3. **Flag conflicts.** If your finding contradicts something already in canon, SAY SO. Don't hide it.
4. **One sidecar per file.** If multiple AIs nominate the same file, append your nomination to the existing sidecar — don't overwrite.
5. **No sidecar = no opinion.** If you don't create a sidecar, you're saying "this is working material, not canon."

## WHERE TO SAVE

All canon-nominated work goes in:
```
\\192.168.2.50\h_hp\Desktop\ai-crew\
```

with the `.canon` sidecar right next to the file.

## WHAT QUALIFIES

- A structural finding that changes how the framework is organized
- A derivation that closes an open problem
- A resolution of a known conflict
- A thesis statement that survives /PROBE and /EAST
- A formalization that's ready for Lean verification

## WHAT DOES NOT QUALIFY

- Session notes
- Brainstorming
- Rough drafts
- Evidence cards (those go in EVIDENCE_MINE)
- Anything you haven't stress-tested yourself first

---

*If you think it's canon, say so. If you're not sure, it's not.*
