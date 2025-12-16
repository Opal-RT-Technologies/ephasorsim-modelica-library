within OpalRT.Electrical.Control.Excitation;
model ESDC1A
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
  Modelica.Blocks.Math.Add add3(k2 = +1, k1 = -1) annotation(Placement(visible = true, transformation(origin = {58, 0}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1(k2 = +1, k1 = +1) annotation(Placement(visible = true, transformation(origin = {40, 2}, extent = {{5, -5}, {-5, 5}}, rotation = 180)));
  Modelica.Blocks.Math.Gain gain1(k = KE_0) annotation(Placement(visible = true, transformation(origin = {0, 20}, extent = {{-5, -5}, {5, 5}}, rotation = -90)));
  NonElectrical.Math.Nonlinear.SaturationQuadratic saturation1(E1 = E1, E2 = E2, SE_E1 = SE_E1, SE_E2 = SE_E2) annotation(Placement(visible = true, transformation(origin = {16, 38}, extent = {{5, -5}, {-5, 5}}, rotation = 90)));
  Modelica.Blocks.Continuous.TransferFunction transferfunction1(b = {KF_0, 0}, a = {TF1_0, 1}, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = 0) annotation(Placement(visible = true, transformation(origin = {-40, 20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add4 annotation(Placement(visible = true, transformation(origin = {-60, -40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag lag1(T = TR, y_start = ECOMP_0, initType = Modelica.Blocks.Types.Init.InitialOutput) annotation(Placement(visible = true, transformation(origin = {-80, 86}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add2(k1 = -1, k2 = +1) annotation(Placement(visible = true, transformation(origin = {-60, 0}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add3 add32(k1 = -1) annotation(Placement(visible = true, transformation(origin = {-40, -40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.LeadLag lead_lag1(TA = TC, TB = TB, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = VM_0) annotation(Placement(visible = true, transformation(origin = {-20, -40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Max max1(y(start = VM_0)) annotation(Placement(visible = true, transformation(origin = {0, -60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunctionNonWindup.Lag_NonWindupLimit lag_non_windup_limit1(KI = KA, TI = TA, VRMAX = VRMAX_0, VRMIN = VRMIN_0, y_init = VR_0) annotation(Placement(visible = true, transformation(origin = {20, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunctionNonWindup.Integrator_NonWindupLimit non_windup_integrator1(VRMAX = Modelica.Constants.inf, VRMIN = 0, KI = 1 / TE, y_init = EFD_0) annotation(Placement(visible = true, transformation(origin = {74, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Product product annotation(Placement(transformation(extent = {{-5, -5}, {5, 5}}, rotation = -90, origin = {19, 19})));
  Modelica.Blocks.Math.Add add5 annotation(Placement(visible = true, transformation(origin = {-100, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = VREF_0) annotation(Placement(visible = true, transformation(origin = {-140, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression Ecomp(y = ETERM) annotation(Placement(visible = true, transformation(origin = {-103, 86}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
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
  connect(add5.u2, const.y) annotation(Line(points={{-106,37},{-117.003,37},{-117.003,
          40.0113},{-129,40.0113},{-129,40}},                                                                                                     color = {0, 0, 127}));
  connect(dVREF, add5.u1) annotation(Line(points={{-100,58},{-111.503,58},{-111.503,
          43.0316},{-106,43.0316},{-106,43}},                                                                                                   color = {0, 0, 127}));
  connect(add5.y, add2.u2) annotation(Line(points={{-94.5,40},{-71.9899,40},{-71.9899,
          -2.97703},{-66,-2.97703},{-66,-3}},                                                                                                        color = {0, 0, 127}));
  connect(VF, transferfunction1.y) annotation(Line(points = {{100, 80}, {-15.4897, 80}, {-15.4897, 20.0456}, {-34.5, 20.0456}, {-34.5, 20}}, color = {0, 0, 127}));
  connect(transferfunction1.y, add32.u1) annotation(Line(points = {{-34.5, 20}, {-15.4897, 20}, {-15.4897, -19.1344}, {-48.5194, -19.1344}, {-48.5194, -35.9909}, {-46, -35.9909}, {-46, -36}}, color = {0, 0, 127}));
  connect(lag_non_windup_limit1.y, add3.u2) annotation(Line(points = {{31, -60}, {48.9157, -60}, {48.9157, -3}, {52, -3}}, color = {0, 0, 127}));
  connect(lag_non_windup_limit1.u, max1.y) annotation(Line(points = {{9, -60}, {5.92255, -60}, {5.92255, -60}, {5.5, -60}}, color = {0, 0, 127}));
  connect(VUEL, max1.u2) annotation(Line(points = {{-100, 20}, {-114, 20}, {-114, -74}, {-14, -74}, {-14, -64}, {-6, -64}, {-6, -63}}, color = {0, 0, 127}));
  connect(lead_lag1.y, max1.u1) annotation(Line(points = {{-15, -40}, {-11.8451, -40}, {-11.8451, -56.9476}, {-6, -56.9476}, {-6, -57}}, color = {0, 0, 127}));
  connect(add32.y, lead_lag1.u) annotation(Line(points = {{-34.5, -40}, {-25.2847, -40}, {-25.2847, -40}, {-25, -40}}, color = {0, 0, 127}));
  connect(add32.u2, add2.y) annotation(Line(points = {{-46, -40}, {-51.2528, -40}, {-51.2528, 0}, {-54.5, 0}, {-54.5, 0}}, color = {0, 0, 127}));
  connect(add4.y, add32.u3) annotation(Line(points = {{-54.5, -40}, {-52.8474, -40}, {-52.8474, -44.4191}, {-46, -44.4191}, {-46, -44}}, color = {0, 0, 127}));
  connect(Ecomp.y, lag1.u) annotation(Line(points = {{-92, 86}, {-84, 86}}, color = {0, 0, 127}));
  connect(gain1.u, EFD) annotation(Line(points = {{1.11022e-15, 26}, {1.11022e-15, 96}, {112, 96}, {112, 0}, {100, 0}}, color = {0, 0, 127}));
  connect(transferfunction1.u, EFD) annotation(Line(points = {{-46, 20}, {-55.5809, 20}, {-55.5809, 96}, {112, 96}, {112, 0}, {100, 0}}, color = {0, 0, 127}));
  connect(saturation1.u, EFD) annotation(Line(points = {{16, 43}, {16, 96}, {112, 96}, {112, 0}, {100, 0}}, color = {0, 0, 127}));
  connect(gain1.y, add1.u1) annotation(Line(points = {{-8.88178e-16, 14.5}, {-8.88178e-16, -0.96128}, {34, -0.96128}, {34, -1}}, color = {0, 0, 127}));
  connect(product.u1, EFD) annotation(Line(points = {{22, 25}, {22, 96}, {112, 96}, {112, 0}, {100, 0}}, color = {0, 0, 127}));
  connect(product.u2, saturation1.y) annotation(Line(points = {{16, 25}, {16, 33}}, color = {0, 0, 127}));
  connect(product.y, add1.u2) annotation(Line(points = {{19, 13.5}, {18.5, 13.5}, {18.5, 5}, {34, 5}}, color = {0, 0, 127}));
  connect(add3.u1, add1.y) annotation(Line(points = {{52, 3}, {50, 3}, {50, 2}, {45.5, 2}}, color = {0, 0, 127}));
  connect(add3.y, non_windup_integrator1.u) annotation(Line(points = {{63.5, 0}, {69, 0}}, color = {0, 0, 127}));
  connect(non_windup_integrator1.y, EFD) annotation(Line(points = {{79, 0}, {100, 0}}, color = {0, 0, 127}));
  connect(add2.u1, lag1.y) annotation(Line(points = {{-66, 3}, {-68, 3}, {-68, 86}, {-75, 86}}, color = {0, 0, 127}));
  connect(add4.u1, VOEL) annotation(Line(points = {{-66, -37}, {-76, -37}, {-76, -8}, {-100, -8}}, color = {0, 0, 127}));
  connect(add4.u2, VOTHSG) annotation(Line(points = {{-66, -43}, {-72, -43}, {-72, -44}, {-82, -44}, {-82, -36}, {-100, -36}}, color = {0, 0, 127}));
  annotation(Documentation(info = "<html>

<img src=\"modelica://OpalRT/resource/Excitation/ESDC1A.png\"
alt=\"ESDC1A.png\"><br>
</html>"), experiment(StartTime = 0, StopTime = 6, Tolerance = 1e-06, Interval = 0.001), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = false, initialScale = 0.1, grid = {2, 2}), graphics={  Text(origin = {-58.4313, -52.6199}, lineColor = {255, 0, 127}, extent = {{-3.08, 2.51}, {3.08, -2.51}}, textString = "VS"), Text(origin = {44.0097, -66.0256}, lineColor = {255, 0, 127}, extent = {{-3.08, 2.51}, {3.08, -2.51}}, textString = "VR"), Text(origin = {-15.2, -23.28}, lineColor = {255, 0, 127}, extent = {{-3.08, 2.51}, {3.08, -2.51}}, textString = "EFDR"), Text(origin = {20.73, -25.97}, lineColor = {255, 0, 0}, extent = {{-7.29, 3.42}, {5.0121, -2.73663}}, textString = "VF")}));
end ESDC1A;
