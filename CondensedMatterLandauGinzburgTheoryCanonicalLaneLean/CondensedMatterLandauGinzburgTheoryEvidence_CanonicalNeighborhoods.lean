import CondensedMatterLandauGinzburgTheoryCanonicalLaneLean.CriticalFixedPoints
import canonicalLaneMathlib.AdmissibleClass

/-!
# Canonical Landau–Ginzburg Neighborhoods Package
-/

namespace HautevilleHouse
namespace CondensedMatterLandauGinzburgTheoryCanonicalLaneLean

structure CanonicalLandauGinzburgNeighborhoodsPackage {C : CrystalLatticePackage}
    {S : SymmetryGroupPackage C} {F : FreeEnergyExpansionPackage S}
    {M : MeanFieldValidityPackage F} {N : NonperturbativeCorrectionsPackage M}
    (Q : CriticalFixedPointPackage N) where
  orderParameterUniversalityCovered : Prop
  scalingFormDecomposition : Prop
  RGFlowCompatibility : Prop
  persistenceUnderRGFlow : Prop

structure CanonicalLandauGinzburgNeighborhoodsEvidence {C : CrystalLatticePackage}
    {S : SymmetryGroupPackage C} {F : FreeEnergyExpansionPackage S}
    {M : MeanFieldValidityPackage F} {N : NonperturbativeCorrectionsPackage M}
    {Q : CriticalFixedPointPackage N} (LN : CanonicalLandauGinzburgNeighborhoodsPackage Q) where
  orderParameterUniversalityCoveredClosed : LN.orderParameterUniversalityCovered
  scalingFormDecompositionClosed : LN.scalingFormDecomposition
  RGFlowCompatibilityClosed : LN.RGFlowCompatibility
  persistenceUnderRGFlowClosed : LN.persistenceUnderRGFlow

def CanonicalLandauGinzburgNeighborhoodsClosed {C : CrystalLatticePackage}
    {S : SymmetryGroupPackage C} {F : FreeEnergyExpansionPackage S}
    {M : MeanFieldValidityPackage F} {N : NonperturbativeCorrectionsPackage M}
    {Q : CriticalFixedPointPackage N} (LN : CanonicalLandauGinzburgNeighborhoodsPackage Q) : Prop :=
  LN.orderParameterUniversalityCovered ∧ LN.scalingFormDecomposition ∧
  LN.RGFlowCompatibility ∧ LN.persistenceUnderRGFlow

theorem canonical_landau_ginzburg_neighborhoods_closed_from_evidence
    {C : CrystalLatticePackage} {S : SymmetryGroupPackage C} {F : FreeEnergyExpansionPackage S}
    {M : MeanFieldValidityPackage F} {N : NonperturbativeCorrectionsPackage M}
    {Q : CriticalFixedPointPackage N} (LN : CanonicalLandauGinzburgNeighborhoodsPackage Q)
    (E : CanonicalLandauGinzburgNeighborhoodsEvidence LN) :
    CanonicalLandauGinzburgNeighborhoodsClosed LN := by
  exact And.intro E.orderParameterUniversalityCoveredClosed
    (And.intro E.scalingFormDecompositionClosed
      (And.intro E.RGFlowCompatibilityClosed E.persistenceUnderRGFlowClosed))

end CondensedMatterLandauGinzburgTheoryCanonicalLaneLean
end HautevilleHouse