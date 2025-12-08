within OpalRT.ModelSets.TypeL;
partial model GenUnitTypeL1
  "GenUnit with SynchronousMachine, Excitation System, Turbine-Governor, Power System Stabilizer and Under-Excitation Limiter models"
  extends ModelSets.GenUnitExcGovPssUel;

  // === Utility constants
  Modelica.Blocks.Sources.Constant constVOEL(k=0)
    annotation (Placement(transformation(extent={{-108,42},{-100,50}})));
equation
  // Defaults where no OEL is present
  connect(constVOEL.y, exciter.VOEL) annotation (Line(points={{-99.6,46},{-68,46},
          {-68,8.56},{-18,8.56}}, color={0,0,127}));
end GenUnitTypeL1;
