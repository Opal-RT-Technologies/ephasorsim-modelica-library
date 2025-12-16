within OpalRT.ModelSets;
partial model GenUnitExcPss
  "Core GenUnit model with Excitation System and PSS models"
  extends GenUnitExc;

  // === Replaceable core components ===
  replaceable Electrical.PartialModel.Stabilizer stabilizer
    annotation (Placement(transformation(extent={{-118,-48},{-82,-12}})));
equation
  // Stabilizer <-> Synchronous machine, Exciter
  connect(synchronousGenerator.SLIP, stabilizer.PSS_AUX2[1]) annotation (Line(
        points={{98,-4.4},{114,-4.4},{114,-96},{-126,-96},{-126,-41.7},{-118,-41.7}},
        color={1,102,94}));
  connect(synchronousGenerator.AccPower, stabilizer.PSS_AUX2[2]) annotation (
      Line(points={{98,5.32},{126,5.32},{126,-100},{-130,-100},{-130,-39.9},{-118,
          -39.9}}, color={1,102,94}));
  connect(stabilizer.PSS_AUX, stabilizer.PSS_AUX2) annotation (Line(points={{-118,
          -30},{-134,-30},{-134,-40.8},{-118,-40.8}},color={197,27,125}));
  connect(synchronousGenerator.VI, stabilizer.VI) annotation (Line(points={{98,10},
          {132,10},{132,-110},{-140,-110},{-140,-26.4},{-118,-26.4}},    color=
          {1,102,94}));
  connect(stabilizer.VI2, stabilizer.VI) annotation (Line(points={{-118,-37.2},{
          -140,-37.2},{-140,-26.4},{-118,-26.4}},color={197,27,125}));
  connect(stabilizer.VOTHSG, exciter.VOTHSG) annotation (Line(points={{-82,-40.8},
          {-60,-40.8},{-60,3.52},{-18,3.52}},        color={0,0,127}));
end GenUnitExcPss;
