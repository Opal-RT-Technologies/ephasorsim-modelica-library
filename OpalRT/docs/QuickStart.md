# 🚀 Quick-Start Guide: Extending OpalRT GenUnit Templates

## 1. **Choose the Right Template**

Select the partial model (`GenUnitTypeA1`, `GenUnitTypeB1`, ..., `GenUnitTypeF2`) that matches the complexity and control systems you need:

*   **Type A**: Generator only
*   **Type B**: + Exciter
*   **Type C**: + Turbine-Governor
*   **Type D**: + Exciter & Turbine-Governor
*   **Type E**: + Exciter & Stabilizer
*   **Type F**: + Exciter, Turbine-Governor & Stabilizer

> **Tip:** Use the class diagram and tables in the documentation to match your requirements.

***

## 2. **Create Your Custom Model**

Extend the chosen partial model in your own Modelica package.  
**Example:** Custom generator with exciter and governor (Type D):

```modelica
model MyGENROU_EXAC1A_GGOV1
  extends OpalRT.GenUnits.TypeD.GenUnitTypeD1(
    redeclare Electrical.Machine.SynchronousMachine.GENROU synchronousGenerator(
      // Optional: parameter overrides here
    ),
    redeclare Electrical.Control.Excitation.EXAC1A exciter(
      // Optional: parameter overrides here
    ),
    redeclare Electrical.Control.TurbineGovernor.GGOV1 turbineGovernor(
      // Optional: parameter overrides here
    ),
    redeclare Data.General.PlantGeneralData_001 generalData,
    redeclare Data.Machines.GENROU.GENROU_001 machineData,
    redeclare Data.Exciters.EXAC1A.EXAC1A_001 exciterData,
    redeclare Data.Governors.GGOV1.GGOV1_001 governorData
  );
end MyGENROU_EXAC1A_GGOV1;
```

*   **redeclare**: Swap in your desired machine, exciter, governor, and data records.
*   **Parameterization**: All numerical values are managed via the data records.

***

## 3. **Customize Data Records**

*   **Edit or create new data records** for your machine, exciter, governor, or stabilizer.
*   **Example:** To change the generator’s reactance, edit `GENROU_001` or create `GENROU_002` with your values.

```modelica
record GENROU_002
  extends Data.Machines.GENROU.MachineDynamicData(
    Xd = 2.1,
    Xq = 1.9,
    // ... other parameters
  );
end GENROU_002;
```

*   **Reference your new record** in the model’s `redeclare` statement.

***

## 4. **(Optional) Override Parameters Inline**

You can override specific parameters directly in the redeclare statement if needed:

```modelica
redeclare Electrical.Control.Excitation.EXAC1A exciter(
  VRMAX = 7.0,
  VRMIN = -7.0
)
```

***

## 5. **Connect to Your System**

*   The template provides standard connectors (`TRIP`, `dVREF`, `dGREF`, `bus0`, etc.).
*   Wire your custom model into your system diagram as you would any Modelica component.

***

## 6. **Simulate and Validate**

*   **Check parameter dialogs**: All parameters should appear grouped by subsystem.
*   **Run test cases**: Validate your model’s dynamic response (e.g., voltage step, frequency event).
*   **Compare results**: If you’re migrating from an older model, compare key signals (Vt, ω, P, Q).

***

## 7. **Best Practices**

*   **Version your data records** for traceability.
*   **Document your customizations** in the model’s annotation or comments.
*   **Reuse data records** across models for consistency.
*   **Leverage inheritance**: If you need a variant, extend your own model and override only what’s different.

***

## 8. **Example: Minimal Custom Model (Type B)**

```modelica
model MyGENROU_ESST1A
  extends OpalRT.GenUnits.TypeB.GenUnitTypeB1(
    redeclare Electrical.Machine.SynchronousMachine.GENROU synchronousGenerator,
    redeclare Electrical.Control.Excitation.ESST1A exciter,
    redeclare Data.General.PlantGeneralData_002 generalData,
    redeclare Data.Machines.GENROU.GENROU_002 machineData,
    redeclare Data.Exciters.ESST1A.ESST1A_002 exciterData
  );
end MyGENROU_ESST1A;
```

***

## 9. **Troubleshooting**

*   **Missing parameters?** Check that your data records include all required fields.
*   **Connector mismatch?** Ensure you’re using the correct template for your system’s needs.
*   **Simulation errors?** Validate parameter values and initial conditions in your data records.

***

## 10. **Where to Go Next**

*   **See the provided class diagrams** for architecture reference.
*   **Consult the Modelica source** for each partial model for advanced customization.
*   **Ask for help**: If you need a more advanced example or run into issues, reach out or consult the OPAL-RT community.

***

**Happy modeling!**
