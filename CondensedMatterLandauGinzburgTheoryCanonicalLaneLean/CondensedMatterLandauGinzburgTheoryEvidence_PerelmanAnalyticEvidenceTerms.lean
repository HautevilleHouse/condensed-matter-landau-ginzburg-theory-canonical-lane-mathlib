import HautevilleHouse.CondensedMatterLandauGinzburgTheoryCanonicalLaneLean.LandauGinzburgAnalyticProof
import canonicalLaneMathlib.AdmissibleClass

/-!
# Landau Ginzburg Analytic Evidence Terms

This module exposes the proof terms carried by each analytic certificate. The
route is term-level: every analytic field has a named Lean term, and those terms
project into the Landau-Ginzburg universal closure.
-/

namespace HautevilleHouse
namespace CondensedMatterLandauGinzburgTheoryCanonicalLaneLean

structure LandauGinzburgFreeEnergyEvidenceTerms {P : LandauGinzburgFreeEnergyPackage}
    (C : LandauGinzburgFreeEnergyAnalyticCertificate P) where
  freeEnergyExistence : C.freeEnergyExistence
  freeEnergyDifferentiable : C.freeEnergyDifferentiable
  freeEnergyBoundedBelow : C.freeEnergyBoundedBelow
  saddlePointExistence : C.saddlePointExistence
  freeEnergyClosed : LandauGinzburgFreeEnergyClosed P

def LandauGinzburgFreeEnergyAnalyticCertificate.evidenceTerms {P : LandauGinzburgFreeEnergyPackage}
    (C : LandauGinzburgFreeEnergyAnalyticCertificate P) : LandauGinzburgFreeEnergyEvidenceTerms C := {
  freeEnergyExistence := C.freeEnergyExistenceClosed
  freeEnergyDifferentiable := C.freeEnergyDifferentiableClosed
  freeEnergyBoundedBelow := C.freeEnergyBoundedBelowClosed
  saddlePointExistence := C.saddlePointExistenceClosed
  freeEnergyClosed := landau_ginzburg_free_energy_closed_from_evidence P C.freeEnergyEvidence
}

structure GradientFlowEvidenceTerms {F : GradientFlowPackage}
    (C : GradientFlowAnalyticCertificate F) where
  gradientFlowEquation : C.gradientFlowEquation
  gradientFlowWellPosed : C.gradientFlowWellPosed
  gradientFlowClosed : GradientFlowClosed F

def GradientFlowAnalyticCertificate.evidenceTerms {F : GradientFlowPackage}
    (C : GradientFlowAnalyticCertificate F) : GradientFlowEvidenceTerms C := {
  gradientFlowEquation := C.gradientFlowEquationClosed
  gradientFlowWellPosed := C.gradientFlowWellPosedClosed
  gradientFlowClosed := gradient_flow_closed_from_evidence F C.gradientFlowEvidence
}

structure ShortTimeExistenceEvidenceTerms {F : GradientFlowPackage} {S : ShortTimeExistencePackage F}
    (C : ShortTimeExistenceAnalyticCertificate S) where
  localExistence : C.localExistence
  localUniqueness : C.localUniqueness
  continuationCriterion : C.continuationCriterion
  shortTimeClosed : ShortTimeExistenceClosed S

def ShortTimeExistenceAnalyticCertificate.evidenceTerms {F : GradientFlowPackage} {S : ShortTimeExistencePackage F}
    (C : ShortTimeExistenceAnalyticCertificate S) : ShortTimeExistenceEvidenceTerms C := {
  localExistence := C.localExistenceClosed
  localUniqueness := C.localUniquenessClosed
  continuationCriterion := C.continuationCriterionClosed
  shortTimeClosed := short_time_existence_closed_from_evidence S C.shortTimeEvidence
}

structure RenormalizationGroupFlowEvidenceTerms {F : GradientFlowPackage} {S : ShortTimeExistencePackage F}
    {R : RenormalizationGroupFlowPackage S} (C : RenormalizationGroupFlowAnalyticCertificate R) where
  rgEquations : C.rgEquations
  betaFunction : C.betaFunction
  fixedPointExistence : C.fixedPointExistence
  renormalizationGroupFlowClosed : RenormalizationGroupFlowClosed R

