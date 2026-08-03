# Lean 4 Excel Claim Reconciliation

Generated: 2026-08-03

Active workbook: `H:\Desktop\LEAN4_OPEN_THIS_ONE\OPEN_THIS_ONE__Lean4_CANONICAL_LEDGER_V2.xlsx`
Validated atom ledger count: 268

## Bottom Line

The Excel-era claim/theorem pool is not fully done. The validated atom ledger is clean, but the workbook/CSV recovery sources contain more rows than the current promoted atom count, and many rows remain pending, missing-from-workbook, or only conservatively matched.

## Counts

- Active workbook named candidate rows: 1141
- Canonical ledger rows: 884
- Canonical ledger unique theorem names: 884
- Missing-from-workbook rows: 756
- Missing-from-workbook unique names: 356
- Owner queue rows: 408
- Owner queue unique names: 408

## Compile Status In Canonical Ledger

- PENDING_NOT_RUN: 884

## Public Count Buckets

- SCAFFOLDING_NOT_PUBLIC_COUNT: 301
- UNIQUE_THEOREM_PENDING_COMPILE: 270
- CANONICAL_THEOREM_DEDUPED_PENDING_COMPILE: 228
- LOW_CONTENT_TRUE_NOT_PUBLIC_COUNT: 85

## Proof Strength Counts

- DECLARATION_OR_UNKNOWN: 399
- DEFINITIONAL_RFL: 157
- WRAPPER_OR_IMPORTED: 110
- TRIVIAL_TRUE: 85
- SIMPLIFICATION: 81
- SUBSTANTIVE_OR_CASE_PROOF: 26
- FINITE_DECIDABLE: 26

## Workbook Sheets

| Sheet | Nonempty Rows | First Headers |
|---|---:|---|
| LEAN_CANONICAL_LEDGER_V2 | 270 | claim_id; public_claim_text; claim_type; definition_status; parent; symmetry; charge; meaning |
| V2_REPAIR_SUMMARY | 25 | metric; value |
| START HERE | 10 | Lean Workbook Alignment Package;  |
| Structural Staging | 270 | Claim_ID; Theorem_Name; Claim_Class; Evidence_Rung; Proof_Strength; Public_Claim_Risk; Exact_Lean_Source; Lean_Line |
| Workbook Alignment | 270 | workbook; sheet; row_number; thm_number; layer; lean_file; theorem_name; what_it_says |
| Missing From Workbook | 349 | repo; file; line; name; statement; proof_head; proof_strength; risk_note |
| Embedded Add List | 42 | Source File; Bucket; Proposed Sheet; Lane/Stage; Role / What It Adds; Claim Type; Status / Strength; Overclaim Guard |
| False Positive Queue | 10 | Right Claim; Wrong Model #; Wrong / Rival Model; Why It Seems Plausible; Constraint Failed; Lean/Test Anchor; Result / Needed Work; Status |
| Open Guards | 6 | Source File; Bucket; Proposed Sheet; Lane/Stage; Role / What It Adds; Claim Type; Status / Strength; Overclaim Guard |
| Proof Strength Summary | 7 | Proof Strength; Count |
| Canonical Summary | 8 | Lean Canonical Ledger Summary; ; ; ; ; ; ;  |
| LEAN_CANONICAL_LEDGER | 886 | LEAN_CANONICAL_LEDGER; ; ; ; ; ; ;  |
| Load Bearing Controls | 9 | Load-Bearing Controls; ; ; ; ; ; ;  |
| Recovered Missing Names | 173 | Recovered Missing Names; ; ; ; ; ; ;  |
| Python Colab Audit | 34 | Python / Colab Runtime Support Audit; ; ; ; ; ; ;  |

## Sample Canonical Names Not Directly Seen In Atom Text

This is a conservative exact-text check. A row may still be represented by a broader atom, but it is not one-to-one reconciled yet.

- `ActualizationRole`
- `ActualizationSystem`
- `AntiFruit`
- `AntiLagrangian`
- `ArmorPiece`
- `Beatitude`
- `BridgeFailure`
- `BridgeMechanism`
- `BridgeTendency`
- `Brokenness`
- `C0_ne_C1`
- `C1_ne_C0`
- `CDSignature`
- `CGate`
- `C_op_converts_negative_to_positive`
- `C_op_converts_neutral_to_positive`
- `C_op_keeps_positive_positive`
- `C_op_preserves_negative_history_even_after_positive_output`
- `C_op_preserves_record_mark`
- `C_op_preserves_source_state`
- `C_zero_collapses_chi`
- `Channel`
- `ChannelScore`
- `ClaimLayer`
- `ClaimState`
- `ClaimType`
- `CoherenceOperator`
- `CoherenceProfile`
- `ConditionalPattern`
- `ConsentedTransform`

## Recommendation

Continue. Promote claims in batches: first public-count-eligible compiled theorems, then missing-from-workbook recovery rows, then owner-queue duplicate cleanup, then theology document candidate atoms.

