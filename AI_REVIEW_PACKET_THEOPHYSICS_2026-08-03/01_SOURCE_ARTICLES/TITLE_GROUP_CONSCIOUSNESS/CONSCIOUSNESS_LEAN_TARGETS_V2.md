# Consciousness Lean Targets V2

Status: target specification, not implementation  
Purpose: identify what Lean can test without pretending to prove consciousness.

## Boundary

Lean can verify conditional structure inside declared definitions and assumptions.

Lean cannot prove that a human, animal, AI, soul, or field is conscious unless consciousness is introduced as a predicate or premise. Any theorem using `Conscious` must be labeled as conditional on the definitions supplied.

## Target 1 - Dependency Skeleton

Goal: prove component necessity.

```lean
structure ConsciousModel (X : Type) where
  Rep : X -> Prop
  SelfRef : X -> Prop
  Oriented : X -> Prop
  Conscious : X -> Prop
  conscious_def : forall x, Conscious x -> Rep x /\ SelfRef x /\ Oriented x
```

Expected theorems:

- `no_conscious_without_rep`
- `no_conscious_without_self_ref`
- `no_conscious_without_orientation`

Proof class: Lean-testable conditional dependency.

## Target 2 - Internal Regress Exit Typology

Goal: formalize the fork without claiming the real mind is fully captured.

```lean
inductive GroundingExit
  | infiniteRegress
  | bruteTerminus
  | selfGroundingTerminus
```

Predicates:

- `Explains : GroundingExit -> Prop`
- `AdequateGrounding : GroundingExit -> Prop`
- `DifferentiatedUnity : GroundingExit -> Prop`

Expected theorems:

- infinite regress is not adequate under `NoInfiniteGrounding`
- brute terminus is not adequate under `NoBruteStopping`
- self-grounding terminus is the only adequate exit under the declared adequacy axioms

Proof class: formal taxonomy / conditional elimination.

## Target 3 - Triad Coupling Gate

Goal: preserve the secular triad objection as a real test.

Definitions:

- `RoleProfile`
- `DistinctRoles`
- `CouplingInvariant`
- `DynamicRelation`
- `PreservesGate`
- `MalformedTriad`

Expected theorem shape:

```lean
theorem fails_gate_if_no_coupling
  (t : Triad) : Not (CouplingInvariant t) -> Not (PreservesGate t)
```

Use cases:

- Test substrate/law/decoherence.
- Test knower/known/knowing-act.
- Make the objection earn its verdict by the same gate used elsewhere.

Proof class: Lean-testable gate behavior.

## Target 4A - Stage 4-5 Definitional Wiring

Goal: expose which conclusions are merely definitional.

Definitions:

- `Potential`
- `Actual`
- `Operator`
- `Applies`
- `Agency`
- `DeterministicSelfEvolution`
- `VoluntaryCoupling`

Definitional theorem target:

```lean
theorem no_voluntary_coupling_without_agency_by_definition
  (s : System) :
  VoluntaryCoupling s -> Agency s
```

Status: allowed only as a transparency theorem. If `VoluntaryCoupling` includes agency by definition, this proves dependency bookkeeping, not the philosophical claim.

Proof class: definitional consequence.

## Target 4B - Stage 4-5 Substantive Agency Gap

Goal: prove what agency adds that deterministic self-evolution lacks, if the framework can state that property non-circularly.

Candidate added predicates:

- `CounterfactualSelection`
- `NormativeOrientation`
- `ResponsibilityBearing`
- `ExternalCoupling`
- `VoluntaryReception`

Open theorem target:

```lean
theorem deterministic_self_evolution_lacks_agency_marker
  (s : System) :
  DeterministicSelfEvolution s ->
  Not (CounterfactualSelection s /\ NormativeOrientation s)
```

Alternate theorem target:

```lean
theorem deterministic_self_evolution_insufficient_for_voluntary_coupling
  (s : System) :
  DeterministicSelfEvolution s ->
  LacksAgencyMarker s ->
  Not (VoluntaryCoupling s)
```

Status: not yet justified. These theorems should not be added until the agency marker is chosen and the definitions make the claim non-circular.

Repair question:

What property does agency add that deterministic self-evolution cannot provide: counterfactual selection, normative orientation, responsibility, external coupling, or something else?

## Target 5 - Ladder Rung Consequences

Goal: formalize consequences after O, G, S, and C are model variables.

Definitions:

- `O : Rung -> Real`
- `G : Rung -> ExtendedReal`
- `S : Rung -> Real`
- `C : Rung -> Real`
- `VoluntaryCoupling r := O r > 0`
- `NoVoluntaryCoupling r := O r = 0`

Expected theorems:

- `O_eq_zero_no_voluntary_coupling`
- `O_pos_has_voluntary_coupling`
- `zero_grace_no_growth_term`
- `zero_orientation_blocks_coupling`

Proof class: algebraic/model consequence only.

## Target 6 - Quarantine Guards

Goal: prevent old overclaims from compiling into canon modules.

Potential Lean names:

- `EquilibriumConditions`
- `NonConsciousField`
- `SatisfiesEquilibrium`
- `DiscriminatesConsciousness`

Expected theorem:

```lean
theorem equilibrium_conditions_do_not_discriminate
  (f : Field) :
  NonConsciousField f ->
  SatisfiesEquilibrium f ->
  Not (DiscriminatesConsciousness EquilibriumConditions)
```

This can encode the ledger ruling: the old scalar-field argument cannot derive consciousness because a non-conscious field satisfies the same equilibrium conditions.

## Naming Rule

Use theorem names that tell the honesty boundary:

- good: `conscious_requires_orientation_under_model`
- good: `self_grounding_unique_under_adequacy_axioms`
- good: `equilibrium_conditions_do_not_discriminate`
- bad: `consciousness_proved`
- bad: `trinity_proves_mind`
- bad: `scalar_field_derives_consciousness`

## Build Label

Any future Lean module should carry this label in the header:

> Conditional structural formalization. This file proves consequences of declared definitions; it does not prove consciousness exists or solve the hard problem.
