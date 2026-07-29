import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CondensedMatterLandauGinzburgTheoryCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

/-- The state space for Landau-Ginzburg theory, including order parameter, temperature, and pressure. -/
structure LandauGinzburgState where
  orderParameter : ℝ → ℝ → ℝ
  temperature : ℝ
  pressure : ℝ

def landauGinzburgProjection : Projection LandauGinzburgState := {
  toFun := fun s => s
  idempotent := by
    intro s; rfl
}

theorem landauGinzburg_projection_idempotent (s : LandauGinzburgState) :
    landauGinzburgProjection.toFun (landauGinzburgProjection.toFun s) = landauGinzburgProjection.toFun s :=
  landauGinzburgProjection.idempotent s

end CondensedMatterLandauGinzburgTheoryCanonicalLaneLean
end HautevilleHouse