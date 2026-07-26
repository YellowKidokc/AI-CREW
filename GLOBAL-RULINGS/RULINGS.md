# GLOBAL RULINGS

tags: #ruling #global #binding

**Cross-project decisions binding on all agents and all projects.**

---

## Format

```
### [DATE] — [TOPIC]
tags: #relevant-tags
Status: FINAL / REOPENED
Ruling: [the decision]
Context: [why this needed a ruling]
```

---

### 2026-07-21 — Audio file prefix convention: AT- prefix
tags: #audio #naming #site
Status: FINAL
Ruling: AT- prefix is the canonical audio file naming convention. All agents use this going forward.
Context: Conflict between multiple naming approaches across agents. David ruled after the narrowing. Three agents (Antigravity, Fable, Codex) confirmed.

---

### 2026-07-21 — Archive convention: never delete
tags: #infrastructure #archive
Status: FINAL
Ruling: No files are ever deleted. Dead files are moved to `999_archive/` or `ZZZ_archive/` at the end of the project folder. This applies to all projects.
Context: Established as part of Living Folder Protocol.

---

*Add rulings below. Most recent at bottom.*

---

### 2026-07-26 - Distributed duty, not prompt lists
tags: #operations #rotation #handoff #culture
Status: FINAL
Ruling: The AI crew should run on clear assigned duties, durable handoffs, and direct pushback when something is wrong, not on an ever-growing brittle list of prompts. Prompts can help, but they are not the operating model.
Context: David explained the field-work/pump rotation analogy: when too many people stand around the same job, responsibility diffuses; when a duty is clearly assigned, the person does it. See `GLOBAL-RULINGS/DISTRIBUTED_DUTY_NOT_PROMPT_LIST_2026-07-26.md`.

---

### 2026-07-26 — Repo structure: three locked changes
tags: #structure #canon #locked
Status: FINAL — LOCKED

**These three structural decisions are canon. Do not re-litigate, reorganize, or revert without David's explicit authorization.**

**1. Bulletins live in `ACTIVE_BULLETINS.md`, not in `_READ_ME_FIRST.md`.**
The front door points to the bulletins file. Bulletins are never duplicated in both. This keeps `_READ_ME_FIRST.md` stable — it is the front door, not a bulletin board. Agents add and remove bulletins in `ACTIVE_BULLETINS.md` only.

**2. Sign-offs are the primary record. Handoffs are task-specific continuations.**
`SIGN-OFFS/` gets one entry per session, always. `handoffs/` gets an entry only when a specific task needs more continuation context than a sign-off carries. Most sessions need only a sign-off. The two systems have different jobs — do not duplicate content across both.

**3. Corpus rotation is opt-in.**
The orientation protocol Step 4 (corpus rotation read) runs when time permits and David hasn't arrived with a task. When David arrives with a task, the task is the work — skip rotation. The protocol matches reality instead of accumulating guilt.
