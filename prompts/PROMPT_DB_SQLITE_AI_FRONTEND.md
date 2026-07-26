# PROMPT: AI Conversational Front-End for Claims Ledger

tags: #prompt #db #sqlite #frontend #codex

**Target:** Codex (local)
**Depends on:** `claims_ledger.sqlite` from PROMPT_DB_SQLITE_CLAIMS_LEDGER
**Output:** A Python script or lightweight web app that lets an AI (or David) query the claims ledger in natural language

---

## Task

Build a conversational interface to the claims_ledger.sqlite database. The user (or an AI agent) asks a question in plain English, and the system translates it to SQL, runs the query, and returns a human-readable answer.

## Requirements

1. **Input:** Natural language question about claims, evidence, bridges, status
2. **Translation:** Convert to SQL against the claims_ledger schema
3. **Output:** Formatted answer with atom IDs, titles, and relevant fields
4. **Safety:** Read-only. Never write to the database from this interface.

## Example Queries

| Natural Language | SQL |
|---|---|
| "How many claims are verified?" | `SELECT COUNT(*) FROM atoms WHERE status='verified'` |
| "Show me all claims with no evidence" | `SELECT * FROM orphan_claims` |
| "What's the bridge grade distribution?" | `SELECT * FROM bridge_distribution` |
| "Which claims depend on AX-001?" | `SELECT a.* FROM atoms a JOIN edges e ON e.source_id=a.atom_id WHERE e.target_id='AX-001' AND e.edge_type='dependsOn'` |
| "What would break if AX-067 is falsified?" | Recursive CTE walking dependsOn edges from AX-067 |
| "Show me everything about the consciousness chapter" | `SELECT * FROM mtl_entries WHERE source_file LIKE '%consciousness%'` |
| "What claims have Lean verification?" | `SELECT * FROM atoms WHERE verified_by LIKE '%lean4%'` |

## Implementation Options

**Option A — Python CLI (simplest)**
```
python query_ledger.py "how many claims are verified?"
```
Uses an LLM API call (DeepSeek at Station 23, or local Ollama) to translate NL → SQL, then sqlite3 to execute.

**Option B — Streamlit Web App**
Single-file Streamlit app with a text input box. Same NL → SQL → result pipeline but with a browser UI.

**Option C — API Endpoint**
Flask/FastAPI endpoint at localhost that accepts POST with a question and returns JSON. Other AI agents can hit it.

## Note

David mentioned he may already have an AI SQL front-end on the D: drive. Check `D:\` for any existing Streamlit, Gradio, or Flask apps that connect to SQLite or PostgreSQL before building from scratch.

---

*Prompt created 2026-07-26 by Claude Opus 4.6*
