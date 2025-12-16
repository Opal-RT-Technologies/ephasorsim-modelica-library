within OpalRT.Electrical.Control.Excitation;
model EXDC2
  extends OpalRT.Electrical.PartialModel.Exciter;
  parameter Real TR = 0.1 "(sec)";
  parameter Real KA = 400;
  parameter Real TA = 5 "(sec)";
  parameter Real TB = 12 "(sec)";
  parameter Real TC = 10 "(sec)";
  parameter Real VRMAX = 5 "or zero";
  parameter Real VRMIN = -5;
  parameter Real KE = 0.5 "or zero";
  parameter Real TE = 0.08 "(sec)";
  parameter Real KF = 0.2;
  parameter Real TF1 = 1.2 "(>0) (sec)";
  parameter Real Switch = 0;
  parameter Real E1 = 4;
  parameter Real SE_E1 = 0.4;
  parameter Real E2 = 5;
  parameter Real SE_E2 = 0.5;
  import sat_q = OpalRT.NonElectrical.Math.Nonlinear.computeSaturationQuadratic;
  Modelica.Blocks.Math.Add3 add31 annotation(Placement(visible = true, transformation(origin = {-60, -60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag lag1(T = TR, y_start = ECOMP_0, initType = Modelica.Blocks.Types.Init.InitialOutput) annotation(Placement(visible = true, transformation(origin = {-56, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add2(k2 = -1, k1 = +1) annotation(Placement(visible = true, transformation(origin = {-20, 0}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add3 add32(k1 = -1) annotation(Placement(visible = true, transformation(origin = {20, -40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.LeadLag lead_lag1(TA = TC, TB = TB, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = VR_0 / KA) annotation(Placement(visible = true, transformation(origin = {40, -40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add3(k2 = +1, k1 = -1) annotation(Placement(visible = true, transformation(origin = {80, 20}, extent = {{-5, -5}, {5, 5}}, rotation = 90)));
  Modelica.Blocks.Math.Add add1(k2 = +1, k1 = +1) annotation(Placement(visible = true, transformation(origin = {60, 0}, extent = {{5, -5}, {-5, 5}}, rotation = 180)));
  Modelica.Blocks.Math.Gain gain1(k = KE_1) annotation(Placement(visible = true, transformation(origin = {0, 20}, extent = {{-5, -5}, {5, 5}}, rotation = -90)));
  NonElectrical.Math.Nonlinear.SaturationQuadratic saturation1(E1 = E1, E2 = E2, SE_E1 = SE_E1, SE_E2 = SE_E2) annotation(Placement(visible = true, transformation(origin = {20, 38}, extent = {{5, -5}, {-5, 5}}, rotation = 90)));
  Modelica.Blocks.Continuous.TransferFunction transferfunction1(b = {KF0, 0}, a = {TF0, 1}, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = 0) annotation(Placement(visible = true, transformation(origin = {-40, 20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator integrator1(k = 1 / TE, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = EFD_0) annotation(Placement(visible = true, transformation(origin = {60, 60}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain2(k = VRMAX_1) annotation(Placement(visible = true, transformation(origin = {100, -20}, extent = {{-5, -5}, {5, 5}}, rotation = 180)));
  Modelica.Blocks.Math.Gain gain3(k = VRMIN_1) annotation(Placement(visible = true, transformation(origin = {100, -60}, extent = {{-5, -5}, {5, 5}}, rotation = 180)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunctionNonWindup.Lag_NonWindupVariableLimit lag_non_windup_var_limit2(KI = KA, TI = TA, y_init = VR_0) annotation(Placement(visible = true, transformation(origin = {60, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Product product annotation(Placement(transformation(extent = {{-5, -5}, {5, 5}}, rotation = -90, origin = {23, 17})));
  Modelica.Blocks.Sources.Constant const(k = VREF_0) annotation(Placement(transformation(extent = {{-153, 34}, {-133, 54}})));
  Modelica.Blocks.Math.Add add4(k2 = +1, k1 = +1) annotation(Placement(visible = true, transformation(origin = {-100, 40}, extent = {{5, -5}, {-5, 5}}, rotation = 180)));
  Modelica.Blocks.Sources.RealExpression Ecomp(y = ETERM) annotation(Placement(visible = true, transformation(origin = {-27, -76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
protected
  parameter Real TF0(start = 1, fixed = false);
  parameter Real KF0(fixed = false, start = 1);
  parameter Real ECOMP_0(fixed = false);
  parameter Real EFD_0(fixed = false);
  parameter Real VRMAX_1(fixed = false);
  parameter Real VRMIN_1(fixed = false);
  parameter Real KE_1(fixed = false);
  parameter Real VREF_0(fixed = false);
  parameter Real VR_0(fixed = false);
  parameter Real SE0(fixed = false);
initial algorithm
  KF0 := KF;
  TF0 := TF1;
initial equation
  ECOMP_0 = ETERM0;
  EFD_0 = EFD0;
  SE0 = sat_q(EFD_0, E1, E2, SE_E1, SE_E2);
  VRMAX_1 = if VRMAX <> 0 then VRMAX elseif KE <= 0 then SE_E2 * E2 else (SE_E2 + KE) * E2;
  VRMIN_1 = if VRMAX <> 0 then VRMIN else -VRMAX_1;
  KE_1 = if KE <> 0 then KE else VRMAX_1 / (10 * EFD_0) - SE0;
  VR_0 = EFD_0 * (SE0 + KE_1);
  VREF_0 = ECOMP_0 + VR_0 / KA;
  VUEL0 = 0;
  VOEL0 = 0;
equation
  connect(add32.u1, VF) annotation(Line(points = {{14, -36}, {10, -36}, {10, -10}, {87.3941, -10}, {87.3941, 80}, {100, 80}}, color = {0, 0, 127}));
  connect(Ecomp.y, lag1.u) annotation(Line(points = {{-16, -76}, {6, -76}, {6, -48}, {-70, -48}, {-70, -20}, {-66, -20}}, color = {0, 0, 127}));
  connect(gain2.y, lag_non_windup_var_limit2.VU) annotation(Line(points = {{94.5, -20}, {55.9913, -20}, {55.9913, -31}, {56, -31}}, color = {0, 0, 127}));
  connect(gain3.y, lag_non_windup_var_limit2.VL) annotation(Line(points = {{94.5, -60}, {61.0022, -60}, {61.0022, -49}, {61, -49}}, color = {0, 0, 127}));
  connect(lag_non_windup_var_limit2.y, add3.u2) annotation(Line(points = {{71, -40}, {83.0065, -40}, {83.0065, 14}, {83, 14}}, color = {0, 0, 127}));
  connect(lead_lag1.y, lag_non_windup_var_limit2.u) annotation(Line(points = {{45, -40}, {49.0196, -40}, {49.0196, -40}, {49, -40}}, color = {0, 0, 127}));
  connect(gain1.u, EFD) annotation(Line(points = {{-3.67382e-16, 26}, {-3.67382e-16, 60}, {0, 60}, {0, 94}, {112, 94}, {112, 0}, {100, 0}}, color = {0, 0, 127}));
  connect(transferfunction1.u, EFD) annotation(Line(points = {{-46, 20}, {-54, 20}, {-54, 94}, {112, 94}, {112, 0}, {100, 0}}, color = {0, 0, 127}));
  connect(integrator1.y, EFD) annotation(Line(points = {{54.5, 60}, {42, 60}, {42, 94}, {112, 94}, {112, 0}, {100, 0}}, color = {0, 0, 127}));
  connect(integrator1.u, add3.y) annotation(Line(points = {{66, 60}, {80.1822, 60}, {80.1822, 25.5}, {80, 25.5}}, color = {0, 0, 127}));
  connect(transferfunction1.y, add32.u1) annotation(Line(points = {{-34.5, 20}, {-8.20046, 20}, {-8.20046, -36.2187}, {14, -36.2187}, {14, -36}}, color = {0, 0, 127}));
  connect(saturation1.u, EFD) annotation(Line(points = {{20, 43}, {20, 94}, {112, 94}, {112, 0}, {100, 0}}, color = {0, 0, 127}));
  connect(gain1.y, add1.u1) annotation(Line(points = {{3.36767e-16, 14.5}, {3.36767e-16, -2.96128}, {54, -2.96128}, {54, -3}}, color = {0, 0, 127}));
  connect(add1.y, add3.u1) annotation(Line(points = {{65.5, 0}, {76.9932, 0}, {76.9932, 14}, {77, 14}}, color = {0, 0, 127}));
  connect(add32.y, lead_lag1.u) annotation(Line(points = {{25.5, -40}, {34.8519, -40}, {34.8519, -40}, {35, -40}}, color = {0, 0, 127}));
  connect(add31.y, add32.u3) annotation(Line(points = {{-54.5, -60}, {-10.4784, -60}, {-10.4784, -44.4191}, {14, -44.4191}, {14, -44}}, color = {0, 0, 127}));
  connect(add2.y, add32.u2) annotation(Line(points = {{-14.5, 0}, {-10.7062, 0}, {-10.7062, -39.8633}, {14, -39.8633}, {14, -40}}, color = {0, 0, 127}));
  connect(dVREF, add4.u2) annotation(Line(points={{-100,58},{-111.595,58},{-111.595,
          42.893},{-106,42.893},{-106,43}},                                                                                                  color = {0, 0, 127}));
  connect(add4.y, add2.u1) annotation(Line(points={{-94.5,40},{-62.4679,40},{-62.4679,
          3.08483},{-26,3.08483},{-26,3}},                                                                                                        color = {0, 0, 127}));
  connect(lag1.y, add2.u2) annotation(Line(points = {{-46, -20}, {-41.6856, -20}, {-41.6856, -3.18907}, {-26, -3.18907}, {-26, -3}}, color = {0, 0, 127}));
  connect(Ecomp.y, gain3.u) annotation(Line(points = {{-16, -76}, {114, -76}, {114, -60}, {106, -60}}, color = {0, 0, 127}));
  connect(Ecomp.y, gain2.u) annotation(Line(points = {{-16, -76}, {114, -76}, {114, -20}, {106, -20}}, color = {0, 0, 127}));
  connect(product.u1, EFD) annotation(Line(points = {{26, 23}, {26, 94}, {112, 94}, {112, 0}, {100, 0}}, color = {0, 0, 127}));
  connect(product.u2, saturation1.y) annotation(Line(points = {{20, 23}, {20, 33}, {20, 33}}, color = {0, 0, 127}));
  connect(product.y, add1.u2) annotation(Line(points = {{23, 11.5}, {23, 3}, {54, 3}}, color = {0, 0, 127}));
  connect(const.y, add4.u1) annotation(Line(points={{-132,44},{-119.228,44},{-119.228,
          36.7135},{-106,36.7135},{-106,37}},                                                                                                     color = {0, 0, 127}));
  connect(add31.u3, VOTHSG) annotation(Line(points = {{-66, -64}, {-82, -64}, {-82, -36}, {-100, -36}}, color = {0, 0, 127}));
  connect(add31.u2, VOEL) annotation(Line(points = {{-66, -60}, {-80, -60}, {-80, -8}, {-100, -8}}, color = {0, 0, 127}));
  connect(add31.u1, VUEL) annotation(Line(points = {{-66, -56}, {-76, -56}, {-76, 20}, {-100, 20}}, color = {0, 0, 127}));
  annotation(Documentation(info = "<html>

<p>
1- In this model, VS = VOTHSG+VUEL+VOEL
</p>
<p>
2- In this model, the regulator output limits are proportional to VT.
</p>
<img src=\"modelica://OpalRT/resource/Excitation/EXDC2.png\"
alt=\"EXDC2.png\"><br>
</html>"), experiment(StartTime = 0, StopTime = 6, Tolerance = 1e-06, Interval = 0.001), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = false, initialScale = 0.1, grid = {2, 2}), graphics={  Text(origin = {-35.88, -54.67}, lineColor = {255, 0, 127}, extent = {{-3.08, 2.51}, {3.08, -2.51}}, textString = "VS"), Text(origin = {79.34, -30.34}, lineColor = {255, 0, 127}, extent = {{-3.08, 2.51}, {3.08, -2.51}}, textString = "VR"), Text(origin = {-15.2, -23.28}, lineColor = {255, 0, 127}, extent = {{-3.08, 2.51}, {3.08, -2.51}}, textString = "VERR"), Text(origin = {34.28, -15.38}, lineColor = {255, 0, 0}, extent = {{-5.58, 3.3}, {5.58, -3.3}}, textString = "VF")}));
end EXDC2;
