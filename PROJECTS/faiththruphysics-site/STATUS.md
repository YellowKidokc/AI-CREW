# Faith Through Physics — Site Status

tags: #site #faiththruphysics #status

---

## Current State

Site shell deployed on Cloudflare Workers + R2. HTML articles scattered across D and E drives need consolidation. Audio/video assets partially organized on E drive.

## Source of Truth Files

- Site shell: `site-shell.js` (see Codex verification — 6 copies, consolidation needed)
- Content: MTL system, worker packets
- Media: Cloudflare R2
- **Canonical site data folder:** E:\Site (target — consolidation in progress)

## Active Workers / Agents

- Codex (this session): JOB-06 coordination/recovered-note pass. Cooms/Mattermost connector unavailable on 2026-07-25; endpoint returned 404, so no live cross-agent check was possible.
- Codex (this session): JOB-08 E/NAS availability verification completed. Found active-looking JOB-01 staging inventory at `E:\Site\_staging\JOB-01-html-aggregation-20260726\inventory\html-paths.txt`; did not modify it.
- Codex (this session): Wrote clean AI Hub handoff at `\\192.168.2.50\h_hp\Desktop\AI HUB DAVID\FAITHTHRUPHYSICS_HTML_HANDOFF_2026-07-26.md`.
- Codex (this session): Wrote lossless daily archive summary at `D:\GitHub\ai-crew\ARCHIVE\2026-07\daily\DAILY_2026-07-26.md`.

## Known Issues

- HTML files scattered across D drive, E drive, and possibly H:\Desktop — need aggregation
- Multiple versions of same articles exist — need dedup and canonical selection
- Series ordering not fully established for all article sets

---

## Job Board

**Rule: Always keep jobs here. When one finishes, add another. There should always be busy work ready for idle agents.**

### JOB-01: HTML Aggregation
**Status:** DONE
**Priority:** HIGH
**Description:** Scan D drive, E drive, H:\Desktop, and recycle bins for all HTML files related to faiththruphysics. Collect every HTML article into one staging folder. Log where each file was found. Do not delete originals — copy only.
**Output:** See `JOB-01_HTML_AGGREGATION_REPORT.md`. Clean inventory: `E:\Site\_staging\JOB-01-html-aggregation-20260726\inventory\html-inventory-clean.csv`. Staged copies: `E:\Site\_staging\JOB-01-html-aggregation-20260726\copies`.
**Note:** Raw scan found 258,495 HTML/HTM paths. Filtered candidate set staged 47,259 unique source rows and 46,706 copied files. Review `candidate-paths-not-in-clean-inventory.txt` for the 315 candidate paths that did not land in the clean inventory.

### JOB-02: Series Assembly
**Status:** OPEN
**Priority:** HIGH
**Description:** Take the aggregated HTML files and organize into coherent series (GTQ, Convergence, standalone). Identify which articles belong to which series, determine correct ordering, flag gaps or duplicates.
**Output:** Series map document showing each series, article order, and any missing entries.

### JOB-03: Asset Inventory Excel
**Status:** OPEN
**Priority:** HIGH
**Description:** Create an Excel checklist for every article across all series. Columns: Article title, Series, Order, HTML (Y/N), Audio (Y/N), Video (Y/N), Images (Y/N), Markdown source (Y/N), Deployed (Y/N), Notes.
**Output:** Master checklist spreadsheet.

### JOB-04: Markdown Source Gathering
**Status:** OPEN
**Priority:** MEDIUM
**Description:** Locate all markdown source files for articles. Check H:\Desktop (GTQ_*.md files visible there), E:\Faith Through Physics MD, Obsidian vault, and any other locations. Map each markdown to its corresponding HTML.
**Output:** Markdown inventory with file paths and matched HTML counterparts.

