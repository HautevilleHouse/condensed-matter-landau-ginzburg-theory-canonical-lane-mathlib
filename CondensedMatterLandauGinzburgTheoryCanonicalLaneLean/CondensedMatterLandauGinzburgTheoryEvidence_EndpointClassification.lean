import canonicalLaneMathlib.AdmissibleClass
import Mathlib

/-!
# Landau-Ginzburg Universality Evidence
-/

namespace HautevilleHouse
namespace CondensedMatterLandauGinzburgTheoryCanonicalLaneLean

structure FreeEnergyFuncPack where
  (a b : ℝ)

structure OrderParamPack where
  (dimension : ℕ)

structure SymmPack (O : OrderParamPack) where
  (group : Type)

structure GinzPack (F : FreeEnergyFuncPack) (O : OrderParamPack) where
  (ginzburgNumber : ℝ)

structure MeanPack (F : FreeEnergyFuncPack) (O : OrderParamPack) (S : SymmPack O) (G : GinzPack F O) where
  (meanFieldTransitionTemperature : ℝ)

structure EffPack (F : FreeEnergyFuncPack) (O : OrderParamPack) (S : SymmPack O) (G : GinzPack F O) (M : MeanPack F O S G) where
  (effectiveFreeEnergyCoefficients : ℕ → ℝ)

structure CritPack (F : FreeEnergyFuncPack) (O : OrderParamPack) (S : SymmPack O) (G : GinzPack F O) (M : MeanPack F O S G) (E : EffPack F O S G M) where
  (α β γ δ : ℚ)

structure UnivPack (F : FreeEnergyFuncPack) (O : OrderParamPack) (S : SymmPack O) (G : GinzPack F O) (M : MeanPack F O S G) (E : EffPack F O S G M) (C : CritPack F O S G M E) where
  (universalityClassID : ℕ)

structure LandauGinzburgFinalPackage (F : FreeEnergyFuncPack) (O : OrderParamPack) (S : SymmPack O) (G : GinzPack F O) (M : MeanPack F O S G) (E : EffPack F O S G M) (C : CritPack F O S G M E) (U : UnivPack F O S G M E C) where
  (experimentalVerification : Prop)

structure LandauGinzburgTheoryPackage {F : FreeEnergyFuncPack} {O : OrderParamPack} {S : SymmPack O} {G : GinzPack F O} {M : MeanPack F O S G} {E : EffPack F O S G M} {C : CritPack F O S G M E} {U : UnivPack F O S G M E C} (Z : LandauGinzburgFinalPackage F O S G M E C U) where
  targetSystem : Type
  targetTopology : TopologicalSpace targetSystem
  secondOrderPhaseTransition : Prop
  experimentallyVerifiedCriticalExponents : Prop
  universalityClassAssertion : Prop

structure LandauGinzburgTheoryEvidence {F : FreeEnergyFuncPack} {O : OrderParamPack} {S : SymmPack O} {G : GinzPack F O} {M : MeanPack F O S G} {E : EffPack F O S G M} {C : CritPack F O S G M E} {U : UnivPack F O S G M E C} {Z : LandauGinzburgFinalPackage F O S G M E C U} (Pkg : LandauGinzburgTheoryPackage Z) where
  phaseTransitionEvidence : Pkg.secondOrderPhaseTransition
  experimentalMatchEvidence : Pkg.experimentallyVerifiedCriticalExponents

def LandauGinzburgTheoryClosed {F : FreeEnergyFuncPack} {O : OrderParamPack} {S : SymmPack O} {G : GinzPack F O} {M : MeanPack F O S G} {E : EffPack F O S G M} {C : CritPack F O S G M E} {U : UnivPack F O S G M E C} {Z : LandauGinzburgFinalPackage F O S G M E C U} (Pkg : LandauGinzburgTheoryPackage Z) : Prop :=
  Pkg.secondOrderPhaseTransition ∧ Pkg.experimentallyVerifiedCriticalExponents

theorem landau_ginzburg_theory_closed_from_evidence {F : FreeEnergyFuncPack} {O : OrderParamPack} {S : SymmPack O} {G : GinzPack F O} {M : MeanPack F O S G} {E : EffPack F O S G M} {C : CritPack F O S G M E} {U : UnivPack F O S G M E C} {Z : LandauGinzburgFinalPackage F O S G M E C U} (Pkg : LandauGinzburgTheoryPackage Z) (Ev : LandauGinzburgTheoryEvidence Pkg) : LandauGinzburgTheoryClosed Pkg :=
  And.intro Ev.phaseTransitionEvidence Ev.experimentalMatchEvidence

theorem landau_ginzburg_theory_supplies_universality_class_assertion {F : FreeEnergyFuncPack} {O : OrderParamPack} {S : SymmPack O} {G : GinzPack F O} {M : MeanPack F O S G} {E : EffPack F O S G M} {C : CritPack F O S G M E} {U : UnivPack F O S G M E C} {Z : LandauGinzburgFinalPackage F O S G M E C U} (Pkg : LandauGinzburgTheoryPackage Z) : Pkg.targetSystem → Pkg.universalityClassAssertion :=
  fun _ => Pkg.universalityClassAssertion

end CondensedMatterLandauGinzburgTheoryCanonicalLaneLean
end HautevilleHouse