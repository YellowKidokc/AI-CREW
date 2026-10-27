/-!
# Modal Cluster Chain Integrity Test

This file tests the composition claim:

God -> Physics  =  God -> Math -> Physics

for the seven modal properties:
Necessary, Eternal, Immutable, Self-existent, Invariant, Transcendent, Objective.

It proves the chain commutes for the encoded canonical map and proves a drifted
map fails. This is structural bookkeeping, not semantic proof that the maps are
faithful to real God, mathematics, or physics.
-/

namespace Theophysics
namespace NumbersInGod
namespace ModalCluster

inductive ModalProperty where
  | necessary
  | eternal
  | immutable
  | selfExistent
  | invariant
  | transcendent
  | objective
deriving Repr, DecidableEq

def allModalProperties : List ModalProperty := [
  .necessary,
  .eternal,
  .immutable,
  .selfExistent,
  .invariant,
  .transcendent,
  .objective
]

theorem modal_cluster_count : allModalProperties.length = 7 := by
  native_decide

def PropertyMap := ModalProperty -> ModalProperty

def idMap : PropertyMap := fun p => p

def compose (g f : PropertyMap) : PropertyMap :=
  fun p => g (f p)

def chainCommutes
    (godToMath mathToPhysics godToPhysics : PropertyMap) : Prop :=
  forall p : ModalProperty,
    godToPhysics p = compose mathToPhysics godToMath p

theorem canonical_modal_chain_commutes :
    chainCommutes idMap idMap idMap := by
  intro p
  cases p <;> rfl

/-!
The following drifted map is a negative control. It collapses `eternal` into
`necessary` on the Math -> Physics leg. This models an equivocation or property
merger in the middle of the chain.
-/

def driftMathToPhysics : PropertyMap
  | .eternal => .necessary
  | p => p

def driftComposite : PropertyMap :=
  compose driftMathToPhysics idMap

theorem drift_chain_fails_on_eternal :
    idMap ModalProperty.eternal != driftComposite ModalProperty.eternal := by
  native_decide

theorem drift_chain_does_not_commute :
    Not (chainCommutes idMap driftMathToPhysics idMap) := by
  intro h
  have hE := h ModalProperty.eternal
  contradiction

/-!
Profiles let us distinguish two things:

1. a full profile can hide drift because every property is present;
2. property-level composition catches drift even when full profile membership
   looks unchanged.
-/

structure ModalProfile where
  has : ModalProperty -> Bool

def fullProfile : ModalProfile where
  has := fun _ => true

def missingEternalProfile : ModalProfile where
  has
    | .eternal => false
    | _ => true

def pullbackProfile (f : PropertyMap) (profile : ModalProfile) : ModalProfile where
  has := fun p => profile.has (f p)

theorem full_profile_hides_drift :
    (pullbackProfile idMap fullProfile).has ModalProperty.eternal =
    (pullbackProfile driftComposite fullProfile).has ModalProperty.eternal := by
  rfl

theorem ablated_profile_exposes_drift :
    (pullbackProfile idMap missingEternalProfile).has ModalProperty.eternal !=
    (pullbackProfile driftComposite missingEternalProfile).has ModalProperty.eternal := by
  native_decide

end ModalCluster
end NumbersInGod
end Theophysics
