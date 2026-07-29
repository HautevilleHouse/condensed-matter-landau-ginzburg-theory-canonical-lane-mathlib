import HautevilleHouse.CondensedMatterLandauGinzburgTheoryCanonicalLaneLean.SourcePackage

/-!
# Source dependency model for `condensed-matter-landau-ginzburg-theory-canonical-lane`

This module records the import and data-route surface used by the source
package/scripts before translation into Lean data.

It makes the source runtime dependency boundary explicit. The dependency boundary is internal to the Lean package as structural data.
-/

namespace HautevilleHouse
namespace CondensedMatterLandauGinzburgTheoryCanonicalLaneLean

structure SourceImportDependency where
  file : String
  kind : String
  module : String
  name : String
  alias : String
  level : Nat
deriving Repr, DecidableEq

structure SourcePathDependency where
  file : String
  name : String
  path : String
  role : String
  line : Nat
deriving Repr, DecidableEq

def sourceImportDependencies : List SourceImportDependency := [
  { file := "scripts/extract_landau_constants.py", kind := "from_import", module := "__future__", name := "annotations", alias := "", level := 0 },
  { file := "scripts/extract_landau_constants.py", kind := "import", module := "argparse", name := "", alias := "", level := 0 },
  { file := "scripts/extract_landau_constants.py", kind := "import", module := "datetime", name := "", alias := "dt", level := 0 },
  { file := "scripts/extract_landau_constants.py", kind := "import", module := "hashlib", name := "", alias := "", level := 0 },
  { file := "scripts/extract_landau_constants.py", kind := "import", module := "json", name := "", alias := "", level := 0 },
  { file := "scripts/extract_landau_constants.py", kind := "import", module := "math", name := "", alias := "", level := 0 },
  { file := "scripts/extract_landau_constants.py", kind := "from_import", module := "pathlib", name := "Path", alias := "", level := 0 },
  { file := "scripts/extract_landau_constants.py", kind := "from_import", module := "typing", name := "Any", alias := "", level := 0 },
  { file := "scripts/lg_closure_guard.py", kind := "from_import", module := "__future__", name := "annotations", alias := "", level := 0 },
  { file := "scripts/lg_closure_guard.py", kind := "import", module := "argparse", name := "", alias := "", level := 0 },
  { file := "scripts/lg_closure_guard.py", kind := "import", module := "datetime", name := "", alias := "dt", level := 0 },
  { file := "scripts/lg_closure_guard.py", kind := "import", module := "json", name := "", alias := "", level := 0 },
  { file := "scripts/lg_closure_guard.py", kind := "import", module := "math", name := "", alias := "", level := 0 },
  { file := "scripts/lg_closure_guard.py", kind := "from_import", module := "pathlib", name := "Path", alias := "", level := 0 },
  { file := "scripts/lg_closure_guard.py", kind := "from_import", module := "typing", name := "Any", alias := "", level := 0 },
  { file := "scripts/promote_landau_constants.py", kind := "from_import", module := "__future__", name := "annotations", alias := "", level := 0 },
  { file := "scripts/promote_landau_constants.py", kind := "import", module := "argparse", name := "", alias := "", level := 0 },
  { file := "scripts/promote_landau_constants.py", kind := "import", module := "datetime", name := "", alias := "dt", level := 0 },
  { file := "scripts/promote_landau_constants.py", kind := "import", module := "json", name := "", alias := "", level := 0 },
  { file := "scripts/promote_landau_constants.py", kind := "import", module := "math", name := "", alias := "", level := 0 },
  { file := "scripts/promote_landau_constants.py", kind := "from_import", module := "pathlib", name := "Path", alias := "", level := 0 },
  { file := "scripts/promote_landau_constants.py", kind := "from_import", module := "typing", name := "Any", alias := "", level := 0 },
  { file := "scripts/release_gate.py", kind := "from_import", module := "__future__", name := "annotations", alias := "", level := 0 },
  { file := "scripts/release_gate.py", kind := "import", module := "argparse", name := "", alias := "", level := 0 },
  { file := "scripts/release_gate.py", kind := "import", module := "datetime", name := "", alias := "dt", level := 0 },
  { file := "scripts/release_gate.py", kind := "import", module := "hashlib", name := "", alias := "", level := 0 },
  { file := "scripts/release_gate.py", kind := "import", module := "json", name := "", alias := "", level := 0 },
  { file := "scripts/release_gate.py", kind := "import", module := "math", name := "", alias := "", level := 0 },
  { file := "scripts/release_gate.py", kind := "from_import", module := "pathlib", name := "Path", alias := "", level := 0 },
  { file := "scripts/release_gate.py", kind := "from_import", module := "typing", name := "Any", alias := "", level := 0 },
  { file := "scripts/update_manifest.py", kind := "from_import", module := "__future__", name := "annotations", alias := "", level := 0 },
  { file := "scripts/update_manifest.py", kind := "import", module := "argparse", name := "", alias := "", level := 0 },
  { file := "scripts/update_manifest.py", kind := "import", module := "datetime", name := "", alias := "dt", level := 0 },
  { file := "scripts/update_manifest.py", kind := "import", module := "hashlib", name := "", alias := "", level := 0 },
  { file := "scripts/update_manifest.py", kind := "import", module := "json", name := "", alias := "", level := 0 },
  { file := "scripts/update_manifest.py", kind := "from_import", module := "pathlib", name := "Path", alias := "", level := 0 },
  { file := "scripts/update_manifest.py", kind := "from_import", module := "typing", name := "Any", alias := "", level := 0 }
]

