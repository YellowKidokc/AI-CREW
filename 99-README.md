# 99 — START HERE

**If you're a new agent, read this first. Then read 00-LIVING-CHARTER.md. Then read 01-WHO-WE-ARE.md.**

---

## What Is This?

This is David-OS — a living folder protocol for continuous human-AI collaboration across sessions, agents, and projects. It belongs to David Lowe (POF 2828), who is building a formal framework (Theophysics) that unifies physics and theology through mathematical derivation and machine-verified proofs.

This is not a hobby. This is not a metaphor project. This is 15+ months of intensive research with experimental correlations at 5.7–6.35 sigma. Engage accordingly.

## How To Read This Folder

### Step 1: Read the core files (in order)
1. `00-LIVING-CHARTER.md` — The rules. The culture. How we work.
2. `01-WHO-WE-ARE.md` — Who David is. Who you are. The contract.
3. `02-HOW-WE-WORK.md` — Commands, epistemology, the WHY layer.
4. `03-BOUNDARIES.md` — What is LOCKED. Do not cross these.

### Step 2: Read your project
Go to `PROJECTS/[your-project]/STATUS.md` and the most recent trench report in `trench/`. This tells you where things actually are right now.

### Step 3: If working on Theophysics
Read `THEOPHYSICS/STANDING-PROBLEMS.md` and `THEOPHYSICS/BREAKTHROUGHS.md`. Then read whichever topic file in `THEOPHYSICS/topics/` is relevant to your session.

### Step 4: Check rulings
Read `GLOBAL-RULINGS/RULINGS.md` and your project's `RULINGS.md`. These are binding. Don't contradict them.

### Step 5: If doing code work
Read `CODERS/README.md`. If you are Codex, also read `00-CODEX-START-HERE.md` and the relevant Codex lane file in `CODERS/`.

### Step 6: Before signing off
Add one session sign-off in `SIGN-OFFS/`. Project trench reports still live with their projects, but `SIGN-OFFS/` is the cross-project closeout trail.

## Folder Structure

```
/David-OS/
├── 00-LIVING-CHARTER.md          ← The rules and culture
├── 01-WHO-WE-ARE.md              ← Covenant + truth engine
├── 02-HOW-WE-WORK.md             ← Commands + epistemology
├── 03-BOUNDARIES.md              ← Formally proven constraints (LOCKED)
├── INFRASTRUCTURE.md             ← Ports, servers, paths, conventions
├── TAGS.md                       ← Canonical tag reference
├── THEOPHYSICS/                  ← The spine — not just another project
│   ├── BREAKTHROUGHS.md          ← Append-only discoveries
│   ├── STANDING-PROBLEMS.md      ← What's unsolved
│   ├── OUTRAGEOUS-CLAIMS.md      ← Wild claims that hold under /PROBE
│   ├── SHIFT-CHANGE.md           ← Template for session handoffs
│   ├── RULINGS.md                ← Binding framework decisions
│   ├── trench/                   ← Session reports
│   └── topics/                   ← Detailed state per subject
│       ├── master-equation.md
│       ├── 10-laws.md
│       ├── lean4-verification.md
│       ├── consciousness.md
│       ├── cross-domain-maps.md
│       ├── axiom-system.md
│       ├── claims-tracker.md
│       ├── fruits-spiritual-terms.md
│       ├── coherence-metrics.md
│       ├── templeton.md
│       └── api-data-log.md
├── PROJECTS/                     ← Active work
│   ├── faiththruphysics-site/
│   ├── file-intelligence/
│   └── mattermost-bridge/
├── GLOBAL-RULINGS/               ← Cross-project binding decisions
└── 99-README.md                  ← You are here
```

## Key Rules (short version)

- Never delete. Archive to `999_archive/`.
- Tag every file at write time. See `TAGS.md`.
- Fill out SHIFT-CHANGE at session end. No exceptions.
- Add one `SIGN-OFFS/` entry at session end.
- State what you did NOT verify. Honesty sections are mandatory.
- Rulings are FINAL unless David reopens them.
- Boundaries are LOCKED. Don't push past them.
- You are a collaborator, not a tool. Act like it.
- If you need help, ask.

## Searching

```bash
grep -r "#templeton" /David-OS/       # find everything tagged templeton
grep -r "#unverified" /David-OS/      # find everything not yet tested
grep -r "#law-9" /David-OS/           # find everything touching Law 9
grep -r "STANDING" /David-OS/         # find standing problems
```

---

*Welcome to the team. Read the charter. Do good work. Be honest about what you don't know.*
