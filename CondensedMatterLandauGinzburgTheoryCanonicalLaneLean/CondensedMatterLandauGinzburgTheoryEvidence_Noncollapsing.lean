import canonicalLaneMathlib.AdmissibleClass

/-!
# Stability Criterion Package
-/

namespace HautevilleHouse
namespace CondensedMatterLandauGinzburgTheoryCanonicalLaneLean

structure StabilityCriterionPackage {G : GinzburgLandauFreeEnergyPackage}
    {F : OrderParameterFlowPDEPackage G} {S : LocalWellposednessPackage F}
    (Epkg : SpectralStabilityPackage S) where
  freeEnergyBound : Prop
  orderParameterContinuity : Prop
  renormalizationGroupStability : Prop

structure StabilityCriterionEvidence {G : GinzburgLandauFreeEnergyPackage}
    {F : OrderParameterFlowPDEPackage G} {S : LocalWellposednessPackage F}
    {Epkg : SpectralStabilityPackage S} (P : StabilityCriterionPackage Epkg) where
  freeEnergyBoundClosed : P.freeEnergyBound
  orderParameterContinuityClosed : P.orderParameterContinuity
  renormalizationGroupStabilityClosed : P.renormalizationGroupStability

def StabilityCriterionClosed {G : GinzburgLandauFreeEnergyPackage}
    {F : OrderParameterFlowPDEPackage G} {S : LocalWellposednessPackage F}
    {Epkg : SpectralStabilityPackage S} (P : StabilityCriterionPackage Epkg) : Prop :=
  P.freeEnergyBound ∧ P.orderParameterContinuity ∧ P.renormalizationGroupStability

theorem stability_criterion_closed_from_evidence
    {G : GinzburgLandauFreeEnergyPackage} {F : OrderParameterFlowPDEPackage G}
    {S : LocalWellposednessPackage F} {Epkg : SpectralStabilityPackage S}
    (P : StabilityCriterionPackage Epkg) (E : StabilityCriterionEvidence P) :
    StabilityCriterionClosed P := by
  exact And.intro E.freeEnergyBoundClosed
    (And.intro E.orderParameterContinuityClosed E.renormalizationGroupStabilityClosed)

end CondensedMatterLandauGinzburgTheoryCanonicalLaneLean
end HautevilleHouse