within OpalRT.Electrical.Machine.SynchronousMachine;
model GENROU_SM_T1_ALG "same as GENROU_SM_T1 but written using algorithms"
  constant Real pi = Modelica.Constants.pi;
  // standard parameters
  parameter String Device_id = "m39";
  parameter Real fn = 50;
  parameter Real P_gen = 1000;
  parameter Real Q_gen = 342.702;
  parameter Real Vt_abs = 1.03;
  parameter Real Vt_ang = -10.96;
  parameter Real SB = 1000;
  parameter Real H = 50;
  parameter Real D = 0;
  parameter Real xd = 0.2;
  parameter Real xq = 0.19;
  parameter Real xdp = 0.06;
  parameter Real xqp = 0.06;
  parameter Real xds = 0.02;
  parameter Real xqs(fixed = false);
  parameter Real xl = 0.03;
  parameter Real Ra(fixed = false);
  parameter Real Tdo_p = 7;
  parameter Real Tdo_s = 0.03;
  parameter Real Tqo_p = 0.7;
  parameter Real Tqo_s = 0.04;
  parameter Real ZSOURCE_RE = 0.01;
  parameter Real ex_status = 0;
  // states
  Real sfd(start = sfd0);
  Real sd1(start = sd10);
  Real sq1(start = sq10);
  Real sq2(start = sq10);
  // algebraic variables
  Real ifd(start = ifd0);
  Real id1(start = id10);
  Real iq1(start = iq10);
  Real iq2(start = iq20);
  Real Te(start = Te0);
  Real EFD;
  Real Imag, Iang;
  Modelica.Blocks.Interfaces.RealOutput anglev(start = Vt_ang) annotation(Placement(visible = true, transformation(origin = {100, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput v(start = Vt_abs) annotation(Placement(visible = true, transformation(origin = {100, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput delta(start = delta0) annotation(Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput slip(start = slip0) annotation(Placement(visible = true, transformation(origin = {100, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.Connector.PwPin p annotation(Placement(visible = true, transformation(origin = {100, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Tm(start = Tm0) annotation(Placement(visible = true, transformation(origin = {-100, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput Tm_0 = Tm0 annotation(Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 180), iconTransformation(origin = {-100, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Interfaces.RealOutput ETERM0 annotation(Placement(visible = true, transformation(origin = {0, -100}, extent = {{-10, -10}, {10, 10}}, rotation = -90), iconTransformation(origin = {0, -100}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));

  Modelica.Blocks.Interfaces.RealInput efd(start = efd0) annotation(Placement(visible = true, transformation(origin = {-100, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput efd_0 = if ex_status == 0 then efd0 else efd0_ex annotation(Placement(visible = true, transformation(origin = {-100, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 180), iconTransformation(origin = {-100, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  // convert standard to fundamental parameters
protected
  parameter Real wR(fixed = false);
  parameter Real Rfd(fixed = false);
  parameter Real Rd1(fixed = false);
  parameter Real Rq1(fixed = false);
  parameter Real Rq2(fixed = false);
  parameter Real Lad(fixed = false);
  parameter Real Laq(fixed = false);
  parameter Real Lfd(fixed = false);
  parameter Real Ld1(fixed = false);
  parameter Real Lq1(fixed = false);
  parameter Real Lq2(fixed = false);
  parameter Real Lad_sec(fixed = false);
  parameter Real Laq_sec(fixed = false);
  // Initialization
  parameter Real P0(fixed = false);
  parameter Real Q0(fixed = false);
  parameter Real vr0(fixed = false);
  parameter Real vi0(fixed = false);
  parameter Real ir0(fixed = false);
  parameter Real ii0(fixed = false);
  parameter Real abs_i0(fixed = false);
  parameter Real phi0(fixed = false);
  parameter Real d1(fixed = false);
  parameter Real d2(fixed = false);
  parameter Real delta0(fixed = false);
  parameter Real Vt_d0(fixed = false);
  parameter Real Vt_q0(fixed = false);
  parameter Real i_d0(fixed = false);
  parameter Real i_q0(fixed = false);
  parameter Real ifd0(fixed = false);
  parameter Real efd0(fixed = false);
  parameter Real efd0_ex(fixed = false);
  parameter Real id10(fixed = false);
  parameter Real iq10(fixed = false);
  parameter Real iq20(fixed = false);
  parameter Real slip0(fixed = false);
  parameter Real sfd0(fixed = false);
  parameter Real sd10(fixed = false);
  parameter Real sq10(fixed = false);
  parameter Real sq20(fixed = false);
  parameter Real saai_ad0(fixed = false);
  parameter Real saai_aq0(fixed = false);
  parameter Real Ed_sec0(fixed = false);
  parameter Real Eq_sec0(fixed = false);
  parameter Real Te0(fixed = false);
  parameter Real Tm0(fixed = false);
  // From Kundur's paper and noteing that xds = xqs
  parameter Real u1(fixed = false);
  parameter Real u2(fixed = false);
  parameter Real u3(fixed = false);
  parameter Real u50(fixed = false);
  parameter Real u60(fixed = false);
  Real der_delta;
  Real der_slip;
  Real der_sfd;
  Real der_sd1;
  Real der_sq1;
  Real der_sq2;
initial algorithm
  // convert standard to fundamental parameters
  wR := fn * pi * 2;
  xqs := xds;
  Ra := ZSOURCE_RE;
  Lad := xd - xl;
  Laq := xq - xl;
  Lfd := Lad * (xdp - xl) / (Lad - xdp + xl);
  Ld1 := Lad * Lfd * (xds - xl) / (Lad * Lfd - (xds - xl) * (Lad + Lfd));
  Lq1 := Laq * (xqp - xl) / (Laq - xqp + xl);
  Lq2 := Laq * Lq1 * (xqs - xl) / (Laq * Lq1 - (xqs - xl) * (Laq + Lq1));
  Lad_sec := 1 / (1 / Lad + 1 / Lfd + 1 / Ld1);
  Laq_sec := 1 / (1 / Laq + 1 / Lq1 + 1 / Lq2);
  Rfd := (Lad + Lfd) / Tdo_p / wR;
  Rd1 := (Ld1 + Lad * Lfd / (Lad + Lfd)) / Tdo_s / wR;
  Rq1 := (Laq + Lq1) / Tqo_p / wR;
  Rq2 := (Lq2 + Laq * Lq1 / (Laq + Lq1)) / Tqo_s / wR;
  // Initialization
  P0 := P_gen / SB;
  Q0 := Q_gen / SB;
  vr0 := Vt_abs * cos(Vt_ang * pi / 180);
  vi0 := Vt_abs * sin(Vt_ang * pi / 180);
  ir0 := (P0 * vr0 + Q0 * vi0) / Vt_abs ^ 2;
  ii0 := (P0 * vi0 - Q0 * vr0) / Vt_abs ^ 2;
  abs_i0 := (ir0 ^ 2 + ii0 ^ 2) ^ 0.5;
  phi0 := atan2(Q0, P0);
  d1 := xq * abs_i0 * cos(phi0) - Ra * abs_i0 * sin(phi0);
  d2 := Vt_abs + Ra * abs_i0 * cos(phi0) + xq * abs_i0 * sin(phi0);
  delta0 := atan2(d1, d2) + Vt_ang * pi / 180;
  Vt_d0 := vr0 * sin(delta0) - vi0 * cos(delta0) "Initialitation";
  Vt_q0 := vr0 * cos(delta0) + vi0 * sin(delta0) "Initialitation";
  i_d0 := ir0 * sin(delta0) - ii0 * cos(delta0) "Initialitation";
  i_q0 := ir0 * cos(delta0) + ii0 * sin(delta0) "Initialitation";
  ifd0 := (Vt_q0 + Ra * i_q0 + xd * i_d0) / Lad;
  efd0 := Rfd * ifd0;
  efd0_ex := efd0 * Lad / Rfd;
  id10 := 0;
  iq10 := 0;
  iq20 := 0;
  slip0 := 0;
  sfd0 := (Lad + Lfd) * ifd0 - Lad * i_d0;
  sd10 := Lad * (ifd0 - i_d0);
  sq10 := -Laq * i_q0;
  sq20 := -Laq * i_q0;
  saai_ad0 := Lad_sec * ((-i_d0) + sfd0 / Lfd + sd10 / Ld1);
  saai_aq0 := Laq_sec * ((-i_q0) + sq10 / Lq1 + sq20 / Lq2);
  Ed_sec0 := Laq_sec * (sq10 / Lq1 + sq20 / Lq2);
  Eq_sec0 := Lad_sec * (sfd0 / Lfd + sd10 / Ld1);
  Te0 := -(saai_ad0 * i_q0 - saai_aq0 * i_d0);
  Tm0 := -Te0;
  // From Kundur's paper and noteing that xds = xqs
  u1 := -Ra;
  u2 := Lad_sec + xl;
  u3 := -u2;
  u50 := (-cos(delta0) * Ed_sec0) - sin(delta0) * Eq_sec0;
  u60 := cos(delta0) * Eq_sec0 - sin(delta0) * Ed_sec0;
  delta := delta0;
  slip := slip0;
  sfd := sfd0;
  sd1 := sd10;
  sq1 := sq10;
  sq2 := sq20;
equation
  // derivatives equations
  EFD = if ex_status == 1 then efd * Rfd / Lad else efd;
  (der_delta, der_slip, der_sfd, der_sd1, der_sq1, der_sq2) =
    Internal.updateDerivativeEquations(
    slip,
    Te,
    Tm,
    EFD,
    ifd,
    id1,
    iq1,
    iq2,
    wR,
    H,
    Rd1,
    Rq1,
    Rq2,
    Rfd);
  der(delta) = der_delta;
  der(slip) = der_slip;
  der(sfd) = der_sfd;
  der(sd1) = der_sd1;
  der(sq1) = der_sq1;
  der(sq2) = der_sq2;
  // Algebraic equations
  (p.ir, p.ii, Te, ifd, id1, iq1, iq2) =Internal.updateAlgebraicEquations(
    sq1,
    sq2,
    sd1,
    sfd,
    delta,
    p.vr,
    p.vi,
    Laq_sec,
    Lad_sec,
    Lq1,
    Lq2,
    Lfd,
    Ld1,
    u1,
    u2,
    u3);
  v = sqrt(p.vr ^ 2 + p.vi ^ 2);
  anglev = atan2(p.vi, p.vr) / pi * 180;
  Imag = sqrt(p.ii ^ 2 + p.ir ^ 2);
  Iang = atan2(p.ii, p.ir) / pi * 180;
  ETERM0 = Vt_abs;
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Rectangle(origin = {0.282885, -0.424328}, extent = {{-99.8586, 100}, {99.8586, -100}}), Text(origin = {-1.41423, 32.3907}, extent = {{-49.22, 29}, {49.22, -29}}, textString = "GENROU"), Text(origin = {-9.98, 2.32}, fillColor = {0, 0, 255}, extent = {{-31.12, 11.18}, {49.22, -29}}, textString = "SM_T1")}), experiment(StartTime = 0, StopTime = 100, Tolerance = 1e-06, Interval = 0.01));
end GENROU_SM_T1_ALG;
