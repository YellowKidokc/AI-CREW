# Prompt: HTML To Markdown Correlation Audit

Date: 2026-07-27

## Mission

You are auditing Faith Through Physics HTML coverage against the cleaned Markdown corpus.

Do not delete, replace, or move source files. This is a compare, stage, and report job.

The main risk is choosing the wrong HTML version as the source for Markdown. There are many copies of the same HTML page across root folders, site-data folders, archives, backups, and staging folders. The best version may not be the newest file and may not be in the obvious folder.

## Start Here

Read this first:

`E:\exports\FaithThroughPhysics_D_Drive_Consolidation\files\SYNTHESIS_COORDINATION_PLAN.md`

Then read:

`\\192.168.2.50\h_hp\Desktop\ai-crew\AI\THEOPHYSICS_SITE_DATA_HANDOFF.md`

## Base / Keeper Folder

Treat this as the keeper site-data folder:

`E:\exports\FaithThroughPhysics_D_Drive_Consolidation\files\faiththruphysics-site`

Do not replace this folder wholesale.

Comparison folders:

- `E:\exports\FaithThroughPhysics_D_Drive_Consolidation\files\faiththruphysics-site-v2`
- `E:\exports\FaithThroughPhysics_D_Drive_Consolidation\files\faiththruphysics-site-v2-fresh`
- `E:\exports\FaithThroughPhysics_D_Drive_Consolidation\files\faiththruphysics-site_backup_20260604_204547`

Cleaned Markdown destination corpus:

`E:\Faith Through Physics MD`

HTML-to-Markdown conversion station:

`\\192.168.2.50\brain\conversion_station`

Reusable Markdown cleaner:

`C:\theophysics\_scripts\clean_markdown.py`

## Critical Starting Sheets

The main coverage sheet is CSV, not Excel:

`E:\exports\FaithThroughPhysics_D_Drive_Consolidation\files\faiththruphysics-site\_synthesis-review\conversion-coverage\HTML_TO_MARKDOWN_COVERAGE.csv`

Use this as the first work queue. It has these important columns:

`identity, series, part_number, slug, representative_title, is_article_like, html_version_count, html_source_folders, html_relative_paths_sample, markdown_status, still_needs_markdown, match_method, matching_markdown_count, matching_markdown_sources, matching_markdown_paths_sample, notes`

Also use:

`E:\exports\FaithThroughPhysics_D_Drive_Consolidation\files\faiththruphysics-site\_synthesis-review\best-candidates\BEST_CANDIDATES.csv`

`E:\exports\FaithThroughPhysics_D_Drive_Consolidation\files\faiththruphysics-site\_synthesis-review\human-review\HUMAN_REVIEW_REQUIRED.csv`

`E:\exports\FaithThroughPhysics_D_Drive_Consolidation\files\faiththruphysics-site\_synthesis-review\identity-map\MASTER_HTML_IDENTITY_MAP_DEDUPED.csv`

## Related Workbooks

There is a real workbook here, but it is framework data, not the primary HTML coverage queue:

`E:\exports\FaithThroughPhysics_D_Drive_Consolidation\files\faiththruphysics-site\_site-and-other-files\shared\data\Theophysics_Master_Workbook.xlsx`

It has sheets like `DASHBOARD`, `Ten_Law_ISOs`, `Bible_60`, `Axioms_7`, `Index`, and `DATA_ENTRY`.

There is also:

`E:\exports\FaithThroughPhysics_D_Drive_Consolidation\files\faiththruphysics-site\_stories-and-markdown\master-equation\INFO\MASTER_THEORY_TRUTHS.xlsx`

That workbook has `All Truths`, `Axioms + Claims`, and `Theory Summary`. It is not the HTML queue.

## Current Known Counts

From `HTML_TO_MARKDOWN_COVERAGE.csv`:

- Total coverage rows: 5,904
- `has_markdown`: 5,248
- `missing_markdown`: 656
- Article-like rows still needing Markdown: 420

From `BEST_CANDIDATES.csv`:

- Best-candidate rows: 558
- High confidence: 292
- Medium confidence: 266

From `HUMAN_REVIEW_REQUIRED.csv`:

- Human-review rows: 248

## Job

For each article-like HTML identity that still needs Markdown:

1. Start from `HTML_TO_MARKDOWN_COVERAGE.csv`, filtering:
   - `still_needs_markdown = yes`
   - `is_article_like = yes`
2. Look up that `identity` in `BEST_CANDIDATES.csv`.
3. If it is in `HUMAN_REVIEW_REQUIRED.csv`, do not auto-convert it. Put it in a review queue.
4. Open the recommended HTML and inspect the actual article quality.
5. Compare variants if there are multiple real HTML versions.
6. Prefer the better article, not merely the newer topbar.
7. Check whether a cleaned Markdown equivalent already exists under:
   - `E:\Faith Through Physics MD`
8. If no good Markdown exists, stage the HTML-to-Markdown conversion plan.

