within OpalRT.Electrical.Control.TurbineGovernor;
model BBGOV1 "European Governor Model"
  extends OpalRT.Electrical.PartialModel.TurbineGovernor;
  parameter Integer IBUS = 100 "Located Bus No.";
  parameter String ID = "M1" "Machine Identifier";
  parameter Real fcut = 1 "(>=0)(pu)";
  parameter Real KS = 1;
  parameter Real KLS = 1 "(> 0)";
  parameter Real KG = 1;
  parameter Real KP = 1;
  parameter Real TN = 1 "(sec)(> 0)";
  parameter Real KD = 0.5;
  parameter Real TD = 0.5 "(sec)(> 0)";
  parameter Real T4 = 0.5 "(sec)";
  parameter Real K2 = 1;
  parameter Real T5 = 0.5 "(sec)";
  parameter Real K3 = 1;
  parameter Real T6 = 0.5 "(sec)";
  parameter Real T1 = 0.5 "(sec)";
  parameter Real SWITCH = 1;
  parameter Real PMAX = 1;
  parameter Real PMIN = -1;
  Modelica.Blocks.Nonlinear.DeadZone deadzone1(uMax = fcut, uMin = -fcut) annotation(Placement(visible = true, transformation(origin = {-80, 20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = KS) annotation(Placement(visible = true, transformation(origin = {-60, 20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add3 add31(k2 = -1, k3 = -1) annotation(Placement(visible = true, transformation(origin = {-40, 20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiter1(uMax = KLS, uMin = -KLS) annotation(Placement(visible = true, transformation(origin = {-20, 20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add3 add32(k1 = -1) annotation(Placement(visible = true, transformation(origin = {0, 20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = GREF_0) annotation(Placement(visible = true, transformation(origin = {-80, 60}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain2(k = KG / KLS) annotation(Placement(visible = true, transformation(origin = {-20, 0}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator integrator1(y_start = GREF_0, initType = Modelica.Blocks.Types.Init.InitialOutput) annotation(Placement(visible = true, transformation(origin = {-40, 0}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.PI_Regulator pi_regulator1(KI = KP / TN, KP = KP, y_start = PMECH_0 / KD, initType = Modelica.Blocks.Types.Init.InitialOutput) annotation(Placement(visible = true, transformation(origin = {20, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag lag2(T = TD, K = KD, y_start = PMECH_0) annotation(Placement(visible = true, transformation(origin = {40, 20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiter2(uMax = PMAX, uMin = PMIN) annotation(Placement(visible = true, transformation(origin = {60, 20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag lag3(T = T4, y_start = PMECH_0) annotation(Placement(visible = true, transformation(origin = {80, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain3(k = 1 - K2) annotation(Placement(visible = true, transformation(origin = {60, 0}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add3 add33 annotation(Placement(visible = true, transformation(origin = {80, -20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain4(k = 1 - K3) annotation(Placement(visible = true, transformation(origin = {60, -20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag lag5(T = T6, K = K3, y_start = PMECH_0 * K2 * K3) annotation(Placement(visible = true, transformation(origin = {60, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag lag4(T = T5, K = K2, y_start = PMECH_0 * K2) annotation(Placement(visible = true, transformation(origin = {20, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.SignalRouting.Multiplexer multiplexer1(n = 2, s = SW) annotation(Placement(visible = true, transformation(origin = {20, 60}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag lag1(T = T1, y_start = if SW == 1 then PELEC_0 else PMECH_0) annotation(Placement(visible = true, transformation(origin = {-20, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant1(k = 0) annotation(Placement(visible = true, transformation(origin = {80, -60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1 annotation(Placement(visible = true, transformation(origin = {-60, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
protected
  parameter Real GREF_0(fixed = false);
  parameter Real PMECH_0(fixed = false);
  parameter Real PELEC_0(fixed = false);
  parameter Real SW(fixed = false);
initial equation
  PMECH_0 = PMECH0;
  PELEC_0 = PELEC;
  SW = if SWITCH == 0 then 1 else 2;
  GREF_0 = if SW == 1 then PELEC_0 else PMECH_0;
equation
  connect(constant1.y, PMECH_LP) annotation(Line(points={{85.5,-60},{95.986,-60},
          {95.986,-60},{104,-60}},                                                                                              color = {0, 0, 127}));
  multiplexer1.u[1] = PELEC;
  connect(multiplexer1.y, lag1.u) annotation(Line(points={{10,60},{-35.9551,60},
          {-35.9551,39.8876},{-30,39.8876},{-30,40}},                                                                                                 color = {0, 0, 127}));
  connect(add32.u1, lag1.y) annotation(Line(points={{-6,24},{-8.42697,24},{
          -8.42697,40.1685},{-10,40.1685},{-10,40}},                                                                                            color = {0, 0, 127}));
  connect(lag3.y, multiplexer1.u[2]) annotation(Line(points={{90,20},{95.7865,
          20},{95.7865,59.5506},{30,59.5506},{30,60.5}},                                                                                             color = {0, 0, 127}));
  connect(add33.y, PMECH) annotation(Line(points={{85.5,-20},{96.9101,-20},{
          96.9101,4.44089e-16},{104,4.44089e-16}},                                                                          color = {0, 0, 127}));
  connect(lag3.y, lag4.u) annotation(Line(points={{90,20},{96.0674,20},{96.0674,
          7.86517},{4.77528,7.86517},{4.77528,-20.2247},{10,-20.2247},{10,-20}},                                                                                                     color = {0, 0, 127}));
  connect(add33.u1, gain3.y) annotation(Line(points={{74,-16},{71.9101,-16},{
          71.9101,0.280899},{65.5,0.280899},{65.5,0}},                                                                                            color = {0, 0, 127}));
  connect(lag5.y, add33.u3) annotation(Line(points={{70,-40},{71.9101,-40},{
          71.9101,-23.8764},{74,-23.8764},{74,-24}},                                                                                             color = {0, 0, 127}));
  connect(lag5.u, lag4.y) annotation(Line(points={{50,-40},{41.0112,-40},{
          41.0112,-19.9438},{30,-19.9438},{30,-20}},                                                                                           color = {0, 0, 127}));
  connect(gain4.u, lag4.y) annotation(Line(points={{54,-20},{30.618,-20},{
          30.618,-20},{30,-20}},                                                                                        color = {0, 0, 127}));
  connect(lag3.y, gain3.u) annotation(Line(points={{90,20},{95.7865,20},{
          95.7865,7.86517},{49.1573,7.86517},{49.1573,-0.561798},{54,-0.561798},
          {54,0}},                                                                                                                                                                       color = {0, 0, 127}));
  connect(add33.u2, gain4.y) annotation(Line(points={{74,-20},{65.4494,-20},{
          65.4494,-20},{65.5,-20}},                                                                                          color = {0, 0, 127}));
  connect(lag3.u, limiter2.y) annotation(Line(points={{70,20},{65.4494,20},{
          65.4494,20},{65.5,20}},                                                                                         color = {0, 0, 127}));
  connect(limiter2.u, lag2.y) annotation(Line(points={{54,20},{44.9438,20},{
          44.9438,20},{45,20}},                                                                                           color = {0, 0, 127}));
  connect(lag2.u, pi_regulator1.y) annotation(Line(points={{35,20},{30.618,20},
          {30.618,20},{30,20}},                                                                                             color = {0, 0, 127}));
  connect(pi_regulator1.u, add32.y) annotation(Line(points={{10,20},{4.77528,20},
          {4.77528,20},{5.5,20}},                                                                                             color = {0, 0, 127}));
  connect(add32.u3, integrator1.y) annotation(Line(points={{-6,16},{-8.42697,16},
          {-8.42697,-10.6742},{-51.4045,-10.6742},{-51.4045,0},{-45.5,0},{-45.5,
          0}},                                                                                                                                                                   color = {0, 0, 127}));
  connect(integrator1.y, add31.u3) annotation(Line(points={{-45.5,0},{-51.4045,
          0},{-51.4045,16.0112},{-46,16.0112},{-46,16}},                                                                                                color = {0, 0, 127}));
  connect(gain2.y, integrator1.u) annotation(Line(points={{-25.5,0},{-33.1461,0},
          {-33.1461,0},{-34,0}},                                                                                                      color = {0, 0, 127}));
  connect(gain2.u, limiter1.y) annotation(Line(points={{-14,0},{-10.1124,0},{
          -10.1124,19.9438},{-14.5,19.9438},{-14.5,20}},                                                                                          color = {0, 0, 127}));
  connect(const.y, add1.u2) annotation(Line(points={{-85.5,60},{-87.6772,60},{
          -87.6772,36.8593},{-66,36.8593},{-66,37}},                                                                                               color = {0, 0, 127}));
  connect(add32.u2, limiter1.y) annotation(Line(points={{-6,20},{-14.0449,20},{
          -14.0449,20},{-14.5,20}},                                                                                          color = {0, 0, 127}));
  connect(limiter1.u, add31.y) annotation(Line(points={{-26,20},{-34.8315,20},{
          -34.8315,20},{-34.5,20}},                                                                                            color = {0, 0, 127}));
  connect(dGREF, add1.u1) annotation(Line(points={{-100,80},{-70.229,80},{
          -70.229,43.1843},{-66,43.1843},{-66,43}},                                                                                           color = {0, 0, 127}));
  connect(add31.u1, add1.y) annotation(Line(points={{-46,24},{-51.4722,24},{
          -51.4722,23.9913},{-54.5,23.9913},{-54.5,40}},                                                                                           color = {0, 0, 127}));
  connect(add31.u2, gain1.y) annotation(Line(points={{-46,20},{-54.7753,20},{
          -54.7753,20},{-54.5,20}},                                                                                          color = {0, 0, 127}));
  connect(deadzone1.u, SLIP) annotation(Line(points={{-86,20},{-96.9101,20},{
          -96.9101,0},{-102,0}},                                                                                               color = {0, 0, 127}));
  connect(gain1.u, deadzone1.y) annotation(Line(points={{-66,20},{-75.5618,20},
          {-75.5618,20},{-74.5,20}},                                                                                            color = {0, 0, 127}));
  annotation(Documentation(info = "<html>
<p>
1. The Governor gain K<sub>s</sub> = 1/R, P<sub>MAX</sub> and P<sub>MIN</sub> are in pu (generator MVA base).
</p>
<img src=\"modelica://OpalRT/resource/Turbine-Governor/BBGOV1.png\"
alt=\"BBGOV1.png\"><br>

</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
end BBGOV1;
