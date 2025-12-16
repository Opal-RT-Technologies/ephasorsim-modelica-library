within OpalRT.Electrical.Machine.SynchronousMachine;
model GENSAL
  extends OpalRT.Electrical.PartialModel.SynchronousGenerator;
  import sat_q = OpalRT.NonElectrical.Math.Nonlinear.computeSaturationQuadratic;
  import Modelica.ComplexMath.j;
  import Modelica.ComplexMath.exp;
  import Modelica.ComplexMath.conj;
  import Modelica.ComplexMath.arg;
  import Modelica.ComplexMath.abs;
  import Modelica.ComplexMath.real;
  import Modelica.ComplexMath.imag;
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
  parameter Real Tdo_p = 7 "d-axis transient time constant";
  parameter Real Tdo_s = 0.03 "d-axis sub-transient time constant, s";
  parameter Real Tqo_s = 0.04 "d-axis sub-transient time constant, s";
  parameter Real H = 50 "Inertia constant";
  parameter Real D = 0 "Speed damping";
  parameter Real Xd = 0.2 "d-axis reactance, p.u.";
  parameter Real Xq = 0.19 "q-axis reactance, p.u.";
  parameter Real Xd_p = 0.06 "d-axis transient reactance, p.u.";
  parameter Real Xd_s = 0.02 "d-axis sub-transient reactance, p.u.";
  parameter Real Xl = 0.03 "Reactance due to the leakage flux which does not cross the air gap, p.u.";
  parameter Real S1 = 0.4 "saturation function value for 1 p.u. input";
  parameter Real S12 = 0.8 "saturation function value for 1.2 p.u. input";
  Complex is_dq;
  Complex is_xy;
  Complex i_dq;
  Complex PSI_s;
  Complex E_s;
  Real Eq_p;
  Real iq, id;
  Real PSI1_d, PSI2_q;
  Real PSId_s, PSIq_s;
  Real TELEC "The generator rotor electrical torque";
  Real PMECH1, EFD1;
  Real ANGLE "Rotor Angle, rad";
protected
  parameter Real[12] k(each fixed = false) "constant parameters";
  parameter Real ETERM_ang0(fixed = false);
  parameter Real ws(fixed = false);
  parameter Complex S0(re(fixed = false), im(fixed = false));
  parameter Complex v0(re(fixed = false), im(fixed = false));
  parameter Complex i0_dq(re(fixed = false), im(fixed = false));
  parameter Complex is0_dq(re(fixed = false), im(fixed = false));
  parameter Complex is0_xy(re(fixed = false), im(fixed = false));
  parameter Complex i0(re(fixed = false), im(fixed = false));
  parameter Complex Z(re(fixed = false), im(fixed = false));
  parameter Complex ep0_xy(re(fixed = false), im(fixed = false));
  parameter Complex PSI_s0(re(fixed = false), im(fixed = false));
  parameter Real ANGLE0(fixed = false);
  parameter Real i0_d(fixed = false);
  parameter Real ang_I(fixed = false);
  parameter Real It_abs0(fixed = false);
  parameter Real Eq_p0(fixed = false);
  parameter Real dsat(fixed = false);
  parameter Real EFD_0(fixed = false);
  parameter Real PMECH_0(fixed = false);
  Integer TRIPI;
