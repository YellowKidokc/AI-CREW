# Lean 4 Excel Promotion Queue

Generated: 2026-08-03

Source: `H:\Desktop\LEAN4_OPEN_THIS_ONE\LEAN_CANONICAL_LEDGER.csv`

## Purpose

This queue identifies Excel-era theorem rows that are marked public-count-eligible after compile, but are not yet treated as completed Lane 4 atoms. They need batch compilation, dedupe, negative guards, and receipt attachment before promotion.

## Counts

- Total promotion candidates: 498
- P2_compile_and_group: 238
- P3_trace_underlying_theorem: 110
- P4_review_before_public_count: 98
- P1_compile_and_promote_first: 52

## Proof Strengths In Queue

- DEFINITIONAL_RFL: 157
- WRAPPER_OR_IMPORTED: 110
- DECLARATION_OR_UNKNOWN: 98
- SIMPLIFICATION: 81
- FINITE_DECIDABLE: 26
- SUBSTANTIVE_OR_CASE_PROOF: 26

## Top Source Files

- `theophysics-lean-main\theophysics-lean-main\Theophysics_Adversarial.lean`: 89
- `theophysics-lean-main\theophysics-lean-main\Theophysics_Core.lean`: 54
- `theophysics-lean-main\theophysics-lean-main\Theophysics_Universality.lean`: 44
- `theophysics-lean-main\theophysics-lean-main\Theophysics_LawMechanisms.lean`: 39
- `theophysics-lean-main\theophysics-lean-main\Theophysics_Canonization.lean`: 35
- `Lean-4-Proofs-main\Lean-4-Proofs-main\theophysics-lean-verification-package\CorrectedEntropyKernel.lean`: 27
- `Lean-4-Proofs-main\Lean-4-Proofs-main\theophysics-lean-verification-package\narrow_product_test\NarrowProductTest\Basic.lean`: 24
- `theophysics-lean-main\theophysics-lean-main\Final_Lean4_From_Excel.lean`: 23
- `theophysics-lean-main\theophysics-lean-main\Theophysics_ChiEvaluator.lean`: 23
- `Faith-Thru-Physics-Lean-4--main\Faith-Thru-Physics-Lean-4--main\Theophysics_NegativeInventory.lean`: 21
- `theophysics-lean-main\theophysics-lean-main\Theophysics_DelayedChoice.lean`: 16
- `theophysics-lean-main\theophysics-lean-main\Theophysics_GodTest.lean`: 16
- `Lean-4-Proofs-main\Lean-4-Proofs-main\theophysics-lean-verification-package\FruitsGraceKernel.lean`: 15
- `theophysics-lean-main\theophysics-lean-main\Theophysics_DeathTest.lean`: 15
- `theophysics-lean-main\theophysics-lean-main\Theophysics_Coherence.lean`: 13

## First 40 Candidates

