# OpalRT.GenUnits.TypeC — Documentation

## 🧩 High-Level Structure

### 📦 Package Overview

The **TypeC Package** defines a partial model `GenUnitTypeC1` that encapsulates a **Synchronous Generator** and a **Turbine-Governor** system. It is designed for modularity and extensibility using replaceable components and connectors.

### 🔧 Core Components

*   **Synchronous Generator**: `Electrical.PartialModel.SynchronousGenerator`
*   **Turbine Governor**: `Electrical.PartialModel.TurbineGovernor`
*   **Data Records**:
    *   `Data.Machines.MachineDynamicData`
    *   `Data.General.PlantGeneralData`
    *   `Data.Governors.GovernorData`

### 🔌 Connectors

*   `TRIP`: Input interface pin for trip signal
*   `dGREF`: Input interface pin for governor reference
*   `bus0`: Power pin for electrical connection

***

## 🧠 Some Features

### 🔁 Replaceable Architecture

Each major component is declared as **replaceable**, allowing for flexible instantiation and substitution in derived models.

### 🔗 Connection Logic

*   `TRIP` → `synchronousGenerator.TRIP`
*   `synchronousGenerator.p` → `bus0`
*   `turbineGovernor.PMECH` ↔ `synchronousGenerator.PMECH`
*   Additional shared parameters:
    *   `PMECH0`, `SLIP`, `MBASE`, `VI` are bidirectionally connected between generator and governor
*   `dGREF` → `turbineGovernor.dGREF`

***

## 🧭 Comparison with TypeA Package

Models in the **TypeA Package** include only the **Synchronous Generator**, without excitation or governor systems. TypeC models expand upon this by integrating the **Turbine-Governor** and associated data records, making it suitable for more dynamic simulations and control scenarios.

***

## 📐 High-Level Class Diagram

```mermaid
classDiagram
    class GenUnitTypeC1 {
        +TRIP : InputInterfacePin
        +dGREF : InputInterfacePin
        +bus0 : PwPin
    }

    class SynchronousGenerator {
        +TRIP
        +PMECH
        +PMECH0
        +SLIP
        +MBASE
        +VI
        +EFD0
        +EFD
    }

    class TurbineGovernor {
        +PMECH
        +PMECH0
        +SLIP
        +MBASE
        +VI
        +dGREF
    }

    class MachineDynamicData
    class PlantGeneralData
    class GovernorData

    GenUnitTypeC1 --> SynchronousGenerator : contains
    GenUnitTypeC1 --> TurbineGovernor : contains
    GenUnitTypeC1 --> MachineDynamicData : uses
    GenUnitTypeC1 --> PlantGeneralData : uses
    GenUnitTypeC1 --> GovernorData : uses
    SynchronousGenerator <--> TurbineGovernor : connected
```

***

## 🔗 Component Extension Map (GenUnitTypeC1)

This diagram shows how models extending `GenUnitTypeC1` would typically redeclare components:

```mermaid
classDiagram
    class GenUnitTypeC1
    class GENROU
    class GovernorModel
    class PlantGeneralData_001
    class MachineDynamicData_001
    class GovernorData_001

    GenUnitTypeC1 <|-- ExtendedModel
    ExtendedModel --> GENROU : redeclare synchronousGenerator
    ExtendedModel --> GovernorModel : redeclare turbineGovernor
    ExtendedModel --> PlantGeneralData_001 : redeclare generalData
    ExtendedModel --> MachineDynamicData_001 : redeclare machineData
    ExtendedModel --> GovernorData_001 : redeclare governorData
```

### 🧬 Mermaid Class Diagram: Connections in `GenUnitTypeC1`

```mermaid
classDiagram
    class GenUnitTypeC1 {
        <<partial>>
        +TRIP : InputInterfacePin
        +dGREF : InputInterfacePin
        +bus0 : PwPin
    }

    class SynchronousGenerator {
        <<replaceable>>
        +TRIP
        +PMECH
        +PMECH0
        +SLIP
        +MBASE
        +VI
        +EFD0
        +EFD
        +p : PwPin
    }

    class TurbineGovernor {
        <<replaceable>>
        +PMECH
        +PMECH0
        +SLIP
        +MBASE
        +VI
        +dGREF
    }

    class Exciter {
        <<replaceable>>
        +EFD
        +EFD0
        +ETERM0
        +EX_AUX
    }

    class Stabilizer {
        <<replaceable>>
        +PSS_AUX2[1]
        +PSS_AUX2[2]
        +VI2
    }

    GenUnitTypeC1 --> SynchronousGenerator : contains
    GenUnitTypeC1 --> TurbineGovernor : contains
    GenUnitTypeC1 --> Exciter : contains
    GenUnitTypeC1 --> Stabilizer : contains

    GenUnitTypeC1 --> bus0
    GenUnitTypeC1 --> TRIP
    GenUnitTypeC1 --> dGREF

    SynchronousGenerator <--> TurbineGovernor : shares PMECH, SLIP, MBASE, VI
    SynchronousGenerator <--> Exciter : shares EFD, EFD0
    SynchronousGenerator <--> Stabilizer : shares SLIP, AccPower, VI
```

## Model Implementation Example

```mermaid
classDiagram
  %% Partial Model
  class GenUnitTypeC1 {
    <<partial>>
    +TRIP : InputInterfacePin
    +dGREF : InputInterfacePin
    +bus0 : PwPin
    synchronousGenerator : SynchronousGenerator
    turbineGovernor : TurbineGovernor
    machineData : MachineDynamicData
    generalData : PlantGeneralData
    governorData : GovernorData
  }

  %% Concrete Model
  class GENROU_IEESGO {
    <<model>>
    extends GenUnitTypeC1
    // redeclare GENROU synchronousGenerator
    // redeclare IEESGO turbineGovernor
    // redeclare GENROU_001 machineData
    // redeclare PlantGeneralData_001 generalData
    // redeclare IEESGO_001 governorData
  }

  %% Synchronous Generator
  class GENROU {
    <<model>>
    // All GENROU parameters (IBUS, ID, P_gen, etc.)
    PMECH
    PMECH0
    SLIP
    MBASE
    VI
    EFD0
    EFD
    TRIP
    p : PwPin
  }

  %% Turbine Governor
  class IEESGO {
    <<model>>
    // All IEESGO parameters (T1, T2, ..., PMAX, PMIN)
    PMECH
    PMECH0
    SLIP
    MBASE
    VI
    dGREF
  }

  %% Data Records
  class GENROU_001 {
    <<record>>
    // All GENROU_001 parameters
  }
  class PlantGeneralData_001 {
    <<record>>
    // All PlantGeneralData_001 parameters
  }
  class IEESGO_001 {
    <<record>>
    // All IEESGO_001 parameters
  }

  %% Relationships
  GenUnitTypeC1 <|-- GENROU_IEESGO
  GENROU_IEESGO o-- GENROU : synchronousGenerator
  GENROU_IEESGO o-- IEESGO : turbineGovernor
  GENROU_IEESGO o-- GENROU_001 : machineData
  GENROU_IEESGO o-- PlantGeneralData_001 : generalData
  GENROU_IEESGO o-- IEESGO_001 : governorData

  %% Main Signal Connections (as comments)
  %% - TRIP --> synchronousGenerator.TRIP
  %% - synchronousGenerator.p --> bus0
  %% - turbineGovernor.PMECH --> synchronousGenerator.PMECH
  %% - synchronousGenerator.PMECH0 --> turbineGovernor.PMECH0
  %% - synchronousGenerator.SLIP --> turbineGovernor.SLIP
  %% - synchronousGenerator.MBASE --> turbineGovernor.MBASE
  %% - synchronousGenerator.VI --> turbineGovernor.VI
  %% - dGREF --> turbineGovernor.dGREF
```
