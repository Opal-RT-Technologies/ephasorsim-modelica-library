within OpalRT.ModelSets.TypeD;
partial model GenUnitTypeD1
  "GenUnit with SynchronousMachine, Excitation System and Turbine-Governor models"
  extends ModelSets.GenUnitExcGov;

  Modelica.Blocks.Sources.Constant constVOTHSG(k=0)
    annotation (Placement(transformation(extent={{-122,30},{-114,38}})));
  Modelica.Blocks.Sources.Constant constVOEL(k=0)
    annotation (Placement(transformation(extent={{-108,42},{-100,50}})));
  Modelica.Blocks.Sources.Constant constVUEL(k=0)
    annotation (Placement(transformation(extent={{-94,54},{-86,62}})));
equation
  // Defaults where no PSS/UEL/OEL is present
  connect(constVUEL.y, exciter.VUEL) annotation (Line(points={{-85.6,58},{-60,58},
          {-60,13.6},{-18,13.6}}, color={0,0,127}));
  connect(constVOEL.y, exciter.VOEL) annotation (Line(points={{-99.6,46},{-68,46},
          {-68,8.56},{-18,8.56}}, color={0,0,127}));
  connect(constVOTHSG.y, exciter.VOTHSG) annotation (Line(points={{-113.6,34},{-76,
          34},{-76,3.52},{-18,3.52}}, color={0,0,127}));
end GenUnitTypeD1;