| Priority | Theorem | Strength | Source | Line |
|---|---|---|---|---:|
| P1_compile_and_promote_first | `nine_maxed_one_zero_fails` | FINITE_DECIDABLE | `Faith-Thru-Physics-Lean-4--main\Faith-Thru-Physics-Lean-4--main\Theophysics_NegativeInventory.lean` | 46 |
| P1_compile_and_promote_first | `neg_plus_neg_not_redeemed` | FINITE_DECIDABLE | `Faith-Thru-Physics-Lean-4--main\Faith-Thru-Physics-Lean-4--main\Theophysics_NegativeInventory.lean` | 153 |
| P1_compile_and_promote_first | `reanimation_only_rejected` | FINITE_DECIDABLE | `Faith-Thru-Physics-Lean-4--main\Faith-Thru-Physics-Lean-4--main\Theophysics_NegativeInventory.lean` | 229 |
| P1_compile_and_promote_first | `memory_erasure_rejected` | FINITE_DECIDABLE | `Faith-Thru-Physics-Lean-4--main\Faith-Thru-Physics-Lean-4--main\Theophysics_NegativeInventory.lean` | 232 |
| P1_compile_and_promote_first | `symbolic_only_rejected` | FINITE_DECIDABLE | `Faith-Thru-Physics-Lean-4--main\Faith-Thru-Physics-Lean-4--main\Theophysics_NegativeInventory.lean` | 235 |
| P1_compile_and_promote_first | `non_identity_replacement_rejected` | FINITE_DECIDABLE | `Faith-Thru-Physics-Lean-4--main\Faith-Thru-Physics-Lean-4--main\Theophysics_NegativeInventory.lean` | 238 |
| P1_compile_and_promote_first | `pure_repair_without_return_rejected` | FINITE_DECIDABLE | `Faith-Thru-Physics-Lean-4--main\Faith-Thru-Physics-Lean-4--main\Theophysics_NegativeInventory.lean` | 241 |
| P1_compile_and_promote_first | `every_return_guard_is_load_bearing` | FINITE_DECIDABLE | `Faith-Thru-Physics-Lean-4--main\Faith-Thru-Physics-Lean-4--main\Theophysics_NegativeInventory.lean` | 246 |
| P1_compile_and_promote_first | `grace_idempotent` | SUBSTANTIVE_OR_CASE_PROOF | `Lean-4-Proofs-main\Lean-4-Proofs-main\theophysics-lean-verification-package\COPY_PASTE_LEAN4.lean` | 82 |
| P1_compile_and_promote_first | `c_is_factor` | FINITE_DECIDABLE | `Lean-4-Proofs-main\Lean-4-Proofs-main\theophysics-lean-verification-package\CorrectedEntropyKernel.lean` | 36 |
| P1_compile_and_promote_first | `love_mem` | FINITE_DECIDABLE | `Lean-4-Proofs-main\Lean-4-Proofs-main\theophysics-lean-verification-package\FruitsGraceKernel.lean` | 44 |
| P1_compile_and_promote_first | `joy_mem` | FINITE_DECIDABLE | `Lean-4-Proofs-main\Lean-4-Proofs-main\theophysics-lean-verification-package\FruitsGraceKernel.lean` | 45 |
| P1_compile_and_promote_first | `peace_mem` | FINITE_DECIDABLE | `Lean-4-Proofs-main\Lean-4-Proofs-main\theophysics-lean-verification-package\FruitsGraceKernel.lean` | 46 |
| P1_compile_and_promote_first | `patience_mem` | FINITE_DECIDABLE | `Lean-4-Proofs-main\Lean-4-Proofs-main\theophysics-lean-verification-package\FruitsGraceKernel.lean` | 47 |
| P1_compile_and_promote_first | `kindness_mem` | FINITE_DECIDABLE | `Lean-4-Proofs-main\Lean-4-Proofs-main\theophysics-lean-verification-package\FruitsGraceKernel.lean` | 48 |
| P1_compile_and_promote_first | `goodness_mem` | FINITE_DECIDABLE | `Lean-4-Proofs-main\Lean-4-Proofs-main\theophysics-lean-verification-package\FruitsGraceKernel.lean` | 49 |
| P1_compile_and_promote_first | `faithfulness_mem` | FINITE_DECIDABLE | `Lean-4-Proofs-main\Lean-4-Proofs-main\theophysics-lean-verification-package\FruitsGraceKernel.lean` | 50 |
| P1_compile_and_promote_first | `gentleness_mem` | FINITE_DECIDABLE | `Lean-4-Proofs-main\Lean-4-Proofs-main\theophysics-lean-verification-package\FruitsGraceKernel.lean` | 51 |
| P1_compile_and_promote_first | `not_allManifest_of_someMissing` | SUBSTANTIVE_OR_CASE_PROOF | `Lean-4-Proofs-main\Lean-4-Proofs-main\theophysics-lean-verification-package\FruitsGraceKernel.lean` | 101 |
| P1_compile_and_promote_first | `c_is_factor_A` | FINITE_DECIDABLE | `Lean-4-Proofs-main\Lean-4-Proofs-main\theophysics-lean-verification-package\narrow_product_test\NarrowProductTest\Basic.lean` | 13 |
| P1_compile_and_promote_first | `c_is_factor_B` | FINITE_DECIDABLE | `Lean-4-Proofs-main\Lean-4-Proofs-main\theophysics-lean-verification-package\narrow_product_test\NarrowProductTest\Basic.lean` | 16 |
| P1_compile_and_promote_first | `chiLocal_not_factor_A` | FINITE_DECIDABLE | `Lean-4-Proofs-main\Lean-4-Proofs-main\theophysics-lean-verification-package\narrow_product_test\NarrowProductTest\Basic.lean` | 19 |
| P1_compile_and_promote_first | `chiLocal_not_factor_B` | FINITE_DECIDABLE | `Lean-4-Proofs-main\Lean-4-Proofs-main\theophysics-lean-verification-package\narrow_product_test\NarrowProductTest\Basic.lean` | 22 |
| P1_compile_and_promote_first | `restForG_nonneg` | SUBSTANTIVE_OR_CASE_PROOF | `Lean-4-Proofs-main\Lean-4-Proofs-main\theophysics-lean-verification-package\narrow_product_test\NarrowProductTest\Basic.lean` | 100 |
| P1_compile_and_promote_first | `restForSProd_nonneg` | SUBSTANTIVE_OR_CASE_PROOF | `Lean-4-Proofs-main\Lean-4-Proofs-main\theophysics-lean-verification-package\narrow_product_test\NarrowProductTest\Basic.lean` | 126 |
| P1_compile_and_promote_first | `mEff_nonneg` | SUBSTANTIVE_OR_CASE_PROOF | `Lean-4-Proofs-main\Lean-4-Proofs-main\theophysics-lean-verification-package\narrow_product_test\NarrowProductTest\Basic.lean` | 252 |
| P1_compile_and_promote_first | `mEff_le_one` | SUBSTANTIVE_OR_CASE_PROOF | `Lean-4-Proofs-main\Lean-4-Proofs-main\theophysics-lean-verification-package\narrow_product_test\NarrowProductTest\Basic.lean` | 256 |
| P1_compile_and_promote_first | `mEff_pos` | SUBSTANTIVE_OR_CASE_PROOF | `Lean-4-Proofs-main\Lean-4-Proofs-main\theophysics-lean-verification-package\narrow_product_test\NarrowProductTest\Basic.lean` | 260 |
| P1_compile_and_promote_first | `Q_nonzero_not_sufficient_for_positive_chi` | SUBSTANTIVE_OR_CASE_PROOF | `theophysics-lean-main\theophysics-lean-main\Final_Lean4_From_Excel.lean` | 122 |
| P1_compile_and_promote_first | `grace_swapped_with_faith_invalid` | FINITE_DECIDABLE | `theophysics-lean-main\theophysics-lean-main\Final_Lean4_From_Excel.lean` | 202 |
| P1_compile_and_promote_first | `entropy_swapped_with_grace_invalid` | FINITE_DECIDABLE | `theophysics-lean-main\theophysics-lean-main\Final_Lean4_From_Excel.lean` | 206 |
| P1_compile_and_promote_first | `burden_two_negatives_stay_negative` | FINITE_DECIDABLE | `theophysics-lean-main\theophysics-lean-main\Final_Lean4_From_Excel.lean` | 339 |
| P1_compile_and_promote_first | `full_Q_nonzero_not_sufficient` | FINITE_DECIDABLE | `theophysics-lean-main\theophysics-lean-main\Theophysics_Adversarial.lean` | 350 |
| P1_compile_and_promote_first | `full_R_gate_required` | FINITE_DECIDABLE | `theophysics-lean-main\theophysics-lean-main\Theophysics_Adversarial.lean` | 354 |
| P1_compile_and_promote_first | `spirit_positive_iff` | SUBSTANTIVE_OR_CASE_PROOF | `theophysics-lean-main\theophysics-lean-main\Theophysics_Canonization.lean` | 93 |
| P1_compile_and_promote_first | `kappa_screening` | SUBSTANTIVE_OR_CASE_PROOF | `theophysics-lean-main\theophysics-lean-main\Theophysics_Canonization.lean` | 145 |
| P1_compile_and_promote_first | `chiRatio_gt_one_iff` | SUBSTANTIVE_OR_CASE_PROOF | `theophysics-lean-main\theophysics-lean-main\Theophysics_Canonization.lean` | 190 |
| P1_compile_and_promote_first | `conjugate_transfer` | SUBSTANTIVE_OR_CASE_PROOF | `theophysics-lean-main\theophysics-lean-main\Theophysics_Canonization.lean` | 373 |
| P1_compile_and_promote_first | `finite_ordering_source_cannot_perfect_coherence` | SUBSTANTIVE_OR_CASE_PROOF | `theophysics-lean-main\theophysics-lean-main\Theophysics_Canonization.lean` | 452 |
| P1_compile_and_promote_first | `finite_source_raises_floor` | SUBSTANTIVE_OR_CASE_PROOF | `theophysics-lean-main\theophysics-lean-main\Theophysics_Canonization.lean` | 461 |

