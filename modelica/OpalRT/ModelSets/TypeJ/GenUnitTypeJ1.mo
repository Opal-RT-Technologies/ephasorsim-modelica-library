within OpalRT.ModelSets.TypeJ;
partial model GenUnitTypeJ1
  "GenUnit with SynchronousMachine, Excitation System, Turbine-Governor and Over-Excitation Limiter models"
  extends ModelSets.GenUnitExcGovOel;

  // === Utility constants
  Modelica.Blocks.Sources.Constant constVUEL(k=0)
    annotation (Placement(transformation(extent={{-94,54},{-86,62}})));
  Modelica.Blocks.Sources.Constant constVOTHSG(k=0)
    annotation (Placement(transformation(extent={{-122,30},{-114,38}})));

  replaceable Electrical.PartialModel.OverExcitationLimiter oel
    annotation(Placement(transformation(extent={{26,54},{-10,90}})));
equation
  // Defaults where no PSS/UEL is present
  connect(constVUEL.y, exciter.VUEL) annotation (Line(points={{-85.6,58},{-60,
          58},{-60,13.6},{-18,13.6}},
                                  color={0,0,127}));
  connect(constVOTHSG.y, exciter.VOTHSG) annotation (Line(points={{-113.6,34},{
          -76,34},{-76,3.52},{-18,3.52}},
                                      color={0,0,127}));
end GenUnitTypeJ1;
