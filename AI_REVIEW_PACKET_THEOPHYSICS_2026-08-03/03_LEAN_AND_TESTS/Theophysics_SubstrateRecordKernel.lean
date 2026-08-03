namespace Theophysics

/-!
# Substrate / Record Kernel

This file formalizes a narrow identity discipline:

* a mission state carries a substrate identity and a record identity;
* finite compression, cross/contact, resurrection, and richer expression may
  change visible form or resolution;
* those operations preserve substrate identity and record identity by
  construction;
* matching visible form alone is not enough to prove substrate identity.

This is a formal-model result only. It does not prove the theological naming of
the substrate.
-/

namespace SubstrateRecordKernel

inductive VisibleForm where
  | unlocalized
  | finiteCompressed
  | crossContact
  | resurrected
deriving Repr, DecidableEq

structure MissionState where
  substrateId : Nat
  recordId : Nat
  form : VisibleForm
  resolution : Nat
deriving Repr, DecidableEq

def finiteCompress (s : MissionState) : MissionState :=
  { s with form := VisibleForm.finiteCompressed, resolution := 1 }

def crossContact (s : MissionState) : MissionState :=
  { s with form := VisibleForm.crossContact }

def resurrect (s : MissionState) : MissionState :=
  { s with form := VisibleForm.resurrected, resolution := s.resolution + 1 }

def richerExpression (s : MissionState) : MissionState :=
  { s with resolution := s.resolution + 1 }

def sameSubstrate (a b : MissionState) : Prop :=
  a.substrateId = b.substrateId

def sameRecord (a b : MissionState) : Prop :=
  a.recordId = b.recordId

def sameVisibleForm (a b : MissionState) : Prop :=
  a.form = b.form

theorem finite_compression_preserves_substrate_identity
    (s : MissionState) :
    sameSubstrate s (finiteCompress s) := by
  rfl

theorem finite_compression_preserves_record_identity
    (s : MissionState) :
    sameRecord s (finiteCompress s) := by
  rfl

theorem cross_contact_preserves_substrate_identity
    (s : MissionState) :
    sameSubstrate s (crossContact s) := by
  rfl

theorem cross_contact_preserves_record_identity
    (s : MissionState) :
    sameRecord s (crossContact s) := by
  rfl

theorem resurrection_preserves_substrate_identity
    (s : MissionState) :
    sameSubstrate s (resurrect s) := by
  rfl

theorem resurrection_preserves_record_identity
    (s : MissionState) :
    sameRecord s (resurrect s) := by
  rfl

theorem richer_expression_preserves_substrate_identity
    (s : MissionState) :
    sameSubstrate s (richerExpression s) := by
  rfl

theorem richer_expression_preserves_record_identity
    (s : MissionState) :
    sameRecord s (richerExpression s) := by
  rfl

theorem resurrection_increases_resolution_by_one
    (s : MissionState) :
    (resurrect s).resolution = s.resolution + 1 := by
  rfl

theorem richer_expression_increases_resolution_by_one
    (s : MissionState) :
    (richerExpression s).resolution = s.resolution + 1 := by
  rfl

theorem visible_form_does_not_determine_substrate_identity :
    exists a b : MissionState,
      sameVisibleForm a b /\ Not (sameSubstrate a b) := by
  refine
    ⟨{ substrateId := 0, recordId := 0, form := VisibleForm.resurrected, resolution := 1 },
     { substrateId := 1, recordId := 0, form := VisibleForm.resurrected, resolution := 1 },
     ?_⟩
  constructor
  · rfl
  · intro h
    unfold sameSubstrate at h
    contradiction

theorem visible_form_does_not_determine_record_identity :
    exists a b : MissionState,
      sameVisibleForm a b /\ Not (sameRecord a b) := by
  refine
    ⟨{ substrateId := 0, recordId := 0, form := VisibleForm.resurrected, resolution := 1 },
     { substrateId := 0, recordId := 1, form := VisibleForm.resurrected, resolution := 1 },
     ?_⟩
  constructor
  · rfl
  · intro h
    unfold sameRecord at h
    contradiction

theorem mission_sequence_preserves_substrate_identity
    (s : MissionState) :
    sameSubstrate s (resurrect (crossContact (finiteCompress s))) := by
  rfl

theorem mission_sequence_preserves_record_identity
    (s : MissionState) :
    sameRecord s (resurrect (crossContact (finiteCompress s))) := by
  rfl

end SubstrateRecordKernel

end Theophysics
