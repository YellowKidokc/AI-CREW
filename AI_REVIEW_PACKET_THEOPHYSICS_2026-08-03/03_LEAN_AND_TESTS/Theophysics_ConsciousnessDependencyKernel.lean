namespace Theophysics

/-!
# Consciousness Dependency Kernel

Conditional structural formalization.

This file proves consequences of declared definitions; it does not prove
consciousness exists, that any human/animal/AI is conscious, that God is the
mirror, or that the empirical hard problem is solved.
-/

namespace ConsciousnessDependencyKernel

/-! ## Target 1: dependency skeleton -/

structure ConsciousModel (X : Type) where
  Rep : X -> Prop
  SelfRef : X -> Prop
  Oriented : X -> Prop
  Conscious : X -> Prop
  conscious_def : forall x, Conscious x -> Rep x /\ SelfRef x /\ Oriented x

theorem conscious_requires_rep_under_model
    {X : Type} (M : ConsciousModel X) (x : X)
    (h : M.Conscious x) :
    M.Rep x := by
  exact (M.conscious_def x h).left

theorem conscious_requires_self_ref_under_model
    {X : Type} (M : ConsciousModel X) (x : X)
    (h : M.Conscious x) :
    M.SelfRef x := by
  exact (M.conscious_def x h).right.left

theorem conscious_requires_orientation_under_model
    {X : Type} (M : ConsciousModel X) (x : X)
    (h : M.Conscious x) :
    M.Oriented x := by
  exact (M.conscious_def x h).right.right

theorem no_conscious_without_rep
    {X : Type} (M : ConsciousModel X) (x : X)
    (h : Not (M.Rep x)) :
    Not (M.Conscious x) := by
  intro hc
  exact h (conscious_requires_rep_under_model M x hc)

theorem no_conscious_without_self_ref
    {X : Type} (M : ConsciousModel X) (x : X)
    (h : Not (M.SelfRef x)) :
    Not (M.Conscious x) := by
  intro hc
  exact h (conscious_requires_self_ref_under_model M x hc)

theorem no_conscious_without_orientation
    {X : Type} (M : ConsciousModel X) (x : X)
    (h : Not (M.Oriented x)) :
    Not (M.Conscious x) := by
  intro hc
  exact h (conscious_requires_orientation_under_model M x hc)

structure MindCandidate where
  representation : Prop
  selfReference : Prop
  orientation : Prop
  sourceRecognition : Prop

def ConsciousCandidate (x : MindCandidate) : Prop :=
  x.representation /\ x.selfReference /\ x.orientation

def SourceAware (x : MindCandidate) : Prop :=
  ConsciousCandidate x /\ x.sourceRecognition

theorem candidate_conscious_implies_representation
    (x : MindCandidate)
    (h : ConsciousCandidate x) :
    x.representation := by
  exact h.left

theorem candidate_conscious_implies_self_reference
    (x : MindCandidate)
    (h : ConsciousCandidate x) :
    x.selfReference := by
  exact h.right.left

theorem candidate_conscious_implies_orientation
    (x : MindCandidate)
    (h : ConsciousCandidate x) :
    x.orientation := by
  exact h.right.right

theorem source_aware_implies_conscious
    (x : MindCandidate)
    (h : SourceAware x) :
    ConsciousCandidate x := by
  exact h.left

/-! ## Target 2: internal regress exit typology -/

inductive GroundingExit where
  | infiniteRegress
  | bruteTerminus
  | selfGroundingTerminus
deriving Repr, DecidableEq

structure GroundingExitModel where
  Explains : GroundingExit -> Prop
  AdequateGrounding : GroundingExit -> Prop
  DifferentiatedUnity : GroundingExit -> Prop
  noInfiniteGrounding :
    Not (AdequateGrounding GroundingExit.infiniteRegress)
  noBruteStopping :
    Not (AdequateGrounding GroundingExit.bruteTerminus)
  selfGroundingAdequate :
    AdequateGrounding GroundingExit.selfGroundingTerminus
  adequateNeedsDifferentiatedUnity :
    forall g, AdequateGrounding g -> DifferentiatedUnity g

theorem infinite_regress_not_adequate_under_model
    (M : GroundingExitModel) :
    Not (M.AdequateGrounding GroundingExit.infiniteRegress) := by
  exact M.noInfiniteGrounding

theorem brute_terminus_not_adequate_under_model
    (M : GroundingExitModel) :
    Not (M.AdequateGrounding GroundingExit.bruteTerminus) := by
  exact M.noBruteStopping

theorem self_grounding_adequate_under_model
    (M : GroundingExitModel) :
    M.AdequateGrounding GroundingExit.selfGroundingTerminus := by
  exact M.selfGroundingAdequate

theorem adequate_grounding_requires_differentiated_unity
    (M : GroundingExitModel)
    (g : GroundingExit)
    (h : M.AdequateGrounding g) :
    M.DifferentiatedUnity g := by
  exact M.adequateNeedsDifferentiatedUnity g h

