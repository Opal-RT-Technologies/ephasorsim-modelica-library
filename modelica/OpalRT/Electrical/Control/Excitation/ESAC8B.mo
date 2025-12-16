within OpalRT.Electrical.Control.Excitation;
model ESAC8B
  extends OpalRT.Electrical.PartialModel.Exciter;
  parameter Integer IBUS = 100 "Located Bus No.";
  parameter String ID = "M1" "Machine Identifier";
  parameter Real TR = 0.02 "(sec)";
  parameter Real KP = 100;
  parameter Real KI = 0.8;
  parameter Real KD = 0.8;
  parameter Real TD = 1 "(sec)";
  parameter Real KA = 100;
  parameter Real TA = 0.5 "(sec)";
  parameter Real VRMAX = 9 "or zero";
  parameter Real VRMIN = -5;
  parameter Real TE = 0.08 "(>0)(sec)";
  parameter Real KE = 0.5 "or zero";
  parameter Real E1 = 4;
  parameter Real SE_E1 = 0.4;
  parameter Real E2 = 5;
  parameter Real SE_E2 = 0.5;
  import sat_q = OpalRT.NonElectrical.Math.Nonlinear.computeSaturationQuadratic;
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag lag1(T = TR, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = ECOMP_0) annotation(Placement(visible = true, transformation(origin = {-60, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add3 add31(k1 = -1) annotation(Placement(visible = true, transformation(origin = {-40, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = KP) annotation(Placement(visible = true, transformation(origin = {0, 60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator integrator1(k = KI, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = VR0 / KA) annotation(Placement(visible = true, transformation(origin = {0, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.TransferFunction1 transferfunction1(b = {KD, 0}, a = {TD0, 1}) annotation(Placement(visible = true, transformation(origin = {0, 20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add3 add32(k1 = +1) annotation(Placement(visible = true, transformation(origin = {20, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain2(k = KE_1) annotation(Placement(visible = true, transformation(origin = {60, -40}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Nonlinear.SaturationQuadratic saturationquadratic1(E1 = E1, E2 = E2, SE_E1 = SE_E1, SE_E2 = SE_E2) annotation(Placement(visible = true, transformation(origin = {60, -20}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Product product1 annotation(Placement(visible = true, transformation(origin = {40, -20}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add3 annotation(Placement(visible = true, transformation(origin = {20, -40}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant1(k = 0) annotation(Placement(visible = true, transformation(origin = {80, 80}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunctionNonWindup.Integrator_NonWindupLimit non_windup_integrator1(VRMAX = Modelica.Constants.inf, VRMIN = 0, KI = 1 / TE, y_init = EFD_0) annotation(Placement(visible = true, transformation(origin = {60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1(k2 = -1, k1 = +1) annotation(Placement(visible = true, transformation(origin = {40, 0}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunctionNonWindup.Lag_NonWindupLimit lag_nonwinduplimit1(KI = KA, TI = TA, VRMAX = VRMAX_1, VRMIN = VRMIN_1, y_init = VR0) annotation(Placement(visible = true, transformation(origin = {60, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = VREF_0) annotation(Placement(visible = true, transformation(origin = {-80, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add3 add33(k1 = +1) annotation(Placement(visible = true, transformation(origin = {-60, 0}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add2 annotation(Placement(visible = true, transformation(origin = {-60, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression Ecomp(y = ETERM) annotation(Placement(visible = true, transformation(origin = {-91, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
protected
  parameter Real EFD_0(fixed = false);
  parameter Real ECOMP_0(fixed = false);
  parameter Real VR0(fixed = false);
  parameter Real VREF_0(fixed = false);
  parameter Real SE0(fixed = false);
  parameter Real TD0(start = 1, fixed = false);
  parameter Real VRMAX_1(fixed = false);
  parameter Real VRMIN_1(fixed = false);
  parameter Real KE_1(fixed = false);
initial equation
  EFD_0 = EFD0;
  ECOMP_0 = ETERM0;
  TD0 = TD;
  SE0 = sat_q(EFD_0, E1, E2, SE_E1, SE_E2);
  VRMAX_1 = if VRMAX <> 0 then VRMAX elseif KE <= 0 then SE_E2 * E2 else (SE_E2 + KE) * E2;
  VRMIN_1 = if VRMAX <> 0 then VRMIN else -VRMAX_1;
  KE_1 = if KE <> 0 then KE else VRMAX_1 / (10 * EFD_0) - SE0;
  VR0 = (SE0 + KE_1) * EFD_0;
  VREF_0 = ECOMP_0;
  VUEL0 = 0;
  VOEL0 = 0;
equation
  connect(add3.y, add1.u2) annotation(Line(points={{14.5,-40},{10.596,-40},{10.596,
          -3.53201},{34,-3.53201},{34,-3}},                                                                                                     color = {0, 0, 127}));
  connect(product1.y, add3.u1) annotation(Line(points={{34.5,-20},{31.7881,-20},
          {31.7881,-37.0861},{26,-37.0861},{26,-37}},                                                                                                 color = {0, 0, 127}));
  connect(gain2.y, add3.u2) annotation(Line(points={{54.5,-40},{41.0596,-40},{41.0596,
          -42.8256},{26,-42.8256},{26,-43}},                                                                                                       color = {0, 0, 127}));
  connect(saturationquadratic1.y, product1.u2) annotation(Line(points={{55,-20},
          {50.3311,-20},{50.3311,-23.3996},{46,-23.3996},{46,-23}},                                                                                                 color = {0, 0, 127}));
  connect(product1.u1, EFD) annotation(Line(points={{46,-17},{50.3311,-17},{50.3311,
          -11.0375},{80.3532,-11.0375},{80.3532,0},{100,0},{100,0}},                                                                                                  color = {0, 0, 127}));
  connect(saturationquadratic1.u, EFD) annotation(Line(points={{65,-20},{80.3532,
          -20},{80.3532,0},{100,0},{100,0}},                                                                                           color = {0, 0, 127}));
  connect(gain2.u, EFD) annotation(Line(points={{66,-40},{80.3532,-40},{80.3532,
          0},{100,0},{100,0}},                                                                                          color = {0, 0, 127}));
  connect(add33.u3, VOTHSG) annotation(Line(points={{-66,-4},{-71.9647,-4},{-71.9647,
          -36.2031},{-100,-36.2031},{-100,-36}},                                                                                                    color = {0, 0, 127}));
  connect(add33.u2, VOEL) annotation(Line(points={{-66,0},{-75.4967,0},{-75.4967,
          -8.38852},{-100,-8.38852},{-100,-8}},                                                                                                 color = {0, 0, 127}));
  connect(add33.u1, VUEL) annotation(Line(points={{-66,4},{-75.4967,4},{-75.4967,
          19.8675},{-100,19.8675},{-100,20}},                                                                                                color = {0, 0, 127}));
  connect(add31.u3, add33.y) annotation(Line(points={{-46,36},{-48.1236,36},{-48.1236,
          0.441501},{-54.5,0.441501},{-54.5,0}},                                                                                                     color = {0, 0, 127}));
  connect(const.y, add2.u2) annotation(Line(points={{-74.5,40},{-71.2082,40},{-71.2082,
          40.1028},{-66,40.1028},{-66,37}},                                                                                                    color = {0, 0, 127}));
  connect(dVREF, add2.u1) annotation(Line(points={{-100,58},{-70.6941,58},{-70.6941,
          57.8406},{-66,57.8406},{-66,43}},                                                                                                    color = {0, 0, 127}));
  connect(add31.u2, add2.y) annotation(Line(points={{-46,40},{-54.2416,40},{-54.2416,
          40},{-54.5,40}},                                                                                                  color = {0, 0, 127}));
  connect(lag1.y, add31.u1) annotation(Line(points={{-50,80},{-48.1236,80},{-48.1236,
          44.1501},{-46,44.1501},{-46,44}},                                                                                                      color = {0, 0, 127}));
  connect(transferfunction1.u, add31.y) annotation(Line(points={{-5,20},{-17.2185,
          20},{-17.2185,39.7351},{-34.5,39.7351},{-34.5,40}},                                                                                               color = {0, 0, 127}));
  connect(gain1.u, add31.y) annotation(Line(points={{-6,60},{-17.2185,60},{-17.2185,
          39.7351},{-34.5,39.7351},{-34.5,40}},                                                                                                 color = {0, 0, 127}));
  connect(add31.y, integrator1.u) annotation(Line(points={{-34.5,40},{-6.62252,40},
          {-6.62252,40},{-6,40}},                                                                                                   color = {0, 0, 127}));
  connect(add32.u3, transferfunction1.y) annotation(Line(points={{14,36},{9.27152,
          36},{9.27152,19.8675},{5,19.8675},{5,20}},                                                                                                     color = {0, 0, 127}));
  connect(integrator1.y, add32.u2) annotation(Line(points={{5.5,40},{13.245,40},
          {13.245,40},{14,40}},                                                                                              color = {0, 0, 127}));
  connect(gain1.y, add32.u1) annotation(Line(points={{5.5,60},{9.27152,60},{9.27152,
          44.1501},{14,44.1501},{14,44}},                                                                                                   color = {0, 0, 127}));
  connect(lag_nonwinduplimit1.u, add32.y) annotation(Line(points={{49,40},{25.1656,
          40},{25.1656,40},{25.5,40}},                                                                                                color = {0, 0, 127}));
  connect(add1.u1, lag_nonwinduplimit1.y) annotation(Line(points={{34,3},{26.9316,
          3},{26.9316,19.8675},{80.3532,19.8675},{80.3532,40.1766},{71,40.1766},
          {71,40}},                                                                                                                                                                             color = {0, 0, 127}));
  connect(non_windup_integrator1.u, add1.y) annotation(Line(points={{55,0},{45.9161,
          0},{45.9161,0},{45.5,0}},                                                                                       color = {0, 0, 127}));
  connect(EFD, non_windup_integrator1.y) annotation(Line(points={{100,0},{65.3422,
          0},{65.3422,0},{65,0}},                                                                                                     color = {0, 0, 127}));
  connect(constant1.y, VF) annotation(Line(points={{85.5,80},{92.3711,80},{92.3711,
          80},{100,80}},                                                                                       color = {0, 0, 127}));
  connect(Ecomp.y, lag1.u) annotation (
    Line(points = {{-80, 80}, {-70, 80}}, color = {0, 0, 127}));
  annotation(Documentation(info = "<html>
<p>
1- In this model, VS = VOTHSG+VUEL+VOEL
</p>
<p>
2- Make sure TA > Simulation time-step.
</p>
<img src=\"modelica://OpalRT/resource/Excitation/ESAC8B.png\"
alt=\"ESAC8B.png\"><br>

</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Text(origin = {29.4952, -27.474}, lineColor = {255, 0, 0}, extent = {{-7.27, 6.87}, {1.20939, -2.42556}}, textString = "Vx"), Text(origin = {83.43, 43.03}, lineColor = {255, 0, 0}, extent = {{-7.27, 6.87}, {1.21, -2.43}}, textString = "VR")}));
end ESAC8B;
