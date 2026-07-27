# Theophysics Site Data Handoff

tags: #ai-handoff #theophysics #site-data #faiththruphysics #canonical

---

## Start Here

This is the handoff for the FaithThroughPhysics / Theophysics site-data consolidation.

If David points you to "the AI folder" and says to look for **Theophysics Site Data**, this is the file.

## Keeper Folder

The canonical/base folder is:

`E:\exports\FaithThroughPhysics_D_Drive_Consolidation\files\faiththruphysics-site`

This is the biggest site-data folder and should be treated as the keeper/vault/base.

Do not replace this folder wholesale.

## Comparison Folders

Use these sibling folders only as comparison/merge sources:

- `E:\exports\FaithThroughPhysics_D_Drive_Consolidation\files\faiththruphysics-site-v2`
- `E:\exports\FaithThroughPhysics_D_Drive_Consolidation\files\faiththruphysics-site-v2-fresh`
- `E:\exports\FaithThroughPhysics_D_Drive_Consolidation\files\faiththruphysics-site_backup_20260604_204547`

## Main Status File

Read this next:

`E:\exports\FaithThroughPhysics_D_Drive_Consolidation\files\faiththruphysics-site\_synthesis-review\CANONICAL_SITE_DATA_STATUS.md`

That file summarizes the current state and points to the working reports.

## Key Reports

Inside:

`faiththruphysics-site\_synthesis-review\`

Read these:

- `identity-map\MASTER_HTML_IDENTITY_MAP_DEDUPED.csv`
- `best-candidates\BEST_CANDIDATES.csv`
- `human-review\HUMAN_REVIEW_REQUIRED.csv`
- `conversion-coverage\HTML_MISSING_MARKDOWN.csv`
- `conversion-coverage\COVERAGE_REPORT.md`
- `folder-merge\CANDIDATE_ADD_TO_BASE.csv`
- `folder-merge\CANDIDATE_COMPARE_VERSIONS.csv`
- `folder-merge\FOLDER_MERGE_REPORT.md`

## Current Numbers

Latest known synthesis status:

- Deduped HTML rows mapped: 8,586
- Multi-version HTML identities: 806
- Best-candidate recommendations: 558
- Human-review HTML recommendations: 248
- HTML article identities still missing Markdown: 420
- Candidate files to add into base: 28,019
- Same logical path but different version/hash: 432

## What David Wants

David wants one canonical site-data folder.

The practical goal:

1. Keep `faiththruphysics-site` as the base.
2. Compare the other copied folders against it.
3. Pick the best-looking finished HTML page article-by-article.
4. Stage winners before replacing anything.
5. Move losing/superseded versions into review/archive, not permanent delete.
6. Keep pushing toward Markdown as the long-term clean source.

Markdown rebuild choices should stay aligned with the metadata pipeline contract:

`C:\theophysics\_INBOX\MASTER_METADATA_CONTRACT_v1.md`

For choosing the best HTML version, prioritize how the page actually looks and reads:

- complete article body
- tight finished layout
- correct media/images where expected
- good spacing and typography
- not a stub
- not a backup/test/template page
- not broken encoding

Topbar differences matter only a little. Do not pick a worse article just because it has a newer topbar.

## Do Not Do This

- Do not delete files permanently.
- Do not replace the base folder wholesale.
- Do not merge entire folders blindly.
- Do not assume one source folder is best for every article.
- Do not overwrite active base files without staging and review.

## Next Best Task

Start with the HTML winners:

1. Open `best-candidates\BEST_CANDIDATES.csv`.
2. Open `human-review\HUMAN_REVIEW_REQUIRED.csv`.
3. Stage the obvious best-looking HTML winners into:

`faiththruphysics-site\_synthesis-review\staged-best-html\`

4. Create a manifest of proposed replacements.
5. Only after review, copy approved staged winners into the keeper/base folder.

Replacement manifest columns:

`identity_slug,winner_path,loser_paths,reason,staged_path`

## Completion Signal

When finished, write back to the crew record:

1. Add a new sign-off in:

`D:\GitHub\ai-crew\SIGN-OFFS\`

2. Update:

`D:\GitHub\ai-crew\PROJECTS\faiththruphysics-site\STATUS.md`

The sign-off should say what was staged, what was not touched, what remains uncertain, and which file the next agent should read first.

## Coordination Record

Also see:

- `D:\GitHub\ai-crew\PROJECTS\faiththruphysics-site\STATUS.md`
- `D:\GitHub\ai-crew\SIGN-OFFS\2026-07-24-gpt1-site-data-synthesis.md`
