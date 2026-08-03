namespace Theophysics

/-!
Master Equation v4: first continuous Lean spine.

This file formalizes only the structural claims that are cleanly algebraic:

* nine dimensionless factors combine by multiplication;
* a zero necessary factor collapses the product;
* a wrapper with `mapZero` passes the collapse through to chi;
* a salvation latch can be monotone while a walk sector changes;
* a boundary-transfer model separates internal production from export;
* a three-body ledger shows why suppression is not repair.

The theological names remain interpretations of the formal structure.
-/

namespace MasterEquationV4

/-! ## Nine-factor product and wrapper -/

structure NineFactors where
  XG : Nat
  XM : Nat
  XE : Nat
  XS : Nat
  XT : Nat
  XK : Nat
  XQ : Nat
  XR : Nat
  XF : Nat
deriving Repr, DecidableEq

def product (X : NineFactors) : Nat :=
  X.XG * X.XM * X.XE * X.XS * X.XT * X.XK * X.XQ * X.XR * X.XF

structure Wrapper where
  map : Nat -> Nat
  mapZero : map 0 = 0

def chi (C : Wrapper) (X : NineFactors) : Nat :=
  C.map (product X)

theorem product_zero_if_XG_zero
    (X : NineFactors)
    (h : X.XG = 0) :
    product X = 0 := by
  simp [product, h]

theorem product_zero_if_XM_zero
    (X : NineFactors)
    (h : X.XM = 0) :
    product X = 0 := by
  simp [product, h]

theorem product_zero_if_XE_zero
    (X : NineFactors)
    (h : X.XE = 0) :
    product X = 0 := by
  simp [product, h]

theorem product_zero_if_XS_zero
    (X : NineFactors)
    (h : X.XS = 0) :
    product X = 0 := by
  simp [product, h]

theorem product_zero_if_XT_zero
    (X : NineFactors)
    (h : X.XT = 0) :
    product X = 0 := by
  simp [product, h]

theorem product_zero_if_XK_zero
    (X : NineFactors)
    (h : X.XK = 0) :
    product X = 0 := by
  simp [product, h]

theorem product_zero_if_XQ_zero
    (X : NineFactors)
    (h : X.XQ = 0) :
    product X = 0 := by
  simp [product, h]

theorem product_zero_if_XR_zero
    (X : NineFactors)
    (h : X.XR = 0) :
    product X = 0 := by
  simp [product, h]

theorem product_zero_if_XF_zero
    (X : NineFactors)
    (h : X.XF = 0) :
    product X = 0 := by
  simp [product, h]

theorem product_zero_if_any_factor_zero
    (X : NineFactors)
    (h :
      X.XG = 0 \/ X.XM = 0 \/ X.XE = 0 \/
      X.XS = 0 \/ X.XT = 0 \/ X.XK = 0 \/
      X.XQ = 0 \/ X.XR = 0 \/ X.XF = 0) :
    product X = 0 := by
  rcases h with
    hG | hM | hE | hS | hT | hK | hQ | hR | hF
  · exact product_zero_if_XG_zero X hG
  · exact product_zero_if_XM_zero X hM
  · exact product_zero_if_XE_zero X hE
  · exact product_zero_if_XS_zero X hS
  · exact product_zero_if_XT_zero X hT
  · exact product_zero_if_XK_zero X hK
  · exact product_zero_if_XQ_zero X hQ
  · exact product_zero_if_XR_zero X hR
  · exact product_zero_if_XF_zero X hF

theorem chi_zero_if_any_factor_zero
    (C : Wrapper)
    (X : NineFactors)
    (h :
      X.XG = 0 \/ X.XM = 0 \/ X.XE = 0 \/
      X.XS = 0 \/ X.XT = 0 \/ X.XK = 0 \/
      X.XQ = 0 \/ X.XR = 0 \/ X.XF = 0) :
    chi C X = 0 := by
  unfold chi
  rw [product_zero_if_any_factor_zero X h]
  exact C.mapZero

theorem product_positive_if_all_positive
    (X : NineFactors)
    (hG : 0 < X.XG)
    (hM : 0 < X.XM)
    (hE : 0 < X.XE)
    (hS : 0 < X.XS)
    (hT : 0 < X.XT)
    (hK : 0 < X.XK)
    (hQ : 0 < X.XQ)
    (hR : 0 < X.XR)
    (hF : 0 < X.XF) :
    0 < product X := by
  unfold product
  repeat' apply Nat.mul_pos
  · exact hG
  · exact hM
  · exact hE
  · exact hS
  · exact hT
  · exact hK
  · exact hQ
  · exact hR
  · exact hF

/-! ## Latch and walk split -/

structure WalkState where
  latch : Bool
  walk : Nat
deriving Repr, DecidableEq

def latchPreserved (before after : WalkState) : Prop :=
  before.latch = true -> after.latch = true

theorem latch_once_true_stays
    (before after : WalkState)
    (hStep : latchPreserved before after)
    (hLatched : before.latch = true) :
    after.latch = true :=
  hStep hLatched

theorem walk_can_change_while_latch_stays :
    exists before after : WalkState,
      before.latch = true /\
      after.latch = true /\
      (before.walk = after.walk -> False) := by
  refine Exists.intro { latch := true, walk := 0 } ?_
  refine Exists.intro { latch := true, walk := 1 } ?_
  constructor
  · rfl
  constructor
  · rfl
  · intro h; cases h

/-! ## Law 5 style boundary-transfer structure -/

structure BoundaryState where
  disorder : Nat
  internalProduction : Nat
  boundaryTransfer : Nat
deriving Repr, DecidableEq

def nextDisorder (S : BoundaryState) : Nat :=
  S.disorder + S.internalProduction - S.boundaryTransfer

theorem no_boundary_transfer_cannot_decrease
    (S : BoundaryState)
    (hBoundary : S.boundaryTransfer = 0) :
    S.disorder <= nextDisorder S := by
  unfold nextDisorder
  simp [hBoundary]

theorem zero_internal_and_zero_boundary_preserves
    (S : BoundaryState)
    (hInternal : S.internalProduction = 0)
    (hBoundary : S.boundaryTransfer = 0) :
    nextDisorder S = S.disorder := by
  unfold nextDisorder
  simp [hInternal, hBoundary]

/-! ## Law 9 style three-body ledger -/

def threeBodyTotal (remaining visible invisible : Nat) : Nat :=
  remaining + visible + invisible

theorem three_body_ledger_suppression_transfers_to_invisible
    (remaining visible invisible : Nat) :
    threeBodyTotal remaining visible invisible =
      threeBodyTotal remaining 0 (visible + invisible) := by
  unfold threeBodyTotal
  omega

theorem visible_zero_does_not_imply_total_zero
    (remaining invisible : Nat) :
    threeBodyTotal remaining 0 invisible = remaining + invisible := by
  unfold threeBodyTotal
  simp

theorem invisible_loss_needed_for_same_total_after_visible_suppression
    (remaining visible invisible suppressedInvisible : Nat)
    (h :
      threeBodyTotal remaining visible invisible =
        threeBodyTotal remaining 0 suppressedInvisible) :
    visible + invisible = suppressedInvisible := by
  unfold threeBodyTotal at h
  omega

end MasterEquationV4

end Theophysics
