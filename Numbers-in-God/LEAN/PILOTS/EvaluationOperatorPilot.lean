/-!
# Evaluation Operator Pilot

This file formalizes the E0-E4 layer:

E0: evaluation schema
E1: structural realization
E2: faithful realization
E3: adequate realization
E4: tridirectional convergence

It deliberately does not prove E5 grounding or E6 theological identification.
-/

universe uI uS uV uX

namespace Theophysics
namespace EvaluationOperatorPilot

structure EvaluationSystem where
  Input : Type uI
  Standard : Type uS
  Verdict : Type uV
  State : Type uX
  assess : Standard -> Input -> Verdict
  step : State -> Verdict -> State

structure EvaluationEvent (E : EvaluationSystem) where
  input : E.Input
  standard : E.Standard
  before : E.State
  verdict : E.Verdict
  after : E.State
  verdict_eq : verdict = E.assess standard input
  after_eq : after = E.step before verdict

theorem event_has_standard
    {E : EvaluationSystem}
    (event : EvaluationEvent E) :
    Nonempty E.Standard :=
  ⟨event.standard⟩

theorem no_event_without_standard
    {E : EvaluationSystem}
    (noStandard : E.Standard -> False) :
    EvaluationEvent E -> False :=
  fun event => noStandard event.standard

theorem standard_is_load_bearing
    {E : EvaluationSystem}
    (noStandard : E.Standard -> False) :
    ¬ Nonempty (EvaluationEvent E) := by
  intro h
  cases h with
  | intro event => exact no_event_without_standard noStandard event

structure Realization
    (Domain Pattern : EvaluationSystem) where
  mapInput : Domain.Input -> Pattern.Input
  mapStandard : Domain.Standard -> Pattern.Standard
  mapVerdict : Domain.Verdict -> Pattern.Verdict
  mapState : Domain.State -> Pattern.State
  preserves_assessment :
    ∀ standard input,
      mapVerdict (Domain.assess standard input) =
        Pattern.assess (mapStandard standard) (mapInput input)
  preserves_transition :
    ∀ state verdict,
      mapState (Domain.step state verdict) =
        Pattern.step (mapState state) (mapVerdict verdict)

structure FaithfulRealization
    (Domain Pattern : EvaluationSystem)
    extends Realization Domain Pattern where
  input_injective : Function.Injective mapInput
  standard_injective : Function.Injective mapStandard
  verdict_injective : Function.Injective mapVerdict
  state_injective : Function.Injective mapState

def Realization.comp
    {A B C : EvaluationSystem}
    (f : Realization A B)
    (g : Realization B C) :
    Realization A C where
  mapInput := g.mapInput ∘ f.mapInput
  mapStandard := g.mapStandard ∘ f.mapStandard
  mapVerdict := g.mapVerdict ∘ f.mapVerdict
  mapState := g.mapState ∘ f.mapState
  preserves_assessment := by
    intro standard input
    simp only [Function.comp_apply]
    rw [f.preserves_assessment]
    rw [g.preserves_assessment]
  preserves_transition := by
    intro state verdict
    simp only [Function.comp_apply]
    rw [f.preserves_transition]
    rw [g.preserves_transition]

structure TridirectionalWitness
    (Physics Cognition Normativity Pattern : EvaluationSystem) where
  physics_realizes : FaithfulRealization Physics Pattern
  cognition_realizes : FaithfulRealization Cognition Pattern
  normativity_realizes : FaithfulRealization Normativity Pattern

theorem tridirectional_has_three_realizations
    {Physics Cognition Normativity Pattern : EvaluationSystem}
    (w : TridirectionalWitness Physics Cognition Normativity Pattern) :
    Nonempty (Realization Physics Pattern) ∧
    Nonempty (Realization Cognition Pattern) ∧
    Nonempty (Realization Normativity Pattern) :=
  ⟨⟨w.physics_realizes.toRealization⟩,
   ⟨⟨w.cognition_realizes.toRealization⟩,
    ⟨w.normativity_realizes.toRealization⟩⟩⟩

structure StandardGrounding (E : EvaluationSystem) where
  Ground : Type
  groundOf : E.Standard -> Ground
  validates : Ground -> E.Standard -> Prop
  ground_validates_standard :
    ∀ standard, validates (groundOf standard) standard

structure GroundedEvaluationSystem where
  evaluation : EvaluationSystem
  grounding : StandardGrounding evaluation

