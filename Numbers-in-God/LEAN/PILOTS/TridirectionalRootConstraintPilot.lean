/-!
# Tridirectional Root Constraint Pilot

This file formalizes a narrow audit shape for the ROOT24 argument.

It does not prove that God exists, that mathematics is God, or that physics
entails Christian theology.

It tests a stricter structural claim:

* there is a 24-property root profile;
* a mathematical ground, a physics-required ground, and a theology-named ground
  can each be checked against that same profile;
* a tridirectional bridge is valid only when all three directions satisfy the
  full profile;
* removing any one property from any direction breaks the strict gate.
-/

namespace Theophysics
namespace TridirectionalRootConstraintPilot

inductive RootProperty where
  | necessary
  | eternal
  | immutable
  | simple
  | consistent
  | universal
  | immaterial
  | foundational
  | selfExistent
  | infinite
  | perfect
  | trueBearing
  | rational
  | orderGiving
  | lawGiving
  | intelligible
  | necessaryForKnowledge
  | invariant
  | nonLocal
  | transcendent
  | objective
  | unified
  | generative
  | judging
deriving Repr, DecidableEq

def root24 : List RootProperty :=
  [ RootProperty.necessary
  , RootProperty.eternal
  , RootProperty.immutable
  , RootProperty.simple
  , RootProperty.consistent
  , RootProperty.universal
  , RootProperty.immaterial
  , RootProperty.foundational
  , RootProperty.selfExistent
  , RootProperty.infinite
  , RootProperty.perfect
  , RootProperty.trueBearing
  , RootProperty.rational
  , RootProperty.orderGiving
  , RootProperty.lawGiving
  , RootProperty.intelligible
  , RootProperty.necessaryForKnowledge
  , RootProperty.invariant
  , RootProperty.nonLocal
  , RootProperty.transcendent
  , RootProperty.objective
  , RootProperty.unified
  , RootProperty.generative
  , RootProperty.judging
  ]

abbrev Profile := RootProperty -> Bool

def satisfiesRoot24 (p : Profile) : Bool :=
  root24.all p

def fullProfile : Profile :=
  fun _ => true

def missingProfile (target : RootProperty) : Profile :=
  fun p => if p == target then false else true

structure TriDirectionalBridge where
  mathematics : Profile
  physics : Profile
  theology : Profile

def validTriDirectional (b : TriDirectionalBridge) : Bool :=
  satisfiesRoot24 b.mathematics &&
  satisfiesRoot24 b.physics &&
  satisfiesRoot24 b.theology

def canonicalBridge : TriDirectionalBridge where
  mathematics := fullProfile
  physics := fullProfile
  theology := fullProfile

def missingInMath (target : RootProperty) : TriDirectionalBridge where
  mathematics := missingProfile target
  physics := fullProfile
  theology := fullProfile

def missingInPhysics (target : RootProperty) : TriDirectionalBridge where
  mathematics := fullProfile
  physics := missingProfile target
  theology := fullProfile

def missingInTheology (target : RootProperty) : TriDirectionalBridge where
  mathematics := fullProfile
  physics := fullProfile
  theology := missingProfile target

theorem root24_has_24_items :
    root24.length = 24 := by
  rfl

theorem canonical_bridge_passes :
    validTriDirectional canonicalBridge = true := by
  rfl

theorem missing_any_property_fails_profile
    (target : RootProperty) :
    satisfiesRoot24 (missingProfile target) = false := by
  cases target <;> rfl

theorem missing_any_property_in_math_fails
    (target : RootProperty) :
    validTriDirectional (missingInMath target) = false := by
  cases target <;> rfl

theorem missing_any_property_in_physics_fails
    (target : RootProperty) :
    validTriDirectional (missingInPhysics target) = false := by
  cases target <;> rfl

theorem missing_any_property_in_theology_fails
    (target : RootProperty) :
    validTriDirectional (missingInTheology target) = false := by
  cases target <;> rfl

theorem math_without_judging_fails :
    validTriDirectional (missingInMath RootProperty.judging) = false := by
  rfl

theorem physics_without_invariance_fails :
    validTriDirectional (missingInPhysics RootProperty.invariant) = false := by
  rfl

theorem theology_without_necessity_fails :
    validTriDirectional (missingInTheology RootProperty.necessary) = false := by
  rfl

end TridirectionalRootConstraintPilot
end Theophysics
