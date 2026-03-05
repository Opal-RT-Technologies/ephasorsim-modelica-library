# OpalRT.ModelSets.TypeB — Documentation

## **TypeB Package Structure**

### **1. Partial Model: GenUnitTypeB1**

*   **GenUnitTypeB1** is the base partial model for generator units with both a synchronous machine and an excitation system.
*   It contains:
    *   **TRIP** (input pin)
    *   **bus0** (power pin)
    *   **synchronousGenerator** (replaceable, e.g., GENROU, GENSAE, GENSAL)
    *   **exciter** (replaceable, e.g., AC7B, ESST4B, EXAC3, etc.)
    *   **dVREF** (input pin for excitation reference)
*   The partial model defines the connections between these components, including signal flow between generator and exciter.

***

### **2. Concrete Models**

*   Each concrete model (e.g., GENROU\_AC7B, GENROU\_ESST4B, GENSAE\_ESST1A, etc.) extends **GenUnitTypeB1**.
*   Each model:
    *   **redeclares** the synchronous generator (e.g., GENROU, GENSAE, GENSAL).
    *   **redeclares** the exciter (e.g., AC7B, ESST4B, EXAC3, etc.).


***

## **3. Mermaid Class Diagram**

Below is a Mermaid diagram showing the structure and relationships for TypeB models extending GenUnitTypeB1, including examples for GENROU and GENSAL machines with different exciters.

```mermaid
classDiagram
    %% Base Partial Model
    class GenUnitTypeB1 {
        <<partial model>>
        TRIP: InputInterfacePin
        bus0: PwPin
        synchronousGenerator: SynchronousGenerator
        exciter: Exciter
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

    %% Concrete Models (examples)
    class GENROU_AC7B {
        <<model>>
        GenUnitTypeB1
        contains GENROU
        contains AC7B
    }
    class GENROU_ESST4B {
        <<model>>
        GenUnitTypeB1
        contains GENROU
        contains ESST4B
    }
    class GENSAL_ESST4B {
        <<model>>
        GenUnitTypeB1
        contains GENSAL
        contains ESST4B
    }

    %% Relationships
    GENROU_AC7B --|> GenUnitTypeB1
    GENROU_ESST4B --|> GenUnitTypeB1
    GENSAL_ESST4B --|> GenUnitTypeB1

    GENROU_AC7B o-- GENROU
    GENROU_AC7B o-- AC7B

    GENROU_ESST4B o-- GENROU
    GENROU_ESST4B o-- ESST4B

    GENSAL_ESST4B o-- GENSAL
    GENSAL_ESST4B o-- ESST4B
```

In Modelica, **models** (like `Electrical.Control.Excitation.AC7B`) are components with configurable parameters.

Here's a detailed class diagram showing how exciters fit into a full generator model in the TypeB package, including the synchronous machine.

```mermaid
classDiagram
    %% Base Partial Model
    class GenUnitTypeB1 {
        <<partial model>>
        TRIP: InputInterfacePin
        bus0: PwPin
        synchronousGenerator: SynchronousGenerator
        exciter: Exciter
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
    }

    %% Concrete Generator Model
    class GENROU_AC7B {
        <<model>>
        extends GenUnitTypeB1
        contains GENROU
        contains AC7B
    }

    %% Relationships
    GENROU_AC7B --|> GenUnitTypeB1
    GENROU_AC7B o-- GENROU
    GENROU_AC7B o-- AC7B
```

**Explanation**

* **AC7B** is the exciter model (component), declared as `Electrical.Control.Excitation.AC7B`.
* When the exciter is redeclared in a generator model, its parameters are configurable.

***

## **Summary of Structure**

*   **GenUnitTypeB1** is the core partial model, providing the structure for generator units with excitation systems.
*   **Concrete models** (e.g., GENROU\_AC7B, GENROU\_ESST4B) extend GenUnitTypeB1 and redeclare the generator and exciter for specific configurations.
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
*   The structure is modular, allowing different exciter and generator types to be plugged in, with their parameters fully configurable.

***


