within OpalRT.ModelSets.TypeG;
partial model GenUnitTypeG1
  "GenUnit with SynchronousMachine, Excitation System and Under-Excitation Limiter models"
  extends ModelSets.GenUnitExcUel;

  // === Utility constants
  Modelica.Blocks.Sources.Constant constVOEL(k=0)
    annotation (Placement(transformation(extent={{-108,42},{-100,50}})));
  Modelica.Blocks.Sources.Constant constVOTHSG(k=0)
    annotation (Placement(transformation(extent={{-122,30},{-114,38}})));

equation
  // No governor in TypeG (short PMECH0 -> PMECH)
  connect(synchronousGenerator.PMECH, synchronousGenerator.PMECH0) annotation (Line(points={{62,-0.8},
          {56,-0.8},{56,-4.4},{62,-4.4}}, color={0,0,0}));
  // Defaults where no PSS/UEL/OEL is present
  connect(constVOEL.y, exciter.VOEL) annotation (Line(points={{-99.6,46},{-68,46},
          {-68,8.56},{-18,8.56}}, color={0,0,127}));
  connect(constVOTHSG.y, exciter.VOTHSG) annotation (Line(points={{-113.6,34},{-76,
          34},{-76,3.52},{-18,3.52}}, color={0,0,127}));
end GenUnitTypeG1;
