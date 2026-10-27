/-!
# Qualitative Channel Capacity

This is the no-Mathlib, proof-complete version of the Judgment Layer's channel
capacity spine.

The full Shannon theorem `C = A * log_2 (1 + T / D)` requires Mathlib real
analysis. This file formalizes the qualitative limit behavior instead:

* zero distortion/noise corresponds to unbounded capacity;
* overwhelming distortion/noise corresponds to collapsed capacity;
* improving the channel never worsens capacity in the qualitative order.
-/

namespace Theophysics
namespace JudgmentLayer

inductive NoiseLevel where
  | zero
  | finiteLow
  | finiteHigh
  | overwhelming
deriving Repr, DecidableEq

inductive CapacityLevel where
  | collapsed
  | limited
  | high
  | unbounded
deriving Repr, DecidableEq

def capacityOfNoise : NoiseLevel -> CapacityLevel
  | .zero => .unbounded
  | .finiteLow => .high
  | .finiteHigh => .limited
  | .overwhelming => .collapsed

def capacityRank : CapacityLevel -> Nat
  | .collapsed => 0
  | .limited => 1
  | .high => 2
  | .unbounded => 3

def noiseRank : NoiseLevel -> Nat
  | .zero => 0
  | .finiteLow => 1
  | .finiteHigh => 2
  | .overwhelming => 3

def capacityAtLeast (a b : CapacityLevel) : Bool :=
  capacityRank b <= capacityRank a

def noiseAtMost (a b : NoiseLevel) : Bool :=
  noiseRank a <= noiseRank b

theorem zero_noise_has_unbounded_capacity :
    capacityOfNoise NoiseLevel.zero = CapacityLevel.unbounded := by
  rfl

theorem overwhelming_noise_has_collapsed_capacity :
    capacityOfNoise NoiseLevel.overwhelming = CapacityLevel.collapsed := by
  rfl

theorem low_noise_beats_high_noise :
    capacityAtLeast
      (capacityOfNoise NoiseLevel.finiteLow)
      (capacityOfNoise NoiseLevel.finiteHigh) = true := by
  native_decide

theorem zero_noise_beats_all
    (noise : NoiseLevel) :
    capacityAtLeast
      (capacityOfNoise NoiseLevel.zero)
      (capacityOfNoise noise) = true := by
  cases noise <;> native_decide

theorem overwhelming_noise_loses_to_all
    (noise : NoiseLevel) :
    capacityAtLeast
      (capacityOfNoise noise)
      (capacityOfNoise NoiseLevel.overwhelming) = true := by
  cases noise <;> native_decide

theorem capacity_antitone_in_noise_qualitative
    (a b : NoiseLevel)
    (h : noiseAtMost a b = true) :
    capacityAtLeast (capacityOfNoise a) (capacityOfNoise b) = true := by
  cases a <;> cases b <;>
    simp [noiseAtMost, capacityAtLeast, noiseRank, capacityRank, capacityOfNoise] at h ⊢

structure ChannelState where
  signalPresent : Bool
  noise : NoiseLevel

def channelCapacity (state : ChannelState) : CapacityLevel :=
  if state.signalPresent then capacityOfNoise state.noise else CapacityLevel.collapsed

theorem no_signal_collapses_capacity
    (noise : NoiseLevel) :
    channelCapacity { signalPresent := false, noise := noise } =
      CapacityLevel.collapsed := by
  rfl

theorem perfect_signal_channel_unbounded :
    channelCapacity { signalPresent := true, noise := NoiseLevel.zero } =
      CapacityLevel.unbounded := by
  rfl

end JudgmentLayer
end Theophysics
