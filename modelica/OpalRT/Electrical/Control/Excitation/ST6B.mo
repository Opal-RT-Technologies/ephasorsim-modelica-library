within OpalRT.Electrical.Control.Excitation;
model ST6B
  extends OpalRT.Electrical.PartialModel.Exciter;
  parameter Real TR = 0.01 "regulator input filter time constant (sec)";
  parameter Real KPA = 40 "(pu) (> 0) voltage regulator proportional gain";
  parameter Real KIA = 1 "(pu) voltage regulator integral gain";
  parameter Real KDA = 1 "(pu) voltage regulator derivative gain";
  parameter Real TDA = 0.1 "voltage regulator derivative channel time constant (sec)";
  parameter Real VAMAX = 1.1 "(pu) regulator output maximum limit";
  parameter Real VAMIN = 0 "(pu) regulator output minimum limit";
  parameter Real KFF = 1 "(pu) pre-control gain of the inner loop field regulator";
  parameter Real KM = 1 "(pu) forward gain of the inner loop field regulator";
  parameter Real KCI = 1 "(pu) exciter output current limit adjustment gain";
  parameter Real KLR = 1 "(pu) exciter output current limiter gain";
  parameter Real ILR = 1 "(pu) exciter current limit reference";
  parameter Real VRMAX = 1.1 "(pu) voltage regulator output maximum limit";
  parameter Real VRMIN = 0 "(pu) voltage regulator output minimum limit";
  parameter Real KG = 1 "feedback gain of the inner loop field voltage regulator";
  parameter Real TG = 1 "feedback time constant of the inner loop field voltage regulator (sec)";
  parameter Real OEL = 1;
  parameter Real VREF_0(fixed = false);
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag lag1(T = TR, y_start = ETERM_0) annotation(Placement(visible = true, transformation(origin = {-60, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add3 add31(k2 = -1, k3 = -1) annotation(Placement(visible = true, transformation(origin = {-20, 60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Max max1 annotation(Placement(visible = true, transformation(origin = {0, 60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add3 add32(k2 = +1, k3 = -1) annotation(Placement(visible = true, transformation(origin = {20, 60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.SignalRouting.DeMultiplexer demultiplexer1(n = 2, s = OEL) annotation(Placement(visible = true, transformation(origin = {-60, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1(k2 = -1) annotation(Placement(visible = true, transformation(origin = {-60, -60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = KM) annotation(Placement(visible = true, transformation(origin = {-40, -60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add2(k2 = +1) annotation(Placement(visible = true, transformation(origin = {-20, -60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain2(k = KFF) annotation(Placement(visible = true, transformation(origin = {-40, -40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiter1(uMax = VRMAX, uMin = VRMIN) annotation(Placement(visible = true, transformation(origin = {0, -60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Product product1 annotation(Placement(visible = true, transformation(origin = {60, -60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Min min1 annotation(Placement(visible = true, transformation(origin = {40, -60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = ILR) annotation(Placement(visible = true, transformation(origin = {-60, -20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain3(k = KCI) annotation(Placement(visible = true, transformation(origin = {-40, -20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add3(k2 = -1, k1 = +1) annotation(Placement(visible = true, transformation(origin = {-20, -20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain4(k = KLR) annotation(Placement(visible = true, transformation(origin = {0, -20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiter2(uMax = Modelica.Constants.inf, uMin = VRMIN) annotation(Placement(visible = true, transformation(origin = {20, -20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder firstorder1(k = KG, T = TG, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = VG0) annotation(Placement(visible = true, transformation(origin = {0, -80}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunctionNonWindup.PID_NonWindupLimit pid_nonwinduplimit1(KP = KPA, KI = KIA, KD = KDA, TD = TDA, MAX = VAMAX, MIN = VAMIN, x_start = VA0) annotation(Placement(visible = true, transformation(origin = {40, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const1(k = VREF_0) annotation(Placement(transformation(extent = {{-134, 33}, {-114, 53}})));
  Modelica.Blocks.Sources.Constant const2(k = 0) annotation(Placement(transformation(extent = {{131, 70}, {111, 90}})));
  Modelica.Blocks.Math.Add add4(k2 = +1) annotation(Placement(visible = true, transformation(origin = {-70, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression Ecomp(y=ETERM)   annotation(Placement(visible = true, transformation(origin={-88,70},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
protected
  parameter Real VA0(fixed = false);
  parameter Real VG0(fixed = false);
  parameter Real ETERM_0(fixed = false);
initial equation
  ETERM0 = ETERM_0;
  VG0 = KG * EFD0;
  VA0 = (EFD0 / ETERM0 + KM * KG * EFD0) / (KFF + KM);
  VREF_0 = if KIA <> 0 then ETERM0 else ETERM0 + VA0 / KPA;
  VUEL0 = -Modelica.Constants.inf;
  VOEL0 = 0;
equation
  connect(add1.u1, pid_nonwinduplimit1.y) annotation(Line(points = {{-66, -57}, {-84.51, -57}, {-84.51, 0.632244}, {61.117, 0.632244}, {61.117, 60.0632}, {50, 60.0632}, {50, 60}}, color = {0, 0, 127}));
  connect(pid_nonwinduplimit1.u, add32.y) annotation(Line(points = {{30, 60}, {24.8683, 60}, {24.8683, 60}, {25.5, 60}}, color = {0, 0, 127}));
  connect(max1.y, add32.u2) annotation(Line(points = {{5.5, 60}, {13.0664, 60}, {13.0664, 60}, {14, 60}}, color = {0, 0, 127}));
  connect(add31.y, max1.u1) annotation(Line(points = {{-14.5, 60}, {-11.0119, 60}, {-11.0119, 63.0952}, {-6, 63.0952}, {-6, 63}}, color = {0, 0, 127}));
  connect(Ecomp.y, product1.u1) annotation (Line(points={{-77,70},{-74,70},{-74, 83},{70,83},{70,-30},{50,-30},{50,-57},{54,-57}}, color={0,0,127}));
  connect(product1.u2, min1.y) annotation(Line(points = {{54, -63}, {49.4357, -63}, {49.4357, -60.0451}, {45.5, -60.0451}, {45.5, -60}}, color = {0, 0, 127}));
  connect(firstorder1.y, add1.u2) annotation(Line(points = {{-5.5, -80}, {-74.9455, -80}, {-74.9455, -62.963}, {-66, -62.963}, {-66, -63}}, color = {0, 0, 127}));
  connect(firstorder1.u, product1.y) annotation(Line(points = {{6, -80}, {72.3312, -80}, {72.3312, -59.9129}, {65.5, -59.9129}, {65.5, -60}}, color = {0, 0, 127}));
  connect(product1.y, EFD) annotation(Line(points = {{65.5, -60}, {92.5926, -60}, {92.5926, 0}, {100, 0}}, color = {0, 0, 127}));
  connect(min1.u1, limiter2.y) annotation(Line(points = {{34, -57}, {30.0385, -57}, {30.0385, -20.0257}, {25.5, -20.0257}, {25.5, -20}}, color = {0, 0, 127}));
  connect(limiter2.u, gain4.y) annotation(Line(points = {{14, -20}, {5.39153, -20}, {5.39153, -20}, {5.5, -20}}, color = {0, 0, 127}));
  connect(gain4.u, add3.y) annotation(Line(points = {{-6, -20}, {-14.8909, -20}, {-14.8909, -20}, {-14.5, -20}}, color = {0, 0, 127}));
  connect(XADIFD, add3.u2) annotation(Line(points = {{-100, -64}, {-76.7651, -64}, {-76.7651, -28.7548}, {-30.8087, -28.7548}, {-30.8087, -23.1065}, {-26, -23.1065}, {-26, -23}}, color = {0, 0, 127}));
  connect(gain3.y, add3.u1) annotation(Line(points = {{-34.5, -20}, {-31.5533, -20}, {-31.5533, -16.9448}, {-26, -17}, {-26, -17}}, color = {0, 0, 127}));
  connect(const.y, gain3.u) annotation(Line(points = {{-54.5, -20}, {-46.1874, -20}, {-46.1874, -20}, {-46, -20}}, color = {0, 0, 127}));
  connect(min1.u2, limiter1.y) annotation(Line(points = {{34, -63}, {8.98588, -63}, {8.98588, -60.077}, {5.5, -60.077}, {5.5, -60}}, color = {0, 0, 127}));
  connect(add2.y, limiter1.u) annotation(Line(points = {{-14.5, -60}, {-5.39153, -60}, {-5.39153, -60}, {-6, -60}}, color = {0, 0, 127}));
  connect(add2.u1, gain2.y) annotation(Line(points = {{-26, -57}, {-29.0116, -57}, {-29.0116, -40.0513}, {-34.5, -40.0513}, {-34.5, -40}}, color = {0, 0, 127}));
  connect(gain2.u, add1.u1) annotation(Line(points = {{-46, -40}, {-66.2388, -40}, {-66.2388, -57}, {-66, -57}}, color = {0, 0, 127}));
  connect(gain1.y, add2.u2) annotation(Line(points = {{-34.5, -60}, {-29.7818, -60}, {-29.7818, -62.6444}, {-26, -62.6444}, {-26, -63}}, color = {0, 0, 127}));
  connect(add1.y, gain1.u) annotation(Line(points = {{-54.5, -60}, {-46.4698, -60}, {-46.4698, -60}, {-46, -60}}, color = {0, 0, 127}));
  connect(demultiplexer1.y[2], add32.u3) annotation(Line(points = {{-50, 19.5}, {8.98588, 19.5}, {8.98588, 56.4827}, {14, 56.4827}, {14, 56}}, color = {0, 0, 127}));
  connect(demultiplexer1.y[1], add31.u3) annotation(Line(points = {{-50, 20.5}, {-34.6598, 20.5}, {-34.6598, 55.9692}, {-26, 55.9692}, {-26, 56}}, color = {0, 0, 127}));
  connect(VOEL, demultiplexer1.u) annotation(Line(points = {{-100, -8}, {-70.6033, -8}, {-70.6033, 20}, {-70, 20}}, color = {0, 0, 127}));
  connect(VUEL, max1.u2) annotation(Line(points = {{-100, 20}, {-9.24262, 20}, {-9.24262, 57.5096}, {-6, 57.5096}, {-6, 57}}, color = {0, 0, 127}));
  connect(add32.u1, VOTHSG) annotation(Line(points = {{14, 64}, {11.5533, 64}, {11.5533, 79.0757}, {-100, 79.0757}, {-100, -36}}, color = {0, 0, 127}));
  connect(dVREF, add4.u1) annotation(Line(points={{-100,58},{-84.8329,58},{
          -84.8329,43.1877},{-76,43.1877},{-76,43}},                                                                                          color = {0, 0, 127}));
  connect(add4.y, add31.u1) annotation(Line(points={{-64.5,40},{-38.3033,40},{
          -38.3033,64.0103},{-26,64.0103},{-26,64}},                                                                                             color = {0, 0, 127}));
  connect(lag1.y, add31.u2) annotation(Line(points = {{-50, 60}, {-26.7009, 60}, {-26.7009, 60}, {-26, 60}}, color = {0, 0, 127}));
  connect(Ecomp.y, lag1.u) annotation (Line(points={{-77,70},{-74,70},{-74,60},{-70,60}}, color={0,0,127}));
  connect(const1.y, add4.u2) annotation(Line(points={{-113,43},{-91.0026,43},{
          -91.0026,36.7609},{-76,36.7609},{-76,37}},                                                                                               color = {0, 0, 127}));
  connect(const2.y, VF) annotation(Line(points = {{110, 80}, {100, 80}}, color = {0, 0, 127}));
  annotation(Documentation(info = "<html>

<img src=\"modelica://OpalRT/resource/Excitation/ST6B.png\"
alt=\"EXDC2.png\"><br>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1})), experiment(StartTime = 0, StopTime = 30, Tolerance = 1e-06, Interval = 0.001), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1}), graphics={  Text(origin = {25.3024, -40.3319}, lineColor = {255, 0, 0}, extent = {{-3.57, 4.32}, {3.57, -4.32}}, textString = "VI", textstyle = {TextStyle.Bold}), Text(origin = {50.7173, -69.7945}, lineColor = {255, 0, 0}, extent = {{-3.57, 4.32}, {5.0581, -4.91524}}, textString = "VR", textstyle = {TextStyle.Bold}), Text(origin = {54.5497, -42.2352}, lineColor = {255, 0, 0}, extent = {{-3.57, 4.32}, {3.8737, -4.44548}}, textString = "VB", textstyle = {TextStyle.Bold}), Text(origin = {54.5451, 34.4013}, lineColor = {255, 0, 0}, extent = {{-3.57, 4.32}, {5.06, -4.92}}, textString = "VA", textstyle = {TextStyle.Bold})}));
end ST6B;
