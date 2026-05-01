# Changelog

All notable changes to the ePHASORSIM Modelica Library are documented in this file.

## [Unreleased]

### Added

- **Single-machine partType=2 FMU wrappers** ([EP-2920]): Replaced partType=1 GenUnit wrappers for GENROU, GENROE, GENSAL, GENSAE, and GENCLS with partType=2 `StateMachine` wrappers using the PIN2INOUT composition pattern.
  - New `PwPinFMU` connector (`OpalRT.NonElectrical.Connector.PwPinFMU`) for FMI-compatible bus voltage interface.
  - Monitoring outputs: `ANGLE`, `TELEC`, `EFD1`, `PMECH1` exposed as flat `RealOutput`.
  - `useInternalEFDLoop` parameter added to `GENCLS` machine model for conditional EFD self-loop control.

- **Single-controller FMU wrappers** ([EP-2913], [EP-2915], [EP-2916]): 66 thin wrappers in `WrappedModels/` that export individual controllers as standalone FMI 1.0 Model Exchange FMUs, for use with ComponentEPhasorsim's `MixNativeFMU` unit-test harness.
  - 37 excitation systems (AC7B, AC8B, ESAC1A–ESDC2A, ESST1A/3A/4B, SCRX, SEXS, EXAC1–EXAC4, EXDC2, EXPIC1, EXST1–3, IEEEX1/X2, IEEET1/T2/T3/T5, IVOEX, REXSYS, ST5B/6B/7B, URST5T)
  - 20 turbine governors (BBGOV1, DEGOV1, GAST, GAST2A, GGOV1, HYGOV, HYGOV4, IEEEG1–G3, IEESGO, PIDGOV, TGOV1/3/5, WEHGOV, WESGOV, WSHYDD, WSHYGP, WSIEG1)
  - 9 power system stabilizers (IEE2ST, IEEEST, PSS2A/2B, PSS3B, ST2CUT, STAB1/3/4)
- **Base partial models** in `Wrappers/`: `SingleExciterFMU`, `SingleGovernorFMU`, `SingleStabilizerFMU` — provide FMU version metadata and bridge interface gaps (e.g. `ECOMP` output for exciters, `ECOMP` input for stabilizers).

## [1.0.0] — 2026-03-04

First release under the **ePHASORSIM Modelica Library** name (previously **EPFMU 0.0.z**).
This is a major, breaking release that overhauls the library architecture.

For a detailed comparison between the old and new implementations, see
[Migration from EPFMU](modelica/OpalRT/docs/migration_from_EPFMU.md).

### Added

- **FMU generation from Modelica environment**: users can now create and generate FMUs directly from the Modelica environment (Open Modelica or Dymola) without relying on the FMUCreator. The `build.sh` script automates FMU builds, including support for remote Linux targets via SSH.
- **Template-based architecture** (`GenUnitTypeA1` through `GenUnitTypeL1`): partial models that encapsulate canonical wiring between subcomponents (machine, exciter, governor, stabilizer, UEL, OEL), eliminating per-model `connect()` boilerplate.
- **Three-layer FMU export architecture** (ModelSet → FMUTemplate → WrappedModel) with formal interface specification.
- **Formal interface specification** (`InterfaceSpecification.md`) covering parameters, power pins, regular I/O pins, and version metadata.
- **Comprehensive documentation**: per-type documentation (TypeA–TypeL), ModelSets overview, Quick Start guide.

### Changed

- **Monolithic models replaced by `extends` + `redeclare`**: concrete models now extend a base template and redeclare only the specific subcomponents, reducing each model to a few lines.
- **All explicit `connect()` statements removed** from concrete models — wiring is inherited from the base partial model.
- **Parameters externalized**: numeric defaults removed from model code; parameters are declared directly on each redeclared component, enabling configuration via the Modelica dialog.
- **Limiter handling simplified**: `VOEL`/`VUEL` constants set declaratively instead of via `initial equation`.
- **Library renamed** from EPFMU to ePHASORSIM Modelica Library.

### Removed

- Monolithic `class`-based model definitions with inline component instantiation and manual wiring.
- Hardcoded numeric parameter defaults inside model code.
- Data record architecture (`OpalRT.ModelSets.Data.*`) — parameters are now set directly on components.
