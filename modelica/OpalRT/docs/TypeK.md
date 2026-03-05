## OpalRT.ModelSets.TypeK — Documentation

### 1. High-Level Structure

#### TypeK Package Overview

The **TypeK** package defines generator unit models that combine a **Synchronous Machine**, an **Excitation System**, an **Under-Excitation Limiter (UEL)**, and an **Over-Excitation Limiter (OEL)**. These models are designed for dynamic studies where both UEL and OEL protections are relevant, but turbine-governor and stabilizer loops are not present. TypeK is ideal for scenarios requiring coordinated excitation system protection against both under- and over-excitation events.

*   **Partial Model:**
    *   `GenUnitTypeK1`: Standard interface for synchronous machine, exciter, UEL, and OEL.
*   **Purpose:**
    *   Provide a modular, extensible template for generator units with excitation, UEL, and OEL protection.
*   **Key Features:**
    *   Highly modular, object-oriented, and fully parameterized via replaceable components.

***

### 2. Object-Oriented Features

#### Inheritance and Composition

*   **Inheritance:**
    *   Concrete models extend `GenUnitTypeK1`.
*   **Composition:**
    *   Each unit contains:
        *   A **replaceable synchronous generator**
        *   A **replaceable exciter**
        *   A **replaceable UEL**
        *   A **replaceable OEL**

#### Replaceable Architecture

*   All major components are declared as `replaceable`, enabling flexible instantiation and substitution in derived models.

***

### 3. Class Diagrams

#### High-Level Class Diagram

```mermaid
classDiagram
class GenUnitTypeK1 {
  <<partial>>
  +TRIP : InputInterfacePin
  +dVREF : InputInterfacePin
  +bus0 : PwPin
  synchronousGenerator : SynchronousGenerator
  exciter : Exciter
  uel : UnderExcitationLimiter
  oel : OverExcitationLimiter
}
class SynchronousGenerator { <<replaceable>> }
class Exciter { <<replaceable>> }
class UnderExcitationLimiter { <<replaceable>> }
class OverExcitationLimiter { <<replaceable>> }
GenUnitTypeK1 o-- SynchronousGenerator
GenUnitTypeK1 o-- Exciter
GenUnitTypeK1 o-- UnderExcitationLimiter
GenUnitTypeK1 o-- OverExcitationLimiter
```

#### Component Extension Map (TypeK)

```mermaid
classDiagram
class GenUnitTypeK1 { <<partial>> }
class ConcreteModel { <<model>> extends GenUnitTypeK1 }
class GENROU { }
class EXAC1 { }
class UEL1 { }
class MAXEX2 { }

GenUnitTypeK1 <|-- ConcreteModel
ConcreteModel o-- GENROU : synchronousGenerator
ConcreteModel o-- EXAC1 : exciter
ConcreteModel o-- UEL1 : uel
ConcreteModel o-- MAXEX2 : oel
```

***

### 4. Signal Connections

TypeK models define all major signal connections between generator, exciter, UEL, and OEL, including:

*   **TRIP** → synchronousGenerator.TRIP
*   **dVREF** → exciter.dVREF
*   **bus0** ← synchronousGenerator.p
*   **synchronousGenerator ↔ exciter** (EFD, EFD0, ETERM0, EX\_AUX, VI, XADIFD)
*   **synchronousGenerator ↔ UEL** (VI, EX\_AUX)
*   **UEL → exciter** (VUEL, VF)
*   **synchronousGenerator ↔ OEL** (XADIFD)
*   **OEL → exciter** (VOEL, EFD)
*   **Default PMECH0 → PMECH** short (no governor present)
*   **VOEL/VOTHSG** are set to constants (no stabilizer present)

***

### 5. Example: Implementation of a TypeK Model

```modelica
model GENROU_EXAC1_UEL1_MAXEX2
  extends GenUnitTypeK1(
    redeclare Electrical.Machine.SynchronousMachine.GENROU synchronousGenerator(...),
    redeclare Electrical.Control.Excitation.EXAC1 exciter(...),
    redeclare Electrical.Control.UnderExcitationLimiter.UEL1 uel(...),
    redeclare Electrical.Control.OverExcitationLimiter.MAXEX2 oel(...)
  );
end GENROU_EXAC1_UEL1_MAXEX2
```

*All parameters ensure full configurability and reproducibility.*

***

### 6. Key Points

*   **TypeK models** are modular generator unit templates supporting excitation, UEL, and OEL protection, but **do not include turbine-governor or stabilizer loops**.
*   **All parameters** are fully configurable, making the models easy to configure for different scenarios and studies.
*   **Signal connections** are clearly defined, supporting dynamic simulations and coordinated excitation protection.
*   **Extensibility:**
    *   Swap any subsystem (machine, exciter, UEL, OEL) by redeclaring the component.

***

### 7. Summary Table: TypeK Model Structure

| Component        | Description / Example (from GENROU\_EXAC1\_UEL1\_MAXEX2) |
| ---------------- | -------------------------------------------------------- |
| Synchronous Gen. | `GENROU` (redeclared)                                    |
| Exciter          | `EXAC1` (redeclared)                                     |
| UEL              | `UEL1` (redeclared)                                      |
| OEL              | `MAXEX2` (redeclared)                                    |