def RenormalizationGroupFlowAnalyticCertificate.evidenceTerms {F : GradientFlowPackage} {S : ShortTimeExistencePackage F}
    {R : RenormalizationGroupFlowPackage S} (C : RenormalizationGroupFlowAnalyticCertificate R) :
    RenormalizationGroupFlowEvidenceTerms C := {
  rgEquations := C.rgEquationsClosed
  betaFunction := C.betaFunctionClosed
  fixedPointExistence := C.fixedPointExistenceClosed
  renormalizationGroupFlowClosed := renormalization_group_flow_closed_from_evidence R C.rgFlowEvidence
}

structure ScalingLimitEvidenceTerms {F : GradientFlowPackage} {S : ShortTimeExistencePackage F}
    {R : RenormalizationGroupFlowPackage S} {L : ScalingLimitPackage R}
    (C : ScalingLimitAnalyticCertificate L) where
  scalingLimitExists : C.scalingLimitExists
  selfSimilarSolutions : C.selfSimilarSolutions
  scalingLimitClosed : ScalingLimitClosed L

def ScalingLimitAnalyticCertificate.evidenceTerms {F : GradientFlowPackage} {S : ShortTimeExistencePackage F}
    {R : RenormalizationGroupFlowPackage S} {L : ScalingLimitPackage R}
    (C : ScalingLimitAnalyticCertificate L) : ScalingLimitEvidenceTerms C := {
  scalingLimitExists := C.scalingLimitExistsClosed
  selfSimilarSolutions := C.selfSimilarSolutionsClosed
  scalingLimitClosed := scaling_limit_closed_from_evidence L C.scalingLimitEvidence
}

structure FixedPointClassificationEvidenceTerms {F : GradientFlowPackage} {S : ShortTimeExistencePackage F}
    {R : RenormalizationGroupFlowPackage S} {L : ScalingLimitPackage R}
    {X : FixedPointClassificationPackage L} (C : FixedPointClassificationAnalyticCertificate X) where
  fixedPointsClassified : C.fixedPointsClassified
  stabilityAnalysis : C.stabilityAnalysis
  fixedPointClassificationClosed : FixedPointClassificationClosed X

def FixedPointClassificationAnalyticCertificate.evidenceTerms {F : GradientFlowPackage} {S : ShortTimeExistencePackage F}
    {R : RenormalizationGroupFlowPackage S} {L : ScalingLimitPackage R}
    {X : FixedPointClassificationPackage L} (C : FixedPointClassificationAnalyticCertificate X) :
    FixedPointClassificationEvidenceTerms C := {
  fixedPointsClassified := C.fixedPointsClassifiedClosed
  stabilityAnalysis := C.stabilityAnalysisClosed
  fixedPointClassificationClosed := fixed_point_classification_closed_from_evidence X C.fixedPointEvidence
}

structure CriticalExponentsEvidenceTerms {F : GradientFlowPackage} {S : ShortTimeExistencePackage F}
    {R : RenormalizationGroupFlowPackage S} {L : ScalingLimitPackage R}
    {X : FixedPointClassificationPackage L} {E : CriticalExponentsPackage X}
    (C : CriticalExponentsAnalyticCertificate E) where
  exponentsComputed : C.exponentsComputed
  universalRelations : C.universalRelations
  criticalExponentsClosed : CriticalExponentsClosed E

def CriticalExponentsAnalyticCertificate.evidenceTerms {F : GradientFlowPackage} {S : ShortTimeExistencePackage F}
    {R : RenormalizationGroupFlowPackage S} {L : ScalingLimitPackage R}
    {X : FixedPointClassificationPackage L} {E : CriticalExponentsPackage X}
    (C : CriticalExponentsAnalyticCertificate E) : CriticalExponentsEvidenceTerms C := {
  exponentsComputed := C.exponentsComputedClosed
  universalRelations := C.universalRelationsClosed
  criticalExponentsClosed := critical_exponents_closed_from_evidence E C.exponentsEvidence
}

structure ConformalInvarianceEvidenceTerms {F : GradientFlowPackage} {S : ShortTimeExistencePackage F}
    {R : RenormalizationGroupFlowPackage S} {L : ScalingLimitPackage R}
    {X : FixedPointClassificationPackage L} {E : CriticalExponentsPackage X}
    {C : ConformalInvariancePackage E} (P : ConformalInvarianceAnalyticCertificate C) where
  conformalSymmetry : P.conformalSymmetry
  operatorProductExpansions : P.operatorProductExpansions
  conformalInvarianceClosed : ConformalInvarianceClosed C

def ConformalInvarianceAnalyticCertificate.evidenceTerms {F : GradientFlowPackage} {S : ShortTimeExistencePackage F}
    {R : RenormalizationGroupFlowPackage S} {L : ScalingLimitPackage R}
    {X : FixedPointClassificationPackage L} {E : CriticalExponentsPackage X}
    {C : ConformalInvariancePackage E} (P : ConformalInvarianceAnalyticCertificate C) :
    ConformalInvarianceEvidenceTerms P := {
  conformalSymmetry := P.conformalSymmetryClosed
  operatorProductExpansions := P.operatorProductExpansionsClosed
  conformalInvarianceClosed := conformal_invariance_closed_from_evidence C P.conformalEvidence
}

structure TopologicalDefectsEvidenceTerms {F : GradientFlowPackage} {S : ShortTimeExistencePackage F}
    {R : RenormalizationGroupFlowPackage S} {L : ScalingLimitPackage R}
    {X : FixedPointClassificationPackage L} {E : CriticalExponentsPackage X}
    {C : ConformalInvariancePackage E} {T : TopologicalDefectsPackage C}
    (P : TopologicalDefectsAnalyticCertificate T) where
  defectSolutionsExists : P.defectSolutionsExists
  defectStability : P.defectStability
  defectTopology : P.defectTopology
  topologicalDefectsClosed : TopologicalDefectsClosed T

def TopologicalDefectsAnalyticCertificate.evidenceTerms {F : GradientFlowPackage} {S : ShortTimeExistencePackage F}
    {R : RenormalizationGroupFlowPackage S} {L : ScalingLimitPackage R}
    {X : FixedPointClassificationPackage L} {E : CriticalExponentsPackage X}
    {C : ConformalInvariancePackage E} {T : TopologicalDefectsPackage C}
    (P : TopologicalDefectsAnalyticCertificate T) : TopologicalDefectsEvidenceTerms P := {
  defectSolutionsExists := P.defectSolutionsExistsClosed
  defectStability := P.defectStabilityClosed
  defectTopology := P.defectTopologyClosed
  topologicalDefectsClosed := topological_defects_closed_from_evidence T P.defectEvidence
}

structure PhaseTransitionClassificationEvidenceTerms {F : GradientFlowPackage} {S : ShortTimeExistencePackage F}
    {R : RenormalizationGroupFlowPackage S} {L : ScalingLimitPackage R}
    {X : FixedPointClassificationPackage L} {E : CriticalExponentsPackage X}
    {C : ConformalInvariancePackage E} {T : TopologicalDefectsPackage C}
    {U : PhaseTransitionClassificationPackage T} (P : PhaseTransitionClassificationAnalyticCertificate U) where
  phaseTransitionsClassified : P.phaseTransitionsClassified
  universalityClasses : P.universalityClasses
  phaseTransitionClassificationClosed : PhaseTransitionClassificationClosed U

def PhaseTransitionClassificationAnalyticCertificate.evidenceTerms {F : GradientFlowPackage} {S : ShortTimeExistencePackage F}
    {R : RenormalizationGroupFlowPackage S} {L : ScalingLimitPackage R}
    {X : FixedPointClassificationPackage L} {E : CriticalExponentsPackage X}
    {C : ConformalInvariancePackage E} {T : TopologicalDefectsPackage C}
    {U : PhaseTransitionClassificationPackage T} (P : PhaseTransitionClassificationAnalyticCertificate U) :
    PhaseTransitionClassificationEvidenceTerms P := {
  phaseTransitionsClassified := P.phaseTransitionsClassifiedClosed
  universalityClasses := P.universalityClassesClosed
  phaseTransitionClassificationClosed := phase_transition_classification_closed_from_evidence U P.phaseEvidence
}