theorem every_standard_has_ground
    (G : GroundedEvaluationSystem)
    (standard : G.evaluation.Standard) :
    ∃ ground : G.grounding.Ground,
      G.grounding.validates ground standard :=
  ⟨G.grounding.groundOf standard,
   G.grounding.ground_validates_standard standard⟩

structure AdequateRealization
    (Domain Pattern : EvaluationSystem) where
  realization : FaithfulRealization Domain Pattern
  Adequate : Prop
  adequacy_witness : Adequate

structure AdequateTridirectionalWitness
    (Physics Cognition Normativity Pattern : EvaluationSystem) where
  physics : AdequateRealization Physics Pattern
  cognition : AdequateRealization Cognition Pattern
  normativity : AdequateRealization Normativity Pattern

theorem adequate_tridirectional_convergence
    {Physics Cognition Normativity Pattern : EvaluationSystem}
    (w : AdequateTridirectionalWitness Physics Cognition Normativity Pattern) :
    w.physics.Adequate ∧
    w.cognition.Adequate ∧
    w.normativity.Adequate :=
  ⟨w.physics.adequacy_witness,
   w.cognition.adequacy_witness,
   w.normativity.adequacy_witness⟩

/-! ## A finite shared pattern -/

inductive AbstractInput where
  | aligned
  | misaligned
  | unresolved
deriving Repr, DecidableEq

inductive AbstractStandard where
  | reference
deriving Repr, DecidableEq

inductive AbstractVerdict where
  | positive
  | negative
  | undetermined
deriving Repr, DecidableEq

inductive AbstractState where
  | stable
  | disrupted
  | pending
deriving Repr, DecidableEq

def abstractAssess (_ : AbstractStandard) : AbstractInput -> AbstractVerdict
  | AbstractInput.aligned => AbstractVerdict.positive
  | AbstractInput.misaligned => AbstractVerdict.negative
  | AbstractInput.unresolved => AbstractVerdict.undetermined

def abstractStep (_ : AbstractState) : AbstractVerdict -> AbstractState
  | AbstractVerdict.positive => AbstractState.stable
  | AbstractVerdict.negative => AbstractState.disrupted
  | AbstractVerdict.undetermined => AbstractState.pending

def AbstractPattern : EvaluationSystem where
  Input := AbstractInput
  Standard := AbstractStandard
  Verdict := AbstractVerdict
  State := AbstractState
  assess := abstractAssess
  step := abstractStep

/-! ## Three small domain instances -/

inductive PhysicalInput where
  | state0
  | state1
  | superposed
deriving Repr, DecidableEq

inductive MeasurementBasis where
  | basisZ
deriving Repr, DecidableEq

inductive MeasurementVerdict where
  | outcome0
  | outcome1
  | indeterminate
deriving Repr, DecidableEq

inductive PhysicalState where
  | registered0
  | registered1
  | notRegistered
deriving Repr, DecidableEq

def physicalAssess (_ : MeasurementBasis) : PhysicalInput -> MeasurementVerdict
  | PhysicalInput.state0 => MeasurementVerdict.outcome0
  | PhysicalInput.state1 => MeasurementVerdict.outcome1
  | PhysicalInput.superposed => MeasurementVerdict.indeterminate

def physicalStep (_ : PhysicalState) : MeasurementVerdict -> PhysicalState
  | MeasurementVerdict.outcome0 => PhysicalState.registered0
  | MeasurementVerdict.outcome1 => PhysicalState.registered1
  | MeasurementVerdict.indeterminate => PhysicalState.notRegistered

def PhysicsFiniteMeasurement : EvaluationSystem where
  Input := PhysicalInput
  Standard := MeasurementBasis
  Verdict := MeasurementVerdict
  State := PhysicalState
  assess := physicalAssess
  step := physicalStep

inductive CognitiveInput where
  | supported
  | contradicted
  | ambiguous
deriving Repr, DecidableEq

inductive EpistemicStandard where
  | evidence
deriving Repr, DecidableEq

inductive CognitiveVerdict where
  | accept
  | reject
  | suspend
deriving Repr, DecidableEq

inductive CognitiveState where
  | beliefStable
  | beliefRejected
  | beliefPending
deriving Repr, DecidableEq

def cognitiveAssess (_ : EpistemicStandard) : CognitiveInput -> CognitiveVerdict
  | CognitiveInput.supported => CognitiveVerdict.accept
  | CognitiveInput.contradicted => CognitiveVerdict.reject
  | CognitiveInput.ambiguous => CognitiveVerdict.suspend

