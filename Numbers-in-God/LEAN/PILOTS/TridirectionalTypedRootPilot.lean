/-!
# Tridirectional Typed Root Pilot

This refines `TridirectionalRootConstraintPilot.lean` by distinguishing
primitive, derived, and bridge-risk properties.

The purpose is audit discipline: ROOT24 is not a flat list of equally primitive
claims. Some properties are direct load-bearing requirements; others are
derived from clusters or need semantic bridge review.
-/

namespace Theophysics
namespace TridirectionalTypedRootPilot

inductive PropertyRole where
  | primitive
  | derived
  | bridge
  | methodologicalBridge
deriving Repr, DecidableEq

inductive RootProperty where
  | necessary | eternal | immutable | simple | consistent | universal
  | immaterial | foundational | selfExistent | infinite | perfect | trueBearing
  | rational | orderGiving | lawGiving | intelligible | necessaryForKnowledge
  | invariant | nonLocal | transcendent | objective | unified | generative | judging
deriving Repr, DecidableEq

structure TypedProperty where
  property : RootProperty
  role : PropertyRole
deriving Repr, DecidableEq

def typedRoot24 : List TypedProperty :=
  [ ⟨RootProperty.necessary, PropertyRole.primitive⟩
  , ⟨RootProperty.eternal, PropertyRole.derived⟩
  , ⟨RootProperty.immutable, PropertyRole.primitive⟩
  , ⟨RootProperty.simple, PropertyRole.methodologicalBridge⟩
  , ⟨RootProperty.consistent, PropertyRole.primitive⟩
  , ⟨RootProperty.universal, PropertyRole.primitive⟩
  , ⟨RootProperty.immaterial, PropertyRole.bridge⟩
  , ⟨RootProperty.foundational, PropertyRole.primitive⟩
  , ⟨RootProperty.selfExistent, PropertyRole.primitive⟩
  , ⟨RootProperty.infinite, PropertyRole.derived⟩
  , ⟨RootProperty.perfect, PropertyRole.derived⟩
  , ⟨RootProperty.trueBearing, PropertyRole.primitive⟩
  , ⟨RootProperty.rational, PropertyRole.primitive⟩
  , ⟨RootProperty.orderGiving, PropertyRole.primitive⟩
  , ⟨RootProperty.lawGiving, PropertyRole.primitive⟩
  , ⟨RootProperty.intelligible, PropertyRole.primitive⟩
  , ⟨RootProperty.necessaryForKnowledge, PropertyRole.derived⟩
  , ⟨RootProperty.invariant, PropertyRole.primitive⟩
  , ⟨RootProperty.nonLocal, PropertyRole.derived⟩
  , ⟨RootProperty.transcendent, PropertyRole.primitive⟩
  , ⟨RootProperty.objective, PropertyRole.derived⟩
  , ⟨RootProperty.unified, PropertyRole.primitive⟩
  , ⟨RootProperty.generative, PropertyRole.primitive⟩
  , ⟨RootProperty.judging, PropertyRole.primitive⟩
  ]

def roleOf (p : RootProperty) : PropertyRole :=
  match p with
  | RootProperty.necessary => PropertyRole.primitive
  | RootProperty.eternal => PropertyRole.derived
  | RootProperty.immutable => PropertyRole.primitive
  | RootProperty.simple => PropertyRole.methodologicalBridge
  | RootProperty.consistent => PropertyRole.primitive
  | RootProperty.universal => PropertyRole.primitive
  | RootProperty.immaterial => PropertyRole.bridge
  | RootProperty.foundational => PropertyRole.primitive
  | RootProperty.selfExistent => PropertyRole.primitive
  | RootProperty.infinite => PropertyRole.derived
  | RootProperty.perfect => PropertyRole.derived
  | RootProperty.trueBearing => PropertyRole.primitive
  | RootProperty.rational => PropertyRole.primitive
  | RootProperty.orderGiving => PropertyRole.primitive
  | RootProperty.lawGiving => PropertyRole.primitive
  | RootProperty.intelligible => PropertyRole.primitive
  | RootProperty.necessaryForKnowledge => PropertyRole.derived
  | RootProperty.invariant => PropertyRole.primitive
  | RootProperty.nonLocal => PropertyRole.derived
  | RootProperty.transcendent => PropertyRole.primitive
  | RootProperty.objective => PropertyRole.derived
  | RootProperty.unified => PropertyRole.primitive
  | RootProperty.generative => PropertyRole.primitive
  | RootProperty.judging => PropertyRole.primitive

def isPrimitive (tp : TypedProperty) : Bool :=
  tp.role == PropertyRole.primitive

def isBridgeRisk (tp : TypedProperty) : Bool :=
  tp.role == PropertyRole.bridge || tp.role == PropertyRole.methodologicalBridge

def primitiveCount : Nat :=
  (typedRoot24.filter isPrimitive).length

def bridgeRiskCount : Nat :=
  (typedRoot24.filter isBridgeRisk).length

abbrev Profile := RootProperty -> Bool

def primitiveProperties : List RootProperty :=
  (typedRoot24.filter isPrimitive).map (fun tp => tp.property)

def satisfiesPrimitiveCore (p : Profile) : Bool :=
  primitiveProperties.all p

def fullProfile : Profile := fun _ => true

def missingProfile (target : RootProperty) : Profile :=
  fun p => if p == target then false else true

theorem typed_root24_has_24_items :
    typedRoot24.length = 24 := by
  rfl

theorem primitive_core_has_16_items :
    primitiveCount = 16 := by
  rfl

theorem bridge_risk_has_2_items :
    bridgeRiskCount = 2 := by
  rfl

theorem full_profile_satisfies_primitive_core :
    satisfiesPrimitiveCore fullProfile = true := by
  rfl

theorem missing_primitive_fails_primitive_core
    (target : RootProperty)
    (h : roleOf target = PropertyRole.primitive) :
    satisfiesPrimitiveCore (missingProfile target) = false := by
  cases target <;> simp [roleOf] at h <;> simp [satisfiesPrimitiveCore, primitiveProperties, typedRoot24, isPrimitive, missingProfile]

theorem missing_derived_eternal_does_not_break_primitive_core :
    satisfiesPrimitiveCore (missingProfile RootProperty.eternal) = true := by
  rfl

theorem missing_bridge_immaterial_does_not_break_primitive_core :
    satisfiesPrimitiveCore (missingProfile RootProperty.immaterial) = true := by
  rfl

end TridirectionalTypedRootPilot
end Theophysics
