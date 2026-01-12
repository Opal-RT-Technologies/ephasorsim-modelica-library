# OpalRT.GenUnits.TypeB — Documentation

## **TypeB Package Structure**

### **1. Partial Model: GenUnitTypeB1**

*   **GenUnitTypeB1** is the base partial model for generator units with both a synchronous machine and an excitation system.
*   It contains:
    *   **TRIP** (input pin)
    *   **bus0** (power pin)
    *   **synchronousGenerator** (replaceable, e.g., GENROU, GENSAE, GENSAL)
    *   **exciter** (replaceable, e.g., AC7B, ESST4B, EXAC3, etc.)
    *   **machineData** (replaceable, from Machines package)
    *   **generalData** (replaceable, from General package)
    *   **exciterData** (replaceable, from Exciters package)
    *   **dVREF** (input pin for excitation reference)
*   The partial model defines the connections between these components, including signal flow between generator and exciter.

***

### **2. Concrete Models**

*   Each concrete model (e.g., GENROU\_AC7B, GENROU\_ESST4B, GENSAE\_ESST1A, etc.) extends **GenUnitTypeB1**.
*   Each model:
    *   **redeclares** the synchronous generator (e.g., GENROU, GENSAE, GENSAL).
    *   **redeclares** the exciter (e.g., AC7B, ESST4B, EXAC3, etc.).
    *   **redeclares** the machine data record (e.g., GENROU\_001, GENROU\_002, GENSAL\_001, etc.).
    *   **redeclares** the general data record (e.g., PlantGeneralData\_001, PlantGeneralData\_002, etc.).
    *   **redeclares** the exciter data record (e.g., AC7B\_001, ESST4B\_001, etc.).

***

### **3. Data Records**

*   **MachineDynamicData**: Base record for machine parameters.
*   **DynamicDataGENROU**, **DynamicDataGENSAE**, **DynamicDataGENSAL**: Specialized records for each machine type.
*   **ExciterData**: Specialized records for each exciter type (e.g., AC7B\_001, ESST4B\_001).
*   **PlantGeneralData**: General plant parameters.

***

## **4. Mermaid Class Diagram**

Below is a Mermaid diagram showing the structure and relationships for TypeB models extending GenUnitTypeB1, including examples for GENROU and GENSAL machines with different exciters and data records.

```mermaid
classDiagram
    %% Base Partial Model
    class GenUnitTypeB1 {
        <<partial model>>
        TRIP: InputInterfacePin
        bus0: PwPin
        synchronousGenerator: SynchronousGenerator
        exciter: Exciter
        machineData: MachineDynamicData
        generalData: PlantGeneralData
        exciterData: ExciterData
        dVREF: InputInterfacePin
    }

    %% Synchronous Machine Types
    class GENROU {
        <<model>>
        // Model parameters
    }
    class GENSAL {
        <<model>>
        // Model parameters
    }
    class GENSAE {
        <<model>>
        // Model parameters
    }

    %% Exciter Models
    class AC7B {
        <<model>>
        // Model parameters
    }
    class ESST4B {
        <<model>>
        // Model parameters
    }

    %% Exciter Data Record Hierarchy
    class ExciterData {
        <<partial record>>
    }
    class DataAC7B {
        <<partial record>>
        TR_ex
        KPR_ex
        // etc.
    }
    class DataESST4B {
        <<partial record>>
        TR_ex
        KPR_ex
        // etc.
    }
    class AC7B_001 {
        <<record>>
        // Example values
    }
    class ESST4B_001 {
        <<record>>
        // Example values
    }

    %% General Data Records
    class PlantGeneralData_001 {
        <<record>>
        // Example values
    }
    class GENROU_001 {
        <<record>>
        // Example values
    }
    class GENSAL_001 {
        <<record>>
        // Example values
    }

    %% Concrete Models (examples)
    class GENROU_AC7B {
        <<model>>
        GenUnitTypeB1
        contains GENROU
        contains AC7B
        contains GENROU_001
        contains PlantGeneralData_001
        contains AC7B_001
    }
    class GENROU_ESST4B {
        <<model>>
        GenUnitTypeB1
        contains GENROU
        contains ESST4B
        contains GENROU_001
        contains PlantGeneralData_001
        contains ESST4B_001
    }
    class GENSAL_ESST4B {
        <<model>>
        GenUnitTypeB1
        contains GENSAL
        contains ESST4B
        contains GENSAL_001
        contains PlantGeneralData_001
        contains ESST4B_001
    }

    %% Relationships
    DataAC7B --|> ExciterData
    AC7B_001 --|> DataAC7B
    DataESST4B --|> ExciterData
    ESST4B_001 --|> DataESST4B

    GENROU_AC7B --|> GenUnitTypeB1
    GENROU_ESST4B --|> GenUnitTypeB1
    GENSAL_ESST4B --|> GenUnitTypeB1

    GENROU_AC7B o-- GENROU
    GENROU_AC7B o-- AC7B
    GENROU_AC7B o-- GENROU_001
    GENROU_AC7B o-- PlantGeneralData_001
    GENROU_AC7B o-- AC7B_001

    GENROU_ESST4B o-- GENROU
    GENROU_ESST4B o-- ESST4B
    GENROU_ESST4B o-- GENROU_001
    GENROU_ESST4B o-- PlantGeneralData_001
    GENROU_ESST4B o-- ESST4B_001

    GENSAL_ESST4B o-- GENSAL
    GENSAL_ESST4B o-- ESST4B
    GENSAL_ESST4B o-- GENSAL_001
    GENSAL_ESST4B o-- PlantGeneralData_001
    GENSAL_ESST4B o-- ESST4B_001
```

In Modelica, **models** (like `Electrical.Control.Excitation.AC7B`) are components, while **records** (like `Data.Exciters.AC7B.AC7B_001`) are data containers. The exciter model takes its parameter values from the exciterData record, which itself inherits from a base record (e.g., `DataAC7B` → `ExciterData`). The parameter names in the exciter model and the record may differ (e.g., `TR` in the model, `TR_ex` in the record).

```mermaid
classDiagram
    %% Base record for exciter data
    class ExciterData {
        <<partial record>>
        // Common exciter parameters
    }
    class DataAC7B {
        <<partial record>>
        // AC7B-specific parameters
        TR_ex: Real
        KPR_ex: Real
        KIR_ex: Real
        KDR_ex: Real
        TDR_ex: Real
        VRMAX_ex: Real
        VRMIN_ex: Real
        KPA_ex: Real
        KIA_ex: Real
        VAMAX_ex: Real
        VAMIN_ex: Real
        KP_ex: Real
        KL_ex: Real
        KF1_ex: Real
        KF2_ex: Real
        KF3_ex: Real
        TF3_ex: Real
        KC_ex: Real
        KD_ex: Real
        KE_ex: Real
        TE_ex: Real
        VFEMAX_ex: Real
        VEMIN_ex: Real
        E1_ex: Real
        S_E1_ex: Real
        E2_ex: Real
        S_E2_ex: Real
    }
    class AC7B_001 {
        <<record>>
        // Example values for all parameters
        TR_ex = 0.04
        KPR_ex = 4.24
        // etc.
    }

    %% Exciter model
    class AC7B {
        <<model>>
        TR: Real
        KPR: Real
        KIR: Real
        KDR: Real
        TDR: Real
        VRMAX: Real
        VRMIN: Real
        KPA: Real
        KIA: Real
        VAMAX: Real
        VAMIN: Real
        KP: Real
        KL: Real
        KF1: Real
        KF2: Real
        KF3: Real
        TF3: Real
        KC: Real
        KD: Real
        KE: Real
        TE: Real
        VFEMAX: Real
        VEMIN: Real
        E1: Real
        S_E1: Real
        E2: Real
        S_E2: Real
    }

    %% Relationships
    DataAC7B --|> ExciterData
    AC7B_001 --|> DataAC7B
    AC7B o.. AC7B_001 : "parameters from"
    AC7B o.. DataAC7B : "parameters from"
```

Here’s a detailed class diagram showing how exciters fit into a full generator model in the TypeB package, including the synchronous machine, general data, machine data, and exciter data.

```mermaid
classDiagram
    %% Base Partial Model
    class GenUnitTypeB1 {
        <<partial model>>
        TRIP: InputInterfacePin
        bus0: PwPin
        synchronousGenerator: SynchronousGenerator
        exciter: Exciter
        machineData: MachineDynamicData
        generalData: PlantGeneralData
        exciterData: ExciterData
        dVREF: InputInterfacePin
    }

    %% Synchronous Machine Model
    class GENROU {
        <<model>>
        // Model parameters
    }

    %% Exciter Model
    class AC7B {
        <<model>>
        // Model parameters
        // Parameters are set from exciterData fields
    }

    %% Data Record Hierarchy
    class ExciterData {
        <<partial record>>
    }
    class DataAC7B {
        <<partial record>>
        TR_ex
        KPR_ex
        // etc.
    }
    class AC7B_001 {
        <<record>>
        // Example values
    }

    class MachineDynamicData {
        <<partial record>>
    }
    class DynamicDataGENROU {
        <<partial record>>
        ZSOURCE_RE
        Tdo_p
        // etc.
    }
    class GENROU_001 {
        <<record>>
        // Example values
    }

    class PlantGeneralData {
        <<partial record>>
    }
    class PlantGeneralData_001 {
        <<record>>
        IBUS
        M_ID
        // etc.
    }

    %% Concrete Generator Model
    class GENROU_AC7B {
        <<model>>
        extends GenUnitTypeB1
        contains GENROU
        contains AC7B
        contains GENROU_001
        contains PlantGeneralData_001
        contains AC7B_001
    }

    %% Relationships
    DataAC7B --|> ExciterData
    AC7B_001 --|> DataAC7B
    DynamicDataGENROU --|> MachineDynamicData
    GENROU_001 --|> DynamicDataGENROU
    PlantGeneralData_001 --|> PlantGeneralData

    GENROU_AC7B --|> GenUnitTypeB1
    GENROU_AC7B o-- GENROU
    GENROU_AC7B o-- AC7B
    GENROU_AC7B o-- GENROU_001
    GENROU_AC7B o-- PlantGeneralData_001
    GENROU_AC7B o-- AC7B_001

    %% Parameter mapping (comment for clarity)
    %% AC7B parameters are set as: TR=exciterData.TR_ex, KPR=exciterData.KPR_ex, etc.
```

**Explanation**

* **ExciterData** is the base record for all exciter data records.
* **DataAC7B** is a specialized record for AC7B exciter parameters, inheriting from ExciterData.
* **AC7B_001** is a concrete instance with actual parameter values, inheriting from DataAC7B.
* **AC7B** is the exciter model (component), declared as `Electrical.Control.Excitation.AC7B`.
* When the exciter is redeclared in a generator model, its parameters are assigned from the exciterData record, e.g., `TR=exciterData.TR_ex`.

For ESST1A, the structure is analogous:

```mermaid
classDiagram
    class ExciterData {
        <<partial record>>
    }
    class DataESST1A {
        <<partial record>>
        UEL_ex: Real
        VOS_ex: Real
        TR_ex: Real
        VIMAX_ex: Real
        VIMIN_ex: Real
        TC_ex: Real
        TB_ex: Real
        TC1_ex: Real
        TB1_ex: Real
        KA_ex: Real
        TA_ex: Real
        VAMAX_ex: Real
        VAMIN_ex: Real
        VRMAX_ex: Real
        VRMIN_ex: Real
        KC_ex: Real
        KF_ex: Real
        TF_ex: Real
        KLR_ex: Real
        ILR_ex: Real
    }
    class ESST1A_001 {
        <<record>>
        // Example values for all parameters
        UEL_ex = ...
        VOS_ex = ...
        // etc.
    }
    class ESST1A {
        <<model>>
        UEL: Real
        VOS: Real
        TR: Real
        VIMAX: Real
        VIMIN: Real
        TC: Real
        TB: Real
        TC1: Real
        TB1: Real
        KA: Real
        TA: Real
        VAMAX: Real
        VAMIN: Real
        VRMAX: Real
        VRMIN: Real
        KC: Real
        KF: Real
        TF: Real
        KLR: Real
        ILR: Real
    }

    DataESST1A --|> ExciterData
    ESST1A_001 --|> DataESST1A
    ESST1A o.. ESST1A_001 : "parameters from"
    ESST1A o.. DataESST1A : "parameters from"
```

***

## **Summary of Structure**

*   **GenUnitTypeB1** is the core partial model, providing the structure for generator units with excitation systems.
*   **Concrete models** (e.g., GENROU\_AC7B, GENROU\_ESST4B) extend GenUnitTypeB1 and redeclare the generator, exciter, and data records for specific configurations.
*   **Data records** allow for flexible parameterization, supporting multiple instances (e.g., GENROU\_001, GENROU\_002).
*   **Exciter models** are modular and can be swapped as needed.

***

## **Signal Connections in GenUnitTypeB1 (TypeB Generator Model)**

Based on the Modelica code for `GenUnitTypeB1`, the main signal connections between the exciter and synchronous machine are as follows:

*   **TRIP** (input pin) → `synchronousGenerator.TRIP`
*   **bus0** (power pin) ← `synchronousGenerator.p`
*   **dVREF** (input pin) → `exciter.dVREF`
*   **synchronousGenerator.EFD0** ↔ `exciter.EFD0`
*   **exciter.EFD** → `synchronousGenerator.EFD`
*   **synchronousGenerator.ETERM0** ↔ `exciter.ETERM0`
*   **synchronousGenerator.EX\_AUX** ↔ `exciter.EX_AUX`
*   **synchronousGenerator.VI** ↔ `exciter.VI`
*   **synchronousGenerator.XADIFD** ↔ `exciter.XADIFD`
*   **const.y** → `exciter.VUEL`
*   **const1.y** → `exciter.VOEL`
*   **const2.y** → `exciter.VOTHSG`

***

### **Signal Connections Diagram**

```mermaid
flowchart TD
    TRIP["TRIP (InputInterfacePin)"]
    dVREF["dVREF (InputInterfacePin)"]
    bus0["bus0 (PwPin)"]
    const["const.y"]
    const1["const1.y"]
    const2["const2.y"]

    subgraph Exciter
        exciter["Exciter (e.g., AC7B, ESST1A)"]
        exciter_dVREF["dVREF"]
        exciter_EFD0["EFD0"]
        exciter_EFD["EFD"]
        exciter_ETERM0["ETERM0"]
        exciter_EX_AUX["EX_AUX"]
        exciter_VI["VI"]
        exciter_XADIFD["XADIFD"]
        exciter_VUEL["VUEL"]
        exciter_VOEL["VOEL"]
        exciter_VOTHSG["VOTHSG"]
    end

    subgraph SynchronousGenerator
        synchronousGenerator["SynchronousGenerator (e.g., GENROU)"]
        sg_TRIP["TRIP"]
        sg_p["p"]
        sg_EFD0["EFD0"]
        sg_EFD["EFD"]
        sg_ETERM0["ETERM0"]
        sg_EX_AUX["EX_AUX"]
        sg_VI["VI"]
        sg_XADIFD["XADIFD"]
    end

    %% Connections
    TRIP --> sg_TRIP
    dVREF --> exciter_dVREF
    sg_p --> bus0

    sg_EFD0 <--> exciter_EFD0
    exciter_EFD --> sg_EFD
    sg_ETERM0 <--> exciter_ETERM0
    sg_EX_AUX <--> exciter_EX_AUX
    sg_VI <--> exciter_VI
    sg_XADIFD <--> exciter_XADIFD

    const --> exciter_VUEL
    const1 --> exciter_VOEL
    const2 --> exciter_VOTHSG
```

***

### **Explanation**

*   **Bidirectional arrows (`<-->`)** indicate signals that are connected both ways (feedback or shared signals).
*   **Unidirectional arrows (`-->`)** indicate signals that flow from one component to another.
*   **Constants** (`const.y`, etc.) are typically used for limiters or reference signals in the exciter.

***

### **Summary**

*   The exciter and synchronous generator exchange several signals, including field voltage, auxiliary signals, and measurement signals.
*   Input pins and constants provide reference and trip signals.
*   The structure is modular, allowing different exciter and generator types to be plugged in, with their parameters set from data records.

***


