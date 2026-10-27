# CHAIN_INTEGRITY_COMPOSITION_TEST_CODEX

## Test

Does:

```text
God -> Physics
```

equal:

```text
God -> Math -> Physics
```

for the Cluster 1 modal properties?

## Lean File

```text
ModalChainIntegrity.lean
```

## Result

```text
ModalChainIntegrity.lean: pass axioms=0 sorries=0 theorems=6
```

## Theorems

```text
modal_cluster_count
canonical_modal_chain_commutes
drift_chain_fails_on_eternal
drift_chain_does_not_commute
full_profile_hides_drift
ablated_profile_exposes_drift
```

## Finding

The canonical encoded chain commutes only because the maps are identity maps.
That is useful as a baseline, but it is not enough for semantic proof.

The negative control is more important:

```text
If Math -> Physics collapses Eternal into Necessary, the chain no longer
commutes.
```

The drift test proves that chain integrity can fail even when all domains appear
to contain the same full property list.

## Required Future Test

Every cluster needs:

```text
1. property-level map
2. direct God -> Physics map
3. composite God -> Math -> Physics map
4. proof that direct = composite
5. drifted negative control
6. ablated profile test
```

Without ablation, a full all-true profile can hide equivocation.

