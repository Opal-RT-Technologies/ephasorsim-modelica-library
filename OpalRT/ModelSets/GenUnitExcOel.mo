within OpalRT.ModelSets;
partial model GenUnitExcOel
  "Core GenUnit model with Excitation System and Over-Excitation Limiter models"
  extends GenUnitExc;
  // === Replaceable core components ===
  replaceable Electrical.PartialModel.OverExcitationLimiter oel
    annotation(Placement(transformation(extent={{-62,114},{-98,78}})));
equation
  // OEL integration pattern
  connect(synchronousGenerator.XADIFD, oel.XADIFD) annotation (Line(points={{98,19},
          {106,19},{106,106.8},{-62.36,106.8}}, color={0,0,127}));
  connect(oel.VOEL, exciter.VOEL) annotation (Line(points={{-98.72,96},{-140,96},
          {-140,8.56},{-18,8.56}}, color={0,255,0}));
  connect(oel.EFD, synchronousGenerator.EFD) annotation (Line(points={{-62.36,85.2},
          {-52,85.2},{-52,-20},{40,-20},{40,15.04},{62,15.04}}, color={0,0,127}));
end GenUnitExcOel;
