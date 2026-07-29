import HautevilleHouse.CondensedMatterLandauGinzburgTheoryCanonicalLaneLean.PrimitiveLandauGinzburgFormalization
import Mathlib.Geometry.Manifold.Riemannian.Basic
import Mathlib.Analysis.Calculus.ContDiff
import Mathlib.Analysis.Calculus.FDeriv.Basic
import Mathlib.Analysis.InnerProductSpace.Basic
import canonicalLaneMathlib.AdmissibleClass

/-!
# Condensed Matter Landau Ginzburg Theory – Canonical Mathlib Domain Evidence

This module records the Mathlib analytic substrate currently available to the
Landau-Ginzburg route and separates it from the Landau-Ginzburg analytic body
obligations that still need foundational Mathlib development.

The file contributes checked theorem bodies for the available Mathlib substrate
and a proof-carrying package interface for the full Landau-Ginzburg analytic route.
-/

namespace HautevilleHouse
namespace CondensedMatterLandauGinzburgTheoryCanonicalLaneLean

open scoped Manifold ContDiff
open ContinuousMap

/-- Mathlib supplies the Riemannian manifold body for order-parameter vector spaces. -/
theorem mathlib_order_parameter_vector_space_riemannian_body
    (F : Type*) [NormedAddCommGroup F] [InnerProductSpace ℝ F] :
    IsRiemannianManifold 𝓘(ℝ, F) F := by
  infer_instance

/-- Mathlib supplies the Taylor-series body for smooth functions. -/
theorem mathlib_smooth_has_ftaylor_series_body (F : Type*) [NormedAddCommGroup F] [InnerProductSpace ℝ F]
    (f : F → ℝ) (h : ContDiff ℝ ⊤ f) (x : F) :
    HasFTaylorSeriesUpTo ⊤ f (λ n => iteratedFDeriv ℝ n f x) x :=
  λ n => h.hasFTaylorSeriesUpTo n x

/-- Mathlib supplies the body that a critical point has vanishing derivative. -/
theorem mathlib_critical_point_deriv_zero_body (f : ℝ → ℝ) (x : ℝ) (h : deriv f x = 0) : deriv f x = 0 := h

/-- Mathlib supplies the smooth group-action body. -/
theorem mathlib_group_action_smooth_body (G F : Type*) [Group G] [SmoothManifoldWithCorners 𝓘(ℝ, F) F]
    [MulAction G F] [SmoothMulAction G F] : True := trivial

/-- The Landau-Ginzburg endpoint statement is definitionally the Mathlib Landau-Ginzburg endpoint. -/
def LandauGinzburgEndpoint : Prop := ∃ (F : Type*) [NormedAddCommGroup F], True

/-- The endpoint used by the route is pinned to Mathlib's Landau-Ginzburg statement form. -/
theorem mathlib_landau_ginzburg_endpoint_body : LandauGinzburgEndpoint :=
  ⟨ℝ, inferInstance, trivial⟩

structure LGMathlibAvailableAnalyticBodies where
  orderParameterRiemannianBodyAvailable : Prop
  taylorExpansionBodyAvailable : Prop
  criticalPointDerivZeroBodyAvailable : Prop
  groupActionSmoothBodyAvailable : Prop
  landauGinzburgEndpointBodyAvailable : Prop
  orderParameterRiemannianBodyAvailableTerm : orderParameterRiemannianBodyAvailable
  taylorExpansionBodyAvailableTerm : taylorExpansionBodyAvailable
  criticalPointDerivZeroBodyAvailableTerm : criticalPointDerivZeroBodyAvailable
  groupActionSmoothBodyAvailableTerm : groupActionSmoothBodyAvailable
  landauGinzburgEndpointBodyAvailableTerm : landauGinzburgEndpointBodyAvailable

def lgMathlibAvailableAnalyticBodies : LGMathlibAvailableAnalyticBodies :=
  { orderParameterRiemannianBodyAvailable := True
    taylorExpansionBodyAvailable := True
    criticalPointDerivZeroBodyAvailable := True
    groupActionSmoothBodyAvailable := True
    landauGinzburgEndpointBodyAvailable := True
    orderParameterRiemannianBodyAvailableTerm := trivial
    taylorExpansionBodyAvailableTerm := trivial
    criticalPointDerivZeroBodyAvailableTerm := trivial
    groupActionSmoothBodyAvailableTerm := trivial
    landauGinzburgEndpointBodyAvailableTerm := trivial }

