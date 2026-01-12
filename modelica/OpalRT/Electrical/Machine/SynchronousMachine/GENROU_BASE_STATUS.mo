within OpalRT.Electrical.Machine.SynchronousMachine;
block GENROU_BASE_STATUS "GENROU model with Special Output to connect to PSS blocks and trip command"
  Modelica.Blocks.Interfaces.RealInput EFD "Field Winding Voltage, p.u." annotation(Placement(visible = true, transformation(origin = {-110, -50}, extent = {{-15, -15}, {15, 15}}, rotation = 0), iconTransformation(origin = {-110, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  import sat_q = OpalRT.NonElectrical.Math.Nonlinear.computeSaturationQuadratic;
  constant Real pi = Modelica.Constants.pi;
  parameter Integer IBUS = 100 "Located system bus";
  parameter String ID = "M1" "Machine Identifier";
  parameter Real P_gen = 1100 "Bus Active Power, MW";
  parameter Real Q_gen = 342.702 "Bus Reactive Power, MVAR";
  parameter Real Vt_abs = 1.03 "Bus Voltage Magnitude, p.u.";
  parameter Real Vt_ang = -10.96 "Bus Voltage Angle, deg.";
  parameter Real SB = 1000 "Machine Base Power, MVA";
  parameter Real fn = 50 "Nominal frequency";
  parameter Real ZSOURCE_RE = 0 "Machine source impedence";
  parameter Real ZSOURCE_IM = Xq_s "Machine source impedence";
  parameter Real Tdo_p = 7 "d-axis transient time constant";
  parameter Real Tdo_s = 0.03 "d-axis sub-transient time constant, s";
  parameter Real Tqo_p = 0.7 "q-axis transient time constant, s";
  parameter Real Tqo_s = 0.04 "d-axis sub-transient time constant, s";
  parameter Real H = 50 "Inertia constant";
  parameter Real D = 0 "Speed damping";
  parameter Real Xd = 0.2 "d-axis reactance, p.u.";
  parameter Real Xq = 0.19 "q-axis reactance, p.u.";
  parameter Real Xd_p = 0.06 "d-axis transient reactance, p.u.";
  parameter Real Xq_p = 0.06 "q-axis transient reactance, p.u.";
  parameter Real Xd_s = 0.02 "d-axis sub-transient reactance, p.u.";
  parameter Real Xq_s = Xd_s "q-axis sub-transient reactance, p.u.";
  parameter Real Xl = 0.03 "Reactance due to the leakage flux which does not cross the air gap, p.u.";
  parameter Real S1 = 0.4 "saturation function value for 1 p.u. input";
  parameter Real S12 = 0.8 "saturation function value for 1.2 p.u. input";
  Real Eq_p, Ed_p;
  Real iq, id;
  Real PSI1_d, PSI2_q;
  Real PSIq_s;
  Real TELEC "The generator rotor electrical torque";
  Real PELEC "The generator electrical active power, p.u.";
  Real QELEC "The generator electrical reactive power, p.u.";
  Real ETERM_ang;
  Real dXadIfd;
  Real PMECH1, EFD1;
  Real PSId_s;
  Real is_d;
  Real is_q;
  Real is_r;
  Real is_i;
  Real PSI_d;
  Real PSI_q;
  Real PSI_s;
  Real ITERM_mag;
  Real ITERM_ang;
  Real ETERM_ang0;
  Real ITERM_ang0;
  discrete Real d_Eq_p;
  discrete Real d_PSI1_d;
  discrete Real d_Ed_p;
  discrete Real d_PSI2_q;
  discrete Real d_SLIP;
  discrete Real d_ANGLE;
  Modelica.Blocks.Interfaces.RealOutput EFD_0 annotation(Placement(visible = true, transformation(origin = {-30, -110}, extent = {{-15, -15}, {15, 15}}, rotation = -90), iconTransformation(origin = {-108.75, -88.75}, extent = {{-8.75, -8.75}, {8.75, 8.75}}, rotation = 180)));
  Modelica.Blocks.Interfaces.RealOutput ANGLE "Rotor Angle, rad" annotation(Placement(visible = true, transformation(origin = {110, -60}, extent = {{-15, -15}, {15, 15}}, rotation = 0), iconTransformation(origin = {110, -50}, extent = {{-11.25, -11.25}, {11.25, 11.25}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput XadIfd annotation(Placement(visible = true, transformation(origin = {110, 60}, extent = {{-15, -15}, {15, 15}}, rotation = 0), iconTransformation(origin = {110, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput SPEED "Rotor Speed, p.u." annotation(Placement(visible = true, transformation(origin = {110, 20}, extent = {{-15, -15}, {15, 15}}, rotation = 0), iconTransformation(origin = {110, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput SLIP annotation(Placement(visible = true, transformation(origin = {110, -20}, extent = {{-15, -15}, {15, 15}}, rotation = 0), iconTransformation(origin = {110, -20}, extent = {{-9.375, -9.375}, {9.375, 9.375}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput ETERM_mag annotation(Placement(visible = true, transformation(origin = {110, 90}, extent = {{-15, -15}, {15, 15}}, rotation = 0), iconTransformation(origin = {109, 79}, extent = {{-12.5, -12.5}, {12.5, 12.5}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput ETERM_mag0 annotation(Placement(visible = true, transformation(origin = {30, -110}, extent = {{-15, -15}, {15, 15}}, rotation = -90), iconTransformation(origin = {-37, -102}, extent = {{-8.75, -8.75}, {8.75, 8.75}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealOutput PSS_OUT[6] annotation(Placement(visible = true, transformation(origin = {56, 110}, extent = {{-19, 19}, {19, -19}}, rotation = 90), iconTransformation(origin = {33, -102}, extent = {{-8.5, -8.5}, {8.5, 8.5}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealInput STATUS annotation(Placement(visible = true, transformation(origin = {-109, -92}, extent = {{-16, -16}, {16, 16}}, rotation = 0), iconTransformation(origin = {0, 98}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  OpalRT.NonElectrical.Connector.PwPin p annotation(Placement(visible = true, transformation(origin = {102, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput PMECH_0 annotation(Placement(visible = true, transformation(origin = {0, -110}, extent = {{-15, -15}, {15, 15}}, rotation = -90), iconTransformation(origin = {-110, 13}, extent = {{-9.6875, -9.6875}, {9.6875, 9.6875}}, rotation = 180)));
  Modelica.Blocks.Interfaces.RealInput PMECH "Mechanical Power, p.u." annotation(Placement(visible = true, transformation(origin = {-110, 50}, extent = {{-15, -15}, {15, 15}}, rotation = 0), iconTransformation(origin = {-110, 35}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput EX_OUT[8] annotation(Placement(visible = true, transformation(origin = {10, 110}, extent = {{-19, 19}, {19, -19}}, rotation = 90), iconTransformation(origin = {-108, 78}, extent = {{8.5, -8.5}, {-8.5, 8.5}}, rotation = 360)));
protected
  parameter Real ws(fixed = false);
  parameter Real P0(fixed = false);
  parameter Real Q0(fixed = false);
  parameter Real vr0(fixed = false);
  parameter Real vi0(fixed = false);
  parameter Real ir0(fixed = false);
  parameter Real ii0(fixed = false);
  parameter Real ZSOURCE_SQR(fixed = false);
  parameter Real es_r0(fixed = false);
  parameter Real es_i0(fixed = false);
  parameter Real ang_P(fixed = false);
  parameter Real ang_I(fixed = false);
  parameter Real ang_PI(fixed = false);
  parameter Real PSI_s0(fixed = false);
  parameter Real It_abs0(fixed = false);
  parameter Real dsat(fixed = false);
  parameter Real a(fixed = false);
  parameter Real b(fixed = false);
  parameter Real ANGLE0(fixed = false);
  parameter Real ANGLE0_DEG(fixed = false);
  parameter Real is_r0(fixed = false);
  parameter Real is_i0(fixed = false);
  parameter Real is_d0(fixed = false);
  parameter Real is_q0(fixed = false);
  parameter Real id0(fixed = false);
  parameter Real iq0(fixed = false);
  parameter Real PSId_s0(fixed = false);
  parameter Real PSIq_s0(fixed = false);
  parameter Real EFD0(fixed = false);
  parameter Real SPEED0(fixed = false);
  parameter Real PMECH0(fixed = false);
  parameter Real Eq_p0(fixed = false);
  parameter Real PSI1_d0(fixed = false);
  parameter Real Ed_p0(fixed = false);
  parameter Real PSI2_q0(fixed = false);
  Integer STATUSI;
initial equation
  ws = 2 * pi * fn "rated angular velocity";
  P0 = P_gen / SB "Bus Active Power, p.u.";
  Q0 = Q_gen / SB "Bus Reactive Power, p.u.";
  vr0 = Vt_abs * cos(Vt_ang * pi / 180) "Terminal voltage initialization, real part, p.u.";
  vi0 = Vt_abs * sin(Vt_ang * pi / 180) "Terminal voltage initialization, imag part, p.u.";
  ir0 = (P0 * vr0 + Q0 * vi0) / Vt_abs ^ 2 "Terminal current initialization, real part, p.u.";
  ii0 = (P0 * vi0 - Q0 * vr0) / Vt_abs ^ 2 "Terminal current initialization, imag part, p.u.";
  ZSOURCE_SQR = ZSOURCE_IM ^ 2 + ZSOURCE_RE ^ 2;
  es_r0 = vr0 + ZSOURCE_RE * ir0 - ZSOURCE_IM * ii0 "sub-transient voltage initialization, real part, p.u.";
  es_i0 = vi0 + ZSOURCE_IM * ir0 + ZSOURCE_RE * ii0 "sub-transient voltage initialization, imag part, p.u.";
  ang_P = atan2(es_i0, es_r0) "sub-transient voltage angle, rad.";
  ang_I = atan2(ii0, ir0) "Terminal current angle, rad.";
  ang_PI = ang_P - ang_I "angle between sub-transient voltage and terminal current";
  PSI_s0 = sqrt(es_r0 ^ 2 + es_i0 ^ 2);
  It_abs0 = sqrt(ir0 ^ 2 + ii0 ^ 2);
  dsat = sat_q(PSI_s0, 1, 1.2, S1, S12);
  a = PSI_s0 + PSI_s0 * dsat * (Xq - Xl) / (Xd - Xl);
  b = It_abs0 * (Xd_s - Xq);
  ANGLE0 = atan(b * cos(ang_PI) / (b * sin(ang_PI) - a)) + ang_P "Rotor angle initialization, rad.";
  ANGLE0_DEG = ANGLE0 / pi * 180 "Rotor angle initialization, deg.";
  is_r0 = ir0 + (vr0 * ZSOURCE_RE + vi0 * ZSOURCE_IM) / ZSOURCE_SQR "Norton current initialization, real part, p.u.";
  is_i0 = ii0 + (vi0 * ZSOURCE_RE - vr0 * ZSOURCE_IM) / ZSOURCE_SQR "Norton current initialization, imag part, p.u.";
  is_d0 = sin(ANGLE0) * is_r0 - cos(ANGLE0) * is_i0 "Norton current initialization in rotor reference, d-axis, p.u.";
  is_q0 = cos(ANGLE0) * is_r0 + sin(ANGLE0) * is_i0 "Norton current initialization in rotor reference, q-axis, p.u.";
  id0 = sin(ANGLE0) * ir0 - cos(ANGLE0) * ii0 "Terminal current initialization in rotor reference, d-axis, p.u.";
  iq0 = cos(ANGLE0) * ir0 + sin(ANGLE0) * ii0 "Terminal current initialization in rotor reference, q-axis, p.u.";
  PSId_s0 = ZSOURCE_IM * is_d0 + ZSOURCE_RE * is_q0;
  PSIq_s0 = (-ZSOURCE_RE * is_d0) + ZSOURCE_IM * is_q0;
  EFD0 = PSId_s0 + (Xd - Xd_s) * id0 + dsat * PSId_s0;
  PMECH0 = P0 + ZSOURCE_RE * (id0 ^ 2 + iq0 ^ 2);
  Eq_p0 = PSId_s0 + (Xd_p - Xd_s) * id0;
  PSI1_d0 = PSId_s0 - (Xd_s - Xl) * id0;
  Ed_p0 = (-PSIq_s0) - (Xq_p - Xq_s) * iq0;
  PSI2_q0 = (-PSIq_s0) + (Xq_s - Xl) * iq0;
  SPEED0 = ws;
  // Initialization of the states
  ANGLE = ANGLE0;
  SLIP = 0;
  Eq_p = Eq_p0;
  PSI1_d = PSI1_d0;
  Ed_p = Ed_p0;
  PSI2_q = PSI2_q0;
  // Initialization of the discrete variables for derivative of the states used for STATUS = 2 case.
  d_ANGLE = 0;
  d_SLIP = 0;
  d_Eq_p = 0;
  d_PSI1_d = 0;
  d_Ed_p = 0;
  d_PSI2_q = 0;
equation
  STATUSI = integer(STATUS);
  when STATUSI == 0 then
    reinit(SLIP, 0);
    reinit(Eq_p, 0);
    reinit(PSI1_d, 0);
    reinit(Ed_p, 0);
    reinit(PSI2_q, 0);
    reinit(ANGLE, 0);
  end when;
  when STATUSI == 2 then
    d_Eq_p = (pre(EFD1) - pre(XadIfd)) / Tdo_p;
    d_PSI1_d = ((-PSI1_d) + Eq_p - (Xd_p - Xl) * pre(id)) / Tdo_s;
    d_Ed_p = ((-Ed_p) + (Xq - Xq_p) * (pre(iq) - (Xq_p - Xq_s) / (Xq_p - Xl) ^ 2 * ((-PSI2_q) + (Xq_p - Xl) * pre(iq) + Ed_p)) + PSIq_s * ((Xq - Xl) / (Xd - Xl)) * pre(dXadIfd)) / Tqo_p;
    d_PSI2_q = ((-PSI2_q) + Ed_p + (Xq_p - Xl) * pre(iq)) / Tqo_s;
    d_SLIP = ((pre(PMECH1) - D * SLIP) / (1 + SLIP) - pre(TELEC)) / (2 * H);
    d_ANGLE = ws * SLIP;
  end when;
  PMECH1 = if STATUSI == 1 then PMECH else 0;
  EFD1 = if STATUSI == 1 then EFD else 0;
  // derivatives
  if STATUSI == 1 then
    der(Eq_p) = (EFD1 - XadIfd) / Tdo_p;
    der(PSI1_d) = ((-PSI1_d) + Eq_p - (Xd_p - Xl) * id) / Tdo_s;
    der(Ed_p) = ((-Ed_p) + (Xq - Xq_p) * (iq - (Xq_p - Xq_s) / (Xq_p - Xl) ^ 2 * ((-PSI2_q) + (Xq_p - Xl) * iq + Ed_p)) + PSIq_s * ((Xq - Xl) / (Xd - Xl)) * dXadIfd) / Tqo_p;
    der(PSI2_q) = ((-PSI2_q) + Ed_p + (Xq_p - Xl) * iq) / Tqo_s;
    der(SLIP) = ((PMECH1 - D * SLIP) / (1 + SLIP) - TELEC) / (2 * H);
    der(ANGLE) = ws * SLIP;
  elseif STATUSI == 0 then
    der(Eq_p) = 0;
    der(PSI1_d) = 0;
    der(Ed_p) = 0;
    der(PSI2_q) = 0;
    der(SLIP) = 0;
    der(ANGLE) = 0;
  else
    der(Eq_p) = d_Eq_p;
    der(PSI1_d) = d_PSI1_d;
    der(Ed_p) = d_Ed_p;
    der(PSI2_q) = d_PSI2_q;
    der(SLIP) = d_SLIP;
    der(ANGLE) = d_ANGLE;
  end if;
  // algebraic equations
  PSId_s = (Xd_s - Xl) / (Xd_p - Xl) * Eq_p + (Xd_p - Xd_s) / (Xd_p - Xl) * PSI1_d;
  PSIq_s = -((Xq_s - Xl) / (Xq_p - Xl) * Ed_p + (Xq_p - Xq_s) / (Xq_p - Xl) * PSI2_q);
  is_d = 1 / ZSOURCE_SQR * (ZSOURCE_IM * PSId_s - ZSOURCE_RE * PSIq_s);
  is_q = 1 / ZSOURCE_SQR * (ZSOURCE_RE * PSId_s + ZSOURCE_IM * PSIq_s);
  is_r = sin(ANGLE) * is_d + cos(ANGLE) * is_q;
  is_i = (-cos(ANGLE) * is_d) + sin(ANGLE) * is_q;
  p.ir = if STATUSI == 1 then is_r - (p.vr * ZSOURCE_RE + p.vi * ZSOURCE_IM) / ZSOURCE_SQR else 0;
  p.ii = if STATUSI == 1 then is_i - (p.vi * ZSOURCE_RE - p.vr * ZSOURCE_IM) / ZSOURCE_SQR else 0;
  id = sin(ANGLE) * p.ir - cos(ANGLE) * p.ii;
  iq = cos(ANGLE) * p.ir + sin(ANGLE) * p.ii;
  PSI_d = PSId_s - Xd_s * id;
  PSI_q = PSIq_s - Xq_s * iq;
  TELEC = PSI_d * iq - PSI_q * id;
  PSI_s = (PSId_s ^ 2 + PSIq_s ^ 2) ^ 0.5;
  dXadIfd = sat_q(PSI_s, 1, 1.2, S1, S12);
  XadIfd = Eq_p + (Xd - Xd_p) * (id - (Xd_p - Xd_s) / (Xd_p - Xl) ^ 2 * (PSI1_d + (Xd_p - Xl) * id - Eq_p)) + PSId_s * dXadIfd;
  // arbitrary Outputs
  ETERM_mag = if STATUSI == 1 then (p.vi ^ 2 + p.vr ^ 2) ^ 0.5 else 0;
  ETERM_ang = if STATUSI == 1 then atan2(p.vi, p.vr) else 0;
  PELEC = p.vr * p.ir + p.vi * p.ii;
  QELEC = p.vi * p.ir - p.vr * p.ii;
  SLIP = (SPEED - ws) / ws;
  ETERM_mag0 = Vt_abs;
  EFD_0 = EFD0;
  PMECH_0 = PMECH0;
  ITERM_mag = (p.ir ^ 2 + p.ii ^ 2) ^ 0.5;
  ITERM_ang = atan2(p.ii, p.ir);
  ETERM_ang0 = atan2(vi0, vr0);
  ITERM_ang0 = ang_I;
  // PSS_OUT connection
  PSS_OUT[1] = SLIP "rotor speed deviation (pu)";
  PSS_OUT[2] = SLIP / 2 / pi "bus frequency deviation (pu)";
  PSS_OUT[3] = PELEC "generator electrical power on MBASE base (pu)";
  PSS_OUT[4] = PMECH1 - TELEC "generator accelerating power (pu)";
  PSS_OUT[5] = ETERM_mag "bus voltage (pu)";
  PSS_OUT[6] = 0 "derivative of pu bus voltage";
  //der(ETERM_mag);
  // EX_OUT connection
  EX_OUT[1] = ETERM_mag;
  EX_OUT[2] = ETERM_ang;
  EX_OUT[3] = ITERM_mag;
  EX_OUT[4] = ITERM_ang;
  EX_OUT[5] = ETERM_mag0;
  EX_OUT[6] = ETERM_ang0;
  EX_OUT[7] = It_abs0 "ITERM_mag0";
  EX_OUT[8] = ITERM_ang0;
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1})), experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.02), Documentation(info = "<html>

<p>
GENROU is a model for a round rotor generator that represents the subtransient effects.
</p>

<img src=\"modelica://OpalRT/resource/Electrical/GENROU.png\"


</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1}), graphics={  Text(origin = {-24.1531, -19.5097}, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, extent = {{-55.16, 26.17}, {85.46, -11.14}}, textString = "GENROU"), Rectangle(origin = {-0.175581, -0.22779}, lineColor = {0, 0, 255}, extent = {{-99.86, 99.86}, {99.86, -99.86}}), Text(origin = {-75.6332, 35.8921}, extent = {{-21.22, 7.45}, {21.22, -7.45}}, textString = "PMECH"), Text(origin = {-84.3595, -59.7585}, extent = {{-21.22, 7.45}, {25.0575, -8.57867}}, textString = "EFD"), Text(origin = {-82.484, -87.0039}, extent = {{-21.22, 7.45}, {25.06, -8.58}}, textString = "EFD0"), Text(origin = {-74.8778, 12.7668}, extent = {{-21.22, 7.45}, {21.22, -7.45}}, textString = "PMECH0"), Text(origin = {-36, -83}, extent = {{-21.22, 7.45}, {25.06, -8.58}}, textString = "ETERM0"), Text(origin = {66.1885, 80.6165}, extent = {{-21.22, 7.45}, {25.06, -8.58}}, textString = "ETERM"), Text(origin = {67.1542, 47.2756}, extent = {{-21.22, 7.45}, {25.06, -8.58}}, textString = "XadIFD"), Text(origin = {71.2843, 10.5474}, extent = {{-21.22, 7.45}, {25.06, -8.58}}, textString = "SPEED"), Text(origin = {71.35, -48.75}, extent = {{-21.22, 7.45}, {25.06, -8.58}}, textString = "ANGLE"), Text(origin = {82.93, -90.45}, extent = {{-21.22, 7.45}, {25.06, -8.58}}, textString = "PIN"), Text(origin = {76.0905, -19.1859}, extent = {{-21.22, 7.45}, {25.06, -8.58}}, textString = "SLIP"), Text(origin = {24, -79}, extent = {{-17, 4}, {35, -14}}, textString = "PSS_OUT"), Text(origin = {-7, 79}, extent = {{-5, 8}, {21.22, -7.45}}, textString = "STATUS"), Text(origin = {-75.29, 78.09}, extent = {{-21.22, 7.45}, {25.06, -8.58}}, textString = "EX_OUT")}));
end GENROU_BASE_STATUS;
