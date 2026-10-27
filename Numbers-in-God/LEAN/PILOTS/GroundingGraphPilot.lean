/-!
# Grounding Graph Pilot

This file formalizes the E5 search space without claiming E6 theological
identification.

The aim is conditional: if standards are grounded, if a common terminal ground
exists, and if plural common terminals are excluded, then uniqueness follows.
-/

universe uS uG

namespace Theophysics
namespace GroundingGraphPilot

inductive GroundingKind where
  | ungroundedPrimitive
  | selfGrounded
  | groundedByAnother
  | finiteGroundingChain
  | infiniteRegress
  | cyclicGrounding
  | commonTerminalGround
  | pluralTerminalGrounds
deriving Repr, DecidableEq

structure GroundingGraph where
  Standard : Type uS
  Ground : Type uG
  grounds : Ground -> Standard -> Prop
  dependsOn : Ground -> Ground -> Prop

def GroundsEveryStandard (G : GroundingGraph) (g : G.Ground) : Prop :=
  forall s : G.Standard, G.grounds g s

def Terminal (G : GroundingGraph) (g : G.Ground) : Prop :=
  forall h : G.Ground, G.dependsOn g h -> False

def CommonTerminalGround (G : GroundingGraph) (g : G.Ground) : Prop :=
  Terminal G g /\ GroundsEveryStandard G g

def SelfGrounded (G : GroundingGraph) (g : G.Ground) : Prop :=
  G.dependsOn g g

def Acyclic (G : GroundingGraph) : Prop :=
  forall g : G.Ground, G.dependsOn g g -> False

def WellFoundedGrounding (G : GroundingGraph) : Prop :=
  WellFounded G.dependsOn

def NoPluralCommonTerminalGrounds (G : GroundingGraph) : Prop :=
  forall a b : G.Ground,
    CommonTerminalGround G a -> CommonTerminalGround G b -> a = b

theorem common_terminal_ground_of_constraints
    (G : GroundingGraph)
    (h_exists : exists g : G.Ground, CommonTerminalGround G g)
    (h_noPlural : NoPluralCommonTerminalGrounds G) :
    exists unique : G.Ground, CommonTerminalGround G unique /\
      forall other : G.Ground, CommonTerminalGround G other -> other = unique := by
  rcases h_exists with ⟨g, hg⟩
  exact ⟨g, hg, by
    intro other hother
    exact h_noPlural other g hother hg⟩

/-! ## A small finite E5 model -/

inductive Standard3 where
  | physics
  | cognition
  | normativity
deriving Repr, DecidableEq

inductive Ground3 where
  | root
  | localPhysics
  | localCognition
  | localNormativity
deriving Repr, DecidableEq

def finiteGrounds : Ground3 -> Standard3 -> Prop
  | Ground3.root, _ => True
  | Ground3.localPhysics, Standard3.physics => True
  | Ground3.localCognition, Standard3.cognition => True
  | Ground3.localNormativity, Standard3.normativity => True
  | _, _ => False

def finiteDependsOn : Ground3 -> Ground3 -> Prop
  | Ground3.localPhysics, Ground3.root => True
  | Ground3.localCognition, Ground3.root => True
  | Ground3.localNormativity, Ground3.root => True
  | _, _ => False

def FiniteGraph : GroundingGraph where
  Standard := Standard3
  Ground := Ground3
  grounds := finiteGrounds
  dependsOn := finiteDependsOn

theorem finite_root_terminal :
    Terminal FiniteGraph Ground3.root := by
  intro h
  intro dep
  cases h <;> cases dep

theorem finite_root_grounds_every_standard :
    GroundsEveryStandard FiniteGraph Ground3.root := by
  intro s
  cases s <;> trivial

theorem finite_root_common_terminal :
    CommonTerminalGround FiniteGraph Ground3.root := by
  exact ⟨finite_root_terminal, finite_root_grounds_every_standard⟩

theorem finite_common_terminal_is_root
    (g : FiniteGraph.Ground)
    (h : CommonTerminalGround FiniteGraph g) :
    g = Ground3.root := by
  cases g
  · rfl
  · have dep : FiniteGraph.dependsOn Ground3.localPhysics Ground3.root := trivial
    exact False.elim (h.left Ground3.root dep)
  · have dep : FiniteGraph.dependsOn Ground3.localCognition Ground3.root := trivial
    exact False.elim (h.left Ground3.root dep)
  · have dep : FiniteGraph.dependsOn Ground3.localNormativity Ground3.root := trivial
    exact False.elim (h.left Ground3.root dep)

theorem finite_no_plural_common_terminal :
    NoPluralCommonTerminalGrounds FiniteGraph := by
  intro a b ha hb
  rw [finite_common_terminal_is_root a ha]
  rw [finite_common_terminal_is_root b hb]

theorem finite_common_terminal_unique :
    exists unique : FiniteGraph.Ground, CommonTerminalGround FiniteGraph unique /\
      forall other : FiniteGraph.Ground,
        CommonTerminalGround FiniteGraph other -> other = unique :=
  common_terminal_ground_of_constraints
    FiniteGraph
    ⟨Ground3.root, finite_root_common_terminal⟩
    finite_no_plural_common_terminal

/-! ## Rival grounding shapes that block the E5 conclusion -/

inductive PluralGround where
  | rootA
  | rootB
deriving Repr, DecidableEq

def pluralGrounds (_ : PluralGround) (_ : Standard3) : Prop := True

def noPluralDepends (_ _ : PluralGround) : Prop := False

def PluralGraph : GroundingGraph where
  Standard := Standard3
  Ground := PluralGround
  grounds := pluralGrounds
  dependsOn := noPluralDepends

theorem plural_rootA_common_terminal :
    CommonTerminalGround PluralGraph PluralGround.rootA := by
  constructor
  · intro h dep
    cases dep
  · intro s
    cases s <;> trivial

theorem plural_rootB_common_terminal :
    CommonTerminalGround PluralGraph PluralGround.rootB := by
  constructor
  · intro h dep
    cases dep
  · intro s
    cases s <;> trivial

theorem plural_graph_blocks_uniqueness :
    Not (exists unique : PluralGraph.Ground,
      CommonTerminalGround PluralGraph unique /\
      forall other : PluralGraph.Ground,
        CommonTerminalGround PluralGraph other -> other = unique) := by
  intro h
  rcases h with ⟨unique, hcommon, hunique⟩
  cases unique
  · have bad := hunique PluralGround.rootB plural_rootB_common_terminal
    contradiction
  · have bad := hunique PluralGround.rootA plural_rootA_common_terminal
    contradiction

inductive CycleGround where
  | left
  | right
deriving Repr, DecidableEq

def cycleGrounds (_ : CycleGround) (_ : Standard3) : Prop := True

def cycleDependsOn : CycleGround -> CycleGround -> Prop
  | CycleGround.left, CycleGround.right => True
  | CycleGround.right, CycleGround.left => True
  | _, _ => False

def CycleGraph : GroundingGraph where
  Standard := Standard3
  Ground := CycleGround
  grounds := cycleGrounds
  dependsOn := cycleDependsOn

theorem cycle_has_no_terminal :
    forall g : CycleGraph.Ground, Not (Terminal CycleGraph g) := by
  intro g hterminal
  cases g
  · exact hterminal CycleGround.right trivial
  · exact hterminal CycleGround.left trivial

theorem cycle_graph_blocks_common_terminal :
    Not (exists g : CycleGraph.Ground, CommonTerminalGround CycleGraph g) := by
  intro h
  rcases h with ⟨g, hg⟩
  exact cycle_has_no_terminal g hg.left

end GroundingGraphPilot
end Theophysics
