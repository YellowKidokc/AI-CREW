namespace Theophysics.ConsciousnessSubstratePilot

/-!
Small executable consciousness/substrate pilot.

The source claims modeled here are deliberately narrow:

* A2.1: information requires substrate;
* A2.2: the ultimate substrate must terminate regress;
* A10.1: individual consciousness requires localized integrated field structure;
* A17.1: witness consciousness requires a Phi/integration threshold;
* A17.2: the witness threshold is substrate-independent;
* O3: consciousness is not reducible to non-conscious scalar-field structure.

The nonconscious scalar-field counterexample is intentionally allowed to carry
information in a field while failing the witness target.
-/

structure ConsciousnessCase where
  information : Bool
  substrate : Bool
  selfGrounding : Bool
  localizedField : Bool
  integratedPhi : Bool
  abovePhiThreshold : Bool
  substrateIndependentPattern : Bool
  experience : Bool
  distinctionMaking : Bool
  observerEffect : Bool
  moralSign : Bool
deriving DecidableEq, Repr

def substrateGate (c : ConsciousnessCase) : Bool :=
  c.information && c.substrate

def groundGate (c : ConsciousnessCase) : Bool :=
  substrateGate c && c.selfGrounding

def localizationGate (c : ConsciousnessCase) : Bool :=
  c.localizedField && c.integratedPhi

def phiGate (c : ConsciousnessCase) : Bool :=
  c.integratedPhi && c.abovePhiThreshold

def witnessGate (c : ConsciousnessCase) : Bool :=
  c.experience && c.distinctionMaking && c.observerEffect

def moralAgencyGate (c : ConsciousnessCase) : Bool :=
  witnessGate c && c.moralSign

def consciousWitness (c : ConsciousnessCase) : Bool :=
  groundGate c &&
  localizationGate c &&
  phiGate c &&
  c.substrateIndependentPattern &&
  moralAgencyGate c

def logosWitness : ConsciousnessCase :=
  { information := true,
    substrate := true,
    selfGrounding := true,
    localizedField := true,
    integratedPhi := true,
    abovePhiThreshold := true,
    substrateIndependentPattern := true,
    experience := true,
    distinctionMaking := true,
    observerEffect := true,
    moralSign := true }

def nonconsciousScalarField : ConsciousnessCase :=
  { information := true,
    substrate := true,
    selfGrounding := false,
    localizedField := false,
    integratedPhi := false,
    abovePhiThreshold := false,
    substrateIndependentPattern := true,
    experience := false,
    distinctionMaking := false,
    observerEffect := false,
    moralSign := false }

def highInformationNoIntegration : ConsciousnessCase :=
  { nonconsciousScalarField with
    selfGrounding := true,
    localizedField := true,
    integratedPhi := false,
    experience := false,
    distinctionMaking := true }

def integratedButNoThreshold : ConsciousnessCase :=
  { logosWitness with abovePhiThreshold := false }

def thresholdButNoWitness : ConsciousnessCase :=
  { logosWitness with experience := false, observerEffect := false }

def witnessButNoMoralSign : ConsciousnessCase :=
  { logosWitness with moralSign := false }

theorem logos_witness_survives :
    consciousWitness logosWitness = true := by
  rfl

theorem scalar_field_is_not_conscious_witness :
    consciousWitness nonconsciousScalarField = false := by
  rfl

theorem substrate_without_ground_rejected :
    groundGate nonconsciousScalarField = false := by
  rfl

theorem information_without_integration_rejected :
    consciousWitness highInformationNoIntegration = false := by
  rfl

theorem integrated_below_threshold_rejected :
    consciousWitness integratedButNoThreshold = false := by
  rfl

theorem threshold_without_witness_rejected :
    consciousWitness thresholdButNoWitness = false := by
  rfl

theorem witness_without_moral_sign_rejected :
    consciousWitness witnessButNoMoralSign = false := by
  rfl

theorem scalar_field_still_satisfies_basic_substrate_gate :
    substrateGate nonconsciousScalarField = true := by
  rfl

end Theophysics.ConsciousnessSubstratePilot
