within OpalRT.Electrical.Machine.InductionMachine;
model CIMTR3 "Induction Generator Model"
  import sat_q = OpalRT.NonElectrical.Math.Nonlinear.computeSaturationQuadratic;
  constant Real pi = Modelica.Constants.pi;
  constant Real eps = Modelica.Constants.eps;
  parameter Integer IBUS = 100 "Located system bus";
  parameter String ID = "M1" "Machine Identifier";
  parameter Real P_gen = 100 "Bus Active Power, MW";
  parameter Real Q_gen = 10 "Bus Reactive Power, MVAR";
  parameter Real Vt_abs = 1.0 "Bus Voltage Magnitude, p.u.";
  parameter Real Vt_ang = 0 "Bus Voltage Angle, deg.";
  parameter Real SB = 100 "Machine Base Power, MVA";
  parameter Real fn = 60 "Nominal frequency";
  parameter Real ZSOURCE_RE = 0.1 "Machine source impedence";
  parameter Real ZSOURCE_IM(fixed = false) "Machine source impedence";
  parameter Real Tp = 1.05 "(> 0)";
  parameter Real Ts = 0.1 "(>= 0; if equal to 0, see manual)";
  parameter Real H = 3 "Inertia";
  parameter Real X = 4;
  parameter Real Xp = 0.3;
  parameter Real Xs = 0.2 "(if equal to 0, see manual)";
  parameter Real Xl = 0.1;
  parameter Real E1 = 1 "(>= 0.)";
  parameter Real SE1 = 0.3157;
  parameter Real E2 = 1.2;
  parameter Real SE2 = 1.303;
  parameter Real Switch = 0;
  parameter Real Syn_Pow = 0 "(> 0), Mechanical power at synchronous speed";
  Modelica.Blocks.Interfaces.RealInput STATUS "Initial status of the Induction generator, 1 = connected, 0=disconnected" annotation(Placement(visible = true, transformation(origin = {-100, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.Connector.PwPin p annotation(Placement(visible = true, transformation(origin = {102, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Real k1(fixed = false);
  parameter Real k2(fixed = false);
  parameter Real k3(fixed = false);
  parameter Real k4(fixed = false);
  parameter Real k5(fixed = false);
  parameter Real ws(fixed = false);
  parameter Real TELEC0(fixed = false);
  parameter Real P0(fixed = false);
  parameter Real Q0(fixed = false);
  parameter Real vr0(fixed = false);
  parameter Real vi0(fixed = false);
  parameter Real ir0(fixed = false);
  parameter Real ii0(fixed = false);
  parameter Real ZSOURCE_SQR(fixed = false);
  parameter Real ER_s0(fixed = false);
  parameter Real EI_s0(fixed = false);
  parameter Real ER_p0(fixed = false);
  parameter Real EI_p0(fixed = false);
  parameter Real EKI0(fixed = false);
  parameter Real EKR0(fixed = false);
  parameter Real IR0(fixed = false), II0(fixed = false);
  parameter Real v10(fixed = false), v20(fixed = false);
  parameter Real Es0(fixed = false);
  parameter Real SLIP0(fixed = false, start = 0.001);
  parameter Real Ycomp_tmp(fixed = false, start = 0) "Admittance of initial condition Mvar difference";
  parameter Real Ycomp(fixed = false) "Admittance of initial condition Mvar difference";
  parameter Real dsat0(fixed = false);
  parameter Real PMECH0(fixed = false);
  parameter Real PMECH_0(fixed = false);
  parameter Real SLIP_0(fixed = false);
  Integer STATUSI;
  Real TELEC, PMECH;
  Real QMOTOR;
  Real ETERM;
  Real EI_p;
  Real EI_s;
  Real EKI;
  Real ER_p;
  Real ER_s;
  Real EKR;
  Real IR, II;
  Real v1, v2;
  Real Es;
  Real SLIP;
  Real ANGLE;
  Real dsat;
  Real t;
  Boolean flg0, flg1;
initial algorithm
  ZSOURCE_IM := Xs;
  k1 := Xp - Xl;
  k5 := X - Xp;
  k2 := (Xs - Xl) / k1;
  k3 := (Xp - Xs) / k1;
  k4 := k3 / k1;
  ws := 2 * pi * fn "synchronuous speed";
  P0 := P_gen / SB "Bus Active Power, p.u.";
  Q0 := Q_gen / SB "Bus Reactive Power, p.u.";
  vr0 := Vt_abs * cos(Vt_ang * pi / 180) "Terminal voltage initialization, real part, p.u.";
  vi0 := Vt_abs * sin(Vt_ang * pi / 180) "Terminal voltage initialization, imag part, p.u.";
  ir0 := (P0 * vr0 + Q0 * vi0) / Vt_abs ^ 2 "Terminal current initialization, real part, p.u.";
  ii0 := (P0 * vi0 - Q0 * vr0) / Vt_abs ^ 2 "Terminal current initialization, imag part, p.u.";
  ZSOURCE_SQR := ZSOURCE_IM ^ 2 + ZSOURCE_RE ^ 2;
initial equation
  v10 = EI_p0 - EKI0 - k1 * IR0;
  v20 = ER_p0 + k1 * II0 - EKR0;
  IR0 = ir0 - Ycomp_tmp * vi0;
  II0 = ii0 + Ycomp_tmp * vr0;
  ER_s0 = vr0 + ZSOURCE_RE * IR0 - ZSOURCE_IM * II0 "sub-transient voltage initialization, real part, p.u.";
  EI_s0 = vi0 + ZSOURCE_IM * IR0 + ZSOURCE_RE * II0 "sub-transient voltage initialization, imag part, p.u.";
  TELEC0 = P0 + ZSOURCE_RE * (IR0 ^ 2 + II0 ^ 2);
  dsat0 = sat_q(Es0, E1, E2, SE1, SE2);
  0 = (-EI_p0) - k5 * (k4 * v10 + IR0) - EI_s0 * dsat0 + Tp * ws * SLIP0 * ER_p0;
  Es0 = sqrt(EI_s0 ^ 2 + ER_s0 ^ 2);
  0 = v10 + Ts * ws * SLIP0 * EKR0;
  EI_s0 = k2 * EI_p0 + k3 * EKI0;
  0 = (-ER_p0) + k5 * (II0 - k4 * v20) - ER_s0 * dsat0 - Tp * ws * SLIP0 * EI_p0;
  0 = v20 - Ts * ws * SLIP0 * EKI0;
  ER_s0 = k2 * ER_p0 + k3 * EKR0;
  0 = (PMECH_0 / (1 + SLIP0) - TELEC0) / (2 * H);
  PMECH0 = if flg0 then PMECH_0 else Syn_Pow;
  Ycomp = if flg0 then Ycomp_tmp else 0;
  // initialization of states
  SLIP_0 = if flg0 then SLIP0 else 0;
  EI_p = if flg0 then EI_p0 else 0;
  EKI = if flg0 then EKI0 else 0;
  ER_p = if flg0 then ER_p0 else 0;
  EKR = if flg0 then EKR0 else 0;
  SLIP = if flg0 then SLIP0 else 0;
  ANGLE = 0;
  t = 0;
equation
  der(t) = 1;
  STATUSI = integer(STATUS);
  flg1 = t < eps or flg0;
  flg0 = STATUSI == 1;
  p.ir = if flg1 then IR + Ycomp * p.vi else 0;
  p.ii = if flg1 then II - Ycomp * p.vr else 0;
  ER_s - (ZSOURCE_RE * IR - ZSOURCE_IM * II) = if flg1 then p.vr else 0 "sub-transient voltage initialization, real part, p.u.";
  EI_s - (ZSOURCE_IM * IR + ZSOURCE_RE * II) = if flg1 then p.vi else 0 "sub-transient voltage initialization, imag part, p.u.";
  EI_s = k2 * EI_p + k3 * EKI;
  dsat = sat_q(Es, E1, E2, SE1, SE2);
  Tp * der(EI_p) = if flg0 then (-EI_p) - k5 * (k4 * v1 + IR) - EI_s * dsat + Tp * ws * SLIP * ER_p else 0;
  v1 = EI_p - EKI - k1 * IR;
  Es = sqrt(EI_s ^ 2 + ER_s ^ 2);
  Ts * der(EKI) = if flg0 then v1 + Ts * ws * SLIP * EKR else 0;
  Tp * der(ER_p) = if flg0 then (-ER_p) + k5 * (II - k4 * v2) - ER_s * dsat - Tp * ws * SLIP * EI_p else 0;
  v2 = ER_p + k1 * II - EKR;
  Ts * der(EKR) = if flg0 then v2 - Ts * ws * SLIP * EKI else 0;
  ER_s = k2 * ER_p + k3 * EKR;
  PMECH = PMECH0;
  when flg0 then
    reinit(SLIP, -0.999);
  end when;
  der(SLIP) = if flg0 then (PMECH / (SLIP + 1) - TELEC) / (2 * H) else 0;
  der(ANGLE) = ws * (SLIP - SLIP_0);
  TELEC = ER_s * IR + EI_s * II;
  QMOTOR = EI_s * IR - ER_s * II - ZSOURCE_IM * (IR ^ 2 + II ^ 2);
  ETERM = sqrt(p.vr ^ 2 + p.vi ^ 2) annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Rectangle(origin = {0.217865, -0.217865}, extent = {{-100, 100}, {100, -100}}), Text(origin = {-0.220261, 3.26453}, extent = {{-74.73, 38.34}, {74.73, -38.34}}, textString = "CIMTR3"), Text(origin = {50.5033, -60.1787}, extent = {{5.22643, -11.1153}, {46.1897, -41.8258}}, textString = "PIN")}));
  annotation(experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.001), Documentation(info = "<html>

<p>
Note1: double cage induction generator only. parameters Xs or Ts could not be zero to have single cage induction generator. please use CIMTR3S for single cage case.
<p>
Note2: QMOTOR in PSS/E is the per unit value in Network base. while in this modelica model it is in machine base. To convert QMOTOR in machine base to the network base use the following formula:
<p>
QMOTOR (net) = (SB_machine/SB_netwrok)*QMOTOR (machine)
</p>

<img src=\"modelica://OpalRT/resource/Electrical/CIMTR3.png\"


</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics = {Text(origin = {-3.53396, 0.338269}, extent = {{-87.36, 88.04}, {87.36, -88.04}}, textString = "CIMTR3"), Rectangle(origin = {0.113895, -0.113895}, extent = {{-100.114, 99.8861}, {100.114, -99.8861}}), Text(origin = {-6.51, 73.63}, extent = {{-75.72, 20.97}, {-17.69, -6.26}}, textString = "STATUS")}));
end CIMTR3;
