# Changelog

All notable changes to the ePHASORSIM Modelica Library are documented in this file.

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
