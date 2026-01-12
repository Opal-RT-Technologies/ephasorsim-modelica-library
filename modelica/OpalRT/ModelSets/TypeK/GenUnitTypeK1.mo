within OpalRT.ModelSets.TypeK;
partial model GenUnitTypeK1
  "GenUnit with SynchronousMachine, Excitation System, Under-Excitation Limiter and Over-Excitation Limiter models"
  extends ModelSets.GenUnitUelOel;

  // === Utility constants
  Modelica.Blocks.Sources.Constant constVOTHSG(k=0)
    annotation (Placement(transformation(extent={{-122,30},{-114,38}})));
equation
  // No governor in TypeK (short PMECH0 -> PMECH)
  connect(synchronousGenerator.PMECH, synchronousGenerator.PMECH0) annotation (Line(
        points={{62,-0.8},{56,-0.8},{56,-4.4},{62,-4.4}}, color={0,0,0}));
  // Defaults no PSS is present
  connect(constVOTHSG.y, exciter.VOTHSG) annotation (Line(points={{-113.6,34},{-76,
          34},{-76,3.52},{-18,3.52}}, color={0,0,127}));
end GenUnitTypeK1;
