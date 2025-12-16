within OpalRT.Electrical.FACTS;
model CSTCNT "FACTS Device Static Condenser (STATCON)"
  constant Real pi = Modelica.Constants.pi;
  parameter Integer IBUS = 100 "Located system bus";
  parameter String ID = "M1" "Machine Identifier";
  parameter Real P_gen = 1100 "Bus Active Power, MW";
  parameter Real Q_gen = 1.0 "Initial reactive power(MVAR)";
  parameter Real Vt_abs = 1.0 "Initial Voltage(power flow result)";
  parameter Real Vt_ang = 0 "degree";
  parameter Real SB = 1000 "Machine Base Power, MVA";
  parameter Real fn = 50 "Nominal frequency";
  parameter Real ZSOURCE_RE = 0 "Machine source impedence";
  parameter Real Remote_bus = 0 "ICONM : # for voltage control; 0 for local control" annotation(Dialog(tab = "ICONs"));
  parameter Real T1 = 0.1;
  parameter Real T2 = 0.1;
  parameter Real T3 = 0.1;
  parameter Real T4 = 0.1;
  parameter Real K = 40;
  parameter Real Droop = 0.025 "Droop";
  parameter Real Vmax = 999;
  parameter Real Vmin = -999;
  parameter Real ICMAX = 1.25 "MaX capacitive current";
  parameter Real ILMAX = 1.25 "MaX inductive current";
  parameter Real Vcutout = 0.2 "cut out voltage";
  parameter Real Elimit = 1.2;
  parameter Real Xt = 0.1 "transformer inductance";
  parameter Real Acc = 0.5;
  Real VT;
  Real ICMAXf;
  Real ILMAXf;
  Real delta;
  Real t;
  Real isre;
  Real isim;
  Modelica.Blocks.Math.Add add1 annotation(Placement(visible = true, transformation(origin = {-40, 20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add3 add31(k1 = -1, k2 = -1, k3 = -1) annotation(Placement(visible = true, transformation(origin = {-60, 0}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain3(k = Droop) annotation(Placement(visible = true, transformation(origin = {0, -20}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add2(k1 = -1) annotation(Placement(visible = true, transformation(origin = {20, 20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain2(k = 1 / Xt) annotation(Placement(visible = true, transformation(origin = {40, 20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Nonlinear.VariableLimiter var_limit1 annotation(Placement(visible = true, transformation(origin = {60, 20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain4(k = 1) annotation(Placement(visible = true, transformation(origin = {80, 20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.SignalRouting.Multiplexer multiplexer1(n = 2, s = if Remote_bus == 0 then 1 else 2) annotation(Placement(visible = true, transformation(origin = {-80, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.Connector.PwPin p annotation(Placement(visible = true, transformation(origin = {100, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput othersignal annotation(Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-7.5, 7.5}, {7.5, -7.5}}, rotation = 0), iconTransformation(origin = {-100, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunctionNonWindup.DoubleLeadLag_NonWindupLimit no_windup_leadlag_trandfer_function_2order1(T1 = T1, T2 = T2, T3 = T3, T4 = T4, VMAX = Vmax, VMIN = Vmin) annotation(Placement(visible = true, transformation(origin = {-20, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput Eterm annotation(Placement(visible = true, transformation(origin = {100, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput Vref0 annotation(Placement(visible = true, transformation(origin = {100, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Vmag_local annotation(Placement(visible = true, transformation(origin = {-100, 20}, extent = {{-5, -5}, {5, 5}}, rotation = 0), iconTransformation(origin = {-100, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Vmag_REMOTE annotation(Placement(visible = true, transformation(origin = {-100, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 0), iconTransformation(origin = {-100, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Vref annotation(Placement(visible = true, transformation(origin = {-100, 80}, extent = {{-5, -5}, {5, 5}}, rotation = 0), iconTransformation(origin = {-100, 40}, extent = {{-12.5, -12.5}, {12.5, 12.5}}, rotation = 0)));

  OpalRT.NonElectrical.Math.Continuous.TransferFunctionNonWindup.Integrator_NonWindupLimit non_windup_integrator1(KI = K, VRMAX = VU0, VRMIN = VL0, y_init = LimitV0) annotation(Placement(visible = true, transformation(origin = {0, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
protected
  parameter Real LimitV0(fixed = false);
  parameter Real VREF0(fixed = false);
  parameter Real Vt0(fixed = false);
  parameter Real Vremote0(fixed = false);
  parameter Real Var0(fixed = false);
  parameter Real vr0(fixed = false);
  parameter Real vi0(fixed = false);
  parameter Real ii0(fixed = false);
  parameter Real ir0(fixed = false);
  parameter Real Vdelta0(fixed = false);
  parameter Real InitialCurrent(fixed = false);
  parameter Real VU0(fixed = false);
  parameter Real VL0(fixed = false);
initial equation
  Vt0 = Vt_abs;
  Vdelta0 = atan2(p.vi, p.vr);
  Var0 = othersignal;
  InitialCurrent = Q_gen / SB / Vt_abs;
  Vremote0 = Vmag_REMOTE;
  if Remote_bus == 0 then
    VREF0 = InitialCurrent * Droop + Var0 + Vt0;
  else
    VREF0 = InitialCurrent * Droop + Var0 + Vremote0;
  end if;
  vr0 = Vt0 * cos(Vt_ang / 180 * pi);
  vi0 = Vt0 * sin(Vt_ang / 180 * pi);
  0 = ir0 * vr0 + ii0 * vi0;
  InitialCurrent = (ir0 * vi0 - ii0 * vr0) / Vt_abs;
  (LimitV0, VU0, VL0) =Internal.nonWindupLimitInitialization(
    ICMAX,
    ILMAX,
    Vcutout,
    Xt,
    Elimit,
    Vt0,
    InitialCurrent);
  t = 0;
equation
  connect(non_windup_integrator1.y, add2.u2) annotation(Line(points = {{5, 20}, {8.11908, 20}, {8.11908, 17.0501}, {14, 17.0501}, {14, 17}}, color = {0, 0, 127}));
  connect(non_windup_integrator1.u, no_windup_leadlag_trandfer_function_2order1.y) annotation(Line(points = {{-5, 20}, {-13.5318, 20}, {-13.5318, 20}, {-10, 20}}, color = {0, 0, 127}));
  connect(Vmag_REMOTE, multiplexer1.u[2]) annotation(Line(points = {{-100, 40}, {-89.9297, 40}, {-89.9297, 20.5}, {-90, 20.5}}, color = {0, 0, 127}));
  connect(Vmag_local, multiplexer1.u[1]) annotation(Line(points = {{-100, 20}, {-89.4614, 20}, {-89.4614, 19.5}, {-90, 19.5}}, color = {0, 0, 127}));
  connect(no_windup_leadlag_trandfer_function_2order1.u, add1.y) annotation(Line(points = {{-30, 20}, {-34.6241, 20}, {-34.6241, 20}, {-34.5, 20}}, color = {0, 0, 127}));
  Eterm = VT;
  Vref0 = VREF0;
  VT = if t < Modelica.Constants.eps then Vt_abs else sqrt(p.vr * p.vr + p.vi * p.vi);
  delta = atan2(p.vi, p.vr);
  if VT >= Vcutout then
    ICMAXf = ICMAX;
  else
    ICMAXf = ICMAX * VT / Vcutout;
  end if;
  if VT >= Vcutout then
    ILMAXf = ILMAX;
  else
    ILMAXf = ILMAX * VT / Vcutout;
  end if;
  ICMAXf = var_limit1.uMax;
  ILMAXf = -1 * var_limit1.uMin;
  VT = add2.u1;
  0 = isre * p.vr + isim * p.vi;
  gain4.y = (isre * p.vi - isim * p.vr) / VT;
  der(t) = 1;
  p.ir = if t < Modelica.Constants.eps then ir0 else isre;
  p.ii = if t < Modelica.Constants.eps then ii0 else isim;
  connect(gain3.y, add31.u3) annotation(Line(points = {{-5.5, -20}, {-74.9415, -20}, {-74.9415, -4.21546}, {-66, -4.21546}, {-66, -4}}, color = {0, 0, 127}));
  connect(add31.u1, multiplexer1.y) annotation(Line(points = {{-66, 4}, {-67.9157, 4}, {-67.9157, 20.6089}, {-70, 20.6089}, {-70, 20}}, color = {0, 0, 127}));
  connect(othersignal, add31.u2) annotation(Line(points = {{-100, 0}, {-74.4731, 0}, {-74.4731, -0.936768}, {-66, -0.936768}, {-66, 0}}, color = {0, 0, 127}));
  connect(Vref, add1.u1) annotation(Line(points = {{-100, 80}, {-56.5371, 80}, {-56.5371, 22.9682}, {-46, 22.9682}, {-46, 23}}, color = {0, 0, 127}));
  connect(gain4.u, var_limit1.y) annotation(Line(points = {{74, 20}, {65.2297, 20}, {65.2297, 20}, {65.5, 20}}, color = {0, 0, 127}));
  connect(gain2.y, var_limit1.u) annotation(Line(points = {{45.5, 20}, {53.5689, 20}, {53.5689, 20}, {54, 20}}, color = {0, 0, 127}));
  connect(gain3.u, var_limit1.y) annotation(Line(points = {{6, -20}, {71.2367, -20}, {71.2367, 19.788}, {65.5, 19.788}, {65.5, 20}}, color = {0, 0, 127}));
  connect(add2.y, gain2.u) annotation(Line(points = {{25.5, 20}, {33.4276, 20}, {33.4276, 20}, {34, 20}}, color = {0, 0, 127}));
  connect(add31.y, add1.u2) annotation(Line(points = {{-54.5, 0}, {-49.258, 0}, {-49.258, 18.0212}, {-45.7244, 18.0212}, {-45.7244, 17}, {-46, 17}}, color = {0, 0, 127}));
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Rectangle(origin = {0.270636, -0.135318}, extent = {{-99.594, 99.7294}, {99.594, -99.7294}}), Text(origin = {3.40223, 6.5364}, extent = {{-69.55, 35.18}, {69.55, -35.18}}, textString = "CSTCNT"), Text(origin = {-61.0257, -83.084}, extent = {{-29.63, 7.85}, {29.63, -7.85}}, textString = "other signal"), Text(origin = {-62.1367, 45.288}, extent = {{-25.17, 7.58}, {25.17, -7.58}}, textString = "Vref"), Text(origin = {-58.9099, -43.5755}, extent = {{-25.03, 6.36}, {25.03, -6.36}}, textString = "Vmag_remote"), Text(origin = {-60.2001, 79.7981}, extent = {{-25.03, 6.36}, {25.03, -6.36}}, textString = "Vmag_local"), Text(origin = {68.88, -79.84}, extent = {{-19.08, 8.93}, {19.08, -8.93}}, textString = "pin"), Text(origin = {66.9572, 82.5103}, extent = {{-19.96, 9.01}, {19.96, -9.01}}, textString = "Eterm"), Text(origin = {65.0136, 40.6369}, extent = {{-21.2, 7.77}, {21.2, -7.77}}, textString = "Vref0")}), experiment(StartTime = 0, StopTime = 0.06, Tolerance = 1e-6, Interval = 0.001), Documentation(info = "<html>
<p>
Note: Currently the non-windup integrator with variable limits is replaced with non-windup integrator with fixed limits and the limits are calculated based on initial values.
</p>

<img src=\"modelica://OpalRT/resource/Electrical/FACTS/CSTCNT.png\"


</html>"));
end CSTCNT;
