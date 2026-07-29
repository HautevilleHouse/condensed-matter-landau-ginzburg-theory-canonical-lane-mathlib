import CondensedMatterLandauGinzburgTheoryCanonicalLaneLean.TheoremStatement
import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace CondensedMatterLandauGinzburgTheoryCanonicalLaneLean

open CanonicalLaneMathlib.AdmissibleClass

structure LandauGinzburgSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure LandauGinzburgAdmittedObject where
  space : LandauGinzburgSpace
  orderParameterType : Type
  orderParameterTopology : TopologicalSpace orderParameterType
  freeEnergy : ℝ → orderParameterType → ℝ
  symmetryGroup : Type
  [groupStructure : Group symmetryGroup]
  [topologicalGroupStructure : TopologicalGroup symmetryGroup]
  action : symmetryGroup → orderParameterType → orderParameterType
  criticalTemperature : ℝ
  exhibitsPhaseTransition : ExhibitsLandauGinzburgPhaseTransition space orderParameterType freeEnergy symmetryGroup action criticalTemperature
  conclusion : exhibitsPhaseTransition

structure LandauGinzburgEndgameState where
  object : LandauGinzburgAdmittedObject

def LandauGinzburgWitnessPhaseTransition (O : LandauGinzburgAdmittedObject) : O.exhibitsPhaseTransition :=
  O.conclusion

end CondensedMatterLandauGinzburgTheoryCanonicalLaneLean
end HautevilleHouse