/-!
# ROOT24 Tridirectional Structure

This file is the Lean side of the 24-property God / mathematics / universe
profile.

It proves finite structural facts about the profile. It does not prove that the
theological, mathematical, or physical interpretations are semantically correct.
-/

namespace Theophysics
namespace Root24

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
  | true_
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

inductive PropertyRole where
  | primitiveCore
  | derived
  | bridgeRisk
deriving Repr, DecidableEq

inductive StructuralGrade where
  | strong
  | medium
  | weak
deriving Repr, DecidableEq

def roleOf : RootProperty -> PropertyRole
  | .necessary => .primitiveCore
  | .eternal => .derived
  | .immutable => .primitiveCore
  | .simple => .bridgeRisk
  | .consistent => .primitiveCore
  | .universal => .primitiveCore
  | .immaterial => .bridgeRisk
  | .foundational => .primitiveCore
  | .selfExistent => .primitiveCore
  | .infinite => .derived
  | .perfect => .derived
  | .true_ => .primitiveCore
  | .rational => .primitiveCore
  | .orderGiving => .primitiveCore
  | .lawGiving => .primitiveCore
  | .intelligible => .primitiveCore
  | .necessaryForKnowledge => .derived
  | .invariant => .primitiveCore
  | .nonLocal => .derived
  | .transcendent => .primitiveCore
  | .objective => .derived
  | .unified => .primitiveCore
  | .generative => .primitiveCore
  | .judging => .primitiveCore

def structuralGradeOf : RootProperty -> StructuralGrade
  | .necessary => .strong
  | .eternal => .medium
  | .immutable => .strong
  | .simple => .weak
  | .consistent => .strong
  | .universal => .strong
  | .immaterial => .weak
  | .foundational => .strong
  | .selfExistent => .medium
  | .infinite => .medium
  | .perfect => .medium
  | .true_ => .strong
  | .rational => .strong
  | .orderGiving => .medium
  | .lawGiving => .strong
  | .intelligible => .strong
  | .necessaryForKnowledge => .strong
  | .invariant => .strong
  | .nonLocal => .medium
  | .transcendent => .medium
  | .objective => .strong
  | .unified => .medium
  | .generative => .strong
  | .judging => .strong

def allProperties : List RootProperty := [
  .necessary,
  .eternal,
  .immutable,
  .simple,
  .consistent,
  .universal,
  .immaterial,
  .foundational,
  .selfExistent,
  .infinite,
  .perfect,
  .true_,
  .rational,
  .orderGiving,
  .lawGiving,
  .intelligible,
  .necessaryForKnowledge,
  .invariant,
  .nonLocal,
  .transcendent,
  .objective,
  .unified,
  .generative,
  .judging
]

def primitiveCore : List RootProperty :=
  allProperties.filter (fun p => roleOf p == .primitiveCore)

def derivedProperties : List RootProperty :=
  allProperties.filter (fun p => roleOf p == .derived)

def bridgeRiskProperties : List RootProperty :=
  allProperties.filter (fun p => roleOf p == .bridgeRisk)

def structurallyStrongProperties : List RootProperty :=
  allProperties.filter (fun p => structuralGradeOf p == .strong)

theorem root24_total_count : allProperties.length = 24 := by
  native_decide

theorem primitive_core_count : primitiveCore.length = 16 := by
  native_decide

theorem derived_count : derivedProperties.length = 6 := by
  native_decide

theorem bridge_risk_count : bridgeRiskProperties.length = 2 := by
  native_decide

theorem strong_count : structurallyStrongProperties.length = 14 := by
  native_decide

structure DomainProfile where
  has : RootProperty -> Bool

def fullProfile : DomainProfile where
  has := fun _ => true

def removeProperty (p : RootProperty) (profile : DomainProfile) : DomainProfile where
  has := fun q => if q == p then false else profile.has q

def hasAll (profile : DomainProfile) (props : List RootProperty) : Bool :=
  props.all profile.has

def hasPrimitiveCore (profile : DomainProfile) : Bool :=
  hasAll profile primitiveCore

def hasStrictRoot24 (profile : DomainProfile) : Bool :=
  hasAll profile allProperties

structure TridirectionalProfile where
  god : DomainProfile
  mathematics : DomainProfile
  cosmos : DomainProfile

def fullTridirectionalProfile : TridirectionalProfile where
  god := fullProfile
  mathematics := fullProfile
  cosmos := fullProfile

def strictTridirectionalGate (profile : TridirectionalProfile) : Bool :=
  hasStrictRoot24 profile.god &&
  hasStrictRoot24 profile.mathematics &&
  hasStrictRoot24 profile.cosmos

def primitiveTridirectionalGate (profile : TridirectionalProfile) : Bool :=
  hasPrimitiveCore profile.god &&
  hasPrimitiveCore profile.mathematics &&
  hasPrimitiveCore profile.cosmos

theorem full_profile_passes_strict_gate :
    strictTridirectionalGate fullTridirectionalProfile = true := by
  native_decide

theorem full_profile_passes_primitive_gate :
    primitiveTridirectionalGate fullTridirectionalProfile = true := by
  native_decide

theorem removing_necessary_from_math_breaks_strict_gate :
    strictTridirectionalGate
      { fullTridirectionalProfile with
        mathematics := removeProperty .necessary fullProfile } = false := by
  native_decide

theorem removing_consistent_from_universe_breaks_primitive_gate :
    primitiveTridirectionalGate
      { fullTridirectionalProfile with
        cosmos := removeProperty .consistent fullProfile } = false := by
  native_decide

theorem removing_immaterial_from_universe_preserves_primitive_gate :
    primitiveTridirectionalGate
      { fullTridirectionalProfile with
        cosmos := removeProperty .immaterial fullProfile } = true := by
  native_decide

theorem removing_simple_from_god_preserves_primitive_gate :
    primitiveTridirectionalGate
      { fullTridirectionalProfile with
        god := removeProperty .simple fullProfile } = true := by
  native_decide

theorem removing_objective_from_math_breaks_strict_but_not_primitive :
    strictTridirectionalGate
      { fullTridirectionalProfile with
        mathematics := removeProperty .objective fullProfile } = false /\
    primitiveTridirectionalGate
      { fullTridirectionalProfile with
        mathematics := removeProperty .objective fullProfile } = true := by
  native_decide

end Root24
end Theophysics
