# Lean 4 P1 Direct Lean Results

Generated: 2026-08-03

Unique files checked: 9
Files passed: 4
Files failed: 5
P1 theorem rows covered by passed files: 15
P1 theorem rows blocked by failed files: 37

| Status | File | Theorem Rows | First Error |
|---|---|---:|---|
| FAIL | `H:\Desktop 2\LEAN 4\GPT\_SORTED_LANE4\00_KERNEL_VERIFIED\Theophysics_NegativeInventory.lean` | 8 | H:\Desktop 2\LEAN 4\GPT\_SORTED_LANE4\00_KERNEL_VERIFIED\Theophysics_NegativeInventory.lean:1:0: error: unknown module prefix 'Theophysics_Core' |
| PASS | `H:\Desktop 2\LEAN 4\Google CoLab Python\_EXTRACTED_REPOS\Lean-4-Proofs-main\Lean-4-Proofs-main\theophysics-lean-verification-package\COPY_PASTE_LEAN4.lean` | 1 |  |
| PASS | `H:\Desktop 2\LEAN 4\Google CoLab Python\_EXTRACTED_REPOS\Lean-4-Proofs-main\Lean-4-Proofs-main\theophysics-lean-verification-package\CorrectedEntropyKernel.lean` | 1 |  |
| PASS | `H:\Desktop 2\LEAN 4\Google CoLab Python\_EXTRACTED_REPOS\Lean-4-Proofs-main\Lean-4-Proofs-main\theophysics-lean-verification-package\FruitsGraceKernel.lean` | 9 |  |
| FAIL | `H:\Desktop 2\LEAN 4\Google CoLab Python\_EXTRACTED_REPOS\Lean-4-Proofs-main\Lean-4-Proofs-main\theophysics-lean-verification-package\narrow_product_test\NarrowProductTest\Basic.lean` | 9 | H:\Desktop 2\LEAN 4\Google CoLab Python\_EXTRACTED_REPOS\Lean-4-Proofs-main\Lean-4-Proofs-main\theophysics-lean-verification-package\narrow_product_test\NarrowProductTest\Basic.lea |
| PASS | `H:\Desktop\LEAN4_RECOVERY_PACKET_2026-08-01\PRIMARY_SOURCE_theophysics-lean-main\Final_Lean4_From_Excel.lean` | 4 | H:\Desktop\LEAN4_RECOVERY_PACKET_2026-08-01\PRIMARY_SOURCE_theophysics-lean-main\Final_Lean4_From_Excel.lean:126:2: warning: Try `simp at h` instead of `simpa using h` |
| FAIL | `H:\Desktop\LEAN4_RECOVERY_PACKET_2026-08-01\PRIMARY_SOURCE_theophysics-lean-main\Theophysics_Adversarial.lean` | 2 | H:\Desktop\LEAN4_RECOVERY_PACKET_2026-08-01\PRIMARY_SOURCE_theophysics-lean-main\Theophysics_Adversarial.lean:1:0: error: unknown module prefix 'Theophysics_Core' |
| FAIL | `H:\Desktop\LEAN4_RECOVERY_PACKET_2026-08-01\PRIMARY_SOURCE_theophysics-lean-main\Theophysics_Canonization.lean` | 11 | H:\Desktop\LEAN4_RECOVERY_PACKET_2026-08-01\PRIMARY_SOURCE_theophysics-lean-main\Theophysics_Canonization.lean:27:0: error: unknown module prefix 'Mathlib' |
| FAIL | `H:\Desktop\LEAN4_RECOVERY_PACKET_2026-08-01\PRIMARY_SOURCE_theophysics-lean-main\Theophysics_Universality.lean` | 7 | H:\Desktop\LEAN4_RECOVERY_PACKET_2026-08-01\PRIMARY_SOURCE_theophysics-lean-main\Theophysics_Universality.lean:1:0: error: unknown module prefix 'Theophysics_LawMechanisms' |

## Passed Theorem Rows

