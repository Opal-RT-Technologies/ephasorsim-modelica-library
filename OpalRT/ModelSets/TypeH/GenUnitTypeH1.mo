within OpalRT.ModelSets.TypeH;
partial model GenUnitTypeH1
  "GenUnit with SynchronousMachine, Excitation System and Over-Excitation Limiter models"
  extends ModelSets.GenUnitExcOel;

  // === Utility constants
  Modelica.Blocks.Sources.Constant constVOTHSG(k=0)
    annotation (Placement(transformation(extent={{-122,30},{-114,38}})));
  Modelica.Blocks.Sources.Constant constVUEL(k=0)
    annotation (Placement(transformation(extent={{-94,54},{-86,62}})));

equation
  // No governor in TypeH (short PMECH0 -> PMECH)
  connect(synchronousGenerator.PMECH, synchronousGenerator.PMECH0) annotation (Line(points={{62,-0.8},
          {16,-0.8},{16,-4.4},{62,-4.4}}, color={0,0,0}));
  // Defaults where no PSS/UEL/OEL is present
  connect(constVUEL.y, exciter.VUEL) annotation (Line(points={{-85.6,58},{-60,58},
          {-60,13.6},{-18,13.6}}, color={0,0,127}));
  connect(constVOTHSG.y, exciter.VOTHSG) annotation (Line(points={{-113.6,34},{-76,
          34},{-76,3.52},{-18,3.52}}, color={0,0,127}));
end GenUnitTypeH1;
