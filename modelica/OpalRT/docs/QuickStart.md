# 🚀 Quick-Start Guide: Extending OpalRT ModelSet Templates

## 1. **Choose the Right Template**

Select the partial model that matches the complexity and control systems you need. For GenUnit types, choose from `GenUnitTypeA1` through `GenUnitTypeL1`:

*   **Type A**: Generator only
*   **Type B**: + Exciter
*   **Type C**: + Turbine-Governor
*   **Type D**: + Exciter & Turbine-Governor
*   **Type E**: + Exciter & Stabilizer
*   **Type F**: + Exciter, Turbine-Governor & Stabilizer
*   **Type G**: + Exciter & UEL
*   **Type H**: + Exciter & OEL
*   **Type I**: + Exciter, Turbine-Governor & UEL
*   **Type J**: + Exciter, Turbine-Governor & OEL
*   **Type K**: + Exciter, UEL & OEL
*   **Type L**: + Exciter, Turbine-Governor, Stabilizer & UEL

For other component types, extend the appropriate base class (e.g., `InjectionCore`, `TwoPinCore`). See the [Model Sets documentation](ModelSets.md) for the full hierarchy.

> **Tip:** Use the class diagram and tables in the Model Sets documentation to match your requirements.

***

## 2. **Create Your Custom Model**

Extend the chosen partial model in your own Modelica package.  
**Example:** Custom generator with exciter and governor (Type D):

```modelica
model MyGENROU_EXAC1A_GGOV1
  extends OpalRT.ModelSets.TypeD.GenUnitTypeD1(
    redeclare Electrical.Machine.SynchronousMachine.GENROU synchronousGenerator(
      // Optional: parameter overrides here
    ),
    redeclare Electrical.Control.Excitation.EXAC1A exciter(
      // Optional: parameter overrides here
    ),
    redeclare Electrical.Control.TurbineGovernor.GGOV1 turbineGovernor(
      // Optional: parameter overrides here
    )
  );
end MyGENROU_EXAC1A_GGOV1;
```

*   **redeclare**: Swap in your desired machine, exciter, and governor.

***

## 3. **Customize Parameters**

*   **Edit parameter values** directly on each component (machine, exciter, governor, or stabilizer) using inline parameter overrides or the parameter dialog.

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

*   **Version your parameter sets** for traceability.
*   **Document your customizations** in the model’s annotation or comments.
*   **Reuse parameter sets** across models for consistency.
*   **Leverage inheritance**: If you need a variant, extend your own model and override only what’s different.

***

## 8. **Example: Minimal Custom Model (Type B)**

```modelica
model MyGENROU_ESST1A
  extends OpalRT.ModelSets.TypeB.GenUnitTypeB1(
    redeclare Electrical.Machine.SynchronousMachine.GENROU synchronousGenerator,
    redeclare Electrical.Control.Excitation.ESST1A exciter
  );
end MyGENROU_ESST1A;
```

***

## 9. **Troubleshooting**

*   **Connector mismatch?** Ensure you’re using the correct template for your system’s needs.
*   **Simulation errors?** Validate parameter values and initial conditions

***

## 10. **Where to Go Next**

*   **See the provided class diagrams** for architecture reference.
*   **Consult the Modelica source** for each partial model for advanced customization.
*   **Ask for help**: If you need a more advanced example or run into issues, reach out or consult the OPAL-RT community.

***

**Happy modeling!**
