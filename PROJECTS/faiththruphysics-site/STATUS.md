# Faith Through Physics - Site Status

tags: #site #faiththruphysics #status

---

## Current State

Canonical site-data synthesis is in progress.

The keeper/base folder is:

- `E:\exports\FaithThroughPhysics_D_Drive_Consolidation\files\faiththruphysics-site`

The sibling folders are comparison sources:

- `faiththruphysics-site-v2`
- `faiththruphysics-site-v2-fresh`
- `faiththruphysics-site_backup_20260604_204547`

Current synthesis reports live under:

- `faiththruphysics-site\_synthesis-review\`

## Source Of Truth Files

- Site shell: `site-shell.js` (see prior Codex verification; consolidation still needed)
- Content: MTL system, worker packets
- Media: Cloudflare R2
- Site synthesis status: `faiththruphysics-site\_synthesis-review\CANONICAL_SITE_DATA_STATUS.md`
- HTML identity map: `faiththruphysics-site\_synthesis-review\identity-map\MASTER_HTML_IDENTITY_MAP_DEDUPED.csv`

## Active Workers / Agents

- GPT 1 / Codex local: master HTML identity map, synthesis status, fallback exact/variant/best-candidate reports.
- Additional Codex lanes: Markdown coverage and folder merge gap reports were requested; outputs should be checked under `_synthesis-review\conversion-coverage\` and `_synthesis-review\folder-merge\`.

## Known Issues

- Do not replace or delete active site files until staged winners are reviewed.
- HTML winner selection must happen article-by-article, not folder-by-folder.
- Markdown conversion is not yet 100%; latest report showed 420 HTML article identities still missing Markdown.
- Folder merge report showed many candidate adds, especially from `Double Check`, `_ASSETS`, backups, and archives; these need filtering before any bulk merge.

---

## Change Log

| Date | Change | Agent |
|------|--------|-------|
| 2026-07-21 | Six-agent session: CSS CDN remediation, MTL fixes, labeler audit | Multi-agent |
| 2026-07-24 | Site-data synthesis reports created: identity map, exact/variant analysis, best-candidate staging plan, Markdown coverage, folder merge gaps | GPT 1 / Codex |
