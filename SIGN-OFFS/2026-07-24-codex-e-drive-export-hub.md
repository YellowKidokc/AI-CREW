# 2026-07-24 - Codex E Drive Export Hub

tags: #signoff #codex #exports #e-drive #api #html #atoms

## Session Focus
David asked to make E drive the export drive and define a class-based folder structure for exports from different drives/repos without losing source provenance.

## Changed
- Created `E:\_EXPORT_HUB` as a non-destructive canonical export hub.
- Added stable export class folders:
  - `00_INBOX_DROP`
  - `01_MANIFESTS`
  - `02_API_CALLS`
  - `03_NLP_CLASSIFICATION`
  - `04_ATOMS`
  - `05_SYNTHESIS_PACKETS`
  - `06_PAPERS`
  - `07_HTML_BUILD`
  - `08_MEDIA`
  - `09_REPORTS_QA`
  - `10_RELEASES`
  - `90_ARCHIVE`
  - `99_LOGS`
- Added subfolders for providers, classifications, atom classes, synthesis packet classes, paper formats, HTML build outputs, media, QA, and releases.
- Added `E:\_EXPORT_HUB\README.md` explaining the export hub rule.
- Added manifest templates in `E:\_EXPORT_HUB\01_MANIFESTS`:
  - `export-registry.csv`
  - `run-registry.csv`
  - `export-schema.md`

## Verified
- Confirmed E drive exists and contains existing export/category folders.
- Confirmed hub folder and manifest files were created.

## Notes
- Existing `E:\exports`, `E:\APIs`, `E:\NLP`, etc. were left untouched.
- Core ruling: folder = export class; manifest columns = source drive, source path, project, stage, row/lane, atom/claim/law/status.
- Recommended next step: teach API/export scripts to write outputs into `E:\_EXPORT_HUB` and append rows to `01_MANIFESTS\export-registry.csv`.
