within OpalRT.ModelSets;
partial model GenUnitExcGovPssUel
  "Core GenUnit model with Excitation System, Turbine-Governor, PSS and Under-Excitation Limiter models"
  extends ModelSets.GenUnitExcGovPss;
  // === External connectors ===
  replaceable Electrical.PartialModel.UnderExcitationLimiter uel
    annotation(Placement(transformation(extent={{10,62},{-26,98}})));
equation
  // UEL integration pattern
  connect(synchronousGenerator.VI, uel.VI) annotation (Line(points={{98,10},{132,
          10},{132,87.2},{9.64,87.2}}, color={0,0,127}));
  connect(uel.VUEL, exciter.VUEL) annotation (Line(points={{-26.72,80},{-40,80},
          {-40,13.6},{-18,13.6}}, color={0,255,0}));
  connect(uel.VF, exciter.VF) annotation (Line(points={{9.64,80},{24,80},{24,24.4},
          {18.72,24.4}}, color={0,255,0}));
  connect(uel.EX_AUX, synchronousGenerator.EX_AUX) annotation (Line(points={{9.64,
          94.4},{56,94.4},{56,24.4},{61.64,24.4}},
        color={0,0,127}));
end GenUnitExcGovPssUel;