def cognitiveStep (_ : CognitiveState) : CognitiveVerdict -> CognitiveState
  | CognitiveVerdict.accept => CognitiveState.beliefStable
  | CognitiveVerdict.reject => CognitiveState.beliefRejected
  | CognitiveVerdict.suspend => CognitiveState.beliefPending

def CognitionFiniteAssessment : EvaluationSystem where
  Input := CognitiveInput
  Standard := EpistemicStandard
  Verdict := CognitiveVerdict
  State := CognitiveState
  assess := cognitiveAssess
  step := cognitiveStep

inductive ActionInput where
  | preserves
  | harms
  | uncertain
deriving Repr, DecidableEq

inductive NormativeStandard where
  | truth
deriving Repr, DecidableEq

inductive NormativeVerdict where
  | permitted
  | forbidden
  | unresolved
deriving Repr, DecidableEq

inductive NormativeState where
  | affirmed
  | condemned
  | pending
deriving Repr, DecidableEq

def normativeAssess (_ : NormativeStandard) : ActionInput -> NormativeVerdict
  | ActionInput.preserves => NormativeVerdict.permitted
  | ActionInput.harms => NormativeVerdict.forbidden
  | ActionInput.uncertain => NormativeVerdict.unresolved

def normativeStep (_ : NormativeState) : NormativeVerdict -> NormativeState
  | NormativeVerdict.permitted => NormativeState.affirmed
  | NormativeVerdict.forbidden => NormativeState.condemned
  | NormativeVerdict.unresolved => NormativeState.pending

def NormativityFiniteJudgment : EvaluationSystem where
  Input := ActionInput
  Standard := NormativeStandard
  Verdict := NormativeVerdict
  State := NormativeState
  assess := normativeAssess
  step := normativeStep

/-! ## Faithful realizations into the shared pattern -/

def mapPhysicalInput : PhysicalInput -> AbstractInput
  | PhysicalInput.state0 => AbstractInput.aligned
  | PhysicalInput.state1 => AbstractInput.misaligned
  | PhysicalInput.superposed => AbstractInput.unresolved

def mapPhysicalVerdict : MeasurementVerdict -> AbstractVerdict
  | MeasurementVerdict.outcome0 => AbstractVerdict.positive
  | MeasurementVerdict.outcome1 => AbstractVerdict.negative
  | MeasurementVerdict.indeterminate => AbstractVerdict.undetermined

def mapPhysicalState : PhysicalState -> AbstractState
  | PhysicalState.registered0 => AbstractState.stable
  | PhysicalState.registered1 => AbstractState.disrupted
  | PhysicalState.notRegistered => AbstractState.pending

def physicsRealization : FaithfulRealization PhysicsFiniteMeasurement AbstractPattern where
  mapInput := mapPhysicalInput
  mapStandard := fun _ => AbstractStandard.reference
  mapVerdict := mapPhysicalVerdict
  mapState := mapPhysicalState
  preserves_assessment := by
    intro standard input
    cases standard
    cases input <;> rfl
  preserves_transition := by
    intro state verdict
    cases state <;> cases verdict <;> rfl
  input_injective := by
    intro a b h
    cases a <;> cases b <;> simp [mapPhysicalInput] at h ⊢
  standard_injective := by
    intro a b h
    cases a
    cases b
    rfl
  verdict_injective := by
    intro a b h
    cases a <;> cases b <;> simp [mapPhysicalVerdict] at h ⊢
  state_injective := by
    intro a b h
    cases a <;> cases b <;> simp [mapPhysicalState] at h ⊢

def mapCognitiveInput : CognitiveInput -> AbstractInput
  | CognitiveInput.supported => AbstractInput.aligned
  | CognitiveInput.contradicted => AbstractInput.misaligned
  | CognitiveInput.ambiguous => AbstractInput.unresolved

def mapCognitiveVerdict : CognitiveVerdict -> AbstractVerdict
  | CognitiveVerdict.accept => AbstractVerdict.positive
  | CognitiveVerdict.reject => AbstractVerdict.negative
  | CognitiveVerdict.suspend => AbstractVerdict.undetermined

def mapCognitiveState : CognitiveState -> AbstractState
  | CognitiveState.beliefStable => AbstractState.stable
  | CognitiveState.beliefRejected => AbstractState.disrupted
  | CognitiveState.beliefPending => AbstractState.pending

