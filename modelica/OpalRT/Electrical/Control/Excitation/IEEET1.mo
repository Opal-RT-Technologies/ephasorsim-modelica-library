within OpalRT.Electrical.Control.Excitation;
model IEEET1
  extends OpalRT.Electrical.PartialModel.Exciter;
  parameter Integer IBUS = 100 "Located Bus No.";
  parameter String ID = "M1" "Machine Identifier";
  parameter Real TR = 0.025 "(sec)";
  parameter Real KA = 98;
  parameter Real TA = 0.2 "(sec)";
  parameter Real VRMAX = 9 "or zero";
  parameter Real VRMIN = -5;
  parameter Real KE = 0.5 "or zero";
  parameter Real TE = 0.35 "(>0) (sec)";
  parameter Real KF = 0.03;
  parameter Real TF = 0.4 "(>0) (sec)";
  parameter Real Switch = 0;
  parameter Real E1 = 4;
  parameter Real SE_E1 = 0.4;
  parameter Real E2 = 5;
  parameter Real SE_E2 = 0.5;
  import sat_q = OpalRT.NonElectrical.Math.Nonlinear.computeSaturationQuadratic;
  Modelica.Blocks.Math.Add3 add31 annotation(Placement(visible = true, transformation(origin = {-60, -20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add2(k1 = -1) annotation(Placement(visible = true, transformation(origin = {0, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag lag1(T = TR, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = ECOMP_0) annotation(Placement(visible = true, transformation(origin = {-60, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add3 add32(k2 = -1) annotation(Placement(visible = true, transformation(origin = {-20, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunctionNonWindup.Lag_NonWindupLimit lag_non_windup_limit1(KI = KA, TI = TA, VRMAX = VRMAX_1, VRMIN = VRMIN_1, y_init = VR0) annotation(Placement(visible = true, transformation(origin = {40, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction transferfunction1(initType = Modelica.Blocks.Types.Init.InitialOutput, b = {KF0, 0}, a = {TF0, 1}) annotation(Placement(visible = true, transformation(origin = {40, 60}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator integrator1(k = 1 / TE, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = EFD_0) annotation(Placement(visible = true, transformation(origin = {40, 0}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1(k1 = +1, k2 = -1) annotation(Placement(visible = true, transformation(origin = {20, 0}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add3(k1 = +1) annotation(Placement(visible = true, transformation(origin = {20, -40}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain2(k = KE_1) annotation(Placement(visible = true, transformation(origin = {60, -44}, extent = {{-5, -5}, {5, 5}}, rotation = 180)));
  NonElectrical.Math.Nonlinear.SaturationQuadratic saturation1(E1 = E1, E2 = E2, SE_E1 = SE_E1, SE_E2 = SE_E2) annotation(Placement(visible = true, transformation(origin = {60, -20}, extent = {{-5, -5}, {5, 5}}, rotation = 180)));
  Modelica.Blocks.Math.Product product annotation(Placement(transformation(extent = {{46, -30}, {34, -18}})));
  Modelica.Blocks.Sources.Constant const(k = VREF_0) annotation(Placement(visible = true, transformation(origin = {-60, 80}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add4(k1 = +1) annotation(Placement(visible = true, transformation(origin = {-40, 60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression Ecomp(y = ETERM) annotation(Placement(visible = true, transformation(origin = {-99, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
protected
  parameter Real TF0(start = 1, fixed = false);
  parameter Real KF0(fixed = false);
  parameter Real EFD_0(fixed = false);
  parameter Real ECOMP_0(fixed = false);
  parameter Real VRMAX_1(fixed = false);
  parameter Real VRMIN_1(fixed = false);
  parameter Real KE_1(fixed = false);
  parameter Real VR0(fixed = false);
  parameter Real VREF_0(fixed = false);
  parameter Real SE0(fixed = false);
initial algorithm
  TF0 := TF;
  KF0 := KF;
initial equation
  EFD_0 = EFD0;
  ECOMP_0 = ETERM0;
  SE0 = sat_q(EFD_0, E1, E2, SE_E1, SE_E2);
  VRMAX_1 = if VRMAX <> 0 then VRMAX elseif KE <= 0 then SE_E2 * E2 else (SE_E2 + KE) * E2;
  VRMIN_1 = if VRMAX <> 0 then VRMIN else -VRMAX_1;
  KE_1 = if KE <> 0 then KE else VRMAX_1 / (10 * EFD_0) - SE0;
  VR0 = (SE0 + KE_1) * EFD_0;
  VREF_0 = VR0 / KA + ECOMP_0;
  VUEL0 = 0;
  VOEL0 = 0;
equation
  connect(add32.u1, add4.y) annotation(Line(points={{-26,44},{-30.1471,44},{-30.1471,
          59.5588},{-34.5,59.5588},{-34.5,60}},                                                                                                  color = {0, 0, 127}));
  connect(add4.u1, const.y) annotation(Line(points={{-46,63},{-50.7353,63},{-50.7353,
          80.1471},{-54.5,80.1471},{-54.5,80}},                                                                                                  color = {0, 0, 127}));
  connect(add4.u2, dVREF) annotation(Line(points={{-46,57},{-96.3235,57},{-96.3235,
          58},{-100,58}},                                                                                                 color = {0, 0, 127}));
  connect(add2.u1, VF) annotation(Line(points = {{-6, 43}, {-11.5672, 43}, {-11.5672, 80.0911}, {100, 80.0911}, {100, 80}}, color = {0, 0, 127}));
  connect(add3.y, add1.u2) annotation(Line(points = {{14.5, -40}, {3.64465, -40}, {3.64465, -2.73349}, {14, -2.73349}, {14, -3}}, color = {0, 0, 127}));
  connect(gain2.y, add3.u2) annotation(Line(points = {{54.5, -44}, {49.6583, -44}, {49.6583, -43.0524}, {26, -43.0524}, {26, -43}}, color = {0, 0, 127}));
  connect(gain2.u, EFD) annotation(Line(points = {{66, -44}, {74.0319, -44}, {74.0319, -0.20501}, {100, -0.20501}, {100, 0}}, color = {0, 0, 127}));
  connect(saturation1.u, EFD) annotation(Line(points = {{65, -20}, {74.0319, -20}, {74.0319, -0.4328}, {100, -0.4328}, {100, 0}}, color = {0, 0, 127}));
  connect(lag_non_windup_limit1.y, add1.u1) annotation(Line(points = {{51, 40}, {56.492, 40}, {56.492, 15.4897}, {3.64465, 15.4897}, {3.64465, 2.2779}, {14, 2.2779}, {14, 3}}, color = {0, 0, 127}));
  connect(add1.y, integrator1.u) annotation(Line(points = {{25.5, 0}, {33.4852, 0}, {33.4852, 0}, {34, 0}}, color = {0, 0, 127}));
  connect(integrator1.y, EFD) annotation(Line(points = {{45.5, 0}, {74.0319, 0}, {74.0319, -0.4328}, {100, -0.4328}, {100, 0}}, color = {0, 0, 127}));
  connect(transferfunction1.y, add2.u1) annotation(Line(points = {{34.5, 60}, {-12.0729, 60}, {-12.0729, 42.369}, {-6, 42.369}, {-6, 43}}, color = {0, 0, 127}));
  connect(transferfunction1.u, EFD) annotation(Line(points = {{46, 60}, {74.2597, 60}, {74.2597, -0.66059}, {100, -0.66059}, {100, 0}}, color = {0, 0, 127}));
  connect(add32.y, add2.u2) annotation(Line(points = {{-14.5, 40}, {-12.0729, 40}, {-12.0729, 36.4465}, {-6, 36.4465}, {-6, 37}}, color = {0, 0, 127}));
  connect(add2.y, lag_non_windup_limit1.u) annotation(Line(points = {{5.5, 40}, {28.246, 40}, {28.246, 40}, {29, 40}}, color = {0, 0, 127}));
  connect(lag1.y, add32.u2) annotation(Line(points = {{-50, 40}, {-25.9681, 40}, {-26, 39.4077}, {-26, 40}}, color = {0, 0, 127}));
  connect(add31.y, add32.u3) annotation(Line(points = {{-54.5, -20}, {-41.9134, -20}, {-41.9134, 35.7631}, {-26.1959, 36}, {-26, 36}}, color = {0, 0, 127}));
  connect(VOEL, add31.u3) annotation(Line(points = {{-100, -8}, {-77.6928, -8}, {-77.6928, -24.3378}, {-66, -24.3378}, {-66, -24}}, color = {0, 0, 127}));
  connect(VOTHSG, add31.u1) annotation(Line(points = {{-100, -36}, {-74.6759, -36}, {-74.6759, -16.6092}, {-66, -16.6092}, {-66, -16}}, color = {0, 0, 127}));
  connect(VUEL, add31.u2) annotation(Line(points = {{-100, 20}, {-71.6931, 20}, {-71.6931, -20}, {-66, -20}}, color = {0, 0, 127}));
  connect(Ecomp.y, lag1.u) annotation(Line(points = {{-88, 40}, {-70, 40}}, color = {0, 0, 127}));
  connect(saturation1.y, product.u1) annotation(Line(points = {{55, -20}, {47.2, -20}, {47.2, -20.4}}, color = {0, 0, 127}));
  connect(product.u2, EFD) annotation(Line(points = {{47.2, -27.6}, {74, -27.6}, {74, -0.20501}, {100, -0.20501}, {100, 0}}, color = {0, 0, 127}));
  connect(product.y, add3.u1) annotation(Line(points = {{33.4, -24}, {30, -24}, {30, -37}, {26, -37}}, color = {0, 0, 127}));
  annotation(Documentation(info = "<html>
<p>
1- In this model, VS = VOTHSG+VUEL+VOEL
</p>
<img src=\"modelica://OpalRT/resource/Excitation/IEEET1.png\"
alt=\"IEEET1.png\"><br>

</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = false, initialScale = 0.1, grid = {2, 2}), graphics={  Text(origin = {18.91, -54.56}, lineColor = {255, 0, 0}, extent = {{-4.78, 3.08}, {4.78, -3.08}}, textString = "VF")}));
end IEEET1;
