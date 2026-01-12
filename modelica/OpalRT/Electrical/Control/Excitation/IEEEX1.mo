within OpalRT.Electrical.Control.Excitation;
model IEEEX1
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
  parameter Real Switch = 0;
  parameter Real E1 = 4;
  parameter Real SE_E1 = 0.4;
  parameter Real E2 = 5;
  parameter Real SE_E2 = 0.5;
  import sat_q = OpalRT.NonElectrical.Math.Nonlinear.computeSaturationQuadratic;
  Modelica.Blocks.Math.Add3 add31(k1 = -1) annotation(Placement(visible = true, transformation(origin = {-20, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1(k1 = -1) annotation(Placement(visible = true, transformation(origin = {-40, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add3 add32 annotation(Placement(visible = true, transformation(origin = {-80, 0}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunctionNonWindup.Lag_NonWindupLimit Lag_Non_Windup_Limit1(KI = KA, TI = TA, VRMAX = VRMAX_1, VRMIN = VRMIN_1, y_init = VR0) annotation(Placement(visible = true, transformation(origin = {20, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add2(k1 = +1, k2 = -1) annotation(Placement(visible = true, transformation(origin = {50, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator integrator1(k = 1 / TE, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = EFD_0) annotation(Placement(visible = true, transformation(origin = {70, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain2(k = KE_1) annotation(Placement(visible = true, transformation(origin = {70, 20}, extent = {{-5, -5}, {5, 5}}, rotation = 180)));
  OpalRT.NonElectrical.Math.Nonlinear.SaturationQuadratic saturation1(E1 = E1, E2 = E2, SE_E1 = SE_E1, SE_E2 = SE_E2) annotation(Placement(visible = true, transformation(origin = {71, 7}, extent = {{-5, -5}, {5, 5}}, rotation = 180)));
  Modelica.Blocks.Math.Add add3(k1 = +1) annotation(Placement(visible = true, transformation(origin = {33, 17}, extent = {{-5, -5}, {5, 5}}, rotation = 180)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag lag1(T = TR, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = ECOMP_0) annotation(Placement(visible = true, transformation(origin = {-70, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.LeadLag lead_lag1(TA = TC, TB = TB, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = VR0 / KA) annotation(Placement(visible = true, transformation(origin = {0, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction transferfunction1(b = {1, 0}, a = {TF10, 1}, initType = Modelica.Blocks.Types.Init.InitialOutput) annotation(Placement(visible = true, transformation(origin = {20, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Math.Gain gain1(k = KF) annotation(Placement(visible = true, transformation(origin = {58, 70}, extent = {{-5, -5}, {5, 5}}, rotation = 180)));
  Modelica.Blocks.Math.Product product annotation(Placement(transformation(extent = {{52, -2}, {44, 6}})));
  Modelica.Blocks.Sources.Constant const(k = VREF_0) annotation(Placement(transformation(extent = {{-133, 34}, {-113, 54}})));
  Modelica.Blocks.Math.Add add4(k1 = +1, k2 = +1) annotation(Placement(visible = true, transformation(origin = {-60, 20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression Ecomp(y = ETERM) annotation(Placement(visible = true, transformation(origin = {-105, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
protected
  parameter Real TF10(start = 1, fixed = false);
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
  connect(add4.u2, const.y) annotation(Line(points={{-66,17},{-87.1345,17},{-87.1345,
          43.8596},{-112,43.8596},{-112,44}},                                                                                                    color = {0, 0, 127}));
  connect(add4.u1, dVREF) annotation(Line(points={{-66,23},{-81.5789,23},{-81.5789,
          58.1871},{-100,58.1871},{-100,58}},                                                                                                  color = {0, 0, 127}));
  connect(add1.u2, add4.y) annotation(Line(points={{-46,37},{-50.5848,37},{-50.5848,
          19.5906},{-54.5,19.5906},{-54.5,20}},                                                                                               color = {0, 0, 127}));
  connect(VF, transferfunction1.y) annotation(Line(points = {{100, 80}, {-0.34396, 80}, {-0.34396, 70}, {9, 70}}, color = {0, 0, 127}));
  connect(gain1.u, integrator1.y) annotation(Line(points = {{64, 70}, {86, 70}, {86, 40}, {75.5, 40}, {75.5, 40}}, color = {0, 0, 127}));
  connect(transferfunction1.u, gain1.y) annotation(Line(points = {{32, 70}, {52.5, 70}}, color = {0, 0, 127}));
  connect(transferfunction1.y, add31.u1) annotation(Line(points = {{9, 70}, {-31.0655, 70}, {-31.0655, 43.6457}, {-26, 43.6457}, {-26, 44}}, color = {0, 0, 127}));
  connect(lead_lag1.y, Lag_Non_Windup_Limit1.u) annotation(Line(points = {{5, 40}, {8.93246, 40}, {8.93246, 40}, {9, 40}}, color = {0, 0, 127}));
  connect(add31.y, lead_lag1.u) annotation(Line(points = {{-14.5, 40}, {-4.57516, 40}, {-4.57516, 40}, {-5, 40}}, color = {0, 0, 127}));
  connect(lag1.y, add1.u1) annotation(Line(points = {{-65, 40}, {-57.2985, 40}, {-57.2985, 42.7015}, {-46, 42.7015}, {-46, 43}}, color = {0, 0, 127}));
  connect(Ecomp.y, lag1.u) annotation(Line(points = {{-94, 80}, {-78, 80}, {-78, 40}, {-75, 40}}, color = {0, 0, 127}));
  connect(add3.u2, gain2.y) annotation(Line(points = {{39, 20}, {59.5937, 20}, {59.5937, 19.6388}, {64.5, 19.6388}, {64.5, 20}}, color = {0, 0, 127}));
  connect(saturation1.u, integrator1.y) annotation(Line(points = {{76, 7}, {86.2302, 7}, {86.2302, 39.9549}, {75.5, 39.9549}, {75.5, 40}}, color = {0, 0, 127}));
  connect(gain2.u, integrator1.y) annotation(Line(points = {{76, 20}, {86.2302, 20}, {86.2302, 39.9549}, {75.5, 39.9549}, {75.5, 40}}, color = {0, 0, 127}));
  connect(integrator1.y, EFD) annotation(Line(points = {{75.5, 40}, {86.2302, 40}, {86.2302, 0.29345}, {100, 0.29345}, {100, 0}}, color = {0, 0, 127}));
  connect(integrator1.u, add2.y) annotation(Line(points = {{64, 40}, {55.3047, 40}, {55.3047, 40}, {55.5, 40}}, color = {0, 0, 127}));
  connect(Lag_Non_Windup_Limit1.y, add2.u1) annotation(Line(points = {{31, 40}, {33.6343, 40}, {33.6343, 43.5666}, {44, 43.5666}, {44, 43}}, color = {0, 0, 127}));
  connect(add1.y, add31.u2) annotation(Line(points = {{-34.5, 40}, {-26.8623, 40}, {-26.8623, 40}, {-26, 40}}, color = {0, 0, 127}));
  connect(add32.y, add31.u3) annotation(Line(points = {{-74.5, 0}, {-32.2799, 0}, {-32.2799, 36.3431}, {-26, 36.3431}, {-26, 36}}, color = {0, 0, 127}));
  connect(product.y, add3.u1) annotation(Line(points = {{43.6, 2}, {43, 2}, {43, 14}, {39, 14}}, color = {0, 0, 127}));
  connect(EFD, product.u2) annotation(Line(points = {{100, 0}, {52.8, 0}, {52.8, -0.4}}, color = {0, 0, 127}));
  connect(saturation1.y, product.u1) annotation(Line(points = {{66, 7}, {52.8, 7}, {52.8, 4.4}}, color = {0, 0, 127}));
  connect(add3.y, add2.u2) annotation(Line(points = {{27.5, 17}, {26, 17}, {26, 30}, {26, 31}, {38, 31}, {38, 37}, {44, 37}}, color = {0, 0, 127}));
  connect(VUEL, add32.u1) annotation(Line(points = {{-100, 20}, {-95, 20}, {-95, 4}, {-86, 4}}, color = {0, 0, 127}));
  connect(VOEL, add32.u2) annotation(Line(points = {{-100, -8}, {-96, -8}, {-96, 0}, {-86, 0}}, color = {0, 0, 127}));
  connect(VOTHSG, add32.u3) annotation(Line(points = {{-100, -36}, {-86, -36}, {-86, -4}}, color = {0, 0, 127}));
  annotation(Documentation(info = "<html>

<p>
1- In this model, VS = VOTHSG+VUEL+VOEL
</p>
<img src=\"modelica://OpalRT/resource/Excitation/IEEEX1.png\"
alt=\"IEEEX1.png\"><br>

</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = false, initialScale = 0.1, grid = {1, 1}), graphics={  Text(origin = {-59.82, 3.84}, extent = {{-4.29, 2.71}, {4.29, -2.71}}, textString = "Vs"), Text(origin = {37.76, 47.25}, extent = {{-4.29, 2.71}, {4.29, -2.71}}, textString = "VR")}));
end IEEEX1;
