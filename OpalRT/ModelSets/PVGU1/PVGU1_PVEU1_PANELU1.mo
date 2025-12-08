within OpalRT.ModelSets.PVGU1;
model PVGU1_PVEU1_PANELU1
  extends PVGU1_PVEU1Base;

  // PANELU1 parameters
  parameter Real PDCMAX200 = 10 "maximum power of panel at an irradiance of 200 W/m2, pu on PDCMAX1000" annotation(Dialog(tab = "PANELU1 parameters"));
  parameter Real PDCMAX400 = 10 "maximum power of panel at an irradiance of 400 W/m2, pu on PDCMAX1000" annotation(Dialog(tab = "PANELU1 parameters"));
  parameter Real PDCMAX600 = 10 "maximum power of panel at an irradiance of 600 W/m2, pu on PDCMAX1000" annotation(Dialog(tab = "PANELU1 parameters"));
  parameter Real PDCMAX800 = 10 "maximum power of panel at an irradiance of 800 W/m2, pu on PDCMAX1000" annotation(Dialog(tab = "PANELU1 parameters"));
  parameter Real PDCMAX1000 = 10 "maximum power of panel at an irradiance of 1000 W/m2, pu on PDCMAX1000" annotation(Dialog(tab = "PANELU1 parameters"));
  OpalRT.Electrical.Load.ConstantImpedance2 rx_load1(R = ZSOURCE_RE, X = 999999) annotation(Placement(visible = true, transformation(origin = {80, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.Electrical.Renewable.PhotoVoltaic.PANELU1 panelu11(PDCMAX200 = PDCMAX200, PDCMAX400 = PDCMAX400, PDCMAX600 = PDCMAX600, PDCMAX800 = PDCMAX800, PDCMAX1000 = PDCMAX1000) annotation(Placement(visible = true, transformation(origin = {-80, -20}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = PMX / SB) annotation(Placement(visible = true, transformation(origin = {-50, -20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain2(k = SB / PMX) annotation(Placement(visible = true, transformation(origin = {-70, -50}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
equation
  connect(rx_load1.p, machine2net_base_change1.p) annotation(Line(points={{70,-80},
          {46.82,-80},{46.82,-45.4668},{50,-45.4668},{50,-46}}));
  connect(panelu11.Irad0, panelu11.Irad) annotation(Line(points={{-95,-11},{-98.5115,
          -11},{-98.5115,-7.84844},{-95,-7.84844},{-95,-8}},                                                                                                       color = {0, 0, 127}));
  connect(gain2.y, panelu11.PDC0) annotation(Line(points={{-75.5,-50},{-98.5115,
          -50},{-98.5115,-31.6644},{-95,-31.6644},{-95,-32}},                                                                                                 color = {0, 0, 127}));
  connect(pveu1.Pref0, gain2.u) annotation(Line(points={{-34.375,21.25},{-33.8295,
          21.25},{-33.8295,-49.797},{-64,-49.797},{-64,-50}},                                                                                                  color = {0, 0, 127}));
  connect(gain1.y, pveu1.Pref) annotation(Line(points={{-44.5,-20},{-42.2192,-20},
          {-42.2192,21.25},{-41.875,21.25}},                                                                                       color = {0, 0, 127}));
  connect(panelu11.PDC, gain1.u) annotation(Line(points={{-65,-20},{-56.2923,-20},
          {-56.2923,-20},{-56,-20}},                                                                                                 color = {0, 0, 127}));
end PVGU1_PVEU1_PANELU1;
