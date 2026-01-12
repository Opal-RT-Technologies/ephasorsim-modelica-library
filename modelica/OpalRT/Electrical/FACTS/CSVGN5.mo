within OpalRT.Electrical.FACTS;
model CSVGN5 "Static Var Compensator"
  constant Real pi = Modelica.Constants.pi;
  parameter Real Vt_abs = 1.03;
  parameter Real Vt_ang = -10.06;
  parameter Real P_gen = 0 "Bus Active Power, MW";
  parameter Real Q_gen = 100 "Bus Reactive Power, MVAR";
  parameter Real SB = 1000 "Machine Base Power, MVA";
  parameter Real fn = 50 "Nominal frequency";
  parameter Real ZSOURCE_RE = 0 "Machine source impedence";
  parameter Real ZSOURCE_IM = 0 "Machine source impedence";
  parameter Real TS1 = 0;
  parameter Real VEMAX = 0.15;
  parameter Real TS2 = 0.1;
  parameter Real TS3 = 5 ">0";
  parameter Real TS4 = 0;
  parameter Real TS5 = 0;
  parameter Real KSVS = 400;
  parameter Real KSD = 0;
  parameter Real BMAX = 1;
  parameter Real BpMAX = 1;
  parameter Real BpMIN = -0.5;
  parameter Real BMIN = -0.5;
  parameter Real TS6 = 0.05 ">0";
  parameter Real DV = 0.15;
  OpalRT.NonElectrical.Connector.PwPin p annotation(Placement(visible = true, transformation(origin = {100, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1(k2 = -1) annotation(Placement(visible = true, transformation(origin = {-40, 70}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag lag1(T = TS1, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = Vt_abs) annotation(Placement(visible = true, transformation(origin = {-70, 70}, extent = {{-7.5, -7.5}, {7.5, 7.5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add2(k2 = +1) annotation(Placement(visible = true, transformation(origin = {-10, 70}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiter1(uMax = VEMAX, uMin = -VEMAX) annotation(Placement(visible = true, transformation(origin = {10, 70}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.LeadLag lead_lag1(TA = TS2, TB = TS3, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = B0 / KSVS) annotation(Placement(visible = true, transformation(origin = {30, 70}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.LeadLag lead_lag2(TA = TS4, TB = TS5, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = B0 / KSVS) annotation(Placement(visible = true, transformation(origin = {50, 70}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = KSVS) annotation(Placement(visible = true, transformation(origin = {70, 70}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));

  OpalRT.Electrical.FACTS.Internal.FastOverride fastoverride1(
    DV=DV,
    KSD=KSD,
    KSVS=KSVS,
    BpMAX=BpMAX,
    BpMIN=BpMIN) annotation (Placement(visible=true, transformation(
        origin={-40,10},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunctionNonWindup.Lag_NonWindupLimit lag_non_windup_limit1(TI = TS6, VRMAX = BMAX, VRMIN = BMIN, y_init = B0) annotation(Placement(visible = true, transformation(origin = {0, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput VOTHSG annotation(Placement(visible = true, transformation(origin = {-40, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput VREF annotation(Placement(visible = true, transformation(origin = {-100, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput VREF0 annotation(Placement(visible = true, transformation(origin = {-100, 70}, extent = {{10, -10}, {-10, 10}}, rotation = 0), iconTransformation(origin = {-100, 40}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Real BSVC(start = B0);
  Real q;
  parameter Real q0(fixed = false);
  parameter Real B0(fixed = false);
  parameter Real vr0(fixed = false);
  parameter Real vi0(fixed = false);
  parameter Real ii0(fixed = false);
  parameter Real ir0(fixed = false);
  Real ETERM;
  Modelica.Blocks.Interfaces.RealOutput ANGLE annotation(Placement(visible = true, transformation(origin = {100, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
initial equation
  q0 = Q_gen / SB;
  B0 = q0 / Vt_abs ^ 2;
  vr0 = Vt_abs * cos(Vt_ang * pi / 180) "Terminal voltage initialization, real part, p.u.";
  vi0 = Vt_abs * sin(Vt_ang * pi / 180) "Terminal voltage initialization, imag part, p.u.";
  ir0 = -B0 * vi0;
  ii0 = B0 * vr0;
equation
  ETERM = (p.vr ^ 2 + p.vi ^ 2) ^ 0.5;
  ETERM = lag1.u;
  q = -(p.vr * p.ii - p.vi * p.ir);
  p.ir = BSVC * p.vi;
  p.ii = -BSVC * p.vr;
  lag_non_windup_limit1.y = BSVC;
  VREF0 = Vt_abs + B0 / KSVS;
  ANGLE = 0;
  connect(fastoverride1.BpR, lag_non_windup_limit1.u) annotation(Line(points = {{-30, 10}, {-11.0398, 10}, {-11.0398, 10}, {-11, 10}}, color = {0, 0, 127}));
  connect(fastoverride1.BR, gain1.y) annotation(Line(points = {{-50, 16}, {-56.4827, 16}, {-56.4827, 53.4018}, {84.2105, 53.4018}, {84.2105, 70.3466}, {75.5, 70.3466}, {75.5, 70}}, color = {0, 0, 127}));
  connect(fastoverride1.VERR, add1.y) annotation(Line(points = {{-50, 6}, {-62.3877, 6}, {-62.3877, 57.2529}, {-27.7279, 57.2529}, {-27.7279, 70.0899}, {-34.5, 70.0899}, {-34.5, 70}}, color = {0, 0, 127}));
  connect(lead_lag2.y, gain1.u) annotation(Line(points = {{55, 70}, {63.8344, 70}, {63.8344, 70}, {64, 70}}, color = {0, 0, 127}));
  connect(lead_lag1.y, lead_lag2.u) annotation(Line(points = {{35, 70}, {44.8802, 70}, {44.8802, 70}, {45, 70}}, color = {0, 0, 127}));
  connect(limiter1.y, lead_lag1.u) annotation(Line(points = {{15.5, 70}, {25.0545, 70}, {25.0545, 70}, {25, 70}}, color = {0, 0, 127}));
  connect(add2.y, limiter1.u) annotation(Line(points = {{-4.5, 70}, {3.92157, 70}, {3.92157, 70}, {4, 70}}, color = {0, 0, 127}));
  connect(VOTHSG, add2.u1) annotation(Line(points = {{-40, 90}, {-21.7865, 90}, {-21.7865, 73.2026}, {-16, 73.2026}, {-16, 73}}, color = {0, 0, 127}));
  connect(add2.u2, add1.y) annotation(Line(points = {{-16, 67}, {-27.6688, 67}, {-27.6688, 70.3704}, {-34.5, 70.3704}, {-34.5, 70}}, color = {0, 0, 127}));
  connect(VREF, add1.u1) annotation(Line(points = {{-100, 90}, {-50.5447, 90}, {-50.5447, 72.7669}, {-46, 72.7669}, {-46, 73}}, color = {0, 0, 127}));
  connect(lag1.y, add1.u2) annotation(Line(points = {{-62.5, 70}, {-57.5163, 70}, {-57.5163, 67.1024}, {-46, 67.1024}, {-46, 67}}, color = {0, 0, 127}));
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1})), experiment(StartTime = 0, StopTime = 100, Tolerance = 1e-06, Interval = 0.01), Documentation(info = "<html>

<img src=\"modelica://OpalRT/resource/Electrical/FACTS/CSVGN5.png\"


</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1}), graphics={  Rectangle(origin = {0.385109, -0.513479}, extent = {{-99.7433, 99.8716}, {99.7433, -99.8716}}), Text(origin = {-5.77979, 3.5987}, extent = {{-63.03, 22.59}, {63.03, -22.59}}, textString = "CSVGN5"), Text(origin = {-59.1783, -69.3226}, extent = {{-32.218, 9.24348}, {39.15, -8.73}}, textString = "VOTHSG"), Text(origin = {-58.4226, 72.1233}, extent = {{-32.22, 9.24}, {12.9626, -9.24348}}, textString = "VREF"), Text(origin = {-51.7587, 41.0461}, extent = {{-32.22, 9.24}, {12.96, -9.24}}, textString = "VREF0"), Text(origin = {69.4, 61.29}, extent = {{-32.22, 9.24}, {12.96, -9.24}}, textString = "ANGLE")}));
end CSVGN5;
