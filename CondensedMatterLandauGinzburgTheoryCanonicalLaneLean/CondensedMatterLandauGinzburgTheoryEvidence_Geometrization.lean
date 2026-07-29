import HautevilleHouse.CanonicalLaneMathlib.AdmissibleClass

/-!
# Landau-Ginzburg Theory Evidence Package
-/

open HautevilleHouse.CanonicalLaneMathlib

namespace HautevilleHouse
namespace CondensedMatterLandauGinzburgTheoryCanonicalLaneLean

structure CondensedLandauGinzburgPackage (U : AdmissibleClass) where
  symmetryBreakingAlternative : Prop
  orderParameterDecomposition : Prop
  phaseDiagramClassified : Prop
  universalityClassFixedPoint : Prop

structure CondensedLandauGinzburgEvidence {U : AdmissibleClass} (Z : CondensedLandauGinzburgPackage U) where
  symmetryBreakingAlternativeClosed : Z.symmetryBreakingAlternative
  orderParameterDecompositionClosed : Z.orderParameterDecomposition
  phaseDiagramClassifiedClosed : Z.phaseDiagramClassified
  universalityClassFixedPointClosed : Z.universalityClassFixedPoint

def CondensedLandauGinzburgClosed {U : AdmissibleClass} (Z : CondensedLandauGinzburgPackage U) : Prop :=
  Z.symmetryBreakingAlternative ∧ Z.orderParameterDecomposition ∧ Z.phaseDiagramClassified ∧ Z.universalityClassFixedPoint

theorem landau_ginzburg_closed_from_evidence {U : AdmissibleClass} (Z : CondensedLandauGinzburgPackage U) (E : CondensedLandauGinzburgEvidence Z) : CondensedLandauGinzburgClosed Z := by
  exact And.intro E.symmetryBreakingAlternativeClosed
    (And.intro E.orderParameterDecompositionClosed
      (And.intro E.phaseDiagramClassifiedClosed
        E.universalityClassFixedPointClosed))

end CondensedMatterLandauGinzburgTheoryCanonicalLaneLean
end HautevilleHouse