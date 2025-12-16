within OpalRT.Electrical.Control.Excitation;
model IEEET2
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
  parameter Real TF1 = 0.4 "(>0) (sec)";
  parameter Real TF2 = 0.4 "(>0) (sec)";
  parameter Real E1 = 4;
  parameter Real SE_E1 = 0.4;
  parameter Real E2 = 5;
  parameter Real SE_E2 = 0.5;
  import sat_q = OpalRT.NonElectrical.Math.Nonlinear.computeSaturationQuadratic;
  Modelica.Blocks.Math.Add3 add31(k1 = -1) annotation(Placement(visible = true, transformation(origin = {-20, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add3 add32 annotation(Placement(visible = true, transformation(origin = {-60, 0}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1(k2 = +1, k1 = -1) annotation(Placement(visible = true, transformation(origin = {0, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunctionNonWindup.Lag_NonWindupLimit lag_nonwinduplimit1(KI = KA, TI = TA, VRMAX = VRMAX_1, VRMIN = VRMIN_1, y_init = VR0) annotation(Placement(visible = true, transformation(origin = {20, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add2(k1 = +1, k2 = -1) annotation(Placement(visible = true, transformation(origin = {40, 0}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator integrator1(k = 1 / TE, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = EFD_0) annotation(Placement(visible = true, transformation(origin = {60, 0}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Nonlinear.SaturationQuadratic saturationquadratic1(E1 = E1, E2 = E2, SE_E1 = SE_E1, SE_E2 = SE_E2) annotation(Placement(visible = true, transformation(origin = {60, -20}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Product product1 annotation(Placement(visible = true, transformation(origin = {40, -20}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = KE_1) annotation(Placement(visible = true, transformation(origin = {60, -40}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add3 annotation(Placement(visible = true, transformation(origin = {20, -40}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag lag1(T = TR, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = ECOMP_0) annotation(Placement(visible = true, transformation(origin = {-60, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = VREF_0) annotation(Placement(visible = true, transformation(origin = {-80, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant1(k = 1) annotation(Placement(visible = true, transformation(origin = {80, 80}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction transferfunction1(a = {TF1_0, 1}, initType = Modelica.Blocks.Types.Init.InitialOutput, b = {KF0, 0}) annotation(Placement(visible = true, transformation(origin = {40, 60}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag lag2(T = TF2_0) annotation(Placement(visible = true, transformation(origin = {0, 80}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add4 annotation(Placement(visible = true, transformation(origin = {-60, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression Ecomp(y = ETERM) annotation(Placement(visible = true, transformation(origin = {-91, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
protected
  parameter Real KF0(fixed = false);
  parameter Real TF1_0(start = 1, fixed = false);
  parameter Real TF2_0(start = 1, fixed = false);
  parameter Real EFD_0(fixed = false);
  parameter Real ECOMP_0(fixed = false);
  parameter Real VR0(fixed = false);
  parameter Real VREF_0(fixed = false);
  parameter Real SE0(fixed = false);
  parameter Real KE_1(fixed = false);
  parameter Real VRMAX_1(fixed = false);
  parameter Real VRMIN_1(fixed = false);
initial algorithm
  KF0 := KF;
  TF1_0 := TF1;
  TF2_0 := TF2;
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
  connect(transferfunction1.u, lag_nonwinduplimit1.y) annotation(Line(points={{46,60},
          {52.7221,60},{52.7221,39.5415},{31,39.5415},{31,40}},                                                                                                       color = {0, 0, 127}));
  connect(lag2.y, add1.u1) annotation(Line(points={{-10,80},{-12.6074,80},{-12.6074,
          43.2665},{-6,43.2665},{-6,43}},                                                                                                       color = {0, 0, 127}));
  connect(transferfunction1.y, lag2.u) annotation(Line(points={{34.5,60},{20.3438,
          60},{20.3438,80.2292},{10.3152,80.2292},{10.3152,80},{10,80}},                                                                                                     color = {0, 0, 127}));
  connect(VF, constant1.y) annotation(Line(points={{100,80},{85.2593,80},{85.2593,
          80},{85.5,80}},                                                                                               color = {0, 0, 127}));
  connect(const.y, add4.u2) annotation(Line(points={{-69,40},{-69.1517,40},{-69.1517,
          37},{-66,37}},                                                                                                    color = {0, 0, 127}));
  connect(add4.u1, dVREF) annotation(Line(points={{-66,43},{-68.6375,43},{-68.6375,
          58.0977},{-100,58.0977},{-100,58}},                                                                                                  color = {0, 0, 127}));
  connect(add31.u2, add4.y) annotation(Line(points={{-26,40},{-25.7069,40},{-25.7069,
          40},{-54.5,40}},                                                                                                    color = {0, 0, 127}));
  connect(add31.u1, lag1.y) annotation(Line(points={{-26,44},{-39.5062,44},{-39.5062,
          80},{-50,80},{-50,80}},                                                                                                 color = {0, 0, 127}));
  connect(Ecomp.y, lag1.u) annotation(Line(points = {{-80, 80}, {-70, 80}}, color = {0, 0, 127}));
  connect(add1.u2, add31.y) annotation(Line(points={{-6,37},{-10.3704,37},{-10.3704,
          40},{-14.5,40},{-14.5,40}},                                                                                          color = {0, 0, 127}));
  connect(lag_nonwinduplimit1.y, add2.u1) annotation(Line(points={{31,40},{35.8025,
          40},{35.8025,27.4074},{26.4198,27.4074},{26.4198,3.45679},{34,3.45679},
          {34,3}},                                                                                                                                                                                color = {0, 0, 127}));
  connect(add3.y, add2.u2) annotation(Line(points={{14.5,-40},{10.3704,-40},{10.3704,
          -3.20988},{34,-3.20988},{34,-3}},                                                                                                       color = {0, 0, 127}));
  connect(add3.u1, product1.y) annotation(Line(points={{26,-37},{30.1235,-37},{30.1235,
          -19.7531},{34.5,-19.7531},{34.5,-20}},                                                                                                    color = {0, 0, 127}));
  connect(add3.u2, gain1.y) annotation(Line(points={{26,-43},{47.4074,-43},{47.4074,
          -39.7531},{54.5,-39.7531},{54.5,-40}},                                                                                                 color = {0, 0, 127}));
  connect(gain1.u, integrator1.y) annotation(Line(points={{66,-40},{75.3086,-40},
          {75.3086,0},{65.5,0},{65.5,0}},                                                                                       color = {0, 0, 127}));
  connect(product1.u2, integrator1.y) annotation(Line(points = {{46, -23}, {50.1235, -23}, {50.1235, -28.8889}, {75.5556, -28.8889}, {75.8025, -0.493827}, {65.5, -0.493827}, {65.5, 0}}, color = {0, 0, 127}));
  connect(saturationquadratic1.u, integrator1.y) annotation(Line(points={{65,-20},
          {75.5556,-20},{75.5556,-0.246914},{65.5,-0.246914},{65.5,0}},                                                                                                color = {0, 0, 127}));
  connect(product1.u1, saturationquadratic1.y) annotation(Line(points={{46,-17},
          {50.8642,-17},{50.8642,-20},{55,-20},{55,-20}},                                                                                          color = {0, 0, 127}));
  connect(EFD, integrator1.y) annotation(Line(points={{100,0},{65.679,0},{65.679,
          0},{65.5,0}},                                                                                                 color = {0, 0, 127}));
  connect(integrator1.u, add2.y) annotation(Line(points={{54,0},{45.9259,0},{45.9259,
          0},{45.5,0}},                                                                                                        color = {0, 0, 127}));
  connect(lag_nonwinduplimit1.u, add1.y) annotation(Line(points={{9,40},{5.4321,
          40},{5.4321,40},{5.5,40}},                                                                                             color = {0, 0, 127}));
  connect(add31.u3, add32.y) annotation(Line(points={{-26,36},{-39.7531,36},{-39.7531,
          -0.246914},{-54.5,-0.246914},{-54.5,0}},                                                                                                      color = {0, 0, 127}));
  connect(add32.u1, VUEL) annotation(Line(points={{-66,4},{-74.0741,4},{-74.0741,
          20.7407},{-100,20.7407},{-100,20}},                                                                                                color = {0, 0, 127}));
  connect(add32.u2, VOEL) annotation(Line(points={{-66,0},{-74.0741,0},{-74.0741,
          -7.65432},{-91.358,-7.65432},{-91.358,-8},{-100,-8}},                                                                                                    color = {0, 0, 127}));
  connect(add32.u3, VOTHSG) annotation(Line(points={{-66,-4},{-68.642,-4},{-68.642,
          -36.0494},{-100,-36.0494},{-100,-36}},                                                                                                  color = {0, 0, 127}));
  annotation(Documentation(info = "<html>
<p>
1- In this model, VS = VOTHSG+VUEL+VOEL
</p>
<img src=\"modelica://OpalRT/resource/Excitation/IEEET2.png\"
alt=\"IEEET2.png\"><br>

</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
end IEEET2;
