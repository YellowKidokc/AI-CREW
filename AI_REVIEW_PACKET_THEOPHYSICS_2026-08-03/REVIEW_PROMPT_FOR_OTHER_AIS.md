# Prompt For AI Reviewers

You are reviewing a Theophysics / POF 2828 research packet.

Please read the packet as a critic, not as a supporter.

Your task:

1. Identify the strongest claims.
2. Identify the weakest or most overclaimed claims.
3. Separate formal proof, science evidence, philosophical argument, theology, bridge language, analogy, and speculation.
4. State the best hostile objection.
5. Rate each major article from 0-10.
6. Recommend what should be kept, guarded, downgraded, tested more, rewritten, or cut.
7. Suggest Lean, Python/Colab, empirical, or textual tests.
8. Note any claims that should remain unchanged despite discomfort, if they are central and properly classified.

Core boundary:

Do not review this as though it claims "physics proves the Trinity." The packet explicitly rejects that claim. If you find places where the text violates that boundary, flag them clearly.

Please use this output shape:

```markdown
# AI Review

## Overall Rating

Score:
Confidence:
One-sentence summary:

## Strongest Claims

## Weakest / Most Dangerous Claims

## Best Hostile Objection

## Article Ratings

### The Science Argument
Score:
Keep:
Downgrade:
Cut:
Test more:

### The Root Speaks / I AM
Score:
Keep:
Downgrade:
Cut:
Test more:

### The Mirror / Consciousness
Score:
Keep:
Downgrade:
Cut:
Test more:

## Claim-Type Hygiene

## Lean / Formalization Suggestions

## Python / Colab / Empirical Suggestions

## Objection Table

| Claim | Severity | Objection | Recommended Action |
|---|---|---|---|

## Final Recommendation
```

