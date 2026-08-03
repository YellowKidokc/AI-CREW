# Sign-Off - 2026-07-27 - Kimi - Canon Guard Equation Catalog Batch

tags: #sign-off #kimi #theophysics #canon-guard #equations #mtl

---

## Session Focus

Improve and exercise `C:\theophysics\_scripts\canon_guard_v0.1.0\canon_guard` so it can catalog equations from `C:\theophysics\_INBOX\Master_Equation` with math translation layer entries.

## What Changed

- Updated `canon-manifest.toml` to support both the July 26 formal canonical Master Equation form (`χ(X) = C_W[∏ᵢ Xᵢ]`) and the older teaching/integral view as a declared `views` entry.
- Modified `canon_guard.py::compare_equations` to accept multiple normalized canonical forms per alias.
- Added `strict` mode to `extract_equations` plus `is_plausible_equation` heuristic to drop prose, glyph directives, HTML, Lean code, and tables.
- Fixed Windows stdout Unicode encoding in `canon_guard.py` and `equation_workflow.py`.
- Added helper scripts:
  - `batch_catalog.py` — creates pending review cases for all unknown equations from an extraction JSON.
  - `apply_batch_reviews.py` — applies a JSON review spec to pending cases.
  - `ratify_reviewed.py` — ratifies all reviewed cases (human override path).
- Extracted **1,547 unique equations** from `C:\theophysics\_INBOX\Master_Equation` and created pending cases.
- Reviewed and ratified the first **10** equations with math/plain/theological translations; added them to `equation-catalog.json`.
- Generated a non-mutating fix script for the one `drift` case (`∂ρ/∂t = Grace·Redemption·Covenant + ...`).

## What Was Verified

- `python -m pytest tests/` passes (5/5).
- `python equation_workflow.py scan ...` now runs without `PYTHONIOENCODING` and stops on the next unknown equation as expected.
- Catalog JSON is valid and contains 10 ratified entries.

## What Was Not Verified

- Did not review the remaining ~1,537 pending cases.
- Did not run the generated drift fix script against the source file.
- Did not scan the rest of `C:\theophysics\_INBOX` beyond `Master_Equation`.
- Did not verify whether the `english_word_count > 4` heuristic is too strict for legitimate equations with prose labels.

## Current Open Loops

- Continue reviewing pending cases in batches.
- Decide if more canonical aliases should be added before broad scanning (e.g., Lindblad, Shannon entropy, Einstein field equations).
- Run `fixes/fix_eq_d5069d9a5c3c.py` and inspect the proposed patch.
- Consider whether the full `_INBOX` should be scanned or whether Master_Equation should be finished first.

## Next Agent Should Start Here

`C:\theophysics\_scripts\canon_guard_v0.1.0\canon_guard\equation-catalog.json`

Then check `.canon-guard\equations\pending\` for the next batch of unreviewed cases.

## Personal Note

None.
