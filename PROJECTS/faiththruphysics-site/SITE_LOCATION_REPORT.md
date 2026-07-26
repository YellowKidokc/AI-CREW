# FAITHTHRUPHYSICS SITE — FILE LOCATION REPORT
Generated: 2026-07-24
Agent: Claude Opus 4.6
tags: #site #inventory #report

## REPOS ON D DRIVE (4 repos + 1 standalone)

### 1. D:\GitHub\faiththruphysics-site-live (PRODUCTION)
- Most organized version — 21 series folders with HTML articles
- Components, scripts, workers, docs
- Has .git — version controlled
- **THIS SHOULD BE CANONICAL**

### 2. D:\GitHub\faiththruphysics-site-v2
- Older version, similar structure
- Has folders not in -live: spiritual-warfare, prophetic-synthesis, watcher-problem, loom, socratic-axioms
- **CANDIDATE FOR ARCHIVE after diffing against -live**

### 3. D:\GitHub\faiththruphysics-site-data
- LARGEST repo — everything plus pipeline/consolidation tooling
- 01_RAW_IMPORTS through 07_REVIEW_NEEDED pipeline folders
- Loose DRV HTML files and audio (.mp3) in root
- _archive, _staging, _consolidation_audit, _LOCKED_FORMAL_VERIFICATION_VAULT
- notebooklm_downloads, notebooklm_text folders
- Kimi consolidation reports
- **THIS IS THE WAREHOUSE — everything landed here at some point**

### 4. D:\GitHub\faiththruphysics-site
- Nearly empty — just assets/media-manifest.json and work/ scripts
- **CAN PROBABLY ARCHIVE**

### 5. D:\GitHub\genesis-to-quantum (STANDALONE)
- GTQ-specific repo with own deployment tooling
- Has genesis-to-quantum/ subfolder + 1111genesis-to-quantum/ (numbered copy?)
- Standalone HTML articles in root
- source_markdown/ folder — MD sources for GTQ
- **GTQ articles may differ from copies in site-live**

## H:\Desktop LOOSE FILES

### Markdown (GTQ series):
GTQ_00_INDEX.md through GTQ_10A (with sub-articles A, B, C)

### Standalone HTML:
the-same-equation.html, the-bilateral-audit-lean4.html, the-inverse-solver.html, Cathedral Shell, Home Page, Master Equation Reveal, equation-presentation-templates.html, various one-offs

### Folders with HTML:
master-equation/, MASTER_EQUATION/, Master EQ/ — THREE master equation folders, faiththruphysics-series-audit/, THEOPHYSICS_ORGANIZED/

## E DRIVE (NAS — \\192.168.2.50\Export)

### Known folders (filesystem tools cannot traverse NAS subdirs):
- Faith Through Physics, Faith Through Physics MD, Faith Through Physics SITE Audio
- Faith thru Physics (another copy?), HTML, Site, Audio, Video, Images
- **NEED MANUAL VERIFICATION**

## H:\00_Canonical_PRODUCTION_v1.0
- Structured Obsidian vault with 7 lanes (Master Equation Core through Raw Source Files)
- Source material vault, not site HTML target
- Has GOD_AXIOM, Trinity/Noether notes, Consciousness scorecard

## KNOWN DUPLICATES / CONFLICTS

1. cross-domain/ and Introduction to Theophysics/ — same 12 articles in site-live
2. moral-decline/ and mda/ — overlap in site-live and site-data
3. GTQ articles exist in: genesis-to-quantum repo, site-live, site-data, H:\Desktop (MD), possibly E drive
4. Three master-equation folders on Desktop
5. DRV articles loose in site-data root AND in revolution-of-truth/ subfolder
6. 4 repos: faiththruphysics-site (empty), site-v2, site-data, site-live

## RECOMMENDED NEXT STEPS

1. Scan E drive folders manually — David verify what's there
2. Diff site-live vs site-data — find what's in data but not live
3. Diff GTQ across all locations — find newest/best version of each article
4. Archive site and site-v2 after confirming site-live has everything
5. Build per-article checklist: HTML, MD, Audio, Video, Images, Topbar, MTL, Deployed