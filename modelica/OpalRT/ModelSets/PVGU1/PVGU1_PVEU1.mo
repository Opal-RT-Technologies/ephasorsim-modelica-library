within OpalRT.ModelSets.PVGU1;
model PVGU1_PVEU1
  extends PVGU1_PVEU1Base;

  OpalRT.Electrical.Load.ConstantImpedance2 rx_load1(R = ZSOURCE_RE, X = 999999) annotation(Placement(visible = true, transformation(origin = {80, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(rx_load1.p, machine2net_base_change1.p) annotation(Line(points={{70,-80},
          {44.9256,-80},{44.9256,-46.0081},{50,-46.0081},{50,-46}}));
  connect(pveu1.Pref0, pveu1.Pref) annotation(Line(points={{-34.375,21.25},{-33.8896,
          21.25},{-33.8896,17.2015},{-41.5918,17.2015},{-41.5918,21.25},{-41.875,
          21.25}},                                                                                                                                                                     color = {0, 0, 127}));
end PVGU1_PVEU1;
