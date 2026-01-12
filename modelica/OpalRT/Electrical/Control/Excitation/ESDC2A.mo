within OpalRT.Electrical.Control.Excitation;
model ESDC2A
  extends OpalRT.Electrical.PartialModel.Exciter;
  parameter Real TR = 0.1 "(sec)";
  parameter Real KA = 400;
  parameter Real TA = 5 "(sec)";
  parameter Real TB = 12 "(sec)";
  parameter Real TC = 10 "(sec)";
  parameter Real VRMAX = 5 "or zero";
  parameter Real VRMIN = -5;
  parameter Real KE = 0 "or zero";
  parameter Real TE = 0.08 "(sec)";
  parameter Real KF = 0.2;
  parameter Real TF1 = 1.2 "(>0) (sec)";
  parameter Real Switch = 0;
  parameter Real E1 = 4;
  parameter Real SE_E1 = 0.4;
  parameter Real E2 = 5;
  parameter Real SE_E2 = 0.5;
  import sat_q = OpalRT.NonElectrical.Math.Nonlinear.computeSaturationQuadratic;
  Modelica.Blocks.Math.Add add1(k2 = +1, k1 = +1) annotation(Placement(visible = true, transformation(origin = {18, 0}, extent = {{5, -5}, {-5, 5}}, rotation = 180)));
  Modelica.Blocks.Math.Gain gain1(k = KE_0) annotation(Placement(visible = true, transformation(origin = {-6, 20}, extent = {{-5, -5}, {5, 5}}, rotation = -90)));
  NonElectrical.Math.Nonlinear.SaturationQuadratic saturation1(E1 = E1, E2 = E2, SE_E1 = SE_E1, SE_E2 = SE_E2) annotation(Placement(visible = true, transformation(origin = {4, 66}, extent = {{5, -5}, {-5, 5}}, rotation = 90)));
  Modelica.Blocks.Continuous.TransferFunction transferfunction1(b = {KF_0, 0}, a = {TF1_0, 1}, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = 0) annotation(Placement(visible = true, transformation(origin = {-40, 20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add4 annotation(Placement(visible = true, transformation(origin = {-68, -44}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag lag1(T = TR, y_start = ECOMP_0, initType = Modelica.Blocks.Types.Init.InitialOutput) annotation(Placement(visible = true, transformation(origin = {-80, 86}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add2(k1 = -1, k2 = +1) annotation(Placement(visible = true, transformation(origin = {-60, 0}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add3 add32(k1 = -1) annotation(Placement(visible = true, transformation(origin = {-40, -40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.LeadLag lead_lag1(TA = TC, TB = TB, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = VM_0) annotation(Placement(visible = true, transformation(origin = {-20, -40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Max max1(y(start = VM_0)) annotation(Placement(visible = true, transformation(origin = {4, -40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunctionNonWindup.Lag_NonWindupVariableLimit lag_non_windup_var_limit1(KI = KA, TI = TA, y_init = VR_0) annotation(Placement(visible = true, transformation(origin = {28, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain3(k = VRMIN_0) annotation(Placement(visible = true, transformation(origin = {60, -60}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain2(k = VRMAX_0) annotation(Placement(visible = true, transformation(origin = {60, -20}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add3(k2 = +1, k1 = -1) annotation(Placement(visible = true, transformation(origin = {56, 0}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator integrator1(k = 1 / TE, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = EFD_0) annotation(Placement(visible = true, transformation(origin = {73, -1}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Product product1 annotation(Placement(visible = true, transformation(origin = {6, 38}, extent = {{-5, -5}, {5, 5}}, rotation = -90)));
  Modelica.Blocks.Sources.Constant const(k = VREF_0) annotation(Placement(transformation(extent = {{-153, 34}, {-133, 54}})));
  Modelica.Blocks.Math.Add add5 annotation(Placement(visible = true, transformation(origin = {-100, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression Ecomp(y = ETERM) annotation(Placement(visible = true, transformation(origin = {-111, 86}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
protected
  parameter Real KE_0(fixed = false);
  parameter Real TF1_0(start = 1, fixed = false);
  parameter Real KF_0(fixed = false);
  parameter Real VRMAX_0(fixed = false);
  parameter Real VRMIN_0(fixed = false);
  parameter Real ECOMP_0(fixed = false);
  parameter Real EFD_0(fixed = false);
  parameter Real SE_0(start = 0.1, fixed = false);
  parameter Real VM_0(fixed = false);
  parameter Real VREF_0(fixed = false);
  parameter Real VR_0(fixed = false);
initial algorithm
  TF1_0 := TF1;
  KF_0 := KF;
  VRMAX_0 := if VRMAX <> 0 then VRMAX elseif KE <= 0 then SE_E2 * E2 else (SE_E2 + KE) * E2;
  VRMIN_0 := if VRMAX <> 0 then VRMIN else -VRMAX_0;
  if abs(KE - 0) > Modelica.Constants.eps then
    KE_0 := KE;
  else
    KE_0 := VRMAX_0 / (10 * EFD_0) - SE_0;
  end if;
initial equation
  ECOMP_0 = ETERM0;
  EFD_0 = EFD0;
  SE_0 = sat_q(EFD_0, E1, E2, SE_E1, SE_E2);
  VR_0 = EFD_0 * (SE_0 + KE_0);
  VM_0 = VR_0 / KA;
  VREF_0 = ECOMP_0 + VM_0;
  VUEL0 = -Modelica.Constants.inf;
  VOEL0 = 0;
equation
  connect(transferfunction1.y, VF) annotation(Line(points = {{-34.5, 20}, {-16, 20}, {-16, 80}, {100, 80}}, color = {0, 0, 127}));
  connect(integrator1.y, EFD) annotation(Line(points = {{78.5, -1}, {80, -1}, {80, 0}, {100, 0}}, color = {0, 0, 127}));
  connect(lag_non_windup_var_limit1.u, max1.y) annotation(Line(points = {{17, -40}, {9.5, -40}}, color = {0, 0, 127}));
  connect(lag_non_windup_var_limit1.y, add3.u2) annotation(Line(points = {{39, -40}, {42.6378, -40}, {42.6378, -40.0911}, {44.9157, -40.0911}, {44.9157, -3}, {50, -3}}, color = {0, 0, 127}));
  connect(add1.y, add3.u1) annotation(Line(points = {{23.5, -4.44089e-16}, {40.7654, -4.44089e-16}, {40.7654, 3}, {50, 3}}, color = {0, 0, 127}));
  connect(Ecomp.y, gain2.u) annotation(Line(points = {{-100, 86}, {-88, 86}, {-88, 96}, {82, 96}, {82, -20}, {66, -20}}, color = {0, 0, 127}));
  connect(Ecomp.y, gain3.u) annotation(Line(points = {{-100, 86}, {-88, 86}, {-88, 96}, {82, 96}, {82, -60}, {66, -60}}, color = {0, 0, 127}));
  connect(gain2.y, lag_non_windup_var_limit1.VU) annotation(Line(points = {{54.5, -20}, {23.7631, -20}, {23.7631, -31.2073}, {24, -31.2073}, {24, -31}}, color = {0, 0, 127}));
  connect(gain3.y, lag_non_windup_var_limit1.VL) annotation(Line(points = {{54.5, -60}, {29.6856, -60}, {29.6856, -49}, {29, -49}}, color = {0, 0, 127}));
  connect(transferfunction1.y, add32.u1) annotation(Line(points = {{-34.5, 20}, {-15.4897, 20}, {-15.4897, -19.1344}, {-48.5194, -19.1344}, {-48.5194, -35.9909}, {-46, -35.9909}, {-46, -36}}, color = {0, 0, 127}));
  connect(VUEL, max1.u2) annotation(Line(points = {{-100, 20}, {-109.809, 20}, {-109.809, -54}, {-8, -54}, {-8, -42}, {-2, -42}, {-2, -43}}, color = {0, 0, 127}));
  connect(lead_lag1.y, max1.u1) annotation(Line(points = {{-15, -40}, {-11.8451, -40}, {-11.8451, -36.9476}, {-2, -36.9476}, {-2, -37}}, color = {0, 0, 127}));
  connect(add32.y, lead_lag1.u) annotation(Line(points = {{-34.5, -40}, {-25.2847, -40}, {-25.2847, -40}, {-25, -40}}, color = {0, 0, 127}));
  connect(add32.u2, add2.y) annotation(Line(points = {{-46, -40}, {-51.2528, -40}, {-51.2528, 0}, {-54.5, 0}, {-54.5, 0}}, color = {0, 0, 127}));
  connect(add4.y, add32.u3) annotation(Line(points = {{-62.5, -44}, {-52.8474, -44}, {-52.8474, -44.4191}, {-46, -44.4191}, {-46, -44}}, color = {0, 0, 127}));
  connect(Ecomp.y, lag1.u) annotation(Line(points = {{-100, 86}, {-84, 86}}, color = {0, 0, 127}));
  connect(gain1.u, EFD) annotation(Line(points = {{-6, 26}, {-6, 94}, {110, 94}, {110, 0}, {100, 0}}, color = {0, 0, 127}));
  connect(transferfunction1.u, EFD) annotation(Line(points = {{-46, 20}, {-53.5809, 20}, {-53.5809, 94}, {110, 94}, {110, 0}, {100, 0}}, color = {0, 0, 127}));
  connect(saturation1.u, EFD) annotation(Line(points = {{4, 71}, {4, 94}, {110, 94}, {110, 0}, {100, 0}}, color = {0, 0, 127}));
  connect(gain1.y, add1.u1) annotation(Line(points = {{-6, 14.5}, {-6, -2.96128}, {12, -2.96128}, {12, -3}}, color = {0, 0, 127}));
  connect(add4.u1, VOEL) annotation(Line(points = {{-74, -41}, {-74, -40}, {-78, -40}, {-78, -8}, {-100, -8}}, color = {0, 0, 127}));
  connect(add4.u2, VOTHSG) annotation(Line(points = {{-74, -47}, {-84, -47}, {-84, -36}, {-100, -36}}, color = {0, 0, 127}));
  connect(add2.u1, lag1.y) annotation(Line(points = {{-66, 3}, {-70, 3}, {-70, 86}, {-75, 86}}, color = {0, 0, 127}));
  connect(add5.y, add2.u2) annotation(Line(points={{-94.5,40},{-74.5501,40},{-74.5501,
          -2.82776},{-66,-2.82776},{-66,-3}},                                                                                                        color = {0, 0, 127}));
  connect(dVREF, add5.u1) annotation(Line(points={{-100,58},{-113.368,58},{-113.368,
          43.1877},{-106,43.1877},{-106,43}},                                                                                                   color = {0, 0, 127}));
  connect(product1.u2, saturation1.y) annotation(Line(points = {{3, 44}, {4, 44}, {4, 61}}, color = {0, 0, 127}));
  connect(product1.u1, EFD) annotation(Line(points = {{9, 44}, {10, 44}, {10, 94}, {110, 94}, {110, 0}, {100, 0}}, color = {0, 0, 127}));
  connect(add1.u2, product1.y) annotation(Line(points = {{12, 3}, {6, 3}, {6, 32.5}}, color = {0, 0, 127}));
  connect(add3.y, integrator1.u) annotation(Line(points = {{61.5, 0}, {64, 0}, {64, -1}, {67, -1}}, color = {0, 0, 127}));
  connect(const.y, add5.u2) annotation(Line(points={{-132,44},{-121.851,44},{-121.851,
          36.5039},{-106,36.5039},{-106,37}},                                                                                                     color = {0, 0, 127}));
  annotation(Documentation(info = "<html>
<img src=\"modelica://OpalRT/resource/Excitation/ESDC2A.png\"
alt=\"ESDC2A.png\"><br>
</html>"), experiment(StartTime = 0, StopTime = 6, Tolerance = 1e-06, Interval = 0.001), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Text(origin = {-58.4313, -40.6199}, lineColor = {255, 0, 127}, extent = {{-3.08, 2.51}, {3.08, -2.51}}, textString = "VS"), Text(origin = {35.1487, -70.6589}, lineColor = {255, 0, 127}, extent = {{-3.08, 2.51}, {3.08, -2.51}}, textString = "VR"), Text(origin = {11.62, -20.16}, lineColor = {255, 0, 0}, extent = {{-4.33, 3.76}, {2.96326, -2.39326}}, textString = "VF")}));
end ESDC2A;
