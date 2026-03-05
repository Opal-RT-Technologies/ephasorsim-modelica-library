# OpalRT.ModelSets.TypeA — Documentation

## **1. High-Level Structure**

### **TypeA Package**

*   Contains **partial models**: `GenUnitTypeA1` and `GenUnitTypeA2`.
*   Contains **concrete models**: `GENCLS`, `GENROE`, `GENROU`, `GENSAE`, `GENSAL`, each extending either `GenUnitTypeA1` or `GenUnitTypeA2`.
*   Each unit model uses:
    *   A **replaceable synchronous generator** (from `Electrical.PartialModel.SynchronousGenerator` or its redeclared versions).

### **Partial Models**

*   **GenUnitTypeA1**: Base for units with a synchronous machine only.
*   **GenUnitTypeA2**: Extends `GenUnitTypeA1`, adds more connections (e.g., excitation system).

### **Electrical.PartialModel**

*   **SynchronousGenerator**: Partial model for synchronous generator behavior.
*   Other partial models: Exciter, TurbineGovernor, Stabilizer, etc.

***

## **2. Object-Oriented Connections**

*   **Inheritance**: Concrete models inherit from partial models (`GenUnitTypeA1` or `GenUnitTypeA2`).
*   **Composition**: Each unit contains a synchronous generator.
*   **Replaceable Classes**: Synchronous generator is replaceable, allowing for flexible configuration.

***

## **3. Class Diagrams**

Below is a Mermaid diagram that captures the main relationships and structure.

```mermaid
classDiagram
    %% Partial Models
    class SynchronousGenerator {
        <<partial model>>
        partType: Real
        enablePQ: Boolean
        PELEC: Real
        QELEC: Real
        PMECH: RealInput
        p: PwPin
        SLIP: RealOutput
        PMECH0: RealOutput
        EFD0: RealOutput
        EFD: RealInput
        TRIP: RealInput
        AccPower: RealOutput
        XADIFD: RealOutput
        ETERM0: RealOutput
        EX_AUX: RealOutput[4]
        MBASE: RealOutput
        VI: RealOutput[4]
    }

    class GenUnitTypeA1 {
        <<partial model>>
        TRIP: InputInterfacePin
        bus0: PwPin
        synchronousGenerator: SynchronousGenerator
    }

    class GenUnitTypeA2 {
        <<partial model>>
        GenUnitTypeA1
        connect(synchronousGenerator.EFD, synchronousGenerator.ETERM0)
    }

    %% Concrete Models
    class GENCLS {
        <<model>>
        GenUnitTypeA1
        redeclare SynchronousGenerator
    }
    class GENROE {
        <<model>>
        GenUnitTypeA2
        redeclare SynchronousGenerator
    }
    %% ... (other models omitted for brevity)

    %% Relationships
    GenUnitTypeA2 --|> GenUnitTypeA1
    GENCLS --|> GenUnitTypeA1
    GENROE --|> GenUnitTypeA2
    GENCLS o-- SynchronousGenerator
    GenUnitTypeA1 o-- SynchronousGenerator
```

Here’s a detailed Mermaid class diagram that includes all machine types from the EPFMU Modelica library, showing how each concrete generator model (GENCLS, GENROE, GENROU, GENSAE, GENSAL) is structured and connected to partial models.

```mermaid
classDiagram
    %% Partial Models
    class SynchronousGenerator {
        <<partial model>>
        partType: Real
        enablePQ: Boolean
        PELEC: Real
        QELEC: Real
        PMECH: RealInput
        p: PwPin
        SLIP: RealOutput
        PMECH0: RealOutput
        EFD0: RealOutput
        EFD: RealInput
        TRIP: RealInput
        AccPower: RealOutput
        XADIFD: RealOutput
        ETERM0: RealOutput
        EX_AUX: RealOutput[4]
        MBASE: RealOutput
        VI: RealOutput[4]
    }

    class GenUnitTypeA1 {
        <<partial model>>
        TRIP: InputInterfacePin
        bus0: PwPin
        synchronousGenerator: SynchronousGenerator
    }

    class GenUnitTypeA2 {
        <<partial model>>
        GenUnitTypeA1
        connect(synchronousGenerator.EFD, synchronousGenerator.ETERM0)
    }

    %% Concrete Models
    class GENCLS {
        <<model>>
        GenUnitTypeA1
        redeclare SynchronousGenerator
    }
    class GENROE {
        <<model>>
        GenUnitTypeA2
        redeclare SynchronousGenerator
    }
    class GENROU {
        <<model>>
        GenUnitTypeA2
        redeclare SynchronousGenerator
    }
    class GENSAE {
        <<model>>
        GenUnitTypeA2
        redeclare SynchronousGenerator
    }
    class GENSAL {
        <<model>>
        GenUnitTypeA2
        redeclare SynchronousGenerator
    }

    %% Relationships
    GenUnitTypeA2 --|> GenUnitTypeA1
    GENCLS --|> GenUnitTypeA1
    GENROE --|> GenUnitTypeA2
    GENROU --|> GenUnitTypeA2
    GENSAE --|> GenUnitTypeA2
    GENSAL --|> GenUnitTypeA2

    GENCLS o-- SynchronousGenerator
    GENROE o-- SynchronousGenerator
    GENROU o-- SynchronousGenerator
    GENSAE o-- SynchronousGenerator
    GENSAL o-- SynchronousGenerator

    GenUnitTypeA1 o-- SynchronousGenerator
```

Here’s a detailed Mermaid class diagram showing how the **electrical components**—such as the Exciter, TurbineGovernor, Stabilizer, OverExcitationLimiter, and UnderExcitationLimiter—connect to the **SynchronousGenerator** in your Modelica library.

```mermaid
classDiagram
    %% Core Generator Model
    class SynchronousGenerator {
        <<partial model>>
        PMECH: RealInput
        PMECH0: RealOutput
        EFD: RealInput
        EFD0: RealOutput
        ETERM0: RealOutput
        AccPower: RealOutput
        XADIFD: RealOutput
        VI: RealOutput[4]
        EX_AUX: RealOutput[4]
        SLIP: RealOutput
        TRIP: RealInput
        p: PwPin
    }

    %% Electrical Components
    class Exciter {
        <<partial model>>
        EFD: RealOutput
        EFD0: RealInput
        dVREF: RealInput
        VOTHSG: RealInput
        XADIFD: RealInput
        ETERM0: RealInput
        VUEL: RealInput
        VOEL: RealInput
        EX_AUX: RealInput[4]
        VF: RealOutput
        VI: RealInput[4]
    }
    class TurbineGovernor {
        <<partial model>>
        PMECH: RealOutput
        PMECH0: RealInput
        SLIP: RealInput
        dGREF: RealInput
        PMECH_LP: RealOutput
        MBASE: RealInput
        VI: RealInput[4]
    }
    class Stabilizer {
        <<partial model>>
        VOTHSG: RealOutput
        PSS_AUX: RealInput[2]
        PSS_AUX2: RealInput[2]
        VI: RealInput[4]
        VI2: RealInput[4]
    }
    class OverExcitationLimiter {
        <<partial model>>
        EFD: RealInput
        XADIFD: RealInput
        VOEL: RealOutput
    }
    class UnderExcitationLimiter {
        <<partial model>>
        VI: RealInput[4]
        EX_AUX: RealInput[4]
        VUEL: RealOutput
        VF: RealInput
    }

    %% Connections
    Exciter "EFD" --> SynchronousGenerator : EFD
    SynchronousGenerator "EFD0" --> Exciter : EFD0
    SynchronousGenerator "XADIFD" --> Exciter : XADIFD
    SynchronousGenerator "ETERM0" --> Exciter : ETERM0
    SynchronousGenerator "EX_AUX" --> Exciter : EX_AUX
    SynchronousGenerator "VI" --> Exciter : VI

    TurbineGovernor "PMECH" --> SynchronousGenerator : PMECH
    SynchronousGenerator "PMECH0" --> TurbineGovernor : PMECH0
    SynchronousGenerator "SLIP" --> TurbineGovernor : SLIP
    SynchronousGenerator "MBASE" --> TurbineGovernor : MBASE
    SynchronousGenerator "VI" --> TurbineGovernor : VI

    Stabilizer "VOTHSG" --> Exciter : VOTHSG
    SynchronousGenerator "VI" --> Stabilizer : VI
    SynchronousGenerator "VI2" --> Stabilizer : VI2

    OverExcitationLimiter "EFD" --> Exciter : EFD
    SynchronousGenerator "XADIFD" --> OverExcitationLimiter : XADIFD
    OverExcitationLimiter "VOEL" --> Exciter : VOEL

    UnderExcitationLimiter "VI" --> SynchronousGenerator : VI
    UnderExcitationLimiter "EX_AUX" --> SynchronousGenerator : EX_AUX
    UnderExcitationLimiter "VUEL" --> Exciter : VUEL
    UnderExcitationLimiter "VF" --> Exciter : VF
```


***

## **4. Summary of Connections**

*   **GenUnitTypeA1** is the base partial model for generator units, containing the main electrical components.
*   **GenUnitTypeA2** extends `GenUnitTypeA1`, adding further connections (e.g., excitation).
*   **Concrete models** (`GENCLS`, `GENROE`, etc.) extend these partial models and redeclare the generator for specific machine types.
*   **SynchronousGenerator** is the core electrical model, with connections to other components (Exciter, TurbineGovernor, etc.) as needed.

***
