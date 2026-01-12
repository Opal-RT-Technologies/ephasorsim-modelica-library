within OpalRT.ModelSets.TypeF;
partial model GenUnitTypeF1
  "GenUnit with SynchronousMachine, Excitation System, Turbine-Governor and Power System Stabilizer models"
  extends ModelSets.GenUnitExcGovPss;

  // === Utility constants
  Modelica.Blocks.Sources.Constant constVUEL(k=0)
    annotation (Placement(transformation(extent={{-94,54},{-86,62}})));
  Modelica.Blocks.Sources.Constant constVOEL(k=0)
    annotation (Placement(transformation(extent={{-108,42},{-100,50}})));
equation
  // Defaults where no UEL/OEL is present
  connect(constVUEL.y, exciter.VUEL) annotation (Line(points={{-85.6,58},{-60,58},
          {-60,13.6},{-18,13.6}}, color={0,0,127}));
  connect(constVOEL.y, exciter.VOEL) annotation (Line(points={{-99.6,46},{-68,46},
          {-68,8.56},{-18,8.56}}, color={0,0,127}));
end GenUnitTypeF1;
