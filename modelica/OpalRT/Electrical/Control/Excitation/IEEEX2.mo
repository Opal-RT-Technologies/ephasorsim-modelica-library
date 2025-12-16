within OpalRT.Electrical.Control.Excitation;
model IEEEX2
  extends OpalRT.Electrical.PartialModel.Exciter;
  parameter Integer IBUS = 100 "Located Bus No.";
  parameter String ID = "M1" "Machine Identifier";
  parameter Real TR = 0.025 "(sec)";
  parameter Real KA = 98;
  parameter Real TA = 0.2 "(sec)";
  parameter Real TB = 0.1 "(sec)";
  parameter Real TC = 0.2 "(sec)";
  parameter Real VRMAX = 9 "or zero";
  parameter Real VRMIN = -5;
  parameter Real KE = 0.5 "or zero";
  parameter Real TE = 0.35 "(>0) (sec)";
  parameter Real KF = 0.03;
  parameter Real TF1 = 0.4 "(>0) (sec)";
  parameter Real TF2 = 0.4 "(>0) (sec)";
  parameter Real E1 = 4;
  parameter Real SE_E1 = 0.4;
  parameter Real E2 = 5;
  parameter Real SE_E2 = 0.5;
  import sat_q = OpalRT.NonElectrical.Math.Nonlinear.computeSaturationQuadratic;
  Modelica.Blocks.Math.Add3 add31(k1 = -1) annotation(Placement(visible = true, transformation(origin = {-20, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1(k1 = -1) annotation(Placement(visible = true, transformation(origin = {-40, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add3 add32 annotation(Placement(visible = true, transformation(origin = {-48, 3}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunctionNonWindup.Lag_NonWindupLimit Lag_Non_Windup_Limit1(KI = KA, TI = TA, VRMAX = VRMAX_1, VRMIN = VRMIN_1, y_init = VR0) annotation(Placement(visible = true, transformation(origin = {20, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add2(k1 = +1, k2 = -1) annotation(Placement(visible = true, transformation(origin = {50, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator integrator1(k = 1 / TE, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = EFD_0) annotation(Placement(visible = true, transformation(origin = {70, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain2(k = KE_1) annotation(Placement(visible = true, transformation(origin = {70, 20}, extent = {{-5, -5}, {5, 5}}, rotation = 180)));
  NonElectrical.Math.Nonlinear.SaturationQuadratic saturation1(E1 = E1, E2 = E2, SE_E1 = SE_E1, SE_E2 = SE_E2) annotation(Placement(visible = true, transformation(origin = {72, -9}, extent = {{-5, -5}, {5, 5}}, rotation = 180)));
  Modelica.Blocks.Math.Add add3(k1 = +1) annotation(Placement(visible = true, transformation(origin = {40, 10}, extent = {{-5, -5}, {5, 5}}, rotation = 180)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag lag1(T = TR, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = ECOMP_0) annotation(Placement(visible = true, transformation(origin = {-68, 86}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.LeadLag lead_lag1(TA = TC, TB = TB, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = VR0 / KA) annotation(Placement(visible = true, transformation(origin = {0, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = KF0) annotation(Placement(visible = true, transformation(origin = {25, 70}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction transferfunction1(b = {1, 0}, initType = Modelica.Blocks.Types.Init.SteadyState, a = if TF10 * TF20 <> 0 then {TF10 * TF20, TF10 + TF20, 1} else {1, 1, 1}) annotation(Placement(visible = true, transformation(origin = {-7, 85}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction transferfunction2(b = {1, 0}, a = {TF10 + TF20, 1}, initType = Modelica.Blocks.Types.Init.InitialOutput) annotation(Placement(visible = true, transformation(origin = {-7, 70}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Product product annotation(Placement(transformation(extent = {{59, -11}, {51, -3}})));
  Modelica.Blocks.Sources.Constant const(k = VREF_0) annotation(Placement(transformation(extent = {{-135, 34}, {-115, 54}})));
  Modelica.Blocks.Math.Add add4 annotation(Placement(visible = true, transformation(origin = {-80, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression Ecomp(y = ETERM) annotation(Placement(visible = true, transformation(origin = {-92, 86}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
protected
  parameter Real TF10(start = 1, fixed = false);
  parameter Real TF20(start = 1, fixed = false);
  parameter Real KF0(fixed = false);
  parameter Real VRMAX_1(fixed = false);
  parameter Real VRMIN_1(fixed = false);
  parameter Real KE_1(fixed = false);
  parameter Real EFD_0(fixed = false);
  parameter Real ECOMP_0(fixed = false);
  parameter Real VR0(fixed = false);
  parameter Real VREF_0(fixed = false);
  parameter Real SE0(fixed = false);
initial algorithm
  TF10 := TF1;
  TF20 := TF2;
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
  connect(add31.u1, VF) annotation(Line(points = {{-26, 44}, {-28.7016, 44}, {-28.7016, 97}, {100, 97}, {100, 80}}, color = {0, 0, 127}));
  add31.u1 = if TF1 * TF2 <> 0 then transferfunction1.y else transferfunction2.y;
  connect(transferfunction1.u, gain1.y) annotation(Line(points = {{-1, 85}, {12.104, 85}, {12.104, 70.0899}, {15.9551, 70.0899}, {15.9551, 70}, {19.5, 70}}, color = {0, 0, 127}));
  connect(gain1.y, transferfunction2.u) annotation(Line(points = {{19.5, 70}, {15.7279, 70}, {15.7279, 70.0899}, {3.9178, 70.0899}, {3.9178, 70}, {-1, 70}}, color = {0, 0, 127}));
  connect(gain1.u, Lag_Non_Windup_Limit1.y) annotation(Line(points = {{31, 70}, {33, 70}, {33, 55}, {33.1686, 55}, {33.1686, 40.0911}, {31, 40.0911}, {31, 40}}, color = {0, 0, 127}));
  connect(lead_lag1.y, Lag_Non_Windup_Limit1.u) annotation(Line(points = {{5, 40}, {8.93246, 40}, {8.93246, 40}, {9, 40}}, color = {0, 0, 127}));
  connect(add31.y, lead_lag1.u) annotation(Line(points = {{-14.5, 40}, {-4.57516, 40}, {-4.57516, 40}, {-5, 40}}, color = {0, 0, 127}));
  connect(lag1.y, add1.u1) annotation(Line(points = {{-63, 86}, {-57.2985, 86}, {-57.2985, 42.7015}, {-46, 42.7015}, {-46, 43}}, color = {0, 0, 127}));
  connect(Ecomp.y, lag1.u) annotation(Line(points = {{-81, 86}, {-73, 86}}, color = {0, 0, 127}));
  connect(add3.y, add2.u2) annotation(Line(points = {{34.5, 10}, {32.3747, 10}, {32.3747, 36.5688}, {44, 36.5688}, {44, 37}}, color = {0, 0, 127}));
  connect(add3.u2, gain2.y) annotation(Line(points = {{46, 13}, {59.5937, 13}, {59.5937, 19.6388}, {64.5, 19.6388}, {64.5, 20}}, color = {0, 0, 127}));
  connect(saturation1.u, integrator1.y) annotation(Line(points = {{77, -9}, {86.2302, -9}, {86.2302, 39.9549}, {75.5, 39.9549}, {75.5, 40}}, color = {0, 0, 127}));
  connect(gain2.u, integrator1.y) annotation(Line(points = {{76, 20}, {86.2302, 20}, {86.2302, 39.9549}, {75.5, 39.9549}, {75.5, 40}}, color = {0, 0, 127}));
  connect(integrator1.y, EFD) annotation(Line(points = {{75.5, 40}, {86.2302, 40}, {86.2302, 0.29345}, {100, 0.29345}, {100, 0}}, color = {0, 0, 127}));
  connect(integrator1.u, add2.y) annotation(Line(points = {{64, 40}, {55.3047, 40}, {55.3047, 40}, {55.5, 40}}, color = {0, 0, 127}));
  connect(Lag_Non_Windup_Limit1.y, add2.u1) annotation(Line(points = {{31, 40}, {33.6343, 40}, {33.6343, 43.5666}, {44, 43.5666}, {44, 43}}, color = {0, 0, 127}));
  connect(add1.y, add31.u2) annotation(Line(points = {{-34.5, 40}, {-26.8623, 40}, {-26.8623, 40}, {-26, 40}}, color = {0, 0, 127}));
  connect(add32.y, add31.u3) annotation(Line(points = {{-42.5, 3}, {-32.2799, 3}, {-32.2799, 36.3431}, {-26, 36.3431}, {-26, 36}}, color = {0, 0, 127}));
  connect(add4.y, add1.u2) annotation(Line(points={{-74.5,40},{-52.6992,40},{-52.6992,
          36.7609},{-46,36.7609},{-46,37}},                                                                                                       color = {0, 0, 127}));
  connect(dVREF, add4.u1) annotation(Line(points={{-100,58},{-88.1748,58},{-88.1748,
          42.9306},{-86,42.9306},{-86,43}},                                                                                                     color = {0, 0, 127}));
  connect(product.u2, saturation1.y) annotation(Line(points = {{59.8, -9.4}, {63.4, -9.4}, {63.4, -9}, {67, -9}}, color = {0, 0, 127}));
  connect(product.u1, integrator1.y) annotation(Line(points = {{59.8, -4.6}, {64, -4.6}, {64, -1}, {86, -1}, {86.2302, 39.9549}, {75.5, 39.9549}, {75.5, 40}}, color = {0, 0, 127}));
  connect(add3.u1, product.y) annotation(Line(points = {{46, 7}, {48, 7}, {48, -7}, {50.6, -7}}, color = {0, 0, 127}));
  connect(VOTHSG, add32.u3) annotation(Line(points = {{-100, -36}, {-61, -36}, {-61, -1}, {-54, -1}}, color = {0, 0, 127}));
  connect(VOEL, add32.u2) annotation(Line(points = {{-100, -8}, {-77, -8}, {-77, 3}, {-54, 3}}, color = {0, 0, 127}));
  connect(VUEL, add32.u1) annotation(Line(points = {{-100, 20}, {-76, 20}, {-76, 7}, {-54, 7}}, color = {0, 0, 127}));
  connect(const.y, add4.u2) annotation(Line(points={{-114,44},{-93.8303,44},{-93.8303,
          37.018},{-86,37.018},{-86,37}},                                                                                                      color = {0, 0, 127}));
  annotation(Documentation(info = "<html>

<p>
1- In this model, VS = VOTHSG+VUEL+VOEL
</p>
<img src=\"modelica://OpalRT/resource/Excitation/IEEEX2.png\"
alt=\"IEEEX2.png\"><br>

</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = false, initialScale = 0.1, grid = {1, 1}), graphics={  Text(origin = {-25.82, 17.84}, extent = {{-4.29, 2.71}, {4.29, -2.71}}, textString = "Vs"), Text(origin = {37.76, 47.25}, extent = {{-4.29, 2.71}, {4.29, -2.71}}, textString = "VR")}));
end IEEEX2;