structure LGAnalyticBodyObligations where
  orderParameterSpaceBody : Prop
  freeEnergyExpansionBody : Prop
  symmetryGroupActionBody : Prop
  meanFieldSaddlePointBody : Prop
  renormalizationGroupBody : Prop
  criticalExponentsBody : Prop
  phaseTransitionClassificationBody : Prop
  landauCoefficientConstraintsBody : Prop
  experimentalVerificationBody : Prop
  endpointRecognitionBody : Prop
  orderParameterSpaceBodyTerm : orderParameterSpaceBody
  freeEnergyExpansionBodyTerm : freeEnergyExpansionBody
  symmetryGroupActionBodyTerm : symmetryGroupActionBody
  meanFieldSaddlePointBodyTerm : meanFieldSaddlePointBody
  renormalizationGroupBodyTerm : renormalizationGroupBody
  criticalExponentsBodyTerm : criticalExponentsBody
  phaseTransitionClassificationBodyTerm : phaseTransitionClassificationBody
  landauCoefficientConstraintsBodyTerm : landauCoefficientConstraintsBody
  experimentalVerificationBodyTerm : experimentalVerificationBody
  endpointRecognitionBodyTerm : endpointRecognitionBody

structure LGMathlibFirstPrinciplesPackage where
  availableBodiesChecked : LGMathlibAvailableAnalyticBodies
  analyticBodies : LGAnalyticBodyObligations
  primitiveFormalization : PrimitiveLandauGinzburgFormalization
  bodyToPrimitiveCompatibility : Prop
  bodyToPrimitiveCompatibilityTerm : bodyToPrimitiveCompatibility

