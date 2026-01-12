within OpalRT.Electrical.Control.TurbineGovernor;
model GGOV1 "GE general purpose turbine-governor model"
  extends OpalRT.Electrical.PartialModel.TurbineGovernor;
  parameter Real R = 1 "Permanent droop (pu)";
  parameter Real Tpelec = 1 "Electrical power transducer time constant (sec)";
  parameter Real maxerr = 1 "Maximum value for speed error signal";
  parameter Real minerr = -1 "Minimum value for speed error signal";
  parameter Real Kpgov = 1 "Governor proportional gain";
  parameter Real Kigov = 1 "Governor integral gain";
  parameter Real Kdgov = 1 "Governor derivative gain";
  parameter Real Tdgov = 1 "Governor derivative controller time constant (sec)";
  parameter Real vmax = 1 "Maximum valve position limit";
  parameter Real vmin = -1 "Minimum valve position limit";
  parameter Real Tact = 1 "Actuator time constant (sec)";
  parameter Real Kturb = 1 "Turbine gain";
  parameter Real Wfnl = 1 "No load fuel flow (pu)";
  parameter Real Tb = 1 "Turbine lag time constant (sec)";
  parameter Real Tc = 1 "Turbine lead time constant (sec)";
  parameter Real Teng = 1 "Transport lag time constant for diesel engine (sec)";
  parameter Real Tfload = 1 "Load Limiter time constant (sec)";
  parameter Real Kpload = 1 "Load limiter proportional gain for PI controller";
  parameter Real Kiload = 1 "Load limiter integral gain for PI controller";
  parameter Real Ldref = 1 "Load limiter reference value (pu)";
  parameter Real Dm = 1 "Mechanical damping coefficient (pu)";
  parameter Real Ropen = 1 "Maximum valve opening rate (pu/sec)";
  parameter Real Rclose = -1 "Maximum valve closing rate (pu/sec)";
  parameter Real Kimw = 1 "Power controller (reset) gain";
  parameter Real Aset = 1 "Acceleration limiter setpoint (pu/sec)";
  parameter Real Ka = 1 "Acceleration limiter gain";
  parameter Real Ta = 1 "Acceleration limiter time constant( > 0) (sec)";
  parameter Real Trate = 1 "Turbine rating (MW)";
  parameter Real db = 1 "Speed governor deadband";
  parameter Real Tsa = 1 "Temperature detection lead time constant (sec)";
  parameter Real Tsb = 1 "Temperature detection lag time constant (sec)";
  parameter Real Rup = 1 "Maximum rate of load limit increase";
  parameter Real Rdown = -1 "Maximum rate of load limit decrease";
  parameter Real Rselect = 1 "ICON(M), Feedback signal for governor droop";
  parameter Real Flag = 1 "ICON(M+1),Switch for fuel source characteristic";
  parameter Real DELTA = 0.01 "Simulation sample time, sec.";
  Modelica.Blocks.Math.Gain gain1(k = power_base_change) annotation(Placement(visible = true, transformation(origin = {-80, -90}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag lag1(T = Tpelec, y_start = PELEC_0) annotation(Placement(visible = true, transformation(origin = {-60, -90}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = Pmwset) annotation(Placement(visible = true, transformation(origin = {-100, -70}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1(k2 = -1) annotation(Placement(visible = true, transformation(origin = {-80, -60}, extent = {{-5, -5}, {5, 5}}, rotation = 90)));
  Modelica.Blocks.Math.Add add2(k2 = +1) annotation(Placement(visible = true, transformation(origin = {-70, -10}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.SignalRouting.Multiplexer multiplexer1(s = Rselect + 3) annotation(Placement(visible = true, transformation(origin = {-50, -50}, extent = {{-5, -5}, {5, 5}}, rotation = 90)));
  Modelica.Blocks.Math.Gain gain2(k = R) annotation(Placement(visible = true, transformation(origin = {-50, -30}, extent = {{-5, -5}, {5, 5}}, rotation = 90)));
  Modelica.Blocks.Math.Add3 add31(k1 = -1, k3 = -1) annotation(Placement(visible = true, transformation(origin = {-40, -10}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant1(k = Ldref) annotation(Placement(visible = true, transformation(origin = {-106, 100}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain3(k = 1 / Kturb) annotation(Placement(visible = true, transformation(origin = {-80, 80}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add3(k2 = +1) annotation(Placement(visible = true, transformation(origin = {-60, 90}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant2(k = Wfnl) annotation(Placement(visible = true, transformation(origin = {-80, 100}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.DeadZone deadzone1(uMax = db, uMin = -db) annotation(Placement(visible = true, transformation(origin = {-20, -10}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiter1(uMax = maxerr, uMin = minerr, y(start = 0)) annotation(Placement(visible = true, transformation(origin = {0, -10}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain4(k = Kpgov) annotation(Placement(visible = true, transformation(origin = {20, -10}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.TransferFunction1 transfer_function11(b = {Kdgov, 0}, a = {Tdgov, 1}, y(start = 0)) annotation(Placement(visible = true, transformation(origin = {20, 10}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add3 add32(k1 = +1, k3 = +1) annotation(Placement(visible = true, transformation(origin = {40, -10}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator integrator1(k = Kigov / Kpgov, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = X0) annotation(Placement(visible = true, transformation(origin = {40, -30}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add4(k2 = +1, k1 = -1) annotation(Placement(visible = true, transformation(origin = {60, -30}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Min min1 annotation(Placement(visible = true, transformation(origin = {60, 0}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Min min2 annotation(Placement(visible = true, transformation(origin = {40, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.TransferFunction1 transfer_function12(b = {1, 0}, a = {Ta, 1}) annotation(Placement(visible = true, transformation(origin = {-60, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant3(k = Aset) annotation(Placement(visible = true, transformation(origin = {-60, 60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add5(k2 = -1) annotation(Placement(visible = true, transformation(origin = {-40, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain5(k = Ka * DELTA) annotation(Placement(visible = true, transformation(origin = {-20, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add6(k2 = +1) annotation(Placement(visible = true, transformation(origin = {10, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add8(k2 = +1, k1 = -1) annotation(Placement(visible = true, transformation(origin = {-40, 80}, extent = {{-5, -5}, {5, 5}}, rotation = -90)));
  Modelica.Blocks.Math.Gain gain6(k = Kpload) annotation(Placement(visible = true, transformation(origin = {-20, 70}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator integrator2(k = Kiload / Kpload, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = X0) annotation(Placement(visible = true, transformation(origin = {20, 80}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add7(k2 = -1, k1 = +1) annotation(Placement(visible = true, transformation(origin = {40, 80}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add9(k2 = +1, k1 = +1) annotation(Placement(visible = true, transformation(origin = {0, 60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiter2(uMax = 1, uMin = -Modelica.Constants.inf) annotation(Placement(visible = true, transformation(origin = {20, 60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag lag2(T = Tfload, y_start = X0) annotation(Placement(visible = true, transformation(origin = {20, 110}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.LeadLag lead_lag1(TA = Tsa, TB = Tsb, y_start = X0) annotation(Placement(visible = true, transformation(origin = {40, 110}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Product product1 annotation(Placement(visible = true, transformation(origin = {60, 110}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Product product2 annotation(Placement(visible = true, transformation(origin = {130, 0}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.SignalRouting.Multiplexer multiplexer2(s = Flag + 1, n = 2) annotation(Placement(visible = true, transformation(origin = {120, -30}, extent = {{-5, -5}, {5, 5}}, rotation = 90)));
  Modelica.Blocks.Math.Add add10(k2 = +1) annotation(Placement(visible = true, transformation(origin = {120, -70}, extent = {{-5, -5}, {5, 5}}, rotation = 90)));
  Modelica.Blocks.Sources.Constant constant4(k = 1) annotation(Placement(visible = true, transformation(origin = {90, -80}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant5(k = 0) annotation(Placement(visible = true, transformation(origin = {-30, -70}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add11(k2 = -1, k1 = +1) annotation(Placement(visible = true, transformation(origin = {160, 0}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant6(k = Wfnl) annotation(Placement(visible = true, transformation(origin = {140, -20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain7(k = Kturb) annotation(Placement(visible = true, transformation(origin = {170, 30}, extent = {{-5, -5}, {5, 5}}, rotation = 90)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.LeadLag lead_lag2(TA = Tc, TB = Tb, y_start = PMECH_0) annotation(Placement(visible = true, transformation(origin = {170, 70}, extent = {{5, -5}, {-5, 5}}, rotation = -90)));
  Modelica.Blocks.Sources.Constant constant7(k = 0) annotation(Placement(visible = true, transformation(origin = {110, 80}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.SignalRouting.Multiplexer multiplexer4(s = if Dm < 0 then 1 else 2, n = 2) annotation(Placement(visible = true, transformation(origin = {120, 110}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.SignalRouting.Multiplexer multiplexer3(s = if Dm > 0 then 1 else 2, n = 2) annotation(Placement(visible = true, transformation(origin = {140, 110}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain8(k = Dm) annotation(Placement(visible = true, transformation(origin = {160, 110}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add12(k2 = +1, k1 = -1) annotation(Placement(visible = true, transformation(origin = {190, 100}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain9(k = 1 / power_base_change) annotation(Placement(visible = true, transformation(origin = {210, 100}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiter3(uMax = vmax, uMin = vmin, y(start = X0)) annotation(Placement(visible = true, transformation(origin = {80, 0}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  parameter Real Pmwset(fixed = false) "VAR(L+6) Supervisory Load Controller Setpoint, Pmwset";
  parameter Real PMECH_0(fixed = false);
  parameter Real PELEC_0(fixed = false);
  parameter Real power_base_change(fixed = false, start = 1);
  parameter Real X0(fixed = false);
  parameter Real X2(fixed = false);
  Modelica.Blocks.Continuous.Integrator integrator3(k = Kimw, initType = Modelica.Blocks.Types.Init.InitialOutput) annotation(Placement(visible = true, transformation(origin = {-80, -40}, extent = {{-5, -5}, {5, 5}}, rotation = 90)));

  OpalRT.Electrical.Control.TurbineGovernor.Internal.ActuatorB actuator1(
    Tact=Tact,
    ropen=Ropen,
    rclose=Rclose,
    y_start=X0) annotation (Placement(visible=true, transformation(
        origin={100,0},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Continuous.TransferFunction transferfunction1(a = {DELTA, 1}, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = X0) annotation(Placement(visible = true, transformation(origin = {-10, 10}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant8(k = 0) annotation(Placement(visible = true, transformation(origin = {63, -80}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add13 annotation(Placement(visible = true, transformation(origin = {-130, -10}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
initial equation
  power_base_change = if Trate > 0 then MBASE / Trate else 1;
  PMECH_0 = PMECH0 * power_base_change;
  PELEC_0 = PELEC * power_base_change;
  Pmwset = PELEC_0;
  X0 = PMECH_0 / Kturb + Wfnl;
  X2 = if Rselect == 1 then R * PELEC_0 elseif Rselect == (-1) or Rselect == (-2) then R * X0 else 0;
equation
  connect(gain7.y, lead_lag2.u) annotation(Line(points = {{170, 35.5}, {170, 63.9663}, {170, 63.9663}, {170, 65}}, color = {0, 0, 127}));
  connect(transferfunction1.y, add6.u2) annotation(Line(points = {{-4.5, 10}, {-1.89445, 10}, {-1.89445, 36.8065}, {4, 36.8065}, {4, 37}}, color = {0, 0, 127}));
  connect(transferfunction1.u, add4.u2) annotation(Line(points = {{-16, 10}, {-29.4993, 10}, {-29.4993, -45.1962}, {70.636, -45.1962}, {70.636, -32.747}, {66, -32.747}, {66, -33}}, color = {0, 0, 127}));
  connect(add4.u2, multiplexer1.u[1]) annotation(Line(points = {{66, -33}, {74.6955, -33}, {74.6955, -62.7876}, {-50.0677, -62.7876}, {-50.0677, -55}, {-50, -55}}, color = {0, 0, 127}));
  connect(actuator1.y, multiplexer1.u[2]) annotation(Line(points = {{110, 0}, {113.938, 0}, {113.938, -21.1096}, {87.9567, -21.1096}, {87.9567, -58.728}, {-49.797, -58.728}, {-49.797, -55}, {-50, -55}}, color = {0, 0, 127}));
  connect(actuator1.y, product2.u1) annotation(Line(points = {{110, 0}, {113.938, 0}, {113.938, 2.70636}, {124, 2.70636}, {124, 3}}, color = {0, 0, 127}));
  connect(actuator1.u, limiter3.y) annotation(Line(points = {{90, 0}, {85.2503, 0}, {85.2503, 0}, {85.5, 0}}, color = {0, 0, 127}));
  connect(add4.u2, limiter3.y) annotation(Line(points = {{66, -33}, {86.6035, -33}, {86.6035, 0}, {85.5, 0}, {85.5, 0}}, color = {0, 0, 127}));
  connect(add7.u1, limiter3.y) annotation(Line(points = {{46, 83}, {86.8742, 83}, {86.8742, 0.270636}, {85.5, 0.270636}, {85.5, 0}}, color = {0, 0, 127}));
  connect(limiter3.u, min1.y) annotation(Line(points = {{74, 0}, {65.2233, 0}, {65.2233, 0}, {65.5, 0}}, color = {0, 0, 127}));
  connect(integrator3.u, add1.y) annotation(Line(points = {{-80, -46}, {-80, -54.9391}, {-80, -54.9391}, {-80, -54.5}}, color = {0, 0, 127}));
  connect(add2.u2, integrator3.y) annotation(Line(points = {{-76, -13}, {-80.1083, -13}, {-80.1083, -34.5}, {-80, -34.5}}, color = {0, 0, 127}));
  add13.u2 = X2;
  product1.u1 = (multiplexer4.y + 1) ^ Dm;
  connect(gain9.y, PMECH) annotation(Line(points = {{215.5, 100}, {232.523, 100}, {232.523, 0}, {104, 0}}, color = {0, 0, 127}));
  connect(gain9.u, add12.y) annotation(Line(points = {{204, 100}, {195.809, 100}, {195.809, 100}, {195.5, 100}}, color = {0, 0, 127}));
  connect(add12.u2, lead_lag2.y) annotation(Line(points = {{184, 97}, {170.044, 97}, {170.044, 75}, {170, 75}}, color = {0, 0, 127}));
  connect(add12.u1, gain8.y) annotation(Line(points = {{184, 103}, {172.943, 103}, {172.943, 109.498}, {165.5, 109.498}, {165.5, 110}}, color = {0, 0, 127}));
  connect(multiplexer3.u[2], multiplexer4.u[2]) annotation(Line(points = {{135, 110.25}, {124.313, 110.25}, {124.313, 110.25}, {125, 110.25}}, color = {0, 0, 127}));
  connect(constant7.y, multiplexer3.u[2]) annotation(Line(points = {{115.5, 80}, {129.788, 80}, {129.788, 110.142}, {135, 110.142}, {135, 110.25}}, color = {0, 0, 127}));
  connect(multiplexer3.u[1], multiplexer4.u[1]) annotation(Line(points = {{135, 109.75}, {124.957, 109.75}, {124.957, 109.75}, {125, 109.75}}, color = {0, 0, 127}));
  connect(SLIP, multiplexer4.u[1]) annotation(Line(points = {{-102, 0}, {-121.092, 0}, {-121.092, 122.38}, {129.788, 122.38}, {129.788, 110.142}, {125, 110.142}, {125, 109.75}}, color = {0, 0, 127}));
  connect(gain8.u, multiplexer3.y) annotation(Line(points = {{154, 110}, {144.602, 110}, {144.602, 110}, {145, 110}}, color = {0, 0, 127}));
  connect(add11.y, gain7.u) annotation(Line(points = {{165.5, 0}, {169.722, 0}, {169.722, 24}, {170, 24}}, color = {0, 0, 127}));
  connect(add11.u1, product2.y) annotation(Line(points = {{154, 3}, {139.127, 3}, {139.127, -0.322054}, {135.5, -0.322054}, {135.5, 0}}, color = {0, 0, 127}));
  connect(constant6.y, add11.u2) annotation(Line(points = {{145.5, -20}, {149.111, -20}, {149.111, -2.89849}, {154, -2.89849}, {154, -3}}, color = {0, 0, 127}));
  connect(product2.y, product1.u2) annotation(Line(points = {{135.5, 0}, {139.127, 0}, {139.127, 19.0012}, {82.4458, 19.0012}, {82.4458, 107.244}, {66, 107.244}, {66, 107}}, color = {0, 0, 127}));
  connect(constant5.y, multiplexer1.u[3]) annotation(Line(points = {{-35.5, -70}, {-49.5963, -70}, {-49.5963, -55}, {-50, -55}}, color = {0, 0, 127}));
  connect(multiplexer2.y, product2.u2) annotation(Line(points = {{120, -25}, {120, -2.89849}, {124, -2.89849}, {124, -3}}, color = {0, 0, 127}));
  connect(add10.y, multiplexer2.u[2]) annotation(Line(points = {{120, -64.5}, {120, -35.1039}, {119.75, -35.1039}, {119.75, -35}}, color = {0, 0, 127}));
  connect(multiplexer2.u[1], constant4.y) annotation(Line(points = {{120.25, -35}, {120.25, -52.4948}, {102.091, -52.4948}, {102.091, -79.8694}, {95.5, -79.8694}, {95.5, -80}}, color = {0, 0, 127}));
  connect(add10.u2, SLIP) annotation(Line(points = {{123, -76}, {123, -109.82}, {-121, -109.82}, {-121, 0}, {-102, 0}}, color = {0, 0, 127}));
  connect(constant4.y, add10.u1) annotation(Line(points = {{95.5, -80}, {116.584, -80}, {116.584, -76}, {117, -76}}, color = {0, 0, 127}));
  connect(product1.y, lead_lag1.u) annotation(Line(points = {{54.5, 110}, {45.4326, 110}, {45.4326, 110}, {45, 110}}, color = {0, 0, 127}));
  connect(lead_lag1.y, lag2.u) annotation(Line(points = {{35, 110}, {25.3042, 110}, {25.3042, 110}, {25, 110}}, color = {0, 0, 127}));
  connect(lag2.y, add8.u1) annotation(Line(points = {{15, 110}, {-37.0937, 110}, {-37.0937, 86}, {-37, 86}}, color = {0, 0, 127}));
  connect(add7.u2, integrator2.y) annotation(Line(points = {{46, 77}, {49.294, 77}, {49.294, 69.0629}, {-9.24262, 69.0629}, {-9.24262, 79.5892}, {14.5, 79.5892}, {14.5, 80}}, color = {0, 0, 127}));
  connect(add9.u1, integrator2.y) annotation(Line(points = {{-6, 63}, {-9.24262, 63}, {-9.24262, 79.5892}, {14.5, 79.5892}, {14.5, 80}}, color = {0, 0, 127}));
  connect(add9.u2, gain6.y) annotation(Line(points = {{-6, 57}, {-12.837, 57}, {-12.837, 69.5764}, {-14.5, 69.5764}, {-14.5, 70}}, color = {0, 0, 127}));
  connect(limiter2.u, add9.y) annotation(Line(points = {{14, 60}, {5.13479, 60}, {5.13479, 60}, {5.5, 60}}, color = {0, 0, 127}));
  connect(min2.u1, limiter2.y) annotation(Line(points = {{34, 43}, {29.0116, 43}, {29.0116, 59.8203}, {25.5, 59.8203}, {25.5, 60}}, color = {0, 0, 127}));
  connect(add7.y, integrator2.u) annotation(Line(points = {{34.5, 80}, {26.2131, 80}, {26.2131, 80}, {26, 80}}, color = {0, 0, 127}));
  connect(gain6.u, add8.y) annotation(Line(points = {{-26, 70}, {-39.5379, 70}, {-39.5379, 74.5}, {-40, 74.5}}, color = {0, 0, 127}));
  connect(add3.y, add8.u2) annotation(Line(points = {{-54.5, 90}, {-43.389, 90}, {-43.389, 86}, {-43, 86}}, color = {0, 0, 127}));
  connect(add6.y, min2.u2) annotation(Line(points = {{15.5, 40}, {19.2555, 40}, {19.2555, 36.7137}, {34, 36.7137}, {34, 37}}, color = {0, 0, 127}));
  connect(gain5.y, add6.u1) annotation(Line(points = {{-14.5, 40}, {-10.5263, 40}, {-10.5263, 42.8755}, {4, 42.8755}, {4, 43}}, color = {0, 0, 127}));
  connect(add5.u1, constant3.y) annotation(Line(points = {{-46, 43}, {-48.5237, 43}, {-48.5237, 59.8203}, {-54.5, 59.8203}, {-54.5, 60}}, color = {0, 0, 127}));
  connect(transfer_function12.y, add5.u2) annotation(Line(points = {{-55, 40}, {-51.8614, 40}, {-51.8614, 36.9705}, {-46, 36.9705}, {-46, 37}}, color = {0, 0, 127}));
  connect(transfer_function12.u, SLIP) annotation(Line(points = {{-65, 40}, {-120.737, 40}, {-120.737, 0}, {-102, 0}}, color = {0, 0, 127}));
  connect(min1.u1, min2.y) annotation(Line(points = {{54, 3}, {49.8074, 3}, {49.8074, 40.0513}, {45.5, 40.0513}, {45.5, 40}}, color = {0, 0, 127}));
  connect(add32.y, min1.u2) annotation(Line(points = {{45.5, -10}, {53.4018, -10}, {53.4018, -3}, {54, -3}}, color = {0, 0, 127}));
  connect(add4.y, integrator1.u) annotation(Line(points = {{54.5, -30}, {46.4698, -30}, {46.4698, -30}, {46, -30}}, color = {0, 0, 127}));
  connect(add4.u1, integrator1.y) annotation(Line(points = {{66, -27}, {71.3736, -27}, {71.3736, -20.0257}, {27.9846, -20.0257}, {27.9846, -30.0385}, {34.5, -30.0385}, {34.5, -30}}, color = {0, 0, 127}));
  connect(integrator1.y, add32.u3) annotation(Line(points = {{34.5, -30}, {27.9846, -30}, {27.9846, -14.1207}, {34, -14.1207}, {34, -14}}, color = {0, 0, 127}));
  connect(add32.u1, transfer_function11.y) annotation(Line(points = {{34, -6}, {29.525, -6}, {29.525, 9.7561}, {25, 9.7561}, {25, 10}}, color = {0, 0, 127}));
  connect(gain4.y, add32.u2) annotation(Line(points = {{25.5, -10}, {33.1194, -10}, {33.1194, -10}, {34, -10}}, color = {0, 0, 127}));
  connect(transfer_function11.u, limiter1.y) annotation(Line(points = {{15, 10}, {8.72914, 10}, {8.72914, -10.0128}, {5.5, -10.0128}, {5.5, -10}}, color = {0, 0, 127}));
  connect(limiter1.y, gain4.u) annotation(Line(points = {{5.5, -10}, {13.3504, -10}, {13.3504, -10}, {14, -10}}, color = {0, 0, 127}));
  connect(deadzone1.y, limiter1.u) annotation(Line(points = {{-14.5, -10}, {-6.16175, -10}, {-6.16175, -10}, {-6, -10}}, color = {0, 0, 127}));
  connect(add31.y, deadzone1.u) annotation(Line(points = {{-34.5, -10}, {-26.4442, -10}, {-26.4442, -10}, {-26, -10}}, color = {0, 0, 127}));
  connect(constant2.y, add3.u1) annotation(Line(points = {{-74.5, 100}, {-67.009, 100}, {-67.009, 93}, {-66, 93}}, color = {0, 0, 127}));
  connect(gain3.y, add3.u2) annotation(Line(points = {{-74.5, 80}, {-67.2657, 80}, {-67.2657, 87}, {-66, 87}}, color = {0, 0, 127}));
  connect(constant1.y, gain3.u) annotation(Line(points = {{-100.5, 100}, {-88.751, 100}, {-88.751, 80}, {-86, 80}}, color = {0, 0, 127}));
  connect(add31.u1, SLIP) annotation(Line(points = {{-46, -6}, {-59, -6}, {-59, 12}, {-121, 12}, {-121, 0}, {-102, 0}}, color = {0, 0, 127}));
  connect(gain2.y, add31.u3) annotation(Line(points = {{-50, -24.5}, {-50, -14.1207}, {-46, -14.1207}, {-46, -14}}, color = {0, 0, 127}));
  connect(multiplexer1.y, gain2.u) annotation(Line(points = {{-50, -45}, {-50, -36.457}, {-50, -36.457}, {-50, -36}}, color = {0, 0, 127}));
  connect(add2.y, add31.u2) annotation(Line(points = {{-64.5, -10}, {-46.4698, -10}, {-46.4698, -10}, {-46, -10}}, color = {0, 0, 127}));
  connect(multiplexer1.u[4], lag1.y) annotation(Line(points = {{-50, -55}, {-50, -75.4814}, {-51.0911, -75.4814}, {-51.0911, -90.1155}, {-55, -90.1155}, {-55, -90}}, color = {0, 0, 127}));
  connect(add13.y, add2.u1) annotation(Line(points={{-124.5,-10},{-87.9177,-10},
          {-87.9177,-6.94087},{-76,-6.94087},{-76,-7}},                                                                                                  color = {0, 0, 127}));
  connect(dGREF, add13.u1) annotation(Line(points={{-100,80},{-142.674,80},{-142.674,
          -6.94087},{-136,-6.94087},{-136,-7}},                                                                                                   color = {0, 0, 127}));
  connect(const.y, add1.u1) annotation(Line(points = {{-94.5, -70}, {-82.9268, -70}, {-82.9268, -66}, {-83, -66}}, color = {0, 0, 127}));
  connect(lag1.y, add1.u2) annotation(Line(points = {{-55, -90}, {-51.0911, -90}, {-51.0911, -75.7381}, {-77.2786, -75.7381}, {-77.2786, -66}, {-77, -66}}, color = {0, 0, 127}));
  gain1.u = PELEC;
  connect(gain1.y, lag1.u) annotation(Line(points = {{-74.5, -90}, {-65.2118, -90}, {-65.2118, -90}, {-65, -90}}, color = {0, 0, 127}));
  connect(add5.y, gain5.u) annotation(Line(points = {{-34.5, 40}, {-26, 40}}, color = {0, 0, 127}));
  connect(constant8.y, PMECH_LP) annotation(Line(points = {{68.5, -80}, {83, -80}, {83, -60}, {104, -60}}, color = {0, 0, 127}));
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1}), graphics={  Rectangle(origin = {48.79, 26.57}, lineColor = {255, 0, 0}, pattern = LinePattern.Dash,
            lineThickness =                                                                                                                                                                                                        1, extent = {{-18.52, 33.33}, {18.52, -33.33}}), Text(origin = {39.2861, 53.6229}, extent = {{-10.31, 7.89}, {35.4302, -4.02535}}, textString = "Low value select"), Text(origin = {83.09, 114.98}, lineColor = {255, 0, 0}, extent = {{-3.86, 0.64}, {19.32, -4.51}}, textString = "(1+u)^Dm"), Rectangle(origin = {80.3525, 120.77}, extent = {{-1.44924, -3.54259}, {23.0269, -11.2719}}), Line(origin = {108.854, 111.753}, points = {{5.79697, -1.28822}, {-0.966162, -1.28822}, {-0.966162, 1.28822}, {-5.79697, 1.28822}, {-5.79697, 1.28822}}), Line(origin = {73.4283, 113.041}, points = {{5.47492, 0}, {-7.40724, 0}}), Text(origin = {-44.3039, -90.6566}, lineColor = {255, 0, 0}, extent = {{-6.49, 4.56}, {1.7064, -2.73768}}, textString = "S0"), Text(origin = {-73.2567, -28.2645}, lineColor = {255, 0, 0}, extent = {{-6.49, 4.56}, {1.71, -2.74}}, textString = "S7"), Text(origin = {36.74, 4.74}, lineColor = {255, 0, 0}, extent = {{-6.49, 4.56}, {1.71, -2.74}}, textString = "S1"), Text(origin = {26.92, -29.22}, lineColor = {255, 0, 0}, extent = {{-6.49, 4.56}, {1.71, -2.74}}, textString = "S2"), Text(origin = {117.33, 6.98}, lineColor = {255, 0, 0}, extent = {{-6.49, 4.56}, {1.71, -2.74}}, textString = "S3"), Text(origin = {163.093, 72.3367}, lineColor = {255, 0, 0}, extent = {{-6.49, 4.56}, {1.71, -2.74}}, textString = "S4"), Text(origin = {-1.62, 83.25}, lineColor = {255, 0, 0}, extent = {{-6.49, 4.56}, {1.71, -2.74}}, textString = "S6"), Text(origin = {8.95, 113.25}, lineColor = {255, 0, 0}, extent = {{-6.49, 4.56}, {1.71, -2.74}}, textString = "S5"), Text(origin = {31.81, 114.11}, lineColor = {255, 0, 0}, extent = {{-6.49, 4.56}, {1.71, -2.74}}, textString = "S9"), Text(origin = {-47.94, 30.21}, lineColor = {255, 0, 0}, extent = {{-6.49, 4.56}, {1.71, -2.74}}, textString = "S8")}), Documentation(info = "<html>

<p>
In this model, Pref is the input reference and Pmwset is constant, intialized to be equal to PELEC at t = 0.
</p>
<p>
<b>Notes</b>:
</p>
<ul>
<li>In current version, Kpload and Kigov could not be zero.</li>
<li>Fixeddelay block for Teng is currently removed to be compatible with Dymola multi-threading.</li>
</ul>
<p>
The block digaram of the model is shown below:
</p>
<img src=\"modelica://OpalRT/resource/Turbine-Governor/GGOV1.png\"
alt=\"TGOV1.png\"><br>
<p>
</html>"), experiment(StartTime = 0, StopTime = 0.01, Tolerance = 1e-06, Interval = 0.01), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1})));
end GGOV1;