### JOB-05: Canonical Folder Consolidation
**Status:** OPEN (blocked by JOB-02, JOB-03)
**Priority:** MEDIUM
**Description:** Once inventory and series assembly are complete, consolidate everything into the canonical site-data folder on E drive. Structure: one folder per series, each containing HTML versions, audio, video, images, and markdown source. Move, don't delete.
**Output:** Clean canonical folder with everything in place.

### JOB-06: D Drive HTML Cleanup Note
**Status:** DONE
**Priority:** LOW
**Description:** Find the prompt/note left by previous agents about 3-4 D drive HTML folders. Retrieve and incorporate into JOB-01 planning.
**Output:** Recovered useful planning notes from:
- `D:\GitHub\faiththruphysics-site-live\KIMI-DEPLOYMENT-HANDOFF.md`
- `D:\GitHub\faiththruphysics-site-data\DIRECTORY-DASHBOARD.md`
- `D:\GitHub\faiththruphysics-site-live\COORDINATION_NOTE.md`
- `D:\GitHub\faiththruphysics-site-v2\CANONICAL_SITE_SOURCE.md`

**Recovered note for JOB-01 planning:**
- Old handoff names NAS source folders under `\\dlowenas\h_hp\Desktop\Folders\Master HTML\`: `K-Production-Ready\02-genesis-to-quantum`, `K-Production-Ready\03-moral-decline`, `Standalone-Articles`, and `_KIMI-READ-FIRST`.
- D-drive site repos to inventory/diff: `D:\GitHub\faiththruphysics-site-live` (production / most organized), `D:\GitHub\faiththruphysics-site-data` (warehouse / broadest collected material), `D:\GitHub\faiththruphysics-site-v2` (older but contains extra folders), `D:\GitHub\faiththruphysics-site` (older/reference/mostly assets), and `D:\GitHub\genesis-to-quantum` (GTQ standalone).
- Data dashboard says `faiththruphysics-site-data` has `[D-LIVE]` folders with HTML counterparts, `[NOT-DONE]` draft/WIP HTML folders, and `[TOOLS/NOTES/BACKUPS]` folders that should be ignored unless doing exhaustive provenance.
- Coordination note says avoid `work/one-page-stories-sprint` unless explicitly continuing that audit/review flow; safe candidates included root folders such as `Axiom Layer`, `consciousness`, `Constitutional audit`, `convergence-deep`, `convergence-series`, `data-viz`, `Family`, `forge-proofs`, `formal-papers`, `revolution-of-truth`, `the-bidirectional-audit`, `three-gates`, and `three-truths`.
- `faiththruphysics-site-v2\CANONICAL_SITE_SOURCE.md` says v2 was once chosen as a working source and warns against broad whole-site repair scripts without backup/commit. This conflicts with the later location report that says `faiththruphysics-site-live` should be canonical, so JOB-01 should inventory both before selecting canonical files.

### JOB-08: E Drive/NAS Manual HTML Verification
**Status:** DONE
**Priority:** HIGH
**Description:** Verify mounted NAS/E-drive site-content folders named in the location report and recovered handoff. Check `E:\Faith Through Physics`, `E:\Faith Through Physics MD`, `E:\Faith Through Physics SITE Audio`, `E:\Faith thru Physics`, `E:\HTML`, `E:\Site`, and the old handoff path `\\dlowenas\h_hp\Desktop\Folders\Master HTML\`. Record which paths exist and whether they contain HTML/MD/audio/video/images. Copy nothing unless continuing JOB-01.
**Output:** See `NAS_E_DRIVE_AVAILABILITY_REPORT.md`. Key result: `\\192.168.2.50\h_hp\Desktop\Folders\Master HTML` exists and contains 32,244 HTML files; `E:\Faith Through Physics` exists and contains 1,218 HTML plus 11,116 markdown files; `E:\Faith Through Physics MD` exists and contains 4,904 markdown files; `E:\Faith Through Physics SITE Audio` exists and contains audio/video staging material. `E:\HTML`, `E:\Audio`, `E:\Video`, and `E:\Images` are currently empty placeholders.

### JOB-09: Filter JOB-01 HTML Inventory to Faith Through Physics Candidates
**Status:** DONE
**Priority:** HIGH
**Description:** Use the existing broad inventory at `E:\Site\_staging\JOB-01-html-aggregation-20260726\inventory\html-paths.txt` and produce a smaller candidate list focused on faiththruphysics/theophysics article content. Include positive path/title heuristics, exclude obvious app/tool/recycle-bin noise unless content appears relevant, and preserve original source paths.
**Output:** Filtered candidate inventory saved at `E:\Site\_staging\JOB-01-html-aggregation-20260726\inventory\html-candidate-paths.txt`; final clean staged inventory saved at `E:\Site\_staging\JOB-01-html-aggregation-20260726\inventory\html-inventory-clean.csv`.

### JOB-10: HTML Dedup And Canonical Candidate Selection
**Status:** OPEN
**Priority:** HIGH
**Description:** Use `html-inventory-clean.csv` and `duplicate-hash-summary.csv` from JOB-01 to collapse exact duplicates, then identify likely canonical versions by source priority (`site-live`, `site-data`, recovered Master HTML, `site-v2`, GTQ standalone, E/NAS). Preserve all alternates in the map; do not delete staged copies or originals.
**Output:** Dedup map with one canonical candidate per hash/title/series cluster, alternates listed with source paths, and unresolved conflicts flagged for human review.
**Note:** FIS priority-source pass completed; see `FIS_DEDUP_PRIORITY_PASS_REPORT.md` and `E:\Site\_staging\JOB-01-html-aggregation-20260726\fis_neardup_priority_sources`.

### JOB-11: Generic FIS Batch/Profile Runner
**Status:** OPEN
**Priority:** MEDIUM
**Description:** Harden the reusable File Intelligence System for large mixed corpora without adding site-specific logic. Add or wire a generic batch/profile runner that accepts roots or inventory CSVs, processes large corpora in chunks, writes a run ledger, and lets project-specific source priority live in external config/report files.
**Output:** Generic FIS batch runner or documented command profile, plus a test run against one staged corpus batch.

### JOB-07: MDA tanh Phase-Transition Fit Test (THEOPHYSICS crossover)
**Status:** OPEN
**Priority:** HIGH
**Description:** Pre-registered fit test on MDA data. BEFORE running: write down (1) which MDA quantities count, (2) the functional form to test — tanh phase transition Φ(χ) = tanh(β(χ−χ_c)), (3) predicted knee window (~1968-1988), (4) numeric thresholds for pass/fail (R², parameter tolerances), (5) what result kills it. THEN run the fit cold. Check for: knee near predicted window, saturation behavior after, shock-response wobble at known events (2008 etc). See THEOPHYSICS/SEEDS.md 2026-07-25 entry for full hypothesis and dead-lead log. Do NOT test against neutrino or particle-physics datasets — those leads are dead and logged.
**Output:** Pre-registration doc + fit results + verdict, filed in THEOPHYSICS/trench/.

---

## Change Log

| Date | Change | Agent |
|------|--------|-------|
| 2026-07-21 | Six-agent session — CSS CDN remediation, MTL fixes, labeler audit (103K issues) | Multi-agent |
| 2026-07-24 | Job board created with 6 initial jobs for HTML/asset consolidation pipeline | Claude Opus 4.6 |
| 2026-07-26 | Completed JOB-01/JOB-09 HTML aggregation: 47,259 unique candidate source rows inventoried, 46,706 files staged under `E:\Site\_staging\JOB-01-html-aggregation-20260726`, duplicate hash summary generated | Codex |
| 2026-07-26 | Ran generic FIS near-duplicate pass on priority staged sources: 9,137 files scanned, 8,668 fingerprinted, 882 exact groups, 957 near-duplicate clusters, 1,496 family groups | Codex |