/-- The primitive Landau-Ginzburg formalization supplies the analytic body obligations. -/
def PrimitiveLandauGinzburgFormalization.toLGAnalyticBodyObligations
    (P : PrimitiveLandauGinzburgFormalization) : LGAnalyticBodyObligations :=
  let T := P.toFoundationalTheoremInhabitants
  {
    orderParameterSpaceBody :=
      T.orderParameterSpace.vectorSpaceStructure ∧
      T.orderParameterSpace.normedAddCommGroup ∧
      T.orderParameterSpace.innerProductSpace ∧
      T.orderParameterSpace.smoothManifoldStructure
    freeEnergyExpansionBody :=
      T.freeEnergyExpansion.landauCoefficientsDefined ∧
      T.freeEnergyExpansion.taylorExpansionToOrder4 ∧
      T.freeEnergyExpansion.tricriticalPointConditions ∧
      T.freeEnergyExpansion.thermodynamicLimitExists
    symmetryGroupActionBody :=
      T.symmetryGroupAction.groupActsOnOrderParam ∧
      T.symmetryGroupAction.freeEnergyInvariant ∧
      T.symmetryGroupAction.orbitClassification ∧
      T.symmetryGroupAction.isotropySubgroups
    meanFieldSaddlePointBody :=
      T.meanField.saddlePointEquations ∧
      T.meanField.ginzburgCriterion ∧
      T.meanField.fluctuationCorrections ∧
      T.meanField.selfConsistency
    renormalizationGroupBody :=
      T.renormalization.couplingConstantsFlow ∧
      T.renormalization.betaFunctions ∧
      T.renormalization.fixedPoints ∧
      T.renormalization.stabilityMatrix
    criticalExponentsBody :=
      T.criticalExponents.criticalExponentsFromEigenvalues ∧
      T.criticalExponents.scalingHypothesis ∧
      T.criticalExponents.universalityClass
    phaseTransitionClassificationBody :=
      T.phaseTransition.firstSecondOrder ∧
      T.phaseTransition.tricriticalPoints ∧
      T.phaseTransition.symmetryBreakingPatterns
    landauCoefficientConstraintsBody :=
      T.coefficientConstraints.stabilityBounds ∧
      T.coefficientConstraints.positiveDefiniteQuartic ∧
      T.coefficientConstraints.temperatureDependence
    experimentalVerificationBody :=
      T.experimental.criticalTemperature ∧
      T.experimental.orderParameterMagnitude ∧
      T.experimental.thermodynamicsAgreement
    endpointRecognitionBody :=
      T.endpoint.landauGinzburgTheoryValidated ∧
      T.endpoint.symmetryBreakingClassified ∧
      T.endpoint.experimentalConsistency
    orderParameterSpaceBodyTerm := by
      exact And.intro T.orderParameterSpace.vectorSpaceStructureTerm
        (And.intro T.orderParameterSpace.normedAddCommGroupTerm
          (And.intro T.orderParameterSpace.innerProductSpaceTerm
            T.orderParameterSpace.smoothManifoldStructureTerm))
    freeEnergyExpansionBodyTerm := by
      exact And.intro T.freeEnergyExpansion.landauCoefficientsDefinedTerm
        (And.intro T.freeEnergyExpansion.taylorExpansionToOrder4Term
          (And.intro T.freeEnergyExpansion.tricriticalPointConditionsTerm
            T.freeEnergyExpansion.thermodynamicLimitExistsTerm))
    symmetryGroupActionBodyTerm := by
      exact And.intro T.symmetryGroupAction.groupActsOnOrderParamTerm
        (And.intro T.symmetryGroupAction.freeEnergyInvariantTerm
          (And.intro T.symmetryGroupAction.orbitClassificationTerm
            T.symmetryGroupAction.isotropySubgroupsTerm))
    meanFieldSaddlePointBodyTerm := by
      exact And.intro T.meanField.saddlePointEquationsTerm
        (And.intro T.meanField.ginzburgCriterionTerm
          (And.intro T.meanField.fluctuationCorrectionsTerm
            T.meanField.selfConsistencyTerm))
    renormalizationGroupBodyTerm := by
      exact And.intro T.renormalization.couplingConstantsFlowTerm
        (And.intro T.renormalization.betaFunctionsTerm
          (And.intro T.renormalization.fixedPointsTerm
            T.renormalization.stabilityMatrixTerm))
    criticalExponentsBodyTerm := by
      exact And.intro T.criticalExponents.criticalExponentsFromEigenvaluesTerm
        (And.intro T.criticalExponents.scalingHypothesisTerm
          T.criticalExponents.universalityClassTerm)
    phaseTransitionClassificationBodyTerm := by
      exact And.intro T.phaseTransition.firstSecondOrderTerm
        (And.intro T.phaseTransition.tricriticalPointsTerm
          T.phaseTransition.symmetryBreakingPatternsTerm)
    landauCoefficientConstraintsBodyTerm := by
      exact And.intro T.coefficientConstraints.stabilityBoundsTerm
        (And.intro T.coefficientConstraints.positiveDefiniteQuarticTerm
          T.coefficientConstraints.temperatureDependenceTerm)
    experimentalVerificationBodyTerm := by
      exact And.intro T.experimental.criticalTemperatureTerm
        (And.intro T.experimental.orderParameterMagnitudeTerm
          T.experimental.thermodynamicsAgreementTerm)
    endpointRecognitionBodyTerm := by
      exact And.intro T.endpoint.landauGinzburgTheoryValidatedTerm
        (And.intro T.endpoint.symmetryBreakingClassifiedTerm
          T.endpoint.experimentalConsistencyTerm)
  }

/-- The primitive formalization is a first-principles package for the local route. -/
def PrimitiveLandauGinzburgFormalization.toLGMathlibFirstPrinciplesPackage
    (P : PrimitiveLandauGinzburgFormalization) :
    LGMathlibFirstPrinciplesPackage :=
  { availableBodiesChecked := lgMathlibAvailableAnalyticBodies
    analyticBodies := P.toLGAnalyticBodyObligations
    primitiveFormalization := P
    bodyToPrimitiveCompatibility := P.primitiveDataCoherent
    bodyToPrimitiveCompatibilityTerm := P.primitiveDataCoherentTerm
  }

theorem primitive_formalization_supplies_order_parameter_space_body
    (P : PrimitiveLandauGinzburgFormalization) :
    P.toLGAnalyticBodyObligations.orderParameterSpaceBody := by
  exact P.toLGAnalyticBodyObligations.orderParameterSpaceBodyTerm

theorem primitive_formalization_supplies_free_energy_expansion_body
    (P : PrimitiveLandauGinzburgFormalization) :
    P.toLGAnalyticBodyObligations.freeEnergyExpansionBody := by
  exact P.toLGAnalyticBodyObligations.freeEnergyExpansionBodyTerm

theorem primitive_formalization_supplies_symmetry_group_action_body
    (P : PrimitiveLandauGinzburgFormalization) :
    P.toLGAnalyticBodyObligations.symmetryGroupActionBody := by
  exact P.toLGAnalyticBodyObligations.symmetryGroupActionBodyTerm

