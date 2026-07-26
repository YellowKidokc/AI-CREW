# PROMPT: API Pipeline — Full 13-Stage Paper Audit (EXISTING)

tags: #prompt #api #pipeline #existing #reference

**THIS PIPELINE ALREADY EXISTS.** Do not rebuild it.

**Location:** `C:\theophysics\CANONICAL\_scripts\API_PIPELINE\`
**Export copy:** `\\192.168.2.50\Export\APIs\C Drive API\API_PIPELINE\`
**Engine:** DeepSeek (`deepseek-reasoner`, temp 0.1)
**Cost:** ~$0.10-0.30 per paper for all 15 stages

---

## What It Does

15 reusable prompts. Run any paper through all of them. Each stage checks specific requirements and outputs X/N. Total score out of 62 determines publication readiness.

- 50+ = publication-ready
- 30-49 = needs targeted work
- <30 = still in draft

## The 15 Stages

| # | Stage | What It Checks |
|---|-------|---------------|
| 00 | Inbox | Provenance, dates, attribution, raw preservation |
| 01_canonical | Canonical | Formal claim, derivation, math, axiom map, consistency |
| 01_glyph | Glyph Audit | Coverage against all 56 glyphs |
| 02 | Strengthener | 7-pass brutal review (exit ramps, claims, voice, structure) |
| 03 | Paradigm | Old model, break, new model, precedent |
| 04 | Synthesis | Cross-domain map, isomorphism vs analogy, bidirectional, ME |
| 05 | Hypothesis | Testable predictions, magnitude, methodology, confidence |
| 06 | Evidence | External validation, competing frameworks, data |
| 07 | Falsification | Kill attempts, steelman, boundaries, failure modes |
| 08 | Paper | Academic structure, argument chain, citations, scope |
| 09 | Objections | Steelmanned objections, responses, unresolved items |
| 10 | Everyday | Plain language, practical application, "so what?" |
| 11 | Worldcheck | Pressure test, simplification, cultural framing, fact-check |
| 12 | Articles | Narrative structure, reading level, cross-references |
| 13 | Audience | Impact, accessibility, actionability, shareability |
| 14 | Fulfilled | Results, prediction accuracy, failures, revision triggers |

## How To Run

1. Copy `prompt.txt` from the stage folder
2. Copy the paper to the `input/` subfolder
3. Run: `python call_openai.py`
4. Output lands in `output/`

## Integration With Claims Ledger

Each stage's output can feed the SQLite ledger:
- Stage 01 canonical score → atom status confidence
- Stage 04 synthesis bridge grades → edges table bridge_grade
- Stage 07 falsification kill conditions → atoms kill_condition field
- Stage 14 fulfilled results → atoms status updates

## Also See

- **Station 23 (MTL):** `\\192.168.2.50\Export\Open-AI-CALL-claude-multi-api-batch-processor-d0fcwr\api_call_23_MTL` — Math Translation Layer, same DeepSeek engine, ~550 tok/equation
- **Station 24 (Glyph Placement):** Designed, not built

---

*Reference prompt created 2026-07-26 by Claude Opus 4.6. This is a pointer to an existing pipeline, not a new build.*
