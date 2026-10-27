/-!
# Evaluation Operator

Formal core for the Judgment Layer.

This file proves the type-theoretic skeleton:
input + prior criterion + evaluation -> verdict + state transition.

It does not prove that every conscious being or every quantum measurement is an
instance. Those are semantic bridge claims.
-/

universe uS uI uC uV

namespace Theophysics
namespace JudgmentLayer

structure EvaluationOperator where
  State : Type uS
  Input : Type uI
  Criterion : Type uC
  Verdict : Type uV
  evaluate : Input -> Criterion -> Verdict
  transition : State -> Input -> Verdict -> State
  criterionExists : Nonempty Criterion

theorem criterion_is_available
    (op : EvaluationOperator) :
    Nonempty op.Criterion :=
  op.criterionExists

structure EvaluationEvent (op : EvaluationOperator) where
  stateBefore : op.State
  input : op.Input
  criterion : op.Criterion
  verdict : op.Verdict
  stateAfter : op.State
  verdict_eq : verdict = op.evaluate input criterion
  state_eq : stateAfter = op.transition stateBefore input verdict

theorem event_contains_criterion
    {op : EvaluationOperator}
    (event : EvaluationEvent op) :
    Nonempty op.Criterion :=
  ⟨event.criterion⟩

theorem no_event_if_criterion_empty
    {op : EvaluationOperator}
    (emptyCriterion : op.Criterion -> False) :
    EvaluationEvent op -> False := by
  intro event
  exact emptyCriterion event.criterion

theorem criterion_required_for_event
    {op : EvaluationOperator} :
    EvaluationEvent op -> Nonempty op.Criterion := by
  intro event
  exact event_contains_criterion event

structure SelfEvaluationAttempt (op : EvaluationOperator) where
  selfToCriterion : op.State -> op.Criterion
  injective : Function.Injective selfToCriterion

theorem no_self_evaluation_if_no_criterion
    {op : EvaluationOperator}
    (emptyCriterion : op.Criterion -> False) :
    SelfEvaluationAttempt op -> False := by
  intro attempt
  cases op.criterionExists with
  | intro criterion => exact emptyCriterion criterion

/-! ## Self-defeating denial schema -/

structure MeaningfulUtterance where
  Utterance : Type
  Standard : Type
  utterance : Utterance
  standardExists : Nonempty Standard

def DeniesAllStandards : Prop :=
  forall Standard : Type, Nonempty Standard -> False

theorem no_exit_self_defeating
    (u : MeaningfulUtterance)
    (denial : DeniesAllStandards) :
    False :=
  denial u.Standard u.standardExists

end JudgmentLayer
end Theophysics