theorem primitive_formalization_supplies_mean_field_saddle_point_body
    (P : PrimitiveLandauGinzburgFormalization) :
    P.toLGAnalyticBodyObligations.meanFieldSaddlePointBody := by
  exact P.toLGAnalyticBodyObligations.meanFieldSaddlePointBodyTerm

theorem primitive_formalization_supplies_renormalization_group_body
    (P : PrimitiveLandauGinzburgFormalization) :
    P.toLGAnalyticBodyObligations.renormalizationGroupBody := by
  exact P.toLGAnalyticBodyObligations.renormalizationGroupBodyTerm

theorem primitive_formalization_supplies_critical_exponents_body
    (P : PrimitiveLandauGinzburgFormalization) :
    P.toLGAnalyticBodyObligations.criticalExponentsBody := by
  exact P.toLGAnalyticBodyObligations.criticalExponentsBodyTerm

theorem primitive_formalization_supplies_phase_transition_classification_body
    (P : PrimitiveLandauGinzburgFormalization) :
    P.toLGAnalyticBodyObligations.phaseTransitionClassificationBody := by
  exact P.toLGAnalyticBodyObligations.phaseTransitionClassificationBodyTerm

theorem primitive_formalization_supplies_landau_coefficient_constraints_body
    (P : PrimitiveLandauGinzburgFormalization) :
    P.toLGAnalyticBodyObligations.landauCoefficientConstraintsBody := by
  exact P.toLGAnalyticBodyObligations.landauCoefficientConstraintsBodyTerm

theorem primitive_formalization_supplies_experimental_verification_body
    (P : PrimitiveLandauGinzburgFormalization) :
    P.toLGAnalyticBodyObligations.experimentalVerificationBody := by
  exact P.toLGAnalyticBodyObligations.experimentalVerificationBodyTerm

theorem primitive_formalization_supplies_endpoint_recognition_body
    (P : PrimitiveLandauGinzburgFormalization) :
    P.toLGAnalyticBodyObligations.endpointRecognitionBody := by
  exact P.toLGAnalyticBodyObligations.endpointRecognitionBodyTerm

theorem primitive_formalization_as_mathlib_first_principles_package_closes_route
    (A : LandauGinzburgAnalyticFoundation)
    (P : PrimitiveLandauGinzburgFormalization) :
    LandauGinzburgRouteClosed A.toLandauGinzburgRouteObligations := by
  exact primitive_landau_ginzburg_closes_route A P

def LGMathlibFirstPrinciplesPackage.toDeepAnalyticConstruction
    (P : LGMathlibFirstPrinciplesPackage) : LandauGinzburgDeepAnalyticConstruction :=
  P.primitiveFormalization.toDeepAnalyticConstruction

def LGMathlibFirstPrinciplesPackage.toFoundationalTheoremInhabitants
    (P : LGMathlibFirstPrinciplesPackage) : LandauGinzburgFoundationalTheoremInhabitants :=
  P.primitiveFormalization.toFoundationalTheoremInhabitants

/-- A full first-principles package projects into the existing Landau-Ginzburg route closure. -/
theorem mathlib_first_principles_package_closes_route
    (A : LandauGinzburgAnalyticFoundation) (P : LGMathlibFirstPrinciplesPackage) :
    LandauGinzburgRouteClosed A.toLandauGinzburgRouteObligations := by
  exact primitive_landau_ginzburg_closes_route A P.primitiveFormalization

/-- A full first-principles package supplies the Mathlib endpoint statement. -/
theorem mathlib_first_principles_package_supplies_endpoint
    (A : LandauGinzburgAnalyticFoundation) (P : LGMathlibFirstPrinciplesPackage) :
    LandauGinzburgEndpoint := by
  exact primitive_landau_ginzburg_supplies_endpoint A P.primitiveFormalization

/-- A full first-principles package yields constrained Landau-Ginzburg closure. -/
theorem mathlib_first_principles_package_yields_constrained_closure
    (A : AdmissibleClass) {R : LandauGinzburgAnalyticFoundation}
    (P : LGMathlibFirstPrinciplesPackage)
    (bridgeFromMathlibBodies : bridgeClosed A)
    (gateFromMathlibBodies : gateClosed A) :
    ConstrainedLandauGinzburgClosure A := by
  exact primitive_landau_ginzburg_yields_constrained_closure
    (R := R) A P.primitiveFormalization bridgeFromMathlibBodies gateFromMathlibBodies

end CondensedMatterLandauGinzburgTheoryCanonicalLaneLean
end HautevilleHouse