structure LandauGinzburgAnalyticEvidenceTerms {A : LandauGinzburgAnalyticFoundation}
    (P : LandauGinzburgAnalyticProofCertificate A) where
  freeEnergy : LandauGinzburgFreeEnergyEvidenceTerms P.freeEnergy
  gradientFlow : GradientFlowEvidenceTerms P.gradientFlow
  shortTime : ShortTimeExistenceEvidenceTerms P.shortTime
  rgFlow : RenormalizationGroupFlowEvidenceTerms P.rgFlow
  scalingLimit : ScalingLimitEvidenceTerms P.scalingLimit
  fixedPointClassification : FixedPointClassificationEvidenceTerms P.fixedPointClassification
  criticalExponents : CriticalExponentsEvidenceTerms P.criticalExponents
  conformalInvariance : ConformalInvarianceEvidenceTerms P.conformalInvariance
  topologicalDefects : TopologicalDefectsEvidenceTerms P.topologicalDefects
  phaseTransitionClassification : PhaseTransitionClassificationEvidenceTerms P.phaseTransitionClassification
  analyticCertificateClosed : LandauGinzburgAnalyticProofCertificateClosed P
  routeClosed : LandauGinzburgRouteClosed A.toLandauGinzburgRouteObligations
  universalClassClosed : LandauGinzburgUniversalClassClosed A

def LandauGinzburgAnalyticProofCertificate.evidenceTerms
    {A : LandauGinzburgAnalyticFoundation} (P : LandauGinzburgAnalyticProofCertificate A) :
    LandauGinzburgAnalyticEvidenceTerms P := {
  freeEnergy := P.freeEnergy.evidenceTerms
  gradientFlow := P.gradientFlow.evidenceTerms
  shortTime := P.shortTime.evidenceTerms
  rgFlow := P.rgFlow.evidenceTerms
  scalingLimit := P.scalingLimit.evidenceTerms
  fixedPointClassification := P.fixedPointClassification.evidenceTerms
  criticalExponents := P.criticalExponents.evidenceTerms
  conformalInvariance := P.conformalInvariance.evidenceTerms
  topologicalDefects := P.topologicalDefects.evidenceTerms
  phaseTransitionClassification := P.phaseTransitionClassification.evidenceTerms
  analyticCertificateClosed := landau_ginzburg_analytic_proof_certificate_closed P
  routeClosed := landau_ginzburg_analytic_proof_closes_route P
  universalClassClosed := landau_ginzburg_analytic_proof_supplies_universal_class P
}

theorem landau_ginzburg_analytic_evidence_terms_close_route
    {A : LandauGinzburgAnalyticFoundation} (P : LandauGinzburgAnalyticProofCertificate A) :
    (P.evidenceTerms).routeClosed = landau_ginzburg_analytic_proof_closes_route P := by
  rfl

theorem landau_ginzburg_analytic_evidence_terms_supply_universal_class
    {A : LandauGinzburgAnalyticFoundation} (P : LandauGinzburgAnalyticProofCertificate A) :
    (P.evidenceTerms).universalClassClosed =
      landau_ginzburg_analytic_proof_supplies_universal_class P := by
  rfl

theorem landau_ginzburg_analytic_evidence_terms_yield_constrained_closure
    (A : AdmissibleClass) {R : LandauGinzburgAnalyticFoundation}
    (P : LandauGinzburgAnalyticProofCertificate R)
    (bridgeFromEvidenceTerms : bridgeClosed A)
    (gateFromEvidenceTerms : gateClosed A) :
    ConstrainedLandauGinzburgUniversalClosure A := by
  exact landau_ginzburg_analytic_proof_yields_constrained_landau_ginzburg_closure
    A P bridgeFromEvidenceTerms gateFromEvidenceTerms

end CondensedMatterLandauGinzburgTheoryCanonicalLaneLean
end HautevilleHouse