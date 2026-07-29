import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CondensedMatterLandauGinzburgTheoryCanonicalLaneLean

/-- A Landau-Ginzburg admitted object represents the essential data of a Landau-Ginzburg
free energy expansion: an order parameter type, the free energy functional, and the
temperature. -/
structure LandauGinzburgAdmittedObject where
  /-- The type of the order parameter (often a real or complex scalar field). -/
  orderParameter : Type
  /-- The free energy as a function of the order parameter. -/
  freeEnergy : orderParameter → ℝ
  /-- The temperature of the system. -/
  temperature : ℝ

/-- `LandauGinzburgWitnessClosed lg` asserts that the Landau-Ginzburg free energy
is physically admissible: it is bounded below and possesses a unique global minimum
(the thermodynamically stable state). -/
def LandauGinzburgWitnessClosed (lg : LandauGinzburgAdmittedObject) : Prop :=
  (∃ C > 0, ∀ x : lg.orderParameter, lg.freeEnergy x ≥ -C) ∧
  (∃! m : lg.orderParameter, ∀ x, lg.freeEnergy m ≤ lg.freeEnergy x)

/-- `AdmissibleClass` is the bridge structure for Landau-Ginzburg admissible objects.
It records the object itself, two classification properties (`endpointSatisfied` for
being at a critical endpoint, `remainderRecorded` for the treatment of remainder terms),
and a gate witness that at least one of them holds. -/
structure AdmissibleClass where
  object : LandauGinzburgAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

/-- `admittedClosure A` asserts that the object's free energy is closed (well-behaved)
and that either the endpoint condition or the remainder condition holds. -/
def admittedClosure (A : AdmissibleClass) : Prop :=
  LandauGinzburgWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end CondensedMatterLandauGinzburgTheoryCanonicalLaneLean
end HautevilleHouse