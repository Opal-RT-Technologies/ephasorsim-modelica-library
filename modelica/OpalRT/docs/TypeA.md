# OpalRT.GenUnits.TypeA — Documentation

## **1. High-Level Structure**

### **TypeA Package**

*   Contains **partial models**: `GenUnitTypeA1` and `GenUnitTypeA2`.
*   Contains **concrete models**: `GENCLS`, `GENROE`, `GENROU`, `GENSAE`, `GENSAL`, each extending either `GenUnitTypeA1` or `GenUnitTypeA2`.
*   Each unit model uses:
    *   A **replaceable synchronous generator** (from `Electrical.PartialModel.SynchronousGenerator` or its redeclared versions).
    *   **Machine dynamic data** (from `Machines` package).
    *   **General plant data** (from `General` package).

### **Partial Models**

*   **GenUnitTypeA1**: Base for units with a synchronous machine only.
*   **GenUnitTypeA2**: Extends `GenUnitTypeA1`, adds more connections (e.g., excitation system).

### **Data Records**

*   **General.PlantGeneralData**: Contains general parameters for the plant.
*   **Machines.MachineDynamicData**: Base for machine-specific dynamic data.
*   Specialized records for each machine type (e.g., `GENCLS_001`, `GENROE_001`).

### **Electrical.PartialModel**

*   **SynchronousGenerator**: Partial model for synchronous generator behavior.
*   Other partial models: Exciter, TurbineGovernor, Stabilizer, etc.

***

## **2. Object-Oriented Connections**

*   **Inheritance**: Concrete models inherit from partial models (`GenUnitTypeA1` or `GenUnitTypeA2`).
*   **Composition**: Each unit contains instances of data records and a synchronous generator.
*   **Replaceable Classes**: Synchronous generator and data records are replaceable, allowing for flexible configuration.

***

## **3. Class Diagrams**

Below is a Mermaid diagram that captures the main relationships and structure.

```mermaid
classDiagram
    %% Data Records
    class PlantGeneralData {
        <<record>>
        IBUS: Integer
        M_ID: String
        P_gen: Real
        Q_gen: Real
        Vt_abs: Real
        Vt_ang: Real
        SB: Real
        fn: Real
    }
    class MachineDynamicData {
        <<record>>
    }
    class DynamicDataGENCLS {
        <<record>>
        ZSOURCE_RE: Real
        ZSOURCE_IM: Real
        H: Real
        D: Real
    }
    class DynamicDataGENROE {
        <<record>>
        ZSOURCE_RE: Real
        Tdo_p: Real
        Tdo_s: Real
        Tqo_p: Real
        Tqo_s: Real
        H: Real
        D: Real
        Xd: Real
        Xq: Real
        Xd_p: Real
        Xq_p: Real
        Xd_s: Real
        Xl: Real
        S1: Real
        S12: Real
    }
    %% ... (other DynamicData classes omitted for brevity)

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
        machineData: MachineDynamicData
        generalData: PlantGeneralData
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
        redeclare PlantGeneralData_002
        redeclare DynamicDataGENCLS_001
    }
    class GENROE {
        <<model>>
        GenUnitTypeA2
        redeclare SynchronousGenerator
        redeclare PlantGeneralData_001
        redeclare DynamicDataGENROE_001
    }
    %% ... (other models omitted for brevity)

    %% Relationships
    GenUnitTypeA2 --|> GenUnitTypeA1
    GENCLS --|> GenUnitTypeA1
    GENROE --|> GenUnitTypeA2
    GENCLS o-- SynchronousGenerator
    GENCLS o-- PlantGeneralData
    GENCLS o-- DynamicDataGENCLS
    GENROE o-- SynchronousGenerator
    GENROE o-- PlantGeneralData
    GENROE o-- DynamicDataGENROE
    GenUnitTypeA1 o-- SynchronousGenerator
    GenUnitTypeA1 o-- MachineDynamicData
    GenUnitTypeA1 o-- PlantGeneralData
    DynamicDataGENCLS --|> MachineDynamicData
    DynamicDataGENROE --|> MachineDynamicData
```

Here’s a detailed Mermaid class diagram that includes all machine types from the EPFMU Modelica library, showing how each concrete generator model (GENCLS, GENROE, GENROU, GENSAE, GENSAL) is structured and connected to data records and partial models.

```mermaid
classDiagram
    %% Data Records
    class PlantGeneralData {
        <<record>>
        IBUS: Integer
        M_ID: String
        P_gen: Real
        Q_gen: Real
        Vt_abs: Real
        Vt_ang: Real
        SB: Real
        fn: Real
    }
    class MachineDynamicData {
        <<record>>
    }
    class DynamicDataGENCLS {
        <<record>>
        ZSOURCE_RE: Real
        ZSOURCE_IM: Real
        H: Real
        D: Real
    }
    class DynamicDataGENROE {
        <<record>>
        ZSOURCE_RE: Real
        Tdo_p: Real
        Tdo_s: Real
        Tqo_p: Real
        Tqo_s: Real
        H: Real
        D: Real
        Xd: Real
        Xq: Real
        Xd_p: Real
        Xq_p: Real
        Xd_s: Real
        Xl: Real
        S1: Real
        S12: Real
    }
    class DynamicDataGENROU {
        <<record>>
        ZSOURCE_RE: Real
        Tdo_p: Real
        Tdo_s: Real
        Tqo_p: Real
        Tqo_s: Real
        H: Real
        D: Real
        Xd: Real
        Xq: Real
        Xd_p: Real
        Xq_p: Real
        Xd_s: Real
        Xl: Real
        S1: Real
        S12: Real
    }
    class DynamicDataGENSAE {
        <<record>>
        ZSOURCE_RE: Real
        Tdo_p: Real
        Tdo_s: Real
        Tqo_s: Real
        H: Real
        D: Real
        Xd: Real
        Xq: Real
        Xd_p: Real
        Xd_s: Real
        Xl: Real
        S1: Real
        S12: Real
    }
    class DynamicDataGENSAL {
        <<record>>
        ZSOURCE_RE: Real
        Tdo_p: Real
        Tdo_s: Real
        Tqo_s: Real
        H: Real
        D: Real
        Xd: Real
        Xq: Real
        Xd_p: Real
        Xd_s: Real
        Xl: Real
        S1: Real
        S12: Real
    }

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
        machineData: MachineDynamicData
        generalData: PlantGeneralData
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
        redeclare PlantGeneralData_002
        redeclare DynamicDataGENCLS_001
    }
    class GENROE {
        <<model>>
        GenUnitTypeA2
        redeclare SynchronousGenerator
        redeclare PlantGeneralData_001
        redeclare DynamicDataGENROE_001
    }
    class GENROU {
        <<model>>
        GenUnitTypeA2
        redeclare SynchronousGenerator
        redeclare PlantGeneralData_001
        redeclare DynamicDataGENROU_001
    }
    class GENSAE {
        <<model>>
        GenUnitTypeA2
        redeclare SynchronousGenerator
        redeclare PlantGeneralData_001
        redeclare DynamicDataGENSAE_001
    }
    class GENSAL {
        <<model>>
        GenUnitTypeA2
        redeclare SynchronousGenerator
        redeclare PlantGeneralData_001
        redeclare DynamicDataGENSAL_001
    }

    %% Relationships
    GenUnitTypeA2 --|> GenUnitTypeA1
    GENCLS --|> GenUnitTypeA1
    GENROE --|> GenUnitTypeA2
    GENROU --|> GenUnitTypeA2
    GENSAE --|> GenUnitTypeA2
    GENSAL --|> GenUnitTypeA2

    GENCLS o-- SynchronousGenerator
    GENCLS o-- PlantGeneralData
    GENCLS o-- DynamicDataGENCLS

    GENROE o-- SynchronousGenerator
    GENROE o-- PlantGeneralData
    GENROE o-- DynamicDataGENROE

    GENROU o-- SynchronousGenerator
    GENROU o-- PlantGeneralData
    GENROU o-- DynamicDataGENROU

    GENSAE o-- SynchronousGenerator
    GENSAE o-- PlantGeneralData
    GENSAE o-- DynamicDataGENSAE

    GENSAL o-- SynchronousGenerator
    GENSAL o-- PlantGeneralData
    GENSAL o-- DynamicDataGENSAL

    GenUnitTypeA1 o-- SynchronousGenerator
    GenUnitTypeA1 o-- MachineDynamicData
    GenUnitTypeA1 o-- PlantGeneralData

    DynamicDataGENCLS --|> MachineDynamicData
    DynamicDataGENROE --|> MachineDynamicData
    DynamicDataGENROU --|> MachineDynamicData
    DynamicDataGENSAE --|> MachineDynamicData
    DynamicDataGENSAL --|> MachineDynamicData
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

Here’s a Mermaid class diagram showing how the **data records for synchronous machine parameters** are structured in your Modelica library, including examples of specific instances like `GENROU_001` and `GENSAE_001`.

```mermaid
classDiagram
    %% Base record for machine dynamic data
    class MachineDynamicData {
        <<partial record>>
    }

    %% Specialized record for GENROU machine type
    class DynamicDataGENROU {
        ZSOURCE_RE: Real
        Tdo_p: Real
        Tdo_s: Real
        Tqo_p: Real
        Tqo_s: Real
        H: Real
        D: Real
        Xd: Real
        Xq: Real
        Xd_p: Real
        Xq_p: Real
        Xd_s: Real
        Xl: Real
        S1: Real
        S12: Real
    }
    class DynamicDataGENSAE {
        ZSOURCE_RE: Real
        Tdo_p: Real
        Tdo_s: Real
        Tqo_s: Real
        H: Real
        D: Real
        Xd: Real
        Xq: Real
        Xd_p: Real
        Xd_s: Real
        Xl: Real
        S1: Real
        S12: Real
    }

    %% Example instances
    class GENROU_001 {
        ZSOURCE_RE = 0
        Tdo_p = 7
        Tdo_s = 0.03
        Tqo_p = 0.7
        Tqo_s = 0.04
        H = 50
        D = 0
        Xd = 0.2
        Xq = 0.19
        Xd_p = 0.06
        Xq_p = 0.06
        Xd_s = 0.02
        Xl = 0.03
        S1 = 0.4
        S12 = 0.8
    }
    class GENROU_002 {
        ZSOURCE_RE = 0
        Tdo_p = 10.2
        Tdo_s = 0.5
        Tqo_p = 1.02
        Tqo_s = 0.01
        H = 8.2
        D = 0
        Xd = 3
        Xq = 0.5
        Xd_p = 0.5231
        Xq_p = 0.361
        Xd_s = 0.41
        Xl = 0.2
        S1 = 0.5
        S12 = 0.6
    }
    class GENSAE_001 {
        ZSOURCE_RE = 0
        Tdo_p = 10
        Tdo_s = 0.05
        Tqo_s = 0.01
        H = 50
        D = 0
        Xd = 0.2
        Xq = 0.19
        Xd_p = 0.06
        Xd_s = 0.02
        Xl = 0.03
        S1 = 0.4
        S12 = 0.8
    }

    %% Inheritance and instantiation relationships
    DynamicDataGENROU --|> MachineDynamicData
    DynamicDataGENSAE --|> MachineDynamicData

    GENROU_001 --|> DynamicDataGENROU
    GENROU_002 --|> DynamicDataGENROU
    GENSAE_001 --|> DynamicDataGENSAE
```


***

## **4. Summary of Connections**

*   **GenUnitTypeA1** is the base partial model for generator units, containing the main electrical and data components.
*   **GenUnitTypeA2** extends `GenUnitTypeA1`, adding further connections (e.g., excitation).
*   **Concrete models** (`GENCLS`, `GENROE`, etc.) extend these partial models and redeclare the generator and data records for specific machine types.
*   **Data records** provide the parameters for each unit, supporting configuration and simulation.
*   **SynchronousGenerator** is the core electrical model, with connections to other components (Exciter, TurbineGovernor, etc.) as needed.

***
