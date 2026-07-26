# PROMPT: Build the Claims-Evidence SQLite Ledger

tags: #prompt #db #sqlite #claims #codex

**Target:** Codex (local or online)
**Repo:** `D:\GitHub\Faith-through-physics-atoms`
**Output:** `claims_ledger.sqlite` at the repo root

---

## Task

Build a SQLite database that serves as the canonical queryable ledger for all claims, evidence, and their connections in the Theophysics framework.

## Schema

```sql
CREATE TABLE atoms (
    atom_id TEXT PRIMARY KEY,        -- e.g. "AX-001", "EQ-047", "BR-003"
    title TEXT NOT NULL,
    node_type TEXT NOT NULL,         -- from vocab.json nodeType
    status TEXT NOT NULL,            -- from vocab.json status
    claim_class TEXT,                -- from vocab.json claimClass
    domain TEXT,                     -- domain folder name
    layer TEXT,                      -- L1_Existence, L2_Substrate, etc.
    equation TEXT,                   -- LaTeX or plain-text equation if any
    core_statement TEXT,             -- the claim in plain English
    kill_condition TEXT,             -- what would falsify this
    scripture_ref TEXT,              -- primary scripture reference
    bridge_grade TEXT,               -- from vocab.json bridgeGrade
    verified_by TEXT,                -- from vocab.json verifiedBy (comma-separated)
    confidence REAL,                 -- 0.0 to 1.0
    source_file TEXT,                -- relative path to the markdown atom
    created_date TEXT,
    updated_date TEXT
);

CREATE TABLE edges (
    edge_id INTEGER PRIMARY KEY AUTOINCREMENT,
    source_id TEXT NOT NULL,         -- atom_id of source
    target_id TEXT NOT NULL,         -- atom_id of target
    edge_type TEXT NOT NULL,         -- from vocab.json edgeType
    bridge_grade TEXT,               -- if edgeType is bridgesTo
    propagates INTEGER DEFAULT 0,   -- 1 if grade propagates status
    FOREIGN KEY (source_id) REFERENCES atoms(atom_id),
    FOREIGN KEY (target_id) REFERENCES atoms(atom_id)
);

CREATE TABLE evidence (
    evidence_id INTEGER PRIMARY KEY AUTOINCREMENT,
    atom_id TEXT NOT NULL,           -- the claim this evidence supports
    evidence_type TEXT NOT NULL,     -- from vocab.json evidenceType
    verified_by TEXT,                -- lean4, python, wolfram, etc.
    description TEXT,
    source_reference TEXT,           -- paper, dataset, experiment
    confidence REAL,
    FOREIGN KEY (atom_id) REFERENCES atoms(atom_id)
);

CREATE TABLE mtl_entries (
    mtl_id TEXT PRIMARY KEY,         -- e.g. "MTL-001"
    equation_id TEXT,                -- e.g. "EQ-001"
    equation_raw TEXT,               -- LaTeX
    english_translation TEXT,
    physics_side TEXT,
    theology_side TEXT,
    shared_structure TEXT,
    bridge_grade TEXT,
    source_file TEXT,
    linked_atom_id TEXT,             -- atom this MTL entry is evidence for
    FOREIGN KEY (linked_atom_id) REFERENCES atoms(atom_id)
);
```

## Views to Create

```sql
-- Claims with no evidence
CREATE VIEW orphan_claims AS
SELECT a.atom_id, a.title, a.claim_class, a.status
FROM atoms a
WHERE a.node_type = 'claim'
AND NOT EXISTS (SELECT 1 FROM evidence e WHERE e.atom_id = a.atom_id)
AND NOT EXISTS (SELECT 1 FROM edges e WHERE e.target_id = a.atom_id AND e.edge_type = 'dependsOn');

-- Status ceiling violations
CREATE VIEW status_violations AS
SELECT a.atom_id, a.title, a.status,
       dep.atom_id as dependency_id, dep.status as dependency_status
FROM atoms a
JOIN edges e ON e.source_id = a.atom_id AND e.edge_type = 'dependsOn'
JOIN atoms dep ON dep.atom_id = e.target_id
WHERE a.status > dep.status;  -- uses statusRank ordering

-- Bridge grade distribution
CREATE VIEW bridge_distribution AS
SELECT bridge_grade, COUNT(*) as count
FROM atoms WHERE bridge_grade IS NOT NULL
GROUP BY bridge_grade ORDER BY count DESC;

-- Claims by verification method
CREATE VIEW verified_claims AS
SELECT verified_by, COUNT(*) as count
FROM atoms WHERE verified_by IS NOT NULL
GROUP BY verified_by ORDER BY count DESC;
```

## Data Sources (ingest in this order)

1. **188 axioms** from `Axiom_Containers_33.xlsx` → `188_Flat` sheet
2. **33 containers** from `Axiom_Containers_33.xlsx` → `33_Containers` sheet
3. **Derivation chain** from `Axiom_Containers_33.xlsx` → `Derivation_Chain` sheet
4. **MTL consciousness** from `Master EXCEL\MTL_CONSCIOUSNESS_COMBINED.xlsx`
5. **MTL master** from `Master EXCEL\MTL_MASTER.xlsx`
6. **Existing markdown atoms** from domain folders in the atoms repo
7. **Lean verification status** from `CANONICAL_LEDGER_V2.xlsx`

## Integration with Existing Validator

Extend `_scripts/validate_atoms.py` to:
1. After validation pass, emit/update `claims_ledger.sqlite`
2. Add a `--check-burden` flag that checks claimClass → required evidence per the claim-burden table in `GOVERNING_RULES_FINAL.md`
3. Report missing evidence per claim as warnings

## Constraint

Do NOT delete or restructure the existing markdown atom files. The SQLite is a queryable index OF the atoms, not a replacement for them.

---

*Prompt created 2026-07-26 by Claude Opus 4.6*