### `COPY_PASTE_LEAN4.lean`
- `grace_idempotent`

### `CorrectedEntropyKernel.lean`
- `c_is_factor`

### `FruitsGraceKernel.lean`
- `love_mem`
- `joy_mem`
- `peace_mem`
- `patience_mem`
- `kindness_mem`
- `goodness_mem`
- `faithfulness_mem`
- `gentleness_mem`
- `not_allManifest_of_someMissing`

### `Final_Lean4_From_Excel.lean`
- `Q_nonzero_not_sufficient_for_positive_chi`
- `grace_swapped_with_faith_invalid`
- `entropy_swapped_with_grace_invalid`
- `burden_two_negatives_stay_negative`

## Failed File Details

### `H:\Desktop 2\LEAN 4\GPT\_SORTED_LANE4\00_KERNEL_VERIFIED\Theophysics_NegativeInventory.lean`

```text
H:\Desktop 2\LEAN 4\GPT\_SORTED_LANE4\00_KERNEL_VERIFIED\Theophysics_NegativeInventory.lean:1:0: error: unknown module prefix 'Theophysics_Core'

No directory 'Theophysics_Core' or file 'Theophysics_Core.olean' in the search path entries:
c:\Users\David\.elan\toolchains\leanprover--lean4---v4.29.0\lib\lean
```

### `H:\Desktop 2\LEAN 4\Google CoLab Python\_EXTRACTED_REPOS\Lean-4-Proofs-main\Lean-4-Proofs-main\theophysics-lean-verification-package\narrow_product_test\NarrowProductTest\Basic.lean`

```text
H:\Desktop 2\LEAN 4\Google CoLab Python\_EXTRACTED_REPOS\Lean-4-Proofs-main\Lean-4-Proofs-main\theophysics-lean-verification-package\narrow_product_test\NarrowProductTest\Basic.lean:1:0: error: unknown module prefix 'Mathlib'

No directory 'Mathlib' or file 'Mathlib.olean' in the search path entries:
c:\Users\David\.elan\toolchains\leanprover--lean4---v4.29.1\lib\lean
```

### `H:\Desktop\LEAN4_RECOVERY_PACKET_2026-08-01\PRIMARY_SOURCE_theophysics-lean-main\Theophysics_Adversarial.lean`

```text
H:\Desktop\LEAN4_RECOVERY_PACKET_2026-08-01\PRIMARY_SOURCE_theophysics-lean-main\Theophysics_Adversarial.lean:1:0: error: unknown module prefix 'Theophysics_Core'

No directory 'Theophysics_Core' or file 'Theophysics_Core.olean' in the search path entries:
c:\Users\David\.elan\toolchains\leanprover--lean4---v4.32.0-rc1\lib\lean
```

### `H:\Desktop\LEAN4_RECOVERY_PACKET_2026-08-01\PRIMARY_SOURCE_theophysics-lean-main\Theophysics_Canonization.lean`

```text
H:\Desktop\LEAN4_RECOVERY_PACKET_2026-08-01\PRIMARY_SOURCE_theophysics-lean-main\Theophysics_Canonization.lean:27:0: error: unknown module prefix 'Mathlib'

No directory 'Mathlib' or file 'Mathlib.olean' in the search path entries:
c:\Users\David\.elan\toolchains\leanprover--lean4---v4.32.0-rc1\lib\lean
```

### `H:\Desktop\LEAN4_RECOVERY_PACKET_2026-08-01\PRIMARY_SOURCE_theophysics-lean-main\Theophysics_Universality.lean`

```text
H:\Desktop\LEAN4_RECOVERY_PACKET_2026-08-01\PRIMARY_SOURCE_theophysics-lean-main\Theophysics_Universality.lean:1:0: error: unknown module prefix 'Theophysics_LawMechanisms'

No directory 'Theophysics_LawMechanisms' or file 'Theophysics_LawMechanisms.olean' in the search path entries:
c:\Users\David\.elan\toolchains\leanprover--lean4---v4.32.0-rc1\lib\lean
```

