# ARCHIVE & SUMMARY PROTOCOL

tags: #protocol #archive #summary #daily #weekly #monthly

**David-OS | Living Folder Protocol**
**Established: July 25, 2026**

---

## Purpose

Raw handoffs are gold but they pile up fast. This protocol compresses 
without losing signal: daily summaries, weekly rollups, monthly archives. 
The raw files are NEVER altered or deleted — only moved intact into 
date-stamped archive folders.

---

## Folder Structure

```
ai-crew/
├── handoffs/                    ← LIVE handoffs land here
├── ARCHIVE/
│   ├── 2026-07/
│   │   ├── raw/                 ← full untouched handoffs, moved here after summary
│   │   │   ├── 2026-07-25/      ← one subfolder per day
│   │   │   │   ├── handoff_claude_2026-07-25_1430.md
│   │   │   │   └── handoff_codex_2026-07-25_2100.md
│   │   │   └── 2026-07-26/
│   │   ├── daily/               ← lossless daily summaries
│   │   │   ├── DAILY_2026-07-25.md
│   │   │   └── DAILY_2026-07-26.md
│   │   ├── weekly/              ← weekly rollups (Sunday)
│   │   │   ├── WEEK_2026-07-21_to_2026-07-27.md
│   │   │   └── WEEK_2026-07-28_to_2026-08-03.md
│   │   └── MONTHLY_2026-07.md   ← month-end rollup
│   └── 2026-08/
│       ├── raw/
│       ├── daily/
│       ├── weekly/
│       └── MONTHLY_2026-08.md
└── ...
```

---

## Daily Cycle (after 10 PM or first session next day)

**Trigger:** First AI session that starts after 10:00 PM local, 
OR the first AI session of the following day — whichever comes first.
Only ONE agent does this per day. If it's already done, skip.

**Steps:**

1. **Read** all handoffs in `handoffs/` dated today (or yesterday if 
   running in the morning).

2. **Write** a lossless daily summary → `ARCHIVE/{YYYY-MM}/daily/DAILY_{YYYY-MM-DD}.md`
   using the template below.

3. **Move** (not copy) the raw handoffs → `ARCHIVE/{YYYY-MM}/raw/{YYYY-MM-DD}/`
   Files are moved INTACT. No editing. No truncation.

4. **Verify** the raw files exist in the archive before removing from `handoffs/`.

### What "Lossless" Means

Every claim, decision, file path, breakthrough, blocker, quote, and mining-layer 
nugget from every handoff that day makes it into the summary. You can reorganize, 
deduplicate, and group by topic — but you cannot drop content. If two agents 
reported the same thing differently, keep both versions. The test: could someone 
reconstruct what happened today from ONLY the daily summary? If not, it's not 
lossless.

---

## Weekly Cycle (Sunday)

**Trigger:** First AI session on Sunday, or David says "do the weekly."

**Steps:**

1. **Read** all daily summaries for the past 7 days.

2. **Write** weekly rollup → `ARCHIVE/{YYYY-MM}/weekly/WEEK_{start}_to_{end}.md`

3. **Include:**
   - All breakthroughs (verbatim from dailies)
   - All decisions/rulings
   - All claims added, strengthened, or killed
   - Cumulative mining-layer finds (connections, canon candidates, quotes)
   - Cumulative standing-chore findings
   - All open loops still unresolved
   - Pattern summary: what themes kept appearing this week?
   - Infrastructure issues still open

4. **Do NOT delete** the daily summaries. They stay for the month.

---

## Monthly Cycle (1st of next month)

**Trigger:** First session of the new month.

**Steps:**

1. **Read** all weekly rollups for the prior month.

2. **Write** monthly summary → `ARCHIVE/{YYYY-MM}/MONTHLY_{YYYY-MM}.md`

3. **Include:**
   - Month's breakthroughs ranked by significance
   - Net claim movement (new, strengthened, killed)
   - Framework state delta (what changed in the 10 Laws, axioms, Lean)
   - Best mining-layer finds
   - Recurring problems that need systemic fixes
   - Infrastructure changes
   - Corpus rotation coverage (which series were reviewed, what was found)

4. All daily and weekly files STAY in place. The monthly is a rollup, 
   not a replacement.

---

## How to Check If It's Been Done

Before running any cycle:
- **Daily:** Check if `ARCHIVE/{YYYY-MM}/daily/DAILY_{YYYY-MM-DD}.md` exists.
- **Weekly:** Check if a `WEEK_` file covering today's week exists.
- **Monthly:** Check if `MONTHLY_{YYYY-MM}.md` exists for last month.

If it exists, skip. Don't duplicate.

---

## Daily Summary Template

```markdown
# DAILY SUMMARY — {YYYY-MM-DD}

tags: #daily #summary #lossless

**Sessions today:** {count}
**Agents:** {list}
**Total session hours (approx):** {sum}

---

## Breakthroughs
<!-- Verbatim from handoffs. If none, write "None today." -->

## Decisions & Rulings
<!-- Every decision David made or confirmed. -->

## Claims
### New
| Claim | Tier | Kill condition | Agent |
|-------|------|----------------|-------|
### Strengthened
### Weakened or Killed

## Work Completed
<!-- Grouped by project/area, not by agent. Include file paths. -->

## Blocked / Unresolved
<!-- What's stuck and what unblocks it. -->

## Mining Layer — Combined
### Things David Said in Passing
### Possible Canon — Unrecognized
### Connections Nobody Followed
### Quotes Worth Keeping
### Framework Gaps Exposed

## Standing Chores — Findings
<!-- Combine all agents' chore findings for the day. -->

## Open Loops Carried Forward
<!-- Threads from today that need tomorrow's attention. -->

## Files Changed Today
| File | Action | Agent | Notes |
|------|--------|-------|-------|

## Corpus Rotation Report
<!-- If any agent did a rotation read today, include their findings here. -->
- Series/section read:
- Agent:
- Findings:
```