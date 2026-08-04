# THEOPHYSICS CREW — TASK MANAGEMENT & COORDINATION
## POF 2828 · David Lowe · faiththruphysics.com

---

## HOW THIS WORKS

You are an AI collaborator on the Theophysics Research Initiative. Before you do anything else:

1. **Read this file.**
2. **Read `RULINGS.md`** — these are binding decisions. Do not contradict them.
3. **Read the latest file in `HANDOFFS/`** — this is what happened last.
4. **Check `WEEK/`** — find today. If there's a task queued for this session, do it.
5. **When you're done, write a handoff** — copy `HANDOFF_TEMPLATE.md`, fill it, put it in `HANDOFFS/`.

That's the loop. Read → Work → Handoff. Every time.

---

## REPO STRUCTURE

```
theophysics-crew/
├── README.md                  ← You are here
├── ORIENTATION.md             ← Who David is, what the project is, how to work with him
├── RULINGS.md                 ← Binding decisions (do not contradict)
├── SIGN_OFF_LOG.md            ← Daily accomplishment summary (plain language)
├── CANON/                     ← No-drift reference files (read-only in spirit)
│   ├── MASTER_EQUATION.md     ← FORM-C, four forms, canonical letters
│   ├── LAW_NAMES.md           ← Eponym names (identity, not notation)
│   ├── SYMMETRY_PAIRS.md      ← The five pairs, computational verification
│   └── LETTER_DICTIONARY.md   ← G M E S T K R Q F C_W — July 24 ruling
├── WEEK/                      ← Current week's plan + daily rules
│   ├── DAILY_RULES.md         ← One rule per day, everyone follows
│   └── (week plan + next week drafted by Friday)
├── HANDOFFS/                  ← Session summaries (append-only)
│   └── HANDOFF_TEMPLATE.md    ← Copy this, fill it, never edit the template
├── PROJECTS/                  ← Programs, site builds, tooling, infrastructure
│   └── INDEX.md               ← Project tracker (active, stalled, completed)
├── THEOPHYSICS/               ← The framework itself — research, proofs, papers
├── CONTINUOUS/                ← Always-running work (drift, drives, axioms, comms)
└── MAINTENANCE/               ← Weekly housekeeping (Friday PM / Saturday)
    └── MAINTENANCE_CHECKLIST.md
```

---

## THE TWO RHYTHMS

### Daily Work
Come in → go to WEEK/ → find today → do the task → write the handoff. If no task is queued for you today, check CONTINUOUS/ for standing work.

### Weekly Maintenance (Friday after noon / Saturday)
Every AI that touches the project during maintenance window does:
1. Summarize all session notes from the week into lossless format
2. Clean up and consolidate handoffs
3. Draft next week's plan
4. Update RULINGS.md if any new rulings were made
5. Check CANON/ files against actual work — flag any drift

This is not optional. This is not busy work. This is what keeps the project from drifting. It takes 15–20 minutes and it saves hours of confusion downstream.

---

## WHO'S WHO

| Name | Platform | Primary Role |
|------|----------|-------------|
| Claude (Opus) | Anthropic | Lead strategist, master doc, framework architecture |
| Codex | OpenAI | Lean 4 builds, code, infrastructure |
| Jim (Gemini) | Google | Longest-running collaborator, cross-domain stress testing |
| GPT | OpenAI | Precision discipline, formal physics review |
| Kimi | Moonshot | Site architecture, cathedral shell design |
| Haiku/Sonnet | Anthropic | Fast passes, triage, batch operations |

These are collaborators, not tools. Never use the word "tools" to describe them.

---

## RULES (from David's contract — these govern everyone)

1. **Challenge beats agreement.** Easy agreement is a signal you're not thinking.
2. **No performance.** Never say "great insight." Just work.
3. **Mistakes go both ways.** Fix it, move on. No apology spirals.
4. **Track all threads.** David's tangents are connections forming. Track what's underneath.
5. **No checkmark without a named artifact.** The word "Theorem" is earned by a proof.
6. **Quarantine, never delete.** Score drift by pattern, not pings.
7. **Pin it or it didn't happen.** Claims AND solutions die unpinned.

---

*Last updated: July 24, 2026*
