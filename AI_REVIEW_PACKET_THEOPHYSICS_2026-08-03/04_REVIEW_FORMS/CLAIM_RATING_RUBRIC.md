# Claim Rating Rubric

Use this rubric when rating candidate atoms or article claims.

## Evidence Level

| Score | Meaning |
|---:|---|
| 0 | Unsupported or incoherent. |
| 1 | Interesting phrase only. |
| 2 | Analogy with no guardrail. |
| 3 | Guarded analogy. |
| 4 | Plausible bridge claim. |
| 5 | Structured bridge with negative guards. |
| 6 | Finite model or local formal support. |
| 7 | Lean/Python/test-supported within declared model. |
| 8 | Multiple independent supports and clear limits. |
| 9 | Strong cross-domain convergence with falsification conditions. |
| 10 | Public-ready core claim with evidence, limits, and adversarial controls. |

## Claim Class Labels

Use one primary label:

- FORMAL_PROOF
- FINITE_MODEL
- PYTHON_TEST
- EMPIRICAL_SCIENCE
- PHILOSOPHICAL_ARGUMENT
- THEOLOGICAL_CLAIM
- BRIDGE_CANDIDATE
- STRUCTURAL_CORRESPONDENCE
- ANALOGY
- SPECULATION
- RHETORICAL_LANGUAGE
- OVERCLAIM

## Recommended Action Labels

- KEEP
- KEEP_WITH_GUARDRAIL
- DOWNGRADE
- REWRITE
- TEST_MORE
- SPLIT_CLAIM
- MOVE_TO_ANALOGY
- MOVE_TO_SPECULATION
- CUT

## Severity Labels

- S0: no issue
- S1: wording issue
- S2: needs guardrail
- S3: support gap
- S4: major overclaim
- S5: invalid or damaging claim

## Five Questions For Every Major Claim

1. What type of claim is this?
2. What evidence currently supports it?
3. What would falsify, weaken, or downgrade it?
4. Is the wording stronger than the evidence?
5. What is the cheapest honest test we can run next?

