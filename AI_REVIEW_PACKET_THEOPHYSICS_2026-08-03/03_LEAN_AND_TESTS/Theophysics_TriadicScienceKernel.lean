namespace Theophysics

/-!
# Triadic Science Kernel

This file formalizes the narrow science-side guardrail from POF 2828,
"The Science Argument".

It does not prove the Trinity. It only models when a three-role scientific
example is stronger than decorative counting, and preserves the boundary between
science-side structure and theology-side identity.
-/

namespace TriadicScienceKernel

inductive RoleClass where
  | stateOrSystem
  | mediationOrTransformation
  | stableWitnessOrConstraint
deriving Repr, DecidableEq

inductive BridgeGrade where
  | A
  | Aminus
  | Bplus
  | B
  | Bminus
  | Cplus
deriving Repr, DecidableEq

inductive ScienceInstance where
  | shannonCommunication
  | quantumMeasurement
  | decoherenceEinselection
  | quantumDarwinism
  | openQuantumSystems
  | noetherTheorem
  | gaugeTheory
  | cpt
  | thermodynamics
  | landauer
  | feedbackControl
  | errorCorrection
  | variationalPrinciple
  | generalRelativity
  | standardModel
  | symmetryBreaking
  | phaseTransitions
  | relationalQuantumMechanics
  | wignersFriend
  | classicalObservation
deriving Repr, DecidableEq

structure TriadFeatures where
  irreducibleRoles : Bool
  functionalDependence : Bool
  mediationWork : Bool
  asymmetricRoles : Bool
  formalVisibility : Bool
deriving Repr, DecidableEq

def ValidTriad (f : TriadFeatures) : Prop :=
  f.irreducibleRoles = true /\
  f.functionalDependence = true /\
  f.mediationWork = true /\
  f.asymmetricRoles = true /\
  f.formalVisibility = true

def DecorativeTriple (f : TriadFeatures) : Prop :=
  f.irreducibleRoles = false \/
  f.functionalDependence = false \/
  f.mediationWork = false \/
  f.asymmetricRoles = false \/
  f.formalVisibility = false

def RemovableThird (f : TriadFeatures) : Prop :=
  f.functionalDependence = false \/ f.mediationWork = false

def LoadBearingScienceBridge (f : TriadFeatures) : Prop :=
  ValidTriad f /\ Not (RemovableThird f)

inductive BridgeClaim where
  | scienceSideStructure
  | bridgeCandidate
  | theologyIdentity
  | directTheologyProof
deriving Repr, DecidableEq

def permittedFromScienceSide (claim : BridgeClaim) : Bool :=
  match claim with
  | BridgeClaim.scienceSideStructure => true
  | BridgeClaim.bridgeCandidate => true
  | BridgeClaim.theologyIdentity => false
  | BridgeClaim.directTheologyProof => false

theorem valid_triad_not_decorative
    (f : TriadFeatures)
    (h : ValidTriad f) :
    Not (DecorativeTriple f) := by
  intro hDecorative
  rcases h with ⟨hI, hD, hM, hA, hF⟩
  rcases hDecorative with hBad | hBad | hBad | hBad | hBad
  · rw [hI] at hBad
    contradiction
  · rw [hD] at hBad
    contradiction
  · rw [hM] at hBad
    contradiction
  · rw [hA] at hBad
    contradiction
  · rw [hF] at hBad
    contradiction

theorem valid_triad_third_not_removable
    (f : TriadFeatures)
    (h : ValidTriad f) :
    Not (RemovableThird f) := by
  intro hRemovable
  rcases h with ⟨_, hD, hM, _, _⟩
  rcases hRemovable with hBad | hBad
  · rw [hD] at hBad
    contradiction
  · rw [hM] at hBad
    contradiction

theorem load_bearing_from_valid_triad
    (f : TriadFeatures)
    (h : ValidTriad f) :
    LoadBearingScienceBridge f := by
  exact ⟨h, valid_triad_third_not_removable f h⟩

theorem removable_third_blocks_load_bearing
    (f : TriadFeatures)
    (h : RemovableThird f) :
    Not (LoadBearingScienceBridge f) := by
  intro hLoad
  exact hLoad.right h

theorem science_side_does_not_permit_direct_theology_proof :
    permittedFromScienceSide BridgeClaim.directTheologyProof = false := by
  rfl

theorem science_side_does_not_permit_theology_identity :
    permittedFromScienceSide BridgeClaim.theologyIdentity = false := by
  rfl

theorem science_side_permits_structural_evidence :
    permittedFromScienceSide BridgeClaim.scienceSideStructure = true := by
  rfl

theorem science_side_permits_bridge_candidate :
    permittedFromScienceSide BridgeClaim.bridgeCandidate = true := by
  rfl

def shannonFeatures : TriadFeatures :=
  { irreducibleRoles := true
    functionalDependence := true
    mediationWork := true
    asymmetricRoles := true
    formalVisibility := true }

theorem shannon_is_valid_triad :
    ValidTriad shannonFeatures := by
  exact ⟨rfl, rfl, rfl, rfl, rfl⟩

def decorativeThreeFeatures : TriadFeatures :=
  { irreducibleRoles := false
    functionalDependence := false
    mediationWork := false
    asymmetricRoles := false
    formalVisibility := false }

theorem decorative_three_is_not_load_bearing :
    Not (LoadBearingScienceBridge decorativeThreeFeatures) := by
  apply removable_third_blocks_load_bearing
  exact Or.inl rfl

end TriadicScienceKernel

end Theophysics
