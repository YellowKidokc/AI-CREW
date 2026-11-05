/-!
# Ternary Grace Ledger

Prototype for David's three-term distinction: negative, zero, positive.
The module separates historical truth, present orientation, and normative debt
status so that restoration does not require erasing the record.

This is a formal model under stated definitions, not a physical or theological
proof and not a Landauer-cost calculation.
-/

namespace TernaryGraceLedger

inductive Polarity where
  | negative
  | zero
  | positive
deriving DecidableEq, Repr

inductive DebtStatus where
  | uninstantiated
  | owed
  | paid
deriving DecidableEq, Repr

/--
`history` records the originating condition; `current` records present
orientation; `standing` records whether the debt remains collectible.
-/
structure MoralState where
  history : Polarity
  current : Polarity
  standing : DebtStatus
deriving DecidableEq, Repr

/-- Restorative operation proposed for the model. -/
def grace (state : MoralState) : MoralState :=
  { history := state.history
    current := .positive
    standing := .paid }

/-- Pre-commitment state proposed for Adam before debt exists. -/
def preCommitment : MoralState :=
  ⟨.zero, .zero, .uninstantiated⟩

theorem precommitment_has_no_instantiated_debt :
    preCommitment.standing = .uninstantiated := rfl

/-- Restoration preserves the truthful historical record. -/
theorem grace_preserves_history (state : MoralState) :
    (grace state).history = state.history := rfl

/-- Restoration changes present orientation to positive. -/
theorem grace_restores_current (state : MoralState) :
    (grace state).current = .positive := rfl

/-- Restoration changes normative standing from collectible to paid. -/
theorem grace_marks_debt_paid (state : MoralState) :
    (grace state).standing = .paid := rfl

/-- Applying the restorative operation twice adds no further state change. -/
theorem grace_idempotent (state : MoralState) :
    grace (grace state) = grace state := rfl

/-- The negative historical record remains negative after restoration. -/
theorem negative_record_not_erased :
    (grace ⟨.negative, .negative, .owed⟩).history = .negative := rfl

/-- Zero and negative are distinct inputs even when both are restored. -/
def zeroInput : MoralState := ⟨.zero, .zero, .owed⟩
def negativeInput : MoralState := ⟨.negative, .negative, .owed⟩

theorem distinct_histories_remain_distinct :
    (grace zeroInput).history ≠ (grace negativeInput).history := by
  decide

/--
Repentance is admitted as a genuine partial internal transition. It turns away
from negative orientation without erasing history or paying the debt.
-/
def repentance : MoralState → MoralState
  | ⟨history, .negative, .owed⟩ => ⟨history, .zero, .owed⟩
  | state => state

theorem repentance_preserves_history (state : MoralState) :
    (repentance state).history = state.history := by
  cases state with
  | mk history current standing =>
      cases current <;> cases standing <;> rfl

theorem repentance_preserves_standing (state : MoralState) :
    (repentance state).standing = state.standing := by
  cases state with
  | mk history current standing =>
      cases current <;> cases standing <;> rfl

theorem repentance_moves_negative_to_zero :
    (repentance negativeInput).current = .zero := rfl

theorem repentance_does_not_pay_debt :
    (repentance negativeInput).standing = .owed := rfl

/--
False grace is the requested counterfeit control: it produces the visible
positive orientation while leaving normative standing unchanged.
-/
def falseGrace (state : MoralState) : MoralState :=
  { state with current := .positive }

theorem false_grace_looks_restored_in_current (state : MoralState) :
    (falseGrace state).current = .positive := rfl

theorem false_grace_preserves_history (state : MoralState) :
    (falseGrace state).history = state.history := rfl

theorem false_grace_does_not_pay_debt :
    (falseGrace negativeInput).standing = .owed := rfl

/-- The counterfeit cannot equal Grace on an owed state. -/
theorem false_grace_is_not_grace_on_owed_state :
    falseGrace negativeInput ≠ grace negativeInput := by
  intro replacement
  have standingEq := congrArg MoralState.standing replacement
  cases standingEq

/-- Internal language after adding the genuine repentance rival. -/
inductive InternalExpr where
  | channelK | channelE | channelT | channelF
  | channelQ | channelS | channelM | channelR
  | repent
  | seq (first second : InternalExpr)
deriving Repr

