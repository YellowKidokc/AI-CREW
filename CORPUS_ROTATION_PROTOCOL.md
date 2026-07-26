# CORPUS ROTATION PROTOCOL

tags: #protocol #orientation #rotation #corpus-review #stress-test

**David-OS | Living Folder Protocol**
**Established: July 25, 2026**

---

## Purpose

The best feedback David ever got was when every AI read the same material 
and independently reported back what was broken. This protocol replicates 
that — permanently. Every incoming AI session gets assigned a section of 
the corpus to read and report on. The assignment rotates every 2-3 days 
so the entire body of work gets stress-tested on a continuous cycle.

This is NOT busy work. This is the immune system.

---

## The Crew Analogy (David's Rule)

This is not "everybody go watch every pump every night." That's how you 
get a whole crew sitting around watching nothing. Instead: you get one 
night a week. That one night might be hard, but the rest of the time 
you don't have to think about it. Assigned, scheduled, accountable.

Nobody likes being assigned stuff — it holds you responsible. That's the 
point. Vague expectations produce vague results. One clear assignment 
per rotation period, one clear report, done.

---

## How It Works

1. **On session start,** check `ROTATION_STATE.md` (this folder) for the 
   current assignment.

2. **Read the assigned section.** Not skim — read. 5-10 files minimum, 
   more if they're short.

3. **File a rotation report** in your handoff (Section 3.1 Corpus Scan 
   or the dedicated corpus rotation section). Include:
   - What you read (file paths)
   - What's broken, inconsistent, or confusing
   - What's surprisingly good (canon-quality but unfiled)
   - What conflicts with canonical docs
   - What's duplicated
   - What's missing that should exist
   - Voice/tone issues
   - Dead links or references

4. **Do NOT fix things during the rotation read** unless David asks. 
   Report only. The value is the fresh-eyes audit, not the patch.

---

## Rotation Schedule

Each assignment stays active for 2-3 days (roughly 4-8 sessions), 
then advances to the next. The summarizer (daily/weekly cycle) 
advances the pointer in ROTATION_STATE.md.

### Slot List (full corpus rotation)

| Slot | Location | What To Look For |
|------|----------|-----------------|
| R-01 | ai-crew core docs (00-LIVING-CHARTER through 03-BOUNDARIES) | Do they still match reality? Are the rules being followed? Contradictions between docs? |
| R-02 | THEOPHYSICS/CANON/ (no-drift docs, the-one-variable) | Drift from July 24 rulings? Letter conflicts? Law naming? |
| R-03 | THEOPHYSICS/topics/ (master-equation, 10-laws) | Current? Consistent with CANON? Missing updates? |
| R-04 | THEOPHYSICS/topics/ (lean4, axiom-system, claims-tracker) | Lean status accurate? Axiom counts match? Claims current? |
| R-05 | THEOPHYSICS/topics/ (consciousness, cross-domain, coherence, temporal) | Stale? Missing connections to recent breakthroughs? |
| R-06 | D:\GTQ-BUILD\articles\ 01-05 | HTML structure, asset presence, topbar, voice, accuracy |
| R-07 | D:\GTQ-BUILD\articles\ 06-10 | Same as above |
| R-08 | D:\GTQ-BUILD\articles\ 11-15 | Same as above |
| R-09 | D:\GTQ-BUILD\articles\ 16-20 | Same as above |
| R-10 | D:\GTQ-BUILD\articles\ 21-26 | Same as above |
| R-11 | D:\SubStack\Convergence\ | Voice, accuracy, series continuity |
| R-12 | C:\theophysics\CANONICAL\ root layer (00_GOD through 04_TEN_LAWS) | Structure match v11 spec? Files in right places? |
| R-13 | C:\theophysics\CANONICAL\ domain folders | Populated? Template followed? 14-stage arc present? |
| R-14 | H:\00_Canonical_PRODUCTION_v1.0\ | Still relevant? Superseded by C:\theophysics\CANONICAL? |
| R-15 | D:\DONT TOUCH HTML\_best_html\ | Still best? Match current canonical structure? |
| R-16 | Z:\ root (vault — first 20 files alphabetically) | Gold buried? Duplicates? Outdated drafts? |
| R-17 | Z:\ vault — next 20 files | Same |
| R-18 | Z:\ vault — framework and axiom subdirs | Consistent with canonical axiom system? |
| R-19 | PROJECTS/ status files + registry | Current? Repos exist? Paths resolve? |
| R-20 | SIGN-OFFS/ + handoffs/ + ARCHIVE/ | Protocol being followed? Gaps? |
| R-21 | CODERS/ + GLOBAL-RULINGS/ | Lane files current? Rulings complete? |
| R-22 | D:\GTQ-BUILD\templates\ + tools\ + workflows\ | Working? Documented? Match current build process? |
| R-23 | INFRASTRUCTURE.md + all referenced paths | Paths resolve? Services up? Ports correct? |
| R-24 | O:\_Theophysics_v5\ (whatever's accessible — sample 10 files) | State of the old vault? Anything not migrated? |
| R-25 | D:\md\ (sample 10-15 files from different depths) | Categorizable? Duplicated elsewhere? Canon quality? |

Full cycle: ~25 slots × 2.5 days = ~62 days. Two months to sweep everything. 
Then it starts over — and the second pass catches what changed.

---

## Rotation State File

See `ROTATION_STATE.md` in this folder. It tracks:
- Current slot
- Date activated
- Sessions completed on this slot
- Agents who reported
- Date to advance

The daily summarizer advances the slot when the day count expires.