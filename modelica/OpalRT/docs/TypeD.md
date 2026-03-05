# OpalRT.ModelSets.TypeD — Documentation

## **1. High-Level Structure**

### **TypeD Package Overview**

The **TypeD** package defines generator unit models that combine a **Synchronous Machine**, an **Excitation System**, and a **Turbine-Governor**. This package is designed for advanced dynamic simulations where both voltage and speed control are required, and where modularity and extensibility are achieved through replaceable components.

*   **Partial Model:** `GenUnitTypeD1`
    *   **Purpose:** Provides a template for generator units with both excitation and turbine-governor systems.
    *   **Key Features:** Modular, object-oriented, and highly configurable via replaceable components.

*   **Concrete Models:** (e.g., `GENROU_EXAC1A_GGOV1`, `GENROU_ESST1A_BBGOV1`, etc.)
    *   **Purpose:** Implement models containing specific generator, exciter, and governor types by redeclaring the replaceable components.

***

## **2. Object-Oriented Features**

### **Inheritance and Composition**

*   **Inheritance:** Concrete models extend the partial model `GenUnitTypeD1`.
*   **Composition:** Each unit contains:
    *   A **replaceable synchronous generator** (e.g., `GENROU`, `GENSAE`, `GENSAL`)
    *   A **replaceable exciter** (e.g., `EXAC1A`, `ESST1A`, `AC7B`)
    *   A **replaceable turbine-governor** (e.g., `GGOV1`, `IEEEG1`, `GAST`)

### **Replaceable Architecture**

*   All major components are declared as `replaceable`, allowing for flexible instantiation and substitution in derived models.

***

## **3. Class Diagrams**

### 📐 High-Level Class Diagram

```mermaid
classDiagram
  class GenUnitTypeD1 {
    <<partial>>
    +TRIP : InputInterfacePin
    +dVREF : InputInterfacePin
    +dGREF : InputInterfacePin
    +bus0 : PwPin
    synchronousGenerator : SynchronousGenerator
    exciter : Exciter
    turbineGovernor : TurbineGovernor
  }

  class SynchronousGenerator {
    <<replaceable>>
    // Electrical machine model (e.g., GENROU, GENSAE, GENSAL)
  }

  class Exciter {
    <<replaceable>>
    // Excitation system model (e.g., AC7B, ESST1A, EXAC1A)
  }

  class TurbineGovernor {
    <<replaceable>>
    // Turbine-governor model (e.g., GGOV1, IEEEG1, GAST)
  }

  GenUnitTypeD1 o-- SynchronousGenerator : synchronousGenerator
  GenUnitTypeD1 o-- Exciter : exciter
  GenUnitTypeD1 o-- TurbineGovernor : turbineGovernor
```

### 🔗 Component Extension Map (GenUnitTypeD1)

```mermaid
classDiagram
  class GenUnitTypeD1 {
    <<partial>>
    +TRIP : InputInterfacePin
    +dVREF : InputInterfacePin
    +dGREF : InputInterfacePin
    +bus0 : PwPin
    synchronousGenerator : SynchronousGenerator
    exciter : Exciter
    turbineGovernor : TurbineGovernor
  }

  class ConcreteModel {
    <<model>>
    extends GenUnitTypeD1
    // redeclare SynchronousGenerator
    // redeclare Exciter
    // redeclare TurbineGovernor
  }

  GenUnitTypeD1 <|-- ConcreteModel
  ConcreteModel o-- SynchronousGenerator
  ConcreteModel o-- Exciter
  ConcreteModel o-- TurbineGovernor
```

***

### **3.2. Component Interconnections**

```mermaid
flowchart TD
  TRIP["TRIP (InputInterfacePin)"] -->|connect| SG["SynchronousGenerator"]
  dVREF["dVREF (InputInterfacePin)"] -->|connect| EX["Exciter"]
  dGREF["dGREF (InputInterfacePin)"] -->|connect| TG["TurbineGovernor"]
  SG["SynchronousGenerator"] -->|p| bus0["bus0 (PwPin)"]

  %% Exciter <-> SynchronousGenerator connections
  EX["Exciter"] -- EFD --> SG
  SG -- EFD0 --> EX
  SG -- ETERM0 --> EX
  SG -- EX_AUX --> EX
  SG -- VI --> EX
  SG -- XADIFD --> EX

  %% TurbineGovernor <-> SynchronousGenerator connections
  TG -- PMECH --> SG
  SG -- PMECH0 --> TG
  SG -- SLIP --> TG
  SG -- MBASE --> TG
  SG -- VI --> TG
```

***

### **3.3. Example: Implementation of a Specific Model**

Let’s illustrate the structure for a concrete model, e.g., `GENROU_EXAC1A_GGOV1`:

```mermaid
classDiagram
  class GenUnitTypeD1
  class GENROU_EXAC1A_GGOV1 {
    <<model>>
    extends GenUnitTypeD1
    redeclare GENROU synchronousGenerator
    redeclare EXAC1A exciter
    redeclare GGOV1 turbineGovernor
  }
  class GENROU
  class EXAC1A
  class GGOV1

  GenUnitTypeD1 <|-- GENROU_EXAC1A_GGOV1
  GENROU_EXAC1A_GGOV1 o-- GENROU : synchronousGenerator
  GENROU_EXAC1A_GGOV1 o-- EXAC1A : exciter
  GENROU_EXAC1A_GGOV1 o-- GGOV1 : turbineGovernor
```

***

## **4. Summary**

*   **GenUnitTypeD1** is the base partial model for generator units with both excitation and turbine-governor systems.
*   **Concrete models** (e.g., `GENROU_EXAC1A_GGOV1`) extend this partial model and redeclare the generator, exciter, and governor for specific configurations.
*   **SynchronousGenerator** is the core electrical model, with connections to both the exciter and turbine-governor as needed.
*   **Exciter** and **TurbineGovernor** exchange signals with the generator for dynamic control.


***

## **6. Key Points**

*   **TypeD models** are highly modular and extensible, supporting a wide range of generator, exciter, and governor types.
*   **All parameters** are fully configurable, making the models easy to adapt for different scenarios.
*   **Signal connections** are clearly defined, supporting advanced dynamic simulations.