def evalInternal : InternalExpr → MoralState → MoralState
  | .channelK, s | .channelE, s | .channelT, s | .channelF, s
  | .channelQ, s | .channelS, s | .channelM, s | .channelR, s => s
  | .repent, s => repentance s
  | .seq first second, s => evalInternal second (evalInternal first s)

/-- All admitted internal compositions preserve normative standing. -/
theorem internal_composition_preserves_standing
    (expr : InternalExpr) (state : MoralState) :
    (evalInternal expr state).standing = state.standing := by
  induction expr generalizing state with
  | channelK | channelE | channelT | channelF
  | channelQ | channelS | channelM | channelR => rfl
  | repent => exact repentance_preserves_standing state
  | seq first second firstIH secondIH =>
      rw [evalInternal, secondIH, firstIH]

/--
Stronger non-replaceability result: repentance can achieve a real partial turn,
but no admitted finite internal composition can duplicate Grace because none
can change owed standing to paid.
-/
theorem repentance_and_channels_cannot_fully_replace_grace :
    ¬ ∃ expr : InternalExpr,
      evalInternal expr negativeInput = grace negativeInput := by
  rintro ⟨expr, replacement⟩
  have standingEq := congrArg MoralState.standing replacement
  rw [internal_composition_preserves_standing] at standingEq
  cases standingEq

/--
Extended adversarial language: the eight placeholder channels, repentance,
and false grace may be composed in any finite order.
-/
inductive CounterfeitExpr where
  | internal (expr : InternalExpr)
  | falseGrace
  | seq (first second : CounterfeitExpr)
deriving Repr

def evalCounterfeit : CounterfeitExpr → MoralState → MoralState
  | .internal expr, state => evalInternal expr state
  | .falseGrace, state => TernaryGraceLedger.falseGrace state
  | .seq first second, state =>
      evalCounterfeit second (evalCounterfeit first state)

/-- Even the stronger counterfeit language cannot change normative standing. -/
theorem counterfeit_composition_preserves_standing
    (expr : CounterfeitExpr) (state : MoralState) :
    (evalCounterfeit expr state).standing = state.standing := by
  induction expr generalizing state with
  | internal expr => exact internal_composition_preserves_standing expr state
  | falseGrace => rfl
  | seq first second firstIH secondIH =>
      rw [evalCounterfeit, secondIH, firstIH]

/--
False grace breaks the old current-orientation collapse premise: it can move a
negative current to positive. This is the intended negative control.
-/
theorem false_grace_breaks_orientation_preservation :
    (falseGrace negativeInput).current = .positive := rfl

/--
Nevertheless, no finite composition of repentance, the eight placeholder
channels, and false grace duplicates Grace on the negative owed input.
-/
theorem repentance_channels_and_false_grace_cannot_fully_replace_grace :
    ¬ ∃ expr : CounterfeitExpr,
      evalCounterfeit expr negativeInput = grace negativeInput := by
  rintro ⟨expr, replacement⟩
  have standingEq := congrArg MoralState.standing replacement
  rw [counterfeit_composition_preserves_standing] at standingEq
  cases standingEq

/--
If only the visible pair `(current, standing)` is observed, restoration merges
three possible prior orientations into the same visible output.
-/
def visibleState (state : MoralState) : Polarity × DebtStatus :=
  (state.current, state.standing)

theorem visible_restoration_merges_zero_and_negative :
    visibleState (grace zeroInput) = visibleState (grace negativeInput) := rfl

/--
An operation that preserves both non-positive orientation and owed standing
cannot duplicate Grace on an owed, non-positive state.
-/
def PreservesUnrestored (op : MoralState → MoralState) : Prop :=
  ∀ state,
    state.current ≠ .positive →
    state.standing = .owed →
    (op state).current ≠ .positive ∧ (op state).standing = .owed

theorem collapse_preserving_rival_cannot_replace_grace
    (op : MoralState → MoralState)
    (preserves : PreservesUnrestored op) :
    ¬ ∀ state, op state = grace state := by
  intro replacement
  have hPreserves := preserves negativeInput (by decide) rfl
  have hReplacement := congrArg MoralState.current (replacement negativeInput)
  rw [grace_restores_current] at hReplacement
  exact hPreserves.1 hReplacement

/--
Negative control: once an internal rival is permitted to perform exactly the
same restorative transition, a replacement exists.
-/
theorem replacement_exists_if_restorative_rival_is_admitted :
    ∃ op : MoralState → MoralState, ∀ state, op state = grace state := by
  exact ⟨grace, by intro state; rfl⟩

end TernaryGraceLedger


