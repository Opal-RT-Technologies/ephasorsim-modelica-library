within OpalRT.Electrical.Control.Excitation;
model ESST1A "IEEE Type ST1A Excitation System"
  extends OpalRT.Electrical.PartialModel.Exciter;
  parameter Real TR = 0.02 "(sec)";
  parameter Real VIMAX = 10;
  parameter Real VIMIN = -10;
  parameter Real TC = 1 "(sec)";
  parameter Real TB = 1 "(sec)";
  parameter Real TC1 = 0 "(sec)";
  parameter Real TB1 = 0 "(sec)";
  parameter Real KA = 210;
  parameter Real TA = 0 "(sec)";
  parameter Real VAMAX = 10;
  parameter Real VAMIN = -10;
  parameter Real VRMAX = 6.43;
  parameter Real VRMIN = -6;
  parameter Real KC = 0.038;
  parameter Real KF = 0;
  parameter Real TF = 0 "> 0 (sec)";
  parameter Real KLR = 4.54;
  parameter Real ILR = 4.4;
  parameter Real UEL = 1 "1,2 or 3";
  parameter Real VOS = 1 "1 or 2";
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag lag1(T = TR, y_start = ETERM_0) annotation(Placement(visible = true, transformation(origin = {-70, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1(k1 = -1) annotation(Placement(visible = true, transformation(origin = {-40, 80}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add3 add31 annotation(Placement(visible = true, transformation(origin = {-10, 80}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add2(k1 = -1, k2 = +1) annotation(Placement(visible = true, transformation(origin = {10, 80}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.SignalRouting.DeMultiplexer demultiplexer1(n = 2, s = VOS) annotation(Placement(visible = true, transformation(origin = {-70, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.SignalRouting.DeMultiplexer demultiplexer2(n = 3, s = UEL) annotation(Placement(visible = true, transformation(origin = {-70, 20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiter1(uMax = VIMAX, uMin = VIMIN) annotation(Placement(visible = true, transformation(origin = {30, 80}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Max HVGATE1 annotation(Placement(visible = true, transformation(origin = {50, 80}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add3 add32(k3 = -1) annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Max HVGATE2 annotation(Placement(visible = true, transformation(origin = {30, 0}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Min LVGATE annotation(Placement(visible = true, transformation(origin = {50, 0}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Nonlinear.VariableLimiter variablelimiter1 annotation(Placement(visible = true, transformation(origin = {80, 0}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = VRMAX) annotation(Placement(visible = true, transformation(origin = {-60, -20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain2(k = KC) annotation(Placement(visible = true, transformation(origin = {-60, -40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add3(k1 = +1, k2 = -1) annotation(Placement(visible = true, transformation(origin = {-40, -20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunctionNonWindup.Lag_NonWindupLimit lag_non_windup_limit1(KI = KA, TI = TA, VRMAX = VAMAX, VRMIN = VAMIN, y_init = VA0) annotation(Placement(visible = true, transformation(origin = {60, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.LeadLag lead_lag2(TA = TC1, TB = TB1, y_start = VI0) annotation(Placement(visible = true, transformation(origin = {30, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.LeadLag lead_lag1(TA = TC, TB = TB, y_start = VI0) annotation(Placement(visible = true, transformation(origin = {0, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain4(k = KF) annotation(Placement(visible = true, transformation(origin = {80, 70}, extent = {{-5, -5}, {5, 5}}, rotation = 90)));
  Modelica.Blocks.Continuous.TransferFunction transferfunction1(b = {1, 0}, a = if TF0 <> 0 then {TF0, 1} else {1, 1}, initType = Modelica.Blocks.Types.Init.InitialOutput) annotation(Placement(visible = true, transformation(origin = {80, 50}, extent = {{-5, -5}, {5, 5}}, rotation = 90)));
  Modelica.Blocks.Math.Gain gain3(k = VRMIN) annotation(Placement(visible = true, transformation(origin = {30, -30}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = ILR) annotation(Placement(visible = true, transformation(origin = {-80, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add4(k1 = +1, k2 = -1) annotation(Placement(visible = true, transformation(origin = {-40, -60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain5(k = KLR) annotation(Placement(visible = true, transformation(origin = {-20, -60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiter2(uMax = Modelica.Constants.inf, uMin = 0) annotation(Placement(visible = true, transformation(origin = {0, -60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const1(k = VREF_0) annotation(Placement(transformation(extent = {{-153, 34}, {-133, 54}})));
  Modelica.Blocks.Math.Add add5 annotation(Placement(visible = true, transformation(origin = {-70, 60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression Ecomp(y = ETERM) annotation(Placement(visible = true, transformation(origin = {-101, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
protected
  parameter Real TF0(start = 1, fixed = false);
  parameter Real IFD0(fixed = false);
  parameter Real VLR0(fixed = false);
  parameter Real VA0(fixed = false);
  parameter Real VI0(fixed = false);
  parameter Real VREF_0(fixed = false);
  parameter Real ETERM_0(fixed = false);
  parameter Real EFD_0(fixed = false);
initial algorithm
  TF0 := TF;
initial equation
  ETERM_0 = ETERM0;
  EFD_0 = EFD0;
  IFD0 = XADIFD;
  VLR0 = if KLR * (IFD0 - ILR) > 0 then KLR * (IFD0 - ILR) else 0;
  VA0 = EFD_0 + VLR0;
  VI0 = VA0 / KA;
  VREF_0 = VI0 + ETERM_0;
  VUEL0 = -Modelica.Constants.inf;
  VOEL0 = Modelica.Constants.inf;
equation
  connect(VF, gain4.y) annotation(Line(points = {{100, 80}, {80.0977, 80}, {80.0977, 75.5}, {80, 75.5}}, color = {0, 0, 127}));
  connect(lead_lag1.u, HVGATE1.u1) annotation(Line(points = {{-10, 30}, {-15.6969, 30}, {-15.6969, 55.4804}, {61.1637, 55.4804}, {61.1637, 88.7686}, {43.5724, 88.7686}, {43.5724, 83}, {44, 83}}, color = {0, 0, 127}));
  connect(LVGATE.u1, HVGATE2.u1) annotation(Line(points = {{44, 3}, {38.7009, 3}, {38.7009, 9.7429}, {23.5453, 9.7429}, {23.5453, 3}, {24, 3}}, color = {0, 0, 127}));
  connect(variablelimiter1.u, LVGATE.u1) annotation(Line(points = {{74, 0}, {57.9161, 0}, {57.9161, 9.20162}, {44.1137, 9.20162}, {44.1137, 3}, {44, 3}}, color = {0, 0, 127}));
  connect(transferfunction1.u, variablelimiter1.u) annotation(Line(points = {{80, 44}, {80, 11.6173}, {65.8314, 11.6173}, {65.8314, 0}, {74, 0}, {74, 0}}, color = {0, 0, 127}));
  connect(limiter2.y, add32.u3) annotation(Line(points = {{5.5, -60}, {13.6674, -60}, {13.6674, -40.0911}, {-15.0342, -40.0911}, {-15.0342, -3.87244}, {-6, -3.87244}, {-6, -4}}, color = {0, 0, 127}));
  connect(gain5.y, limiter2.u) annotation(Line(points = {{-14.5, -60}, {-6.60592, -60}, {-6.60592, -60}, {-6, -60}}, color = {0, 0, 127}));
  connect(add4.y, gain5.u) annotation(Line(points = {{-34.5, -60}, {-26.6515, -60}, {-26.6515, -60}, {-26, -60}}, color = {0, 0, 127}));
  connect(add4.u1, XADIFD) annotation(Line(points = {{-46, -57}, {-74.0319, -57}, {-74.0319, -40.0911}, {-100, -40.0911}, {-100, -64}}, color = {0, 0, 127}));
  connect(const.y, add4.u2) annotation(Line(points = {{-69, -70}, {-58.7699, -70}, {-58.7699, -62.6424}, {-46, -62.6424}, {-46, -63}}, color = {0, 0, 127}));
  connect(Ecomp.y, gain1.u) annotation (Line(points={{-90,80},{-86,80},{-86,-20}, {-66,-20}}, color={0,0,127}));
  connect(Ecomp.y, gain3.u) annotation (Line(points={{-90,80},{-85,80},{-85,-30}, {24,-30}}, color={0,0,127}));
  connect(gain3.y, variablelimiter1.uMin) annotation(Line(points = {{35.5, -30}, {64.0091, -30}, {64.0091, -4.10023}, {74, -4.10023}, {74, -4}}, color = {0, 0, 127}));
  connect(gain4.y, add2.u1) annotation(Line(points = {{80, 75.5}, {80, 92.0273}, {-1.36674, 92.0273}, {-1.36674, 82.6879}, {4, 82.6879}, {4, 83}}, color = {0, 0, 127}));
  connect(add2.u2, add31.y) annotation(Line(points = {{4, 77}, {0, 77}, {0, 80.1822}, {-4.5, 80.1822}, {-4.5, 80}}, color = {0, 0, 127}));
  connect(transferfunction1.y, gain4.u) annotation(Line(points = {{80, 55.5}, {80, 62.8702}, {80, 62.8702}, {80, 64}}, color = {0, 0, 127}));
  connect(lag_non_windup_limit1.y, add32.u1) annotation(Line(points = {{71, 30}, {72.4374, 30}, {72.4374, 12.9841}, {-10.9339, 12.9841}, {-10.9339, 4.32802}, {-6, 4.32802}, {-6, 4}}, color = {0, 0, 127}));
  connect(lead_lag1.y, lead_lag2.u) annotation(Line(points = {{10, 30}, {19.8178, 30}, {19.8178, 30}, {20, 30}}, color = {0, 0, 127}));
  connect(lead_lag2.y, lag_non_windup_limit1.u) annotation(Line(points = {{40, 30}, {47.8588, 30}, {47.8588, 30}, {49, 30}}, color = {0, 0, 127}));
  connect(variablelimiter1.y, EFD) annotation(Line(points = {{85.5, 0}, {101.367, 0}, {101.367, 0}, {100, 0}}, color = {0, 0, 127}));
  connect(add3.y, variablelimiter1.uMax) annotation(Line(points = {{-34.5, -20}, {60.5923, -20}, {60.5923, 4.10023}, {74, 4.10023}, {74, 4}}, color = {0, 0, 127}));
  connect(gain2.y, add3.u2) annotation(Line(points = {{-54.5, -40}, {-51.0251, -40}, {-51.0251, -22.779}, {-46, -22.779}, {-46, -23}}, color = {0, 0, 127}));
  connect(gain1.y, add3.u1) annotation(Line(points = {{-54.5, -20}, {-51.4806, -20}, {-51.4806, -17.5399}, {-46, -17.5399}, {-46, -17}}, color = {0, 0, 127}));
  connect(XADIFD, gain2.u) annotation(Line(points = {{-100, -64}, {-66.7426, -64}, {-66.7426, -40}, {-66, -40}}, color = {0, 0, 127}));
  connect(VOEL, LVGATE.u2) annotation(Line(points = {{-100, -8}, {-37.8132, -8}, {-37.8132, -14.8064}, {39.8633, -14.8064}, {39.8633, -2.73349}, {44, -2.73349}, {44, -3}}, color = {0, 0, 127}));
  connect(HVGATE2.u2, demultiplexer2.y[3]) annotation(Line(points={{24,-3},{
          11.8451,-3},{11.8451,-10.4784},{-32.8018,-10.4784},{-32.8018,19.8178},
          {-64.9203,19.8178},{-64.9203,19.6667},{-65,19.6667}},                                                                                                                                                          color = {0, 0, 127}));
  connect(add32.y, HVGATE2.u1) annotation(Line(points = {{5.5, 0}, {11.3895, 0}, {11.3895, 3.18907}, {24, 3.18907}, {24, 3}}, color = {0, 0, 127}));
  connect(add32.u2, demultiplexer1.y[2]) annotation(Line(points = {{-6, 0}, {-28.7016, 0}, {-28.7016, 40.0911}, {-65, 40.0911}, {-65, 39.75}}, color = {0, 0, 127}));
  connect(HVGATE1.u2, demultiplexer2.y[2]) annotation(Line(points = {{44, 77}, {38.2688, 77}, {38.2688, 62.1868}, {-20.7289, 62.1868}, {-20.7289, 19.8178}, {-65, 19.8178}, {-65, 20}}, color = {0, 0, 127}));
  connect(limiter1.y, HVGATE1.u1) annotation(Line(points = {{35.5, 80}, {37.8132, 80}, {37.8132, 82.9157}, {44, 82.9157}, {44, 83}}, color = {0, 0, 127}));
  connect(limiter1.u, add2.y) annotation(Line(points = {{24, 80}, {15.9453, 80}, {15.9453, 80}, {15.5, 80}}, color = {0, 0, 127}));
  connect(demultiplexer2.y[1], add31.u3) annotation(Line(points={{-65,20.3333},
          {-24.1458,20.3333},{-24.1458,76.082},{-16,76.082},{-16,76}},                                                                                 color = {0, 0, 127}));
  connect(demultiplexer1.y[1], add31.u2) annotation(Line(points = {{-65, 40.25}, {-28.7016, 40.25}, {-28.7016, 80.6378}, {-16, 80.6378}, {-16, 80}}, color = {0, 0, 127}));
  connect(VUEL, demultiplexer2.u) annotation(Line(points = {{-100, 20}, {-75.1708, 20}, {-75.1708, 20}, {-75, 20}}, color = {0, 0, 127}));
  connect(VOTHSG, demultiplexer1.u) annotation(Line(points = {{-100, -36}, {-75.1708, -36}, {-75.1708, 40}, {-75, 40}}, color = {0, 0, 127}));
  connect(dVREF, add5.u1) annotation(Line(points={{-100,58},{-94.8586,58},{
          -94.8586,62.982},{-76,62.982},{-76,63}},                                                                                           color = {0, 0, 127}));
  connect(add5.y, add1.u2) annotation(Line(points={{-64.5,60},{-55.2699,60},{
          -55.2699,76.8638},{-46,76.8638},{-46,77}},                                                                                              color = {0, 0, 127}));
  connect(add1.y, add31.u1) annotation(Line(points = {{-34.5, 80}, {-32.3462, 80}, {-32.3462, 84.2825}, {-16, 84.2825}, {-16, 84}}, color = {0, 0, 127}));
  connect(lag1.y, add1.u1) annotation(Line(points = {{-60, 80}, {-55.8087, 80}, {-55.8087, 82.6879}, {-46, 82.6879}, {-46, 83}}, color = {0, 0, 127}));
  connect(Ecomp.y, lag1.u) annotation(Line(points = {{-90, 80}, {-80, 80}}, color = {0, 0, 127}));
  connect(const1.y, add5.u2) annotation(Line(points={{-132,44},{-83.8046,44},{
          -83.8046,56.8123},{-76,56.8123},{-76,57}},                                                                                               color = {0, 0, 127}));
  annotation(Documentation(info = "<html>

<p>
all LV and HV gates, are currently disabled.
</p>
<img src=\"modelica://OpalRT/resource/Excitation/ESST1A.png\"
alt=\"ESST1A.png\"><br>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1}), graphics={  Text(origin = {-18.23, 71.3}, lineColor = {255, 0, 0}, extent = {{-4.33, 1.82}, {7.29, -2.96}}, textString = "UEL=1"), Text(origin = {44.17, 70.59}, lineColor = {255, 0, 0}, extent = {{-4.33, 1.82}, {7.29, -2.96}}, textString = "UEL=2"), Text(origin = {18.17, -7.56}, lineColor = {255, 0, 0}, fillColor = {255, 0, 0}, extent = {{-4.33, 1.82}, {7.29, -2.96}}, textString = "UEL=3"), Text(origin = {-20.8, 3.58}, lineColor = {255, 0, 0}, fillColor = {255, 0, 0}, extent = {{-4.33, 1.82}, {7.29, -2.96}}, textString = "VOS=2"), Text(origin = {-37.22, 69.17}, lineColor = {255, 0, 0}, extent = {{-4.33, 1.82}, {7.29, -2.96}}, textString = "VOS=1"), Text(origin = {2.24547, 95.4144}, lineColor = {255, 0, 0}, extent = {{-4.33, 1.82}, {2.51, -3.42}}, textString = "VF"), Text(origin = {88.84, 88.5}, lineColor = {255, 0, 0}, extent = {{-4.56, 3.08}, {4.56, -3.08}}, textString = "VF")}));
end ESST1A;
