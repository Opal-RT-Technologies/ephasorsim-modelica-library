## OpalRT.GenUnits.TypeH — Documentation

### 1. High-Level Structure

#### TypeH Package Overview

The **TypeH** package defines generator unit models that combine a **Synchronous Machine**, an **Excitation System**, and an **Over-Excitation Limiter (OEL)**. These models are designed for dynamic studies where excitation and OEL protection are relevant, but turbine-governor, stabilizer, and UEL loops are not present. TypeH is ideal for OEL validation, excitation system studies, and scenarios where mechanical and UEL control are handled externally.

*   **Partial Model:**
    *   `GenUnitTypeH1`: Standard interface for synchronous machine, exciter, and OEL.
*   **Purpose:**
    *   Provide a modular, extensible template for generator units with excitation and OEL protection.
*   **Key Features:**
    *   Highly modular, object-oriented, and fully parameterized via replaceable components and data records.

***

### 2. Object-Oriented Features

#### Inheritance and Composition

*   **Inheritance:**
    *   Concrete models extend `GenUnitTypeH1`.
*   **Composition:**
    *   Each unit contains:
        *   A **replaceable synchronous generator** (e.g., `GENROU`, `GENSAL`)
        *   A **replaceable exciter** (e.g., `EXAC1`, `ESAC5A`)
        *   A **replaceable OEL** (`MAXEX1`, `MAXEX2`)
        *   **Replaceable data records** for machine, exciter, OEL, and plant general data

#### Replaceable Architecture

*   All major components and parameter records are declared as `replaceable`, enabling flexible instantiation and substitution in derived models.
*   Parameterization is handled via data records.

***

### 3. Class Diagrams

#### High-Level Class Diagram

```mermaid
classDiagram
class GenUnitTypeI1 {
  <<partial>>
  +TRIP : InputInterfacePin
  +dVREF : InputInterfacePin
  +dGREF : InputInterfacePin
  +bus0 : PwPin
  synchronousGenerator : SynchronousGenerator
  exciter : Exciter
  turbineGovernor : TurbineGovernor
  uel : UnderExcitationLimiter
  machineData : MachineDynamicData
  generalData : PlantGeneralData
  exciterData : ExciterData
  governorData : GovernorData
  uelData : UELData
}
class SynchronousGenerator { <<replaceable>> }
class Exciter { <<replaceable>> }
class TurbineGovernor { <<replaceable>> }
class UnderExcitationLimiter { <<replaceable>> }
class MachineDynamicData { <<replaceable record>> }
class PlantGeneralData { <<replaceable record>> }
class ExciterData { <<replaceable record>> }
class GovernorData { <<replaceable record>> }
class UELData { <<replaceable record>> }
GenUnitTypeI1 o-- SynchronousGenerator
GenUnitTypeI1 o-- Exciter
GenUnitTypeI1 o-- TurbineGovernor
GenUnitTypeI1 o-- UnderExcitationLimiter
GenUnitTypeI1 o-- MachineDynamicData
GenUnitTypeI1 o-- PlantGeneralData
GenUnitTypeI1 o-- ExciterData
GenUnitTypeI1 o-- GovernorData
GenUnitTypeI1 o-- UELData
```

#### Component Extension Map (TypeH)

```mermaid
classDiagram
class GenUnitTypeI1 { <<partial>> }
class ConcreteModel { <<model>> extends GenUnitTypeI1 }
class GENROU { }
class EXAC1 { }
class IEEEG2 { }
class UEL1 { }
class PlantGeneralData_003 { }
class GENROU_002 { }
class EXAC1_001 { }
class IEEEG2_001 { }
class UEL1_001 { }
GenUnitTypeI1 <|-- ConcreteModel
ConcreteModel o-- GENROU : synchronousGenerator
ConcreteModel o-- EXAC1 : exciter
ConcreteModel o-- IEEEG2 : turbineGovernor
ConcreteModel o-- UEL1 : uel
ConcreteModel o-- PlantGeneralData_003 : generalData
ConcreteModel o-- GENROU_002 : machineData
ConcreteModel o-- EXAC1_001 : exciterData
ConcreteModel o-- IEEEG2_001 : governorData
ConcreteModel o-- UEL1_001 : uelData
```

***

### 4. Signal Connections

TypeH models define all major signal connections between generator, exciter, and OEL, including:

*   **TRIP** → synchronousGenerator.TRIP
*   **dVREF** → exciter.dVREF
*   **bus0** ← synchronousGenerator.p
*   **synchronousGenerator ↔ exciter** (EFD, EFD0, ETERM0, EX\_AUX, VI, XADIFD)
*   **synchronousGenerator ↔ OEL** (XADIFD)
*   **OEL → exciter** (VOEL, EFD)
*   **Default PMECH0 → PMECH** short (no governor present)
*   **VOEL/VOTHSG** are set to constants (no UEL or stabilizer present)

***

### 5. Example: Implementation of a TypeH Model

```modelica
model GENROU_EXAC1_MAXEX2
  extends GenUnitTypeH1(
    redeclare Electrical.Machine.SynchronousMachine.GENROU synchronousGenerator(...),
    redeclare Electrical.Control.Excitation.EXAC1 exciter(...),
    redeclare Electrical.Control.OverExcitationLimiter.MAXEX2 oel(...),
    redeclare Data.General.PlantGeneralData_003 generalData,
    redeclare Data.Machines.GENROU.GENROU_002 machineData,
    redeclare Data.Exciters.EXAC1.EXAC1_001 exciterData,
    redeclare Data.OELs.MAXEX2.MAXEX2_001 oelData
  );
end GENROU_EXAC1_MAXEX2
```

*All parameters are sourced from the corresponding data records, ensuring full configurability and reproducibility.*

***

### 6. Key Points

*   **TypeH models** are modular generator unit templates supporting excitation and OEL protection, but do **not include turbine-governor, UEL, or stabilizer loops**.
*   **All parameters** are provided via replaceable data records.
*   **Signal connections** are clearly defined, supporting dynamic simulations and OEL coordination.
*   **Extensibility:**
    *   Swap any subsystem (machine, exciter, OEL) by redeclaring the component and its data record.

***

### 7. Summary Table: TypeH Model Structure

| Component        | Description / Example (from GENROU\_EXAC1\_MAXEX2) |
| ---------------- | -------------------------------------------------- |
| Synchronous Gen. | `GENROU` (redeclared)                              |
| Exciter          | `EXAC1` (redeclared)                               |
| OEL              | `MAXEX2` (redeclared)                              |
| Machine Data     | `GENROU_002`                                       |
| Plant Data       | `PlantGeneralData_003`                             |
| Exciter Data     | `EXAC1_001`                                        |
| OEL Data         | `MAXEX2_001`                                       |
