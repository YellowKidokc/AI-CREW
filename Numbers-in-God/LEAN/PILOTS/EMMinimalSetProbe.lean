namespace Theophysics.EMMinimalSetProbe

/-!
Minimal EM survivor/reject probe.

This intentionally tests only the smallest Boolean shape:
one candidate type, two gates, one survivor, and six rejected alternatives.
-/

inductive EMSystem where
  | quaternion
  | vectorOnly
  | heavisideVector
  | modalist
  | staticSingleField
  | arbitraryThreePart
  | relabeledRoles
deriving DecidableEq, Repr

def preservesCouplingInvariant : EMSystem -> Bool
  | EMSystem.quaternion => true
  | _ => false

def trinityStructureValid : EMSystem -> Bool
  | EMSystem.quaternion => true
  | _ => false

def emSurvives (s : EMSystem) : Bool :=
  preservesCouplingInvariant s && trinityStructureValid s

theorem quaternion_survives_minimal_em :
    emSurvives EMSystem.quaternion = true := by
  rfl

theorem vector_only_rejected_minimal_em :
    emSurvives EMSystem.vectorOnly = false := by
  rfl

theorem heaviside_vector_rejected_minimal_em :
    emSurvives EMSystem.heavisideVector = false := by
  rfl

theorem modalist_rejected_minimal_em :
    emSurvives EMSystem.modalist = false := by
  rfl

theorem static_single_field_rejected_minimal_em :
    emSurvives EMSystem.staticSingleField = false := by
  rfl

theorem arbitrary_three_part_rejected_minimal_em :
    emSurvives EMSystem.arbitraryThreePart = false := by
  rfl

theorem relabeled_roles_rejected_minimal_em :
    emSurvives EMSystem.relabeledRoles = false := by
  rfl

end Theophysics.EMMinimalSetProbe
