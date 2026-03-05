# OpalRT.ModelSets.TypeE — Documentation

## **1. High-Level Structure**

### **TypeE Package Overview**

The **TypeE** package defines generator unit models that combine a **Synchronous Machine**, an **Excitation System**, and a **Power System Stabilizer (PSS)**. This package is designed for advanced dynamic simulations where both voltage control and system stability enhancement are required, and where modularity and extensibility are achieved through replaceable components.

*   **Partial Model:** `GenUnitTypeE1`
    *   **Purpose:** Provides a template for generator units with both excitation and stabilizer systems.
    *   **Key Features:** Modular, object-oriented, and highly configurable via replaceable components.

*   **Concrete Models:** (e.g., `GENROU_AC7B_PSS2B`, `GENROU_ESST1A_PSS2A`, etc.)
    *   **Purpose:** Implement generation unit models containing specific generator, exciter, and stabilizer types by redeclaring the replaceable components.

***

## **2. Object-Oriented Features**

### **Inheritance and Composition**

*   **Inheritance:** Concrete models extend the partial model `GenUnitTypeE1`.
*   **Composition:** Each unit contains:
    *   A **replaceable synchronous generator** (e.g., `GENROU`, `GENSAE`, `GENSAL`)
    *   A **replaceable exciter** (e.g., `EXAC1A`, `ESST1A`, `AC7B`)
    *   A **replaceable stabilizer** (e.g., `PSS2A`, `PSS2B`, `IEEEST`)

### **Replaceable Architecture**

*   All major components are declared as `replaceable`, allowing for flexible instantiation and substitution in derived models.

***

## **3. Class Diagrams**

### 📐 High-Level Class Diagram

```mermaid
classDiagram
  class GenUnitTypeE1 {
    <<partial>>
    +TRIP : InputInterfacePin
    +dVREF : InputInterfacePin
    +bus0 : PwPin
    synchronousGenerator : SynchronousGenerator
    exciter : Exciter
    stabilizer : Stabilizer
  }

  class SynchronousGenerator {
    <<replaceable>>
    // Electrical machine model (e.g., GENROU, GENSAE, GENSAL)
  }

  class Exciter {
    <<replaceable>>
    // Excitation system model (e.g., AC7B, ESST1A, EXAC1A)
  }

  class Stabilizer {
    <<replaceable>>
    // Power system stabilizer model (e.g., PSS2A, PSS2B, IEEEST)
  }

  GenUnitTypeE1 o-- SynchronousGenerator : synchronousGenerator
  GenUnitTypeE1 o-- Exciter : exciter
  GenUnitTypeE1 o-- Stabilizer : stabilizer
```

### 🔗 Component Extension Map (GenUnitTypeE1)

```mermaid
classDiagram
  class GenUnitTypeE1 {
    <<partial>>
    +TRIP : InputInterfacePin
    +dVREF : InputInterfacePin
    +bus0 : PwPin
    synchronousGenerator : SynchronousGenerator
    exciter : Exciter
    stabilizer : Stabilizer
  }

  class ConcreteModel {
    <<model>>
    extends GenUnitTypeE1
    // redeclare SynchronousGenerator
    // redeclare Exciter
    // redeclare Stabilizer
  }

  GenUnitTypeE1 <|-- ConcreteModel
  ConcreteModel o-- SynchronousGenerator
  ConcreteModel o-- Exciter
  ConcreteModel o-- Stabilizer
```

***

### **Component Interconnections**

```mermaid
flowchart TD
  TRIP["TRIP (InputInterfacePin)"] -->|connect| SG["SynchronousGenerator"]
  dVREF["dVREF (InputInterfacePin)"] -->|connect| EX["Exciter"]
  SG["SynchronousGenerator"] -->|p| bus0["bus0 (PwPin)"]

  %% Exciter <-> SynchronousGenerator connections
  EX["Exciter"] -- EFD --> SG
  SG -- EFD0 --> EX
  SG -- ETERM0 --> EX
  SG -- EX_AUX --> EX
  SG -- VI --> EX
  SG -- XADIFD --> EX

  %% Stabilizer <-> SynchronousGenerator/Exciter connections
  SG -- VI --> ST["Stabilizer"]
  SG -- SLIP --> ST
  SG -- AccPower --> ST
  ST -- VOTHSG --> EX
  ST -- VI2 --> SG
```

***

### **Example: Implementation of a Specific Model**

Let’s illustrate the structure for a concrete model, e.g., `GENROU_AC7B_PSS2B`:

```mermaid
classDiagram
  class GenUnitTypeE1
  class GENROU_AC7B_PSS2B {
    <<model>>
    extends GenUnitTypeE1
    redeclare GENROU synchronousGenerator
    redeclare AC7B exciter
    redeclare PSS2B stabilizer
  }
  class GENROU
  class AC7B
  class PSS2B

  GenUnitTypeE1 <|-- GENROU_AC7B_PSS2B
  GENROU_AC7B_PSS2B o-- GENROU : synchronousGenerator
  GENROU_AC7B_PSS2B o-- AC7B : exciter
  GENROU_AC7B_PSS2B o-- PSS2B : stabilizer
```

***

## **4. Summary**

*   **GenUnitTypeE1** is the base partial model for generator units with both excitation and stabilizer systems.
*   **Concrete models** (e.g., `GENROU_AC7B_PSS2B`) extend this partial model and redeclare the generator, exciter, and stabilizer for specific configurations.
*   **SynchronousGenerator** is the core electrical model, with connections to both the exciter and stabilizer as needed.
*   **Exciter** and **Stabilizer** exchange signals with the generator for dynamic control and system stability.


***

## **6. Key Points**

*   **TypeE models** are highly modular and extensible, supporting a wide range of generator, exciter, and stabilizer types.
*   **All parameters** are fully configurable, making the models easy to configure for different scenarios.
*   **Signal connections** are clearly defined, supporting advanced dynamic simulations and system stability studies.