initial algorithm
  // define parameters
  ws := 2 * pi * fn;
  k[1] := Xd - Xd_p;
  k[2] := Xd_p - Xd_s;
  k[3] := Xd_p - Xl;
  k[4] := k[3] - k[2];
  k[5] := k[2] / k[3];
  k[6] := k[4] / k[3];
  k[7] := k[5] / k[3];
  k[8] := 1 / Tdo_p;
  k[9] := 1 / Tdo_s;
  k[10] := 1 / Tqo_s;
  k[11] := 1 / (2 * H);
  k[12] := Xd_s - Xq;
  // initialize rotor angle
  S0 := P_gen / SB + j * Q_gen / SB "Initial apparent power, complex, p.u.";
  Z := ZSOURCE_RE + j * Xd_s "admittance";
  v0 := Vt_abs * exp(j * Vt_ang * pi / 180);
  ETERM_ang0 := arg(v0) "Initial terminal voltage angle, rad.";
  i0 := conj(S0 / v0);
  ang_I := arg(i0) "Terminal current angle, rad.";
  It_abs0 := abs(i0);
  ep0_xy := v0 + (ZSOURCE_RE + j * Xq) * i0;
  ANGLE0 := arg(ep0_xy);
  // initialize EFD, PMECH
  is0_xy := i0 + v0 / Z;
  is0_dq := Common.xy2dq(is0_xy, ANGLE0);
  i0_dq := Common.xy2dq(i0, ANGLE0);
  i0_d := real(i0_dq);
  PSI_s0 := -j * Z * is0_dq;
  Eq_p0 := real(PSI_s0) + (Xd_p - Xd_s) * i0_d;
  dsat := sat_q(Eq_p0, 1, 1.2, S1, S12);
  EFD_0 := Eq_p0 * (1 + dsat) + k[1] * i0_d;
  PMECH_0 := real(S0) + ZSOURCE_RE * It_abs0 * It_abs0;
  // initialize states
  ANGLE := ANGLE0;
  SLIP := 0;
  Eq_p := Eq_p0;
  PSI1_d := Eq_p0 - k[3] * i0_d;
  PSI2_q := -k[12] * imag(i0_dq);
equation
  TRIPI = integer(TRIP);
  PMECH1 = if TRIPI == 0 then PMECH else 0;
  EFD1 = if TRIPI == 0 then EFD else 0;
  when TRIPI == 1 then
    reinit(SLIP, 0);
    reinit(Eq_p, 0);
    reinit(PSI1_d, 0);
    reinit(PSI2_q, 0);
    reinit(ANGLE, 0);
  end when;
  // derivatives
  if TRIPI == 0 then
    der(Eq_p) = k[8] * (EFD1 - XADIFD);
    der(PSI1_d) = k[9] * ((-PSI1_d) + Eq_p - k[3] * id);
    der(PSI2_q) = -k[10] * (PSI2_q + k[12] * iq);
    der(SLIP) = k[11] * ((PMECH1 - D * SLIP) / (1 + SLIP) - TELEC);
    der(ANGLE) = ws * SLIP;
  else
    der(ANGLE) = 0;
    der(SLIP) = 0;
    der(Eq_p) = 0;
    der(PSI1_d) = 0;
    der(PSI2_q) = 0;
  end if;
  // algebraic equations
  v = p.vr + j * p.vi;
  PSId_s = k[6] * Eq_p + k[5] * PSI1_d;
  PSIq_s = -PSI2_q;
  PSI_s = PSId_s + j * PSIq_s;
  is_dq = j * PSI_s / Z;
  is_xy = Common.dq2xy(is_dq, ANGLE);
  i = if TRIPI == 0 then is_xy - v / Z else 0 + j * 0;
  p.ir + j * p.ii = i;
  i_dq = Common.xy2dq(i, ANGLE);
  id + j * iq = i_dq;
  XADIFD = k[1] * (id - k[7] * (PSI1_d + k[3] * id - Eq_p)) + (1 + sat_q(Eq_p, 1, 1.2, S1, S12)) * Eq_p;
  E_s = PSI_s - Xd_s * i_dq;
  TELEC = -imag(E_s * conj(i_dq));
  ETERM0 = Vt_abs;
  EFD0 = EFD_0;
  PMECH0 = PMECH_0;
  MBASE = SB;
  AccPower = PMECH1 - TELEC "generator accelerating power (pu)";
  //der(ETERM_mag);
  // EX_OUT connection
  EX_AUX[1] = Vt_abs;
  EX_AUX[2] = ETERM_ang0;
  EX_AUX[3] = It_abs0;
  EX_AUX[4] = ang_I;
  // VI_OUT connection
  VI[1] = p.vr;
  VI[2] = p.vi;
  VI[3] = p.ir;
  VI[4] = p.ii;
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1})), experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.02), Documentation(info = "<html>

<p>
1- Salient Pole Generator Model (Quadratic Saturation on d-Axis)
</p>
<img src=\"modelica://OpalRT/resource/Electrical/GENSAL.png\"
alt=\"GENSAL.png\"><br>

</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1})));
end GENSAL;
