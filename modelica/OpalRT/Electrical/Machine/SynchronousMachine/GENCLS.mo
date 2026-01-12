within OpalRT.Electrical.Machine.SynchronousMachine;
model GENCLS "Classical synchronous machine model in ePHASORsim internal library (Please see ePHASORsim user manual for SM_T2)."
  extends OpalRT.Electrical.PartialModel.SynchronousGenerator;
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
  parameter Real fn = 50;
  parameter Real P_gen = 900;
  parameter Real Q_gen = 200;
  parameter Real Vt_abs = 1.03;
  parameter Real Vt_ang = -10.96;
  parameter Real SB = 1000;
  parameter Real H = 5;
  parameter Real D = 2;
  parameter Real ZSOURCE_IM = 0;
  parameter Real ZSOURCE_RE = 0;
  Real TELEC;
  Real ETERM_ang;
  Real PMECH1;
  Real ANGLE;
protected
  Real EFD1;
  Complex E;
protected
  parameter Real ws(fixed = false);
  parameter Complex S0(re(fixed = false), im(fixed = false));
  parameter Complex E0(re(fixed = false), im(fixed = false));
  parameter Complex v0(re(fixed = false), im(fixed = false));
  parameter Complex i0(re(fixed = false), im(fixed = false));
  parameter Complex Z(re(fixed = false), im(fixed = false));
  parameter Real EFD_0(fixed = false);
  parameter Real It_abs0(fixed = false);
  parameter Real ANGLE0(fixed = false);
  parameter Real PMECH_0(fixed = false);
  Integer TRIPI;
initial algorithm
  ws := 2 * pi * fn;
  S0 := P_gen / SB + j * Q_gen / SB "Initial apparent power, complex, p.u.";
  Z := ZSOURCE_RE + j * ZSOURCE_IM "admittance";
  v0 := Vt_abs * exp(j * Vt_ang * pi / 180);
  i0 := conj(S0 / v0);
  E0 := v0 + Z * i0;
  EFD_0 := abs(E0);
  ANGLE0 := arg(E0);
  It_abs0 := abs(i0);
  PMECH_0 := real(S0) + ZSOURCE_RE * It_abs0 * It_abs0;
  ANGLE := ANGLE0;
  SLIP := 0;
equation
  TRIPI = integer(TRIP);
  when TRIPI == 1 then
    reinit(SLIP, 0);
    reinit(ANGLE, 0);
  end when;
  EFD0 = EFD_0;
  PMECH1 = if TRIPI == 0 then PMECH else 0;
  EFD1 = if TRIPI == 0 then EFD else 0;
  // derivatives
  if TRIPI == 0 then
    der(SLIP) = (PMECH1 - D * SLIP - TELEC) / (1 + SLIP) / (2 * H);
    der(ANGLE) = ws * SLIP;
  else
    der(SLIP) = 0;
    der(ANGLE) = 0;
  end if;
  // algebraic equations
  v = p.vr + j * p.vi;
  PMECH0 = PMECH_0;
  E = EFD1 * exp(j * ANGLE);
  i = if TRIPI == 0 then (E - v) / Z else 0 + j * 0;
  p.ir + j * p.ii = i;
  TELEC = ZSOURCE_RE * real(i * conj(i)) + PELEC;
  ETERM_ang = arg(v);
  ETERM0 = Vt_abs;
  MBASE = SB;
  AccPower = 0;
  EX_AUX = zeros(4);
  XADIFD = 0;
  // VI_OUT connection
  VI[1] = p.vr;
  VI[2] = p.vi;
  VI[3] = p.ir;
  VI[4] = p.ii;
  connect(EFD0, EFD) annotation(Line(points = {{-102, 20}, {-114, 20}, {-114, 28}, {-100, 28}}, color = {0, 0, 127}));
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Documentation(info = "<html>
<p>This is a classical model of synchronous generator. In this model, there are two dynamic equations regarding speed and rotor angle as the following: </p>
<ul>
<li>der(SLIP) = 0.5 / H * (PMECH - D * SLIP - TELEC)/(1 + SLIP) </li>
<li>der(ANGLE) = SLIP * ws </li>
</ul>
<p><br><b>Notes</b></p>
<ol>
<li> EFD is internally connected to EFD0.</li>
<li>XADIFD, PSS_OUT, EX_OUT are all set to zero.</li>
</ol>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
end GENCLS;
