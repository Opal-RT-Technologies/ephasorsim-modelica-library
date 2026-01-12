# OpalRT.GenUnits.TypeD — Documentation

## **1. High-Level Structure**

### **TypeD Package Overview**

The **TypeD** package defines generator unit models that combine a **Synchronous Machine**, an **Excitation System**, and a **Turbine-Governor**. This package is designed for advanced dynamic simulations where both voltage and speed control are required, and where modularity and extensibility are achieved through replaceable components and parameter records.

*   **Partial Model:** `GenUnitTypeD1`
    *   **Purpose:** Provides a template for generator units with both excitation and turbine-governor systems.
    *   **Key Features:** Modular, object-oriented, and highly configurable via replaceable components and data records.

*   **Concrete Models:** (e.g., `GENROU_EXAC1A_GGOV1`, `GENROU_ESST1A_BBGOV1`, etc.)
    *   **Purpose:** Implement models containing specific generator, exciter, and governor types by redeclaring the replaceable components and parameter records.

***

## **2. Object-Oriented Features**

### **Inheritance and Composition**

*   **Inheritance:** Concrete models extend the partial model `GenUnitTypeD1`.
*   **Composition:** Each unit contains:
    *   A **replaceable synchronous generator** (e.g., `GENROU`, `GENSAE`, `GENSAL`)
    *   A **replaceable exciter** (e.g., `EXAC1A`, `ESST1A`, `AC7B`)
    *   A **replaceable turbine-governor** (e.g., `GGOV1`, `IEEEG1`, `GAST`)
    *   **Replaceable data records** for machine, exciter, governor, and plant general data.

### **Replaceable Architecture**

*   All major components are declared as `replaceable`, allowing for flexible instantiation and substitution in derived models.
*   Parameter records are also replaceable, enabling easy configuration for different machine types and control strategies.

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
    machineData : MachineDynamicData
    generalData : PlantGeneralData
    exciterData : ExciterData
    governorData : GovernorData
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

  class MachineDynamicData {
    <<replaceable record>>
    // Machine-specific dynamic parameters
  }

  class PlantGeneralData {
    <<replaceable record>>
    // General plant parameters
  }

  class ExciterData {
    <<replaceable record>>
    // Exciter-specific parameters
  }

  class GovernorData {
    <<replaceable record>>
    // Governor-specific parameters
  }

  GenUnitTypeD1 o-- SynchronousGenerator : synchronousGenerator
  GenUnitTypeD1 o-- Exciter : exciter
  GenUnitTypeD1 o-- TurbineGovernor : turbineGovernor
  GenUnitTypeD1 o-- MachineDynamicData : machineData
  GenUnitTypeD1 o-- PlantGeneralData : generalData
  GenUnitTypeD1 o-- ExciterData : exciterData
  GenUnitTypeD1 o-- GovernorData : governorData
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
    machineData : MachineDynamicData
    generalData : PlantGeneralData
    exciterData : ExciterData
    governorData : GovernorData
  }

  class ConcreteModel {
    <<model>>
    extends GenUnitTypeD1
    // redeclare SynchronousGenerator
    // redeclare Exciter
    // redeclare TurbineGovernor
    // redeclare MachineDynamicData
    // redeclare PlantGeneralData
    // redeclare ExciterData
    // redeclare GovernorData
  }

  GenUnitTypeD1 <|-- ConcreteModel
  ConcreteModel o-- SynchronousGenerator
  ConcreteModel o-- Exciter
  ConcreteModel o-- TurbineGovernor
  ConcreteModel o-- MachineDynamicData
  ConcreteModel o-- PlantGeneralData
  ConcreteModel o-- ExciterData
  ConcreteModel o-- GovernorData
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
    redeclare GENROU_001 machineData
    redeclare PlantGeneralData_001 generalData
    redeclare EXAC1A_001 exciterData
    redeclare GGOV1_001 governorData
  }
  class GENROU
  class EXAC1A
  class GGOV1
  class GENROU_001
  class PlantGeneralData_001
  class EXAC1A_001
  class GGOV1_001

  GenUnitTypeD1 <|-- GENROU_EXAC1A_GGOV1
  GENROU_EXAC1A_GGOV1 o-- GENROU : synchronousGenerator
  GENROU_EXAC1A_GGOV1 o-- EXAC1A : exciter
  GENROU_EXAC1A_GGOV1 o-- GGOV1 : turbineGovernor
  GENROU_EXAC1A_GGOV1 o-- GENROU_001 : machineData
  GENROU_EXAC1A_GGOV1 o-- PlantGeneralData_001 : generalData
  GENROU_EXAC1A_GGOV1 o-- EXAC1A_001 : exciterData
  GENROU_EXAC1A_GGOV1 o-- GGOV1_001 : governorData
```

***

## **4. Summary**

*   **GenUnitTypeD1** is the base partial model for generator units with both excitation and turbine-governor systems.
*   **Concrete models** (e.g., `GENROU_EXAC1A_GGOV1`) extend this partial model and redeclare the generator, exciter, governor, and data records for specific configurations.
*   **Data records** provide the parameters for each unit, supporting configuration and simulation.
*   **SynchronousGenerator** is the core electrical model, with connections to both the exciter and turbine-governor as needed.
*   **Exciter** and **TurbineGovernor** exchange signals with the generator for dynamic control.


***

## **6. Key Points**

*   **TypeD models** are highly modular and extensible, supporting a wide range of generator, exciter, and governor types.
*   **All parameters** are provided via replaceable data records, making the models easy to configure for different scenarios.
*   **Signal connections** are clearly defined, supporting advanced dynamic simulations.
