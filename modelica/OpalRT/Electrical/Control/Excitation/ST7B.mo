within OpalRT.Electrical.Control.Excitation;
model ST7B
  extends OpalRT.Electrical.PartialModel.Exciter;
  parameter Real TR = 0.01 " regulator input filter time constant (s)";
  parameter Real TG = 1 " lead time constant of voltage input (s)";
  parameter Real TF = 1 " lag time constant of voltage input (s)";
  parameter Real VMAX = 1.1 " voltage reference maximum limit (p.u.)";
  parameter Real VMIN = 0.9 " voltage reference minimum limit (p.u.)";
  parameter Real KPA = 40 "(>0) voltage regulator gain (p.u.)";
  parameter Real VRMAX = 5 " voltage regulator maximum limit (p.u.)";
  parameter Real VRMIN = -4.5 " voltage regulator minimum limit (p.u.)";
  parameter Real KH = 1 " feedback gain (p.u.)";
  parameter Real KL = 1 " feedback gain (p.u.)";
  parameter Real TC = 1 " lead time constant of voltage regulator (s)";
  parameter Real TB = 1 " lag time constant of voltage regulator (s)";
  parameter Real KIA = 1 "(>0) gain of the first order feedback block (p.u.)";
  parameter Real TIA = 3 "(>0) time constant of the first order feedback block (s)";
  parameter Real OEL = 1 "Flag (1,2 or 3)";
  parameter Real UEL = 1 "Flag (1,2 or 3)";
  Modelica.Blocks.Sources.Constant const(k = 0) annotation(Placement(visible = true, transformation(origin = {-122, 55}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add3 add31 annotation(Placement(visible = true, transformation(origin = {-75, 55}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.SignalRouting.DeMultiplexer demultiplexer2(n = 3, s = UEL) annotation(Placement(visible = true, transformation(origin = {-60, 100}, extent = {{-5, -5}, {5, 5}}, rotation = -90)));
  OpalRT.NonElectrical.SignalRouting.DeMultiplexer demultiplexer1(n = 3, s = OEL) annotation(Placement(visible = true, transformation(origin = {-40, 100}, extent = {{-5, -5}, {5, 5}}, rotation = -90)));
  Modelica.Blocks.Math.Add3 add32 annotation(Placement(visible = true, transformation(origin = {-40, 60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Min LVgate annotation(Placement(visible = true, transformation(origin = {-20, 60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Max HVgate annotation(Placement(visible = true, transformation(origin = {0, 60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiter1(uMax = VMAX, uMin = VMIN) annotation(Placement(visible = true, transformation(origin = {20, 60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1 annotation(Placement(visible = true, transformation(origin = {40, 60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add2(k1 = +1, k2 = -1) annotation(Placement(visible = true, transformation(origin = {60, 60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = KPA) annotation(Placement(visible = true, transformation(origin = {80, 60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.LeadLag lead_lag1(TA = TG, TB = TF, y_start = ETERM_0) annotation(Placement(visible = true, transformation(origin = {-20, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag lag1(T = TR, y_start = ETERM_0) annotation(Placement(visible = true, transformation(origin = {-40, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain3(k = VRMIN) annotation(Placement(visible = true, transformation(origin = {-60, 20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain2(k = VRMAX) annotation(Placement(visible = true, transformation(origin = {-60, 0}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Max max1 annotation(Placement(visible = true, transformation(origin = {-20, 20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add3(k2 = -1) annotation(Placement(visible = true, transformation(origin = {-40, 20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Min min1 annotation(Placement(visible = true, transformation(origin = {0, 20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.LeadLag lead_lag2(TA = TC, TB = TB, y_start = V20) annotation(Placement(visible = true, transformation(origin = {20, 20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add5 annotation(Placement(visible = true, transformation(origin = {40, 20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Min min2 annotation(Placement(visible = true, transformation(origin = {60, 20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Max max2 annotation(Placement(visible = true, transformation(origin = {80, 20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag lag2(T = TIA, y_start = EFD_0 * KIA, K = KIA) annotation(Placement(visible = true, transformation(origin = {50, -40}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.VariableLimiter variablelimiter1 annotation(Placement(visible = true, transformation(origin = {-10, -20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add4(k2 = -1) annotation(Placement(visible = true, transformation(origin = {-30, 0}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain4(k = KL) annotation(Placement(visible = true, transformation(origin = {0, -40}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain5(k = KH) annotation(Placement(visible = true, transformation(origin = {0, -60}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant1(k = VREF_0) annotation(Placement(visible = true, transformation(origin = {-122, 38}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant2(k = 0) annotation(Placement(visible = true, transformation(origin = {77, 103}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add6 annotation(Placement(visible = true, transformation(origin = {-100, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression Ecomp(y = ETERM) annotation(Placement(visible = true, transformation(origin = {-65, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
protected
  parameter Real ETERM_0(fixed = false);
  parameter Real EFD_0(fixed = false);
  parameter Real V20(fixed = false);
  parameter Real Vref_FB(fixed = false);
  parameter Real VREF_0(fixed = false);
initial equation
  ETERM_0 = ETERM0;
  EFD_0 = EFD0;
  V20 = EFD_0 * (1 - KIA);
  Vref_FB = V20 / KPA + ETERM_0;
  VREF_0 = Vref_FB;
  VUEL0 = -Modelica.Constants.inf;
  VOEL0 = Modelica.Constants.inf;
equation
  connect(add31.u3, const.y) annotation(Line(points = {{-81, 51}, {-114, 51}, {-114, 55}, {-116.5, 55}}, color = {0, 0, 127}));
  connect(const.y, add31.u2) annotation(Line(points = {{-116.5, 55}, {-103.079, 55}, {-103.079, 54.8862}, {-81, 54.8862}, {-81, 55}}, color = {0, 0, 127}));
  connect(dVREF, add6.u1) annotation(Line(points={{-100,58},{-109.512,58},{
          -109.512,59.6401},{-106,59.6401},{-106,43}},                                                                                          color = {0, 0, 127}));
  connect(add31.u1, add6.y) annotation(Line(points={{-81,59},{-84.8329,59},{
          -84.8329,39.8458},{-94.5,39.8458},{-94.5,40}},                                                                                         color = {0, 0, 127}));
  connect(limiter1.u, HVgate.u2) annotation(Line(points = {{14, 60}, {8.12641, 60}, {8.12641, 52.3702}, {-6.09481, 52.3702}, {-6.09481, 57}, {-6, 57}}, color = {0, 0, 127}));
  connect(HVgate.u2, LVgate.u2) annotation(Line(points = {{-6, 57}, {-12.6411, 57}, {-12.6411, 53.0474}, {-26.4108, 53.0474}, {-26.4108, 57}, {-26, 57}}, color = {0, 0, 127}));
  connect(variablelimiter1.u, max2.u2) annotation(Line(points = {{-16, -20}, {-25.7336, -20}, {-25.7336, -8.12641}, {74.0406, -8.12641}, {74.0406, 17}, {74, 17}}, color = {0, 0, 127}));
  connect(max2.u2, min2.u2) annotation(Line(points = {{74, 17}, {67.0429, 17}, {67.0429, 13.544}, {54.1761, 13.544}, {54.1761, 17}, {54, 17}}, color = {0, 0, 127}));
  connect(gain5.u, lag2.y) annotation(Line(points = {{6, -60}, {28.2167, -60}, {28.2167, -40.1806}, {45, -40.1806}, {45, -40}}, color = {0, 0, 127}));
  connect(gain5.y, add3.u2) annotation(Line(points = {{-5.5, -60}, {-49.2099, -60}, {-49.2099, 16.93}, {-46, 16.93}, {-46, 17}}, color = {0, 0, 127}));
  connect(gain4.y, add4.u2) annotation(Line(points = {{-5.5, -40}, {-40.1806, -40}, {-40.1806, -3.386}, {-36, -3.386}, {-36, -3}}, color = {0, 0, 127}));
  connect(lag2.y, gain4.u) annotation(Line(points = {{45, -40}, {6.09481, -40}, {6.09481, -40}, {6, -40}}, color = {0, 0, 127}));
  connect(lag2.y, add5.u2) annotation(Line(points = {{45, -40}, {28.2167, -40}, {28.2167, 16.93}, {34, 16.93}, {34, 17}}, color = {0, 0, 127}));
  connect(lag2.u, EFD) annotation(Line(points = {{55, -40}, {92.3251, -40}, {92.3251, 0}, {100, 0}}, color = {0, 0, 127}));
  connect(add4.y, min1.u2) annotation(Line(points = {{-24.5, 0}, {-12.6411, 0}, {-12.6411, 17.1558}, {-6, 17.1558}, {-6, 17}}, color = {0, 0, 127}));
  connect(gain2.y, add4.u1) annotation(Line(points = {{-54.5, 0}, {-52.5959, 0}, {-52.5959, 3.16027}, {-46, 3}, {-36, 3}}, color = {0, 0, 127}));
  connect(variablelimiter1.y, EFD) annotation(Line(points = {{-4.5, -20}, {93.228, -20}, {93.228, 0}, {100, 0}}, color = {0, 0, 127}));
  connect(variablelimiter1.limit2, gain3.y) annotation(Line(points = {{-16, -24}, {-51.0158, -24}, {-51.0158, 20.0903}, {-54.5, 20.0903}, {-54.5, 20}}, color = {0, 0, 127}));
  connect(variablelimiter1.limit1, gain2.y) annotation(Line(points = {{-16, -16}, {-52.8217, -16}, {-52.8217, -0.451467}, {-54.5, -0.451467}, {-54.5, 0}}, color = {0, 0, 127}));
  connect(min2.u1, demultiplexer1.y[3]) annotation(Line(points={{54,23},{
          49.2099,23},{49.2099,29.3454},{93.228,29.3454},{93.228,89.1648},{
          -40.4063,89.1648},{-40.4063,95},{-40.3333,95}},                                                                                                                                                  color = {0, 0, 127}));
  connect(max2.u1, demultiplexer2.y[3]) annotation(Line(points={{74,23},{
          69.3002,23},{69.3002,27.991},{95.2596,27.991},{95.2596,83.5214},{
          -60.2709,83.5214},{-60.2709,95},{-60.3333,95}},                                                                                                                                                  color = {0, 0, 127}));
  connect(add5.y, min2.u2) annotation(Line(points = {{45.5, 20}, {50.1129, 20}, {50.1129, 16.7043}, {54, 16.7043}, {54, 17}}, color = {0, 0, 127}));
  connect(lead_lag2.y, add5.u1) annotation(Line(points = {{25, 20}, {27.7652, 20}, {27.7652, 23.0248}, {34, 23.0248}, {34, 23}}, color = {0, 0, 127}));
  connect(lead_lag2.u, min1.y) annotation(Line(points = {{15, 20}, {5.41761, 20}, {5.41761, 20}, {5.5, 20}}, color = {0, 0, 127}));
  connect(max1.y, min1.u1) annotation(Line(points = {{-14.5, 20}, {-11.9639, 20}, {-11.9639, 22.7991}, {-6, 22.7991}, {-6, 23}}, color = {0, 0, 127}));
  connect(gain1.y, max1.u1) annotation(Line(points = {{85.5, 60}, {88.7133, 60}, {88.7133, 31.1512}, {-31.377, 31.1512}, {-31.377, 22.7991}, {-26, 22.7991}, {-26, 23}}, color = {0, 0, 127}));
  connect(add3.y, max1.u2) annotation(Line(points = {{-34.5, 20}, {-31.8284, 20}, {-31.8284, 16.4786}, {-26, 16.4786}, {-26, 17}}, color = {0, 0, 127}));
  connect(gain3.y, add3.u1) annotation(Line(points = {{-54.5, 20}, {-52.1445, 20}, {-52.1445, 22.7991}, {-46, 22.7991}, {-46, 23}}, color = {0, 0, 127}));
  connect(lag1.y, lead_lag1.u) annotation(Line(points = {{-35, 40}, {-25.3273, 40}, {-25.3273, 40}, {-25, 40}}, color = {0, 0, 127}));
  connect(lead_lag1.y, add2.u2) annotation(Line(points = {{-15, 40}, {46.0497, 40}, {46.0497, 57.1106}, {54, 57.1106}, {54, 57}}, color = {0, 0, 127}));
  connect(add1.y, add2.u1) annotation(Line(points = {{45.5, 60}, {47.6298, 60}, {47.6298, 63.4312}, {54, 63.4312}, {54, 63}}, color = {0, 0, 127}));
  connect(gain1.u, add2.y) annotation(Line(points = {{74, 60}, {65.6885, 60}, {65.6885, 60}, {65.5, 60}}, color = {0, 0, 127}));
  connect(add1.u1, VOTHSG) annotation(Line(points = {{34, 63}, {31.1196, 63}, {31.1196, 76}, {-139, 76}, {-139, -37}, {-100, -37}, {-100, -36}}, color = {0, 0, 127}));
  connect(add1.u2, limiter1.y) annotation(Line(points = {{34, 57}, {29.1196, 57}, {29.1196, 60.0451}, {25.5, 60.0451}, {25.5, 60}}, color = {0, 0, 127}));
  connect(HVgate.u1, demultiplexer2.y[2]) annotation(Line(points = {{-6, 63}, {-11.0609, 63}, {-11.0609, 73.5892}, {-60.2709, 73.5892}, {-60.2709, 95}, {-60, 95}}, color = {0, 0, 127}));
  connect(LVgate.u1, demultiplexer1.y[2]) annotation(Line(points = {{-26, 63}, {-31.714, 63}, {-31.714, 71.0732}, {-40.2088, 71.0732}, {-40.2088, 95}, {-40, 95}}, color = {0, 0, 127}));
  connect(LVgate.u2, add32.y) annotation(Line(points = {{-26, 57}, {-30.015, 57}, {-30.015, 60.03}, {-34.5, 60.03}, {-34.5, 60}}, color = {0, 0, 127}));
  connect(demultiplexer1.y[1], add32.u1) annotation(Line(points={{-39.6667,95},
          {-39.6667,89.1955},{-55.4994,89.1955},{-55.4994,63.7111},{-46,63.7111},
          {-46,64}},                                                                                                                                                          color = {0, 0, 127}));
  connect(demultiplexer2.y[1], add32.u2) annotation(Line(points={{-59.6667,95},
          {-59.6667,59.4637},{-46,59.4637},{-46,60}},                                                                               color = {0, 0, 127}));
  connect(add32.u3, add31.y) annotation(Line(points = {{-46, 56}, {-60.5963, 56}, {-60.5963, 54.6499}, {-69.5, 54.6499}, {-69.5, 55}}, color = {0, 0, 127}));
  connect(demultiplexer1.u, VOEL) annotation(Line(points = {{-40, 105}, {-40, 112}, {-165, 112}, {-165, -8}, {-100, -8}}, color = {0, 0, 127}));
  connect(demultiplexer2.u, VUEL) annotation(Line(points = {{-60, 105}, {-161, 105}, {-161, 20}, {-100, 20}}, color = {0, 0, 127}));
  connect(Ecomp.y, gain3.u) annotation (Line(points={{-54,40},{-51,40},{-51,30}, {-83,30},{-83,20},{-66,20}}, color={0,0,127}));
  connect(Ecomp.y, gain2.u) annotation (Line(points={{-54,40},{-51,40},{-51,30}, {-83,30},{-83,0},{-66,0}}, color={0,0,127}));
  connect(Ecomp.y, lag1.u) annotation(Line(points = {{-54, 40}, {-45, 40}}, color = {0, 0, 127}));
  connect(constant1.y, add6.u2) annotation(Line(points={{-116.5,38},{-112.339,
          38},{-112.339,36.5039},{-106,36.5039},{-106,37}},                                                                                             color = {0, 0, 127}));
  connect(constant2.y, VF) annotation(Line(points = {{82.5, 103}, {100, 103}, {100, 80}}, color = {0, 0, 127}));
  annotation(Documentation(info = "<html>

<img src=\"modelica://OpalRT/resource/Excitation/ST7B.png\"
alt=\"EXDC2.png\"><br>
</html>"), experiment(StartTime = 0, StopTime = 30, Tolerance = 1e-06, Interval = 0.001), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1}), graphics={  Text(origin = {-30.1542, 90.0488}, lineColor = {255, 0, 0}, fillColor = {255, 0, 0}, extent = {{-7.22, 5.95}, {1.55679, -1.41944}}, textString = "OEL"), Text(origin = {-63.19, 89.01}, lineColor = {255, 0, 0}, fillColor = {255, 0, 0}, extent = {{-7.22, 5.95}, {1.56, -1.42}}, textString = "UEL"), Text(origin = {-46.4839, 65.7876}, lineColor = {255, 0, 0}, fillColor = {255, 0, 0}, extent = {{-7.22, 5.95}, {1.56, -1.42}}, textString = "OEL=1"), Text(origin = {-22.61, 65.88}, lineColor = {255, 0, 0}, fillColor = {255, 0, 0}, extent = {{-7.22, 5.95}, {1.56, -1.42}}, textString = "OEL=2"), Text(origin = {-50.2697, 59.1729}, lineColor = {255, 0, 0}, fillColor = {255, 0, 0}, extent = {{-7.22, 5.95}, {1.56, -1.42}}, textString = "UEL=1"), Text(origin = {-2.8, 66.46}, lineColor = {255, 0, 0}, fillColor = {255, 0, 0}, extent = {{-7.22, 5.95}, {1.56, -1.42}}, textString = "UEL=2"), Text(origin = {94.33, 23.41}, lineColor = {255, 0, 0}, fillColor = {255, 0, 0}, extent = {{-7.22, 5.95}, {1.56, -1.42}}, textString = "UEL=3"), Text(origin = {57.3749, 25.0611}, lineColor = {255, 0, 0}, fillColor = {255, 0, 0}, extent = {{-7.22, 5.95}, {1.56, -1.42}}, textString = "OEL=3"), Rectangle(origin = {-19.41, 66.8}, lineColor = {255, 0, 0}, pattern = LinePattern.Dash,
            lineThickness =                                                                                                                                                                                                        1, extent = {{-14.67, 9.82}, {29.12, -17.04}}), Rectangle(origin = {62.6, 24.33}, lineColor = {255, 0, 0}, pattern = LinePattern.Dash,
            lineThickness =                                                                                                                                                                                                        1, extent = {{-14.67, 9.82}, {34.53, -18.4}}), Text(origin = {-17.2971, 77.7957}, lineColor = {255, 0, 0}, fillColor = {255, 0, 0}, extent = {{-7.22, 5.95}, {16.4584, -3.4516}}, textString = "DISABLED"), Text(origin = {68.7752, 36.1027}, lineColor = {255, 0, 0}, fillColor = {255, 0, 0}, extent = {{-7.22, 5.95}, {16.4584, -3.4516}}, textString = "DISABLED"), Text(origin = {-106.738, 56.9459}, lineColor = {255, 0, 0}, fillColor = {255, 0, 0}, extent = {{-7.22, 5.95}, {6.11154, -3.5619}}, textString = "VSCL"), Text(origin = {-107.538, 53.4829}, lineColor = {255, 0, 0}, fillColor = {255, 0, 0}, extent = {{-7.22, 5.95}, {13.6067, -9.9857}}, textString = "VDROOP"), Rectangle(origin = {-115.018, 60.4209}, lineColor = {255, 0, 0}, pattern = LinePattern.Dash,
            lineThickness =                                                                                                                                                                                                        1, extent = {{-15.0859, 2.70875}, {28.018, -11.4209}}), Text(origin = {-126.44, 65.8412}, lineColor = {255, 0, 0}, fillColor = {255, 0, 0}, extent = {{-7.22, 5.95}, {16.4584, -3.4516}}, textString = "DISABLED")}));
end ST7B;