## Full Conversion Workflow

Run this in order. HTML quality comes first.

### 1. Choose The HTML Source

Use `HTML_TO_MARKDOWN_COVERAGE.csv` as the queue, but do not convert blindly from the first HTML path shown there.

For each missing article:

1. Check `BEST_CANDIDATES.csv`.
2. Check `HUMAN_REVIEW_REQUIRED.csv`.
3. Inspect the recommended HTML and any close competing variants.
4. Pick the best complete HTML article as the conversion source.
5. Record the exact source path and reason.

If the row is uncertain, put it in `HTML_HUMAN_REVIEW_QUEUE.csv`.

### 2. Send Missing HTML Through Conversion Station

Use:

`\\192.168.2.50\brain\conversion_station`

Expected useful output locations from prior runs:

- `\\192.168.2.50\brain\conversion_station\SITE_MARKDOWN`
- `\\192.168.2.50\brain\conversion_station\HTML to Markdown`

The conversion station may emit repeated slug/hash Markdown files. Do not treat every emitted file as final. Deduplicate and pick one cleaned candidate per identity.

### 3. Clean Converted Markdown

Before importing converted Markdown into `E:\Faith Through Physics MD`, run the cleaner.

Dry-run first:

```powershell
python C:\theophysics\_scripts\clean_markdown.py "<converted markdown folder>" --dry-run --report "<report path>.csv"
```

Preview copy if needed:

```powershell
python C:\theophysics\_scripts\clean_markdown.py "<converted markdown folder>" --out "<preview folder>" --report "<report path>.csv"
```

Write clean files only after the report looks sane:

```powershell
python C:\theophysics\_scripts\clean_markdown.py "<converted markdown folder>" --write --backup-dir "<backup folder>" --report "<report path>.csv"
```

### 4. Import Clean Markdown To E Drive

Destination corpus:

`E:\Faith Through Physics MD`

Put files into the existing short-code series folders where possible:

- `GTQ - Genesis To Quantum`
- `MDA - Moral Decline Audit`
- `ISO - Isomorphism`
- `LGS - Logos Papers`
- `FP - Formal Papers`
- `MEQ - Master Equation`
- `SA - Socratic Axioms`
- `SW - Spiritual Warfare`
- `CD - Cross Domain`
- `CON - Consciousness`
- `OP - One Pagers`

Before importing:

1. Compare exact hashes against existing Markdown.
2. Compare normalized slug/title against existing Markdown.
3. Do not overwrite a cleaned Markdown file unless a reviewed replacement is explicitly approved.
4. If a clean Markdown equivalent already exists, record it in `HTML_ALREADY_HAS_CLEAN_MD.csv`.
5. If a new Markdown file is imported, record it in `HTML_MARKDOWN_CONVERT_QUEUE.csv` or a follow-up import manifest.

### 5. Verify

After import:

1. Rerun coverage against `E:\Faith Through Physics MD`.
2. Update `HTML_TO_MARKDOWN_COVERAGE.csv` or write a new dated coverage report.
3. The target is to drive article-like missing Markdown down from the current `420` rows.

## What "Better HTML" Means

Prefer HTML with:

- complete article body
- correct title
- full article structure
- working images/media when expected
- correct series/part identity
- no placeholder body
- no broken encoding
- no obvious template/test/admin page
- no truncated content

Topbar/nav differences are secondary. Do not pick a worse article just because it has a newer topbar.

## Required Output

Write outputs under:

`E:\exports\FaithThroughPhysics_D_Drive_Consolidation\files\faiththruphysics-site\_synthesis-review\html-markdown-correlation\`

Create:

- `HTML_MARKDOWN_CORRELATION_AUDIT.csv`
- `HTML_MARKDOWN_CONVERT_QUEUE.csv`
- `HTML_HUMAN_REVIEW_QUEUE.csv`
- `HTML_ALREADY_HAS_CLEAN_MD.csv`
- `HTML_MARKDOWN_CORRELATION_REPORT.md`
- `HTML_TO_CONVERSION_STATION_QUEUE.csv`
- `CONVERTED_MARKDOWN_IMPORT_MANIFEST.csv`

Suggested columns:

`identity, series, slug, title, coverage_status, best_candidate_path, best_candidate_confidence, human_review_required, cleaned_md_match_path, md_quality_status, action, reason`

## Non-Negotiables

- Do not delete anything.
- Do not overwrite the keeper folder.
- Do not assume every file in archives is worse.
- Do not assume every file in the root/site-data folder is best.
- Do not convert from a stub when a better full article exists.
- Preserve traceability: every recommendation needs source path and reason.

## Completion Signal

When done, update:

`\\192.168.2.50\h_hp\Desktop\ai-crew\PROJECTS\faiththruphysics-site\STATUS.md`

And add a sign-off in:

`\\192.168.2.50\h_hp\Desktop\ai-crew\SIGN-OFFS\`
