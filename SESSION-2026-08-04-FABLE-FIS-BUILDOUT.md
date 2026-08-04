# Session Report — 2026-08-04 — Claude Fable 5
## The FIS Buildout: canonization, law layer, always-on loop, CHI codes, GUI
### For the crew: everything built today, where it lives, how to continue it.

David's first Fable session. One day, one system: the File Intelligence System went
from scattered organs to a running organism. Everything below is LIVE unless marked.

---

## 1. CANONIZATION LOOP (change canon once, it disperses everywhere)

- **Central registry**: `D:\GitHub\David-OS\system\canon_rules.json`
  10 rulings, each individually versioned (`version`, `status: binding/draft/retired`,
  `source_ruling`). Covers: nine-factor product form, Dictionary A (Laws 7/8 = Quantum/
  Relativity, 4/9 = Strong/Weak), variable dictionary, symmetry pairs, 58-count,
  EQ-CHANNEL-CAPACITY (draft — C = A·log2(1+T/D), David to ratify).
- **Definitions database**: `D:\GitHub\David-OS\system\definitions_registry.json`
  One entry per named theorem/term. Filled: DEF-GODEL (consistent + effectively
  axiomatized + interprets arithmetic — NOT "self-reference"; gives unprovability-
  from-within only), DEF-SHANNON (capacity never inverts), DEF-NOETHER (continuous
  symmetry of the action). Draft skeletons to fill: SECOND-LAW, BELL, OBSERVER, ENTROPY.
  **Adding an entry = the whole corpus is guarded. No code.**
- **Scanner**: `D:\GitHub\David-OS\file-intelligence-system\fis_canon_scan.py`
  Auto-merges both registries. Two layers: regex (free, always) + NLP (`--nlp`,
  :8700 /nlp/contradiction, premise=paragraph, hypothesis=canonical statement;
  ≥60% = CONTRADICTION, 40–60% = NEEDS_CANON_DECISION — David rules, not the scanner).
  Disperses rulings into every folder's `.fisnote` below the FIS-CANON-DIVIDER line.
  Writes WANTED-vs-WRITTEN reports to `<folder>\09_TO_REVIEW\CANON_SCAN_*.md/.json`.
  **NEVER edits content files.** Auto-fix stays locked until verdicts prove trust.
- **Acid test passed**: scanner independently caught both reviewer catches in
  `Downloads\THE-JUDGMENT-LAYER-CANONICAL_1.md` (L270 Gödel misstatement, L308
  "channel inverts"). The loop David wanted — write → scan → "defined wrong, line N"
  → fix or extend registry — is real.

## 2. LAW LAYER (the Master EXCEL constitution, enforced)

- Source of truth: `Desktop\Master EXCEL\folder_symptom_registry.xlsx` (40 symptoms,
  S/C/T/I/N/R families) + `FIS SYSTEM.xlsx` (Guardrails, Severity Scale, Report_Sections,
  Rule_Builder grammar). **Edit the workbook → scanners obey next run** (JSON cache in
  `system\symptom_registry_cache.json` for NAS-offline).
- `fis_symptoms.py`: ~26 detectors implemented (was 0/40). Includes catalog-powered
  R-family (R01 untagged canonical, R06 low-confidence, R08 claim-without-evidence)
  and C02 format redundancy. Hard rules: critical = NEVER auto-fixable; unimplemented
  symptoms are always listed as "not evaluated" — never silently passed.
- `fis_report.py <folder>`: consulting-grade self-contained HTML report structured by
  the Report_Sections sheet (exec summary KPIs, scope + guardrails table, corpus
  inventory, findings by severity with recommended actions, canon compliance, honesty
  section). → `09_TO_REVIEW\FIS_REPORT_*.html + .json`, auto-opens.
- Pilot (MASTER_EQUATION (1), 248 folders): 118 findings — 4 critical (all project
  roots correctly flagged protect-only), 42 medium, 72 low.
- David wants LATER (parked): ~7-paragraph narrative walkthrough w/ green/orange/red,
  same structure every time — job for the light NLP + template.

## 3. ALWAYS-ON LOOP (running now, survives reboot)

- Daemons at `D:\DONT TOUCH BOOT UP\FIS\` (fis_daemon.py = watcher + slow crawler +
  reconciler; fis_folder_daemon.py). Restarted today after being down since 7/29.
  Autostart: HKCU Run keys `POF_FIS_FileTracker / FolderTracker / ApprovalGUI`
  (schtasks ONLOGON was denied non-elevated; only "POF FIS Rename Cycle" — 4-hourly
  RENAME_CYCLE.bat — registered via schtasks).
- Priority attention: `fis_config.json` watch_folders now = local Desktop, Documents,
  NAS Desktop (instant watchdog); crawler cycles all 12 drives slowly.
- Approval GUI :10778 (`approval-gui\server.py`): ~200 Desktop rename proposals pending.
  Every click teaches TWO learners: local River model + **X-drive Markov chains** via
  new `approval-gui\fis_markov_bridge.py` → `X:\09_DATABASES\FIS\preference_engine.db`
  (keyword_chains / ext_chains / correction_matrix; verified schema). Fails silent if
  X: offline.
- Rename grammar: `fis_normalize.py` (lowercase, separators, typo map; proposes only).

## 4. CHI CODE (the 24-character classification David remembered)

- Daemon catalog `D:\DONT TOUCH BOOT UP\FIS\fis_catalog.db` = 3.34M files with full
  12-variable master-equation classification (chi_json G–C 0-3, domain, law, content
  type, evidence, fruit).
- `fis_chi_code.py` codec — canonical format:
  `3332132213-PHY-L01-NT-E8F9`
  (ten digits ALWAYS in G M E S T K R Q F C order · domain · law · content-type ·
  evidence/fruit deciles). `explain <code>` decodes to full meaning; `file <path>`;
  `stamp <folder>` copies codes into the search index; `reclassify <folder>` = science-
  NLP zero-shot second opinion on needs_review rows (report-only).
- All 7,061 pilot files fresh-classified (crawler hadn't reached H: yet) and stamped;
  CHI column + decode live in the GUI Search page.
- Gotcha: catalog paths are drive-letter AND UNC mixed; stamp has alias map.
  classify_file returns domain/law as {name, score} dicts.

## 5. SEARCH SPINE + FIND-LIKE-THIS + LIGHT NLP

- `fis.py`: SQLite+FTS5 index (`D:\GitHub\David-OS\system\fis_index.sqlite`, LOCAL
  disk on purpose — SQLite over SMB breaks). 680 folders / 7,061 files indexed.
  Every hit shows last-scanned age; >30d = `[STALE - re-scan before trusting]`.
- `fis_find_like.py`: "here's an exemplar, find its siblings" — rates every md/html/txt
  on 4 levels (wordage band, structure density, keyword cosine, semantic embedding)
  with visible per-level breakdown. Verified: Judgment Layer over 19.5k docs →
  THE QUESTION CHAIN top match (correct).
- `fis_nlp_light.py` + `nlp_light\potion-base-8M`: the INTERACTION LAYER — 30.7 MB
  model2vec embeddings packaged INSIDE the folder, numpy-only, offline, instant.
  Priority chain everywhere: :8700 full stack → light model. `pip install model2vec`
  is the only dependency on a new machine.

## 6. GUI — FIS CONTROL CENTER (`fis_gui.py`, START_FIS_GUI.bat)

Seven pages, ONE recurring layout grammar (David's requirement): nav rail always left,
context box + bold primary action always top-right, results table middle, detail pane
below, live status strip bottom (daemons/approvals/NLP/chains, 20s refresh). Colors
always mean the same: green=fresh/ok, red=stale/down, orange=alerts, purple=needs-decision.
Pages: Dashboard | Search (CHI column) | Find Like This | Rename Approvals (A/R keys,
teaches both learners) | Duplicates | Canon Review (verdicts → canon_verdicts.json) |
Scan & Index (full pipeline = inventory → canon → index → report).
First draft on purpose — David reacts box-by-box, template makes changes cheap.

## 7. FISNOTES v3 + CATALOG DOC

- `fisnote_scan.py` v3: per-file 1–2 sentence plain descriptions (kind/size/dates/
  title-or-docstring/keywords/NEW), move/delete tracking, preserves canon section.
  117 fisnotes regenerated in pilot.
- `FIS_CAPABILITIES_CATALOG.md`: full inventory of the FIS tree — the crown jewels
  (fis_near_dup 3-layer engine, observe→propose→approve suite), the -master repo's
  PySide6 popup/tray worth mining, vendored code to isolate, archivable list, and
  ⚠ `_salvage_boot_up\FIS` is a LIVE dependency (production imports fis_namer/
  fis_classifier from it) — rescue before any cleanup.
- `CANONIZATION_SYSTEM_SPEC.md`: architecture + handoff TODOs for a cheaper coder
  (scheduler, DeepSeek mirror, threshold tuning; adjudication GUI now done).

## 8. THE JUDGMENT LAYER (David's paper — review notes)

Strongest piece in the corpus: the child-hand opening, kept Socratic promise ("I don't
need to say it"), §VII five-component parallel is the spine. Two fixes before hostile
readers: (1) §IX "structural identity" → claim Structural Correspondence per David's
own taxonomy, identity = the research program; (2) §X Gödel two-sentence fix (in canon
registry now) + §XI "channel inverts" isn't produced by C = A·log2(1+T/D) — state a
mechanism or soften to capacity-collapse. Both now auto-flagged by definition guards.

## OPEN / IN FLIGHT

- Deep NLP canon scan of MASTER_EQUATION (1): still running in background at session
  end (hours-long CPU job; writes report only at completion). Regex-only report already
  in 09_TO_REVIEW.
- 200 rename approvals pending at :10778 — first real training session for the chains.
- Fill the 4 draft definitions; ratify EQ-CHANNEL-CAPACITY.
- Crawler pass #1 in progress across 12 drives; H:\Desktop will enter the catalog soon
  (then `fis_chi_code.py stamp` works from catalog directly).
- Narrative 7-paragraph report mode (parked by David's instruction).
- GUI feedback round; deeper NLP-informed CHI scoring; R07 law-coverage-hole detector.

*Everything above is also in Claude's persistent memory (fis-canonization-system.md),
so any future session picks this up without re-explaining.*

— Fable, 2026-08-04