def sourceRuntimeModules : List String :=
  "__future__.annotations" ::
  "argparse" ::
  "datetime" ::
  "hashlib" ::
  "json" ::
  "math" ::
  "pathlib.Path" ::
  "typing.Any" ::
  []

def sourcePathDependencies : List SourcePathDependency :=
  { file := "scripts/extract_landau_constants.py", name := "DEFAULT_INPUTS", path := "artifacts/landau_constants_extraction_inputs.json", role := "artifact", line := 17 } ::
  { file := "scripts/extract_landau_constants.py", name := "DEFAULT_OUT", path := "artifacts/landau_constants_extracted.json", role := "artifact", line := 18 } ::
  { file := "scripts/lg_closure_guard.py", name := "DEFAULT_REGISTRY", path := "artifacts/landau_constants_registry.json", role := "artifact", line := 16 } ::
  { file := "scripts/lg_closure_guard.py", name := "DEFAULT_STITCH", path := "artifacts/stitch_landau_constants.json", role := "artifact", line := 17 } ::
  { file := "scripts/lg_closure_guard.py", name := "DEFAULT_OUT", path := "repro/certificate_runtime_landau.json", role := "repro", line := 18 } ::
  { file := "scripts/lg_closure_guard.py", name := "DEFAULT_HISTORY", path := "repro/drift_guard_runs_landau.jsonl", role := "repro", line := 19 } ::
  { file := "scripts/promote_landau_constants.py", name := "DEFAULT_EXTRACTED", path := "artifacts/landau_constants_extracted.json", role := "artifact", line := 16 } ::
  { file := "scripts/promote_landau_constants.py", name := "DEFAULT_REGISTRY", path := "artifacts/landau_constants_registry.json", role := "artifact", line := 17 } ::
  { file := "scripts/promote_landau_constants.py", name := "DEFAULT_STITCH", path := "artifacts/stitch_landau_constants.json", role := "artifact", line := 18 } ::
  { file := "scripts/promote_landau_constants.py", name := "DEFAULT_REPORT", path := "artifacts/promotion_report_landau.json", role := "artifact", line := 19 } ::
  { file := "scripts/release_gate.py", name := "DEFAULT_MANIFEST", path := "repro/repro_manifest_landau.json", role := "repro", line := 17 } ::
  { file := "scripts/release_gate.py", name := "DEFAULT_REGISTRY", path := "artifacts/landau_constants_registry.json", role := "artifact", line := 18 } ::
  { file := "scripts/release_gate.py", name := "DEFAULT_INPUTS", path := "artifacts/landau_constants_extraction_inputs.json", role := "artifact", line := 19 } ::
  { file := "scripts/update_manifest.py", name := "DEFAULT_MANIFEST", path := "repro/repro_manifest_landau.json", role := "repro", line := 16 } ::
  []

def sourceImportDependencyCount : Nat := 37
def sourceRuntimeModuleCount : Nat := 8
def sourcePathDependencyCount : Nat := 14

theorem source_import_dependency_count_checked : sourceImportDependencies.length = 37 := by
  native_decide

theorem source_runtime_module_count_checked : sourceRuntimeModules.length = 8 := by
  native_decide

theorem source_path_dependency_count_checked : sourcePathDependencies.length = 14 := by
  native_decide

end CondensedMatterLandauGinzburgTheoryCanonicalLaneLean
end HautevilleHouse