within OpalRT.Electrical.Renewable.WindTurbineGenerator.WT4;
model WT4G1 "Wind Generator Model with Power Converter (Type 4)"

  parameter Integer IBUS = 100 "Located system bus";
  parameter String ID = "M1" "Machine Identifier";
  parameter Real SB = 1000 "Machine base power (MVA)";
  parameter Real fn = 60 "FReqnuency(HZ)";
  parameter Real Vt_abs = 1.03 "initial voltage in p.u.";
  parameter Real Vt_ang = -10.6 "initial bus anglein degree";
  parameter Real P_gen = 600 "initial P in Mvar.";
  parameter Real Q_gen = 93.6 "initial Q in Mvar.";
  constant Real pi = Modelica.Constants.pi;
  parameter Real TIQCmd = 0.02 "Converter time constant for IQcmd, second";
  parameter Real TIPCmd = 0.02 " Converter time constant for IPcmd, second";
  parameter Real VLVPL1 = 0.4 "Low Voltage power Logic (LVPL), voltage 1 (pu)";
  parameter Real VLVPL2 = 0.9 "LVPL voltage 2 (pu)";
  parameter Real GLVPL = 1.11 "LVPL gain";
  parameter Real VHVRCR = 1.2 "High Voltage reactive Current (HVRC) logic,voltage (pu)";
  parameter Real CURHVRCR = 2.0 "HVRC logic, current (pu)";
  parameter Real RIp_LVPL = 2.0 "Rate of active current change";
  parameter Real T_LVPL = 0.02 "Voltage sensor for LVPL, second";
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag Vtlag(y_start = Vt_abs, T = T_LVPL, u(start = Vt_abs)) annotation(Placement(visible = true, transformation(origin = {0, -20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiter1(uMax = RIp_LVPL, uMin = -Modelica.Constants.inf) annotation(Placement(visible = true, transformation(origin = {-60, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.VariableLimiter variablelimiter1 annotation(Placement(visible = true, transformation(origin = {20, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator integrator1(k = 1 / TIPCmd, y_start = I_pcmd0, initType = Modelica.Blocks.Types.Init.InitialOutput) annotation(Placement(visible = true, transformation(origin = {-20, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback feedback1 annotation(Placement(visible = true, transformation(origin = {-80, 40}, extent = {{-2.5, -2.5}, {2.5, 2.5}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput IQCMD annotation(Placement(visible = true, transformation(origin = {-100, 80}, extent = {{-5, -5}, {5, 5}}, rotation = 0), iconTransformation(origin = {-100, 40}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput IPCMD annotation(Placement(visible = true, transformation(origin = {-100, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 0), iconTransformation(origin = {-100, -20}, extent = {{-12.5, -12.5}, {12.5, 12.5}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = -Modelica.Constants.inf) annotation(Placement(visible = true, transformation(origin = {-20, 20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag lag1(y_start = I_qcmd0, T = TIQCmd) annotation(Placement(visible = true, transformation(origin = {-60, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput Iqcmd00 annotation(Placement(visible = true, transformation(origin = {-20, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 90), iconTransformation(origin = {-60, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  OpalRT.Electrical.Renewable.WindTurbineGenerator.WT4.Internal.LVPL lvp1(
    VLVPL1=VLVPL1,
    VLVPL2=VLVPL2,
    GLVPL=GLVPL) annotation (Placement(visible=true, transformation(
        origin={-40,-20},
        extent={{10,-10},{-10,10}},
        rotation=0)));
  OpalRT.Electrical.Renewable.WindTurbineGenerator.WT4.Internal.LVACL lvacl1
    annotation (Placement(visible=true, transformation(
        origin={60,40},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  OpalRT.Electrical.Renewable.WindTurbineGenerator.WT4.Internal.HVRCL hvrcl1(
    VHVRCR=VHVRCR,
    CURHVRCR=CURHVRCR,
    accel=1) annotation (Placement(visible=true, transformation(
        origin={40,80},
        extent={{-12,-12},{12,12}},
        rotation=0)));
  OpalRT.Electrical.Load.ConstantImpedance2 rx_load1(R = 0, X = 999999) annotation(Placement(visible = true, transformation(origin = {120, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  OpalRT.NonElectrical.Connector.PwPin p annotation(Placement(visible = true, transformation(origin = {100, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput IqL annotation(Placement(visible = true, transformation(origin = {100, 80}, extent = {{-5, -5}, {5, 5}}, rotation = 0), iconTransformation(origin = {100, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput IdL annotation(Placement(visible = true, transformation(origin = {100, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 0), iconTransformation(origin = {100, 40}, extent = {{-12.5, -12.5}, {12.5, 12.5}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput QELEC annotation(Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput PELEC annotation(Placement(visible = true, transformation(origin = {100, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput Ipcmd00 annotation(Placement(visible = true, transformation(origin = {0, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 90), iconTransformation(origin = {0, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Interfaces.RealOutput VTt annotation(Placement(visible = true, transformation(origin = {80, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 90), iconTransformation(origin = {40, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
protected
  parameter Real p0(fixed = false) "initial value of bus active power in p.u. machinebase";
  parameter Real q0(fixed = false) "initial value of bus reactive power in p.u. machinebase";
  parameter Real vr0(fixed = false) "Real component of initial terminal voltage";
  parameter Real vi0(fixed = false) "Imaginary component of intitial terminal voltage";
  parameter Real ir0(fixed = false) "Real component of initial armature current, M_b";
  parameter Real ii0(fixed = false) "Imaginary component of initial armature current, M_b";
  parameter Real Isr0(fixed = false) "Sorce current re M_b";
  parameter Real Isi0(fixed = false) "Sorce current im M_b";
  parameter Real anglev_rad0(fixed = false) "initial value of bus angle in rad";
  parameter Real Id0(fixed = false);
  parameter Real Iq0(fixed = false);
  parameter Real I_pcmd0(fixed = false);
  parameter Real I_qcmd0(fixed = false);
  Real delta(start = anglev_rad0) "Bus voltage angle dynamic (rad) ";
  Real Isre;
  Real Isim;
  Real t;
  Real VT;
initial equation
  p0 = P_gen / SB "initial value of bus active power in p.u. machinebase";
  q0 = Q_gen / SB "initial value of bus reactive power in p.u. machinebase";
  vr0 = Vt_abs * cos(anglev_rad0) "Real component of initial terminal voltage";
  vi0 = Vt_abs * sin(anglev_rad0) "Imaginary component of intitial terminal voltage";
  ir0 = (p0 * vr0 + q0 * vi0) / Vt_abs ^ 2;
  ii0 = (p0 * vi0 - q0 * vr0) / Vt_abs ^ 2;
  Isr0 = ir0 "Sorce current re M_b";
  Isi0 = ii0 "Sorce current im M_b";
  anglev_rad0 = Vt_ang * pi / 180;
  Id0 = Isr0 * cos(anglev_rad0) + Isi0 * sin(anglev_rad0);
  Iq0 = Isr0 * sin(anglev_rad0) - Isi0 * cos(anglev_rad0);
  I_qcmd0 = Iq0;
  I_pcmd0 = Id0;
  t = 0;
equation
  connect(hvrcl1.Iq_HVRCL, IqL) annotation(Line(points = {{55, 80}, {96.3554, 80}, {96.3554, 80}, {100, 80}}, color = {0, 0, 127}));
  connect(lag1.y, hvrcl1.Iq) annotation(Line(points = {{-50, 80}, {28.4738, 80}, {28.4738, 80}, {29.5, 80}}, color = {0, 0, 127}));
  connect(lvacl1.Ip_LVPL, variablelimiter1.y) annotation(Line(points = {{51, 40}, {25.7403, 40}, {25.7403, 40}, {25.5, 40}}, color = {0, 0, 127}));
  connect(lvacl1.Ip_LVACL, IdL) annotation(Line(points = {{71, 40}, {96.3554, 40}, {96.3554, 40}, {100, 40}}, color = {0, 0, 127}));
  connect(lvp1.LVPL, variablelimiter1.limit1) annotation(Line(points = {{-51, -20}, {-86.3326, -20}, {-86.3326, 58.3144}, {9.33941, 58.3144}, {9.33941, 44.1913}, {13.4396, 44.1913}, {13.4396, 44}, {14, 44}}, color = {0, 0, 127}));
  connect(Vtlag.y, lvp1.Vt) annotation(Line(points = {{-10, -20}, {-30.5239, -20}, {-30.5239, -20}, {-31, -20}}, color = {0, 0, 127}));
  Iqcmd00 = Iq0;
  Ipcmd00 = Id0;
  connect(IQCMD, lag1.u) annotation(Line(points = {{-100, 80}, {-69.0122, 80}, {-69.0122, 80}, {-70, 80}}, color = {0, 0, 127}));
  connect(const.y, variablelimiter1.limit2) annotation(Line(points = {{-14.5, 20}, {5.68336, 20}, {5.68336, 35.9946}, {14, 35.9946}, {14, 36}}, color = {0, 0, 127}));
  connect(feedback1.u2, variablelimiter1.y) annotation(Line(points = {{-80, 38}, {-79.0257, 38}, {-79.0257, 10.5548}, {32.4763, 10.5548}, {32.4763, 40.0541}, {25.5, 40.0541}, {25.5, 40}}, color = {0, 0, 127}));
  connect(integrator1.y, variablelimiter1.u) annotation(Line(points = {{-14.5, 40}, {14.6143, 40}, {14.6143, 40}, {14, 40}}, color = {0, 0, 127}));
  connect(limiter1.y, integrator1.u) annotation(Line(points = {{-54.5, 40}, {-26.2517, 40}, {-26.2517, 40}, {-26, 40}}, color = {0, 0, 127}));
  connect(IPCMD, feedback1.u1) annotation(Line(points = {{-100, 40}, {-81.7321, 40}, {-81.7321, 40}, {-82, 40}}, color = {0, 0, 127}));
  VT = sqrt(p.vr * p.vr + p.vi * p.vi);
  Vtlag.u = VT;
  hvrcl1.Vt = VT;
  lvacl1.Vt = VT;
  der(t) = 1;
  delta = if t < Modelica.Constants.eps then anglev_rad0 else atan2(p.vi, p.vr);
  p.ir = if t < Modelica.Constants.eps then ir0 else Isre;
  p.ii = if t < Modelica.Constants.eps then ii0 else Isim;
  IdL = Isre * cos(delta) + Isim * sin(delta);
  IqL = Isre * sin(delta) - Isim * cos(delta);
  PELEC = p.vr * p.ir + p.vi * p.ii;
  QELEC = p.vi * p.ir - p.vr * p.ii;
  VTt = VT;
  connect(feedback1.y, limiter1.u) annotation(Line(points = {{-77.75, 40}, {-66.0334, 40}, {-66.0334, 40}, {-66, 40}}, color = {0, 0, 127}));
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Documentation(info = "<html>

<p>
WT4 Generator/Converter Module
</p>

<img src=\"modelica://OpalRT/resource/Electrical/Wind_Turbine/WT4/WT4G1.png\"


</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Rectangle(origin = {0.401445, 0}, extent = {{-99.5583, 99.9597}, {99.5583, -99.9597}}), Text(origin = {-1.41, -2.01}, extent = {{-51.18, 14.85}, {51.18, -14.85}}, textString = "WT4G1"), Text(origin = {-55.19, 42.75}, extent = {{-24.69, 11.84}, {24.69, -11.84}}, textString = "WIQCMD"), Text(origin = {-53.26, -29.98}, extent = {{-24.69, 11.84}, {24.69, -11.84}}, textString = "WIPCMD"), Text(origin = {64.43, -80.29}, extent = {{-25.89, 12.04}, {25.89, -12.04}}, textString = "Pwin"), Text(origin = {94.4575, 32.1403}, extent = {{-5.81746, 1.80934}, {-37.94, 17.46}}, textString = "IX"), Text(origin = {74.2336, 81.5517}, extent = {{-13.45, 9.43}, {13.45, -9.43}}, textString = "Iy"), Text(origin = {-62.8384, 78.0378}, extent = {{-24.69, 11.84}, {24.69, -11.84}}, textString = "IQCMD00"), Text(origin = {-1.61836, 78.7967}, extent = {{-24.69, 11.84}, {24.69, -11.84}}, textString = "IPCMD00"), Text(origin = {72.3233, -1.36989}, extent = {{-9.91, 8.43}, {9.91, -8.43}}, textString = "PELEC"), Text(origin = {71.82, -39.23}, extent = {{-9.91, 8.43}, {9.91, -8.43}}, textString = "QELEC"), Text(origin = {31.32, 86.9}, extent = {{26.54, -14.46}, {-0.57, -0.11}}, textString = "VT")}));
end WT4G1;