def cognitionRealization : FaithfulRealization CognitionFiniteAssessment AbstractPattern where
  mapInput := mapCognitiveInput
  mapStandard := fun _ => AbstractStandard.reference
  mapVerdict := mapCognitiveVerdict
  mapState := mapCognitiveState
  preserves_assessment := by
    intro standard input
    cases standard
    cases input <;> rfl
  preserves_transition := by
    intro state verdict
    cases state <;> cases verdict <;> rfl
  input_injective := by
    intro a b h
    cases a <;> cases b <;> simp [mapCognitiveInput] at h ⊢
  standard_injective := by
    intro a b h
    cases a
    cases b
    rfl
  verdict_injective := by
    intro a b h
    cases a <;> cases b <;> simp [mapCognitiveVerdict] at h ⊢
  state_injective := by
    intro a b h
    cases a <;> cases b <;> simp [mapCognitiveState] at h ⊢

def mapNormativeInput : ActionInput -> AbstractInput
  | ActionInput.preserves => AbstractInput.aligned
  | ActionInput.harms => AbstractInput.misaligned
  | ActionInput.uncertain => AbstractInput.unresolved

def mapNormativeVerdict : NormativeVerdict -> AbstractVerdict
  | NormativeVerdict.permitted => AbstractVerdict.positive
  | NormativeVerdict.forbidden => AbstractVerdict.negative
  | NormativeVerdict.unresolved => AbstractVerdict.undetermined

def mapNormativeState : NormativeState -> AbstractState
  | NormativeState.affirmed => AbstractState.stable
  | NormativeState.condemned => AbstractState.disrupted
  | NormativeState.pending => AbstractState.pending

def normativityRealization : FaithfulRealization NormativityFiniteJudgment AbstractPattern where
  mapInput := mapNormativeInput
  mapStandard := fun _ => AbstractStandard.reference
  mapVerdict := mapNormativeVerdict
  mapState := mapNormativeState
  preserves_assessment := by
    intro standard input
    cases standard
    cases input <;> rfl
  preserves_transition := by
    intro state verdict
    cases state <;> cases verdict <;> rfl
  input_injective := by
    intro a b h
    cases a <;> cases b <;> simp [mapNormativeInput] at h ⊢
  standard_injective := by
    intro a b h
    cases a
    cases b
    rfl
  verdict_injective := by
    intro a b h
    cases a <;> cases b <;> simp [mapNormativeVerdict] at h ⊢
  state_injective := by
    intro a b h
    cases a <;> cases b <;> simp [mapNormativeState] at h ⊢

def finiteTridirectionalWitness :
    TridirectionalWitness
      PhysicsFiniteMeasurement
      CognitionFiniteAssessment
      NormativityFiniteJudgment
      AbstractPattern where
  physics_realizes := physicsRealization
  cognition_realizes := cognitionRealization
  normativity_realizes := normativityRealization

theorem physics_cognition_normativity_share_evaluation_pattern :
    Nonempty (Realization PhysicsFiniteMeasurement AbstractPattern) ∧
    Nonempty (Realization CognitionFiniteAssessment AbstractPattern) ∧
    Nonempty (Realization NormativityFiniteJudgment AbstractPattern) :=
  tridirectional_has_three_realizations finiteTridirectionalWitness

def adequateFiniteWitness :
    AdequateTridirectionalWitness
      PhysicsFiniteMeasurement
      CognitionFiniteAssessment
      NormativityFiniteJudgment
      AbstractPattern where
  physics := ⟨physicsRealization, True, trivial⟩
  cognition := ⟨cognitionRealization, True, trivial⟩
  normativity := ⟨normativityRealization, True, trivial⟩

theorem finite_adequate_tridirectional_convergence :
    adequateFiniteWitness.physics.Adequate ∧
    adequateFiniteWitness.cognition.Adequate ∧
    adequateFiniteWitness.normativity.Adequate :=
  adequate_tridirectional_convergence adequateFiniteWitness

/-! ## Counterfeit: many-to-one relabeling destroys faithfulness -/

def constantInputMap (_ : PhysicalInput) : AbstractInput :=
  AbstractInput.aligned

theorem constant_input_map_not_injective :
    ¬ Function.Injective constantInputMap := by
  intro h
  have bad : PhysicalInput.state0 = PhysicalInput.state1 := h rfl
  contradiction

end EvaluationOperatorPilot
end Theophysics