theorem only_self_grounding_can_be_adequate_under_model
    (M : GroundingExitModel)
    (g : GroundingExit)
    (h : M.AdequateGrounding g) :
    g = GroundingExit.selfGroundingTerminus := by
  cases g with
  | infiniteRegress =>
      exact False.elim (M.noInfiniteGrounding h)
  | bruteTerminus =>
      exact False.elim (M.noBruteStopping h)
  | selfGroundingTerminus =>
      rfl

/-! ## Target 3: triad coupling gate -/

structure Triad where
  distinctRoles : Prop
  couplingInvariant : Prop
  dynamicRelation : Prop

def PreservesGate (t : Triad) : Prop :=
  t.distinctRoles /\ t.couplingInvariant /\ t.dynamicRelation

def MalformedTriad (t : Triad) : Prop :=
  Not t.distinctRoles \/ Not t.couplingInvariant \/ Not t.dynamicRelation

theorem fails_gate_if_no_coupling
    (t : Triad)
    (h : Not t.couplingInvariant) :
    Not (PreservesGate t) := by
  intro hp
  exact h hp.right.left

theorem fails_gate_if_no_dynamic_relation
    (t : Triad)
    (h : Not t.dynamicRelation) :
    Not (PreservesGate t) := by
  intro hp
  exact h hp.right.right

theorem malformed_triad_fails_gate
    (t : Triad)
    (h : MalformedTriad t) :
    Not (PreservesGate t) := by
  intro hp
  rcases h with hBad | hBad | hBad
  · exact hBad hp.left
  · exact hBad hp.right.left
  · exact hBad hp.right.right

/-! ## Target 4A: definitional agency wiring -/

structure AgencySystem where
  Agency : Prop
  DeterministicSelfEvolution : Prop
  VoluntaryCoupling : Prop
  voluntaryCouplingRequiresAgency : VoluntaryCoupling -> Agency

theorem no_voluntary_coupling_without_agency_by_definition
    (s : AgencySystem)
    (h : Not s.Agency) :
    Not s.VoluntaryCoupling := by
  intro hv
  exact h (s.voluntaryCouplingRequiresAgency hv)

/-! ## Target 5: ladder rung consequences -/

structure RungState where
  O : Nat
  G : Nat
  S : Nat
  C : Nat
deriving Repr, DecidableEq

def VoluntaryCouplingRung (r : RungState) : Prop :=
  0 < r.O

def GraceGrowthTerm (r : RungState) : Prop :=
  0 < r.G

def OrientationActive (r : RungState) : Prop :=
  0 < r.S

def CouplingAllowed (r : RungState) : Prop :=
  VoluntaryCouplingRung r /\ OrientationActive r

theorem O_eq_zero_no_voluntary_coupling
    (r : RungState)
    (h : r.O = 0) :
    Not (VoluntaryCouplingRung r) := by
  intro hv
  unfold VoluntaryCouplingRung at hv
  rw [h] at hv
  exact Nat.lt_irrefl 0 hv

theorem O_pos_has_voluntary_coupling
    (r : RungState)
    (h : 0 < r.O) :
    VoluntaryCouplingRung r := by
  exact h

theorem zero_grace_no_growth_term
    (r : RungState)
    (h : r.G = 0) :
    Not (GraceGrowthTerm r) := by
  intro hg
  unfold GraceGrowthTerm at hg
  rw [h] at hg
  exact Nat.lt_irrefl 0 hg

theorem zero_orientation_blocks_coupling
    (r : RungState)
    (h : r.S = 0) :
    Not (CouplingAllowed r) := by
  intro hc
  have hs : Not (OrientationActive r) := by
    intro ho
    unfold OrientationActive at ho
    rw [h] at ho
    exact Nat.lt_irrefl 0 ho
  exact hs hc.right

/-! ## Target 6: quarantine guards -/

inductive ConditionSet where
  | equilibriumConditions
  | discriminatingConsciousnessConditions
deriving Repr, DecidableEq

structure FieldCandidate where
  NonConsciousField : Prop
  SatisfiesEquilibrium : Prop

def DiscriminatesConsciousness (c : ConditionSet) : Prop :=
  c = ConditionSet.discriminatingConsciousnessConditions

theorem equilibrium_conditions_do_not_discriminate
    (f : FieldCandidate)
    (_hNonConscious : f.NonConsciousField)
    (_hEquilibrium : f.SatisfiesEquilibrium) :
    Not (DiscriminatesConsciousness ConditionSet.equilibriumConditions) := by
  intro h
  cases h

theorem nonconscious_equilibrium_is_counterexample_to_equilibrium_derivation
    (f : FieldCandidate)
    (hNonConscious : f.NonConsciousField)
    (hEquilibrium : f.SatisfiesEquilibrium) :
    f.NonConsciousField /\ f.SatisfiesEquilibrium /\
      Not (DiscriminatesConsciousness ConditionSet.equilibriumConditions) := by
  exact
    ⟨hNonConscious, hEquilibrium,
      equilibrium_conditions_do_not_discriminate f hNonConscious hEquilibrium⟩

end ConsciousnessDependencyKernel

end Theophysics
