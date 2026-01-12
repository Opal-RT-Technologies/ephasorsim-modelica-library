within OpalRT.ModelSets.TypeI;
partial model GenUnitTypeI1
  "GenUnit with SynchronousMachine, Excitation System, Turbine-Governor and Under-Excitation Limiter models"
  extends ModelSets.GenUnitExcGovUel;

  // === Utility constants
  Modelica.Blocks.Sources.Constant constVOEL(k=0)
    annotation (Placement(transformation(extent={{-108,42},{-100,50}})));
  Modelica.Blocks.Sources.Constant constVOTHSG(k=0)
    annotation (Placement(transformation(extent={{-122,30},{-114,38}})));
equation
  // Defaults where no PSS/OEL is present
  connect(constVOEL.y, exciter.VOEL) annotation (Line(points={{-99.6,46},{-68,46},
          {-68,8.56},{-18,8.56}}, color={0,0,127}));
  connect(constVOTHSG.y, exciter.VOTHSG) annotation (Line(points={{-113.6,34},{-76,
          34},{-76,3.52},{-18,3.52}}, color={0,0,127}));
end GenUnitTypeI1;
