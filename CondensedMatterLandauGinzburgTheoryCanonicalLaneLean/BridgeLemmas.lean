import HautevilleHouse.CondensedMatterLandauGinzburgTheoryCanonicalLaneLean.LandauGinzburgModel

namespace HautevilleHouse.CondensedMatterLandauGinzburgTheoryCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  LandauGinzburgMinimumExists A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A :=
  exact A.object.minimumExists

end HautevilleHouse.CondensedMatterLandauGinzburgTheoryCanonicalLaneLean