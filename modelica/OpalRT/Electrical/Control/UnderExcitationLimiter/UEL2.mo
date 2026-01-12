within OpalRT.Electrical.Control.UnderExcitationLimiter;
model UEL2 "IEEE 421.5 2005 UEL2 Minimum Excitation Limiter"
  extends OpalRT.Electrical.PartialModel.UnderExcitationLimiter;
  parameter Real TUV = 5 "(sec) voltage filter time constant";
  parameter Real TUP = 5 "(sec) real power filter time constant";
  parameter Real TUQ = 0 "(sec) reactive power filter time constant";
  parameter Real KUI = 0.5 "(pu) UEL integral gain";
  parameter Real KUL = 0.8 "(pu) UEL proportional gain";
  parameter Real VUIMAX = 0.25 "(pu) UEL integrator output maximum limit";
  parameter Real VUIMIN = 0 "(pu) UEL integrator output minimum limit";
  parameter Real KUF = 0 "(pu) UEL excitation system stabilizer gain";
  parameter Real KFB = 0 "(pu)";
  parameter Real TUL = 0 "(sec)";
  parameter Real TU1 = 0 "UEL lead time constant (sec)";
  parameter Real TU2 = 0 "UEL lag time constant (sec)";
  parameter Real TU3 = 0 "UEL lead time constant (sec)";
  parameter Real TU4 = 0 "UEL lag time constant (sec)";
  parameter Real P0 = 0 "(pu on gen. MVA base)";
  parameter Real Q0 = -0.31 "(pu on gen. MVA base)";
  parameter Real P1 = 0.3 "(pu on gen. MVA base)";
  parameter Real Q1 = -0.31 "(pu on gen. MVA base)";
  parameter Real P2 = 0.6 "(pu on gen. MVA base)";
  parameter Real Q2 = -0.28 "(pu on gen. MVA base)";
  parameter Real P3 = 0.9 "(pu on gen. MVA base)";
  parameter Real Q3 = -0.21 "(pu on gen. MVA base)";
  parameter Real P4 = 1.02 "(pu on gen. MVA base)";
  parameter Real Q4 = 0 "(pu on gen. MVA base)";
  parameter Real P5 = 0 "(pu on gen. MVA base)";
  parameter Real Q5 = 0 "(pu on gen. MVA base)";
  parameter Real P6 = 0 "(pu on gen. MVA base)";
  parameter Real Q6 = 0 "(pu on gen. MVA base)";
  parameter Real P7 = 0 "(pu on gen. MVA base)";
  parameter Real Q7 = 0 "(pu on gen. MVA base)";
  parameter Real P8 = 0 "(pu on gen. MVA base)";
  parameter Real Q8 = 0 "(pu on gen. MVA base)";
  parameter Real P9 = 0 "(pu on gen. MVA base)";
  parameter Real Q9 = 0 "(pu on gen. MVA base)";
  parameter Real P10 = 0 "(pu on gen. MVA base)";
  parameter Real Q10 = 0 "(pu on gen. MVA base)";
  parameter Real VULMAX = 0.25 "(pu) UEL output maximum limit";
  parameter Real VULMIN = 0 "(pu) UEL output minimum limit";
  parameter Real M0 = 0 "k1, exponent in function F1";
  parameter Real M1 = 0 "k2, exponent in function F2";
  parameter Real M2 = 0 " 0: MVAR curve interpreted as mirror image around MVAR axis; 1: MVAR is found by linear extrapolation";
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag lag1(T = TUQ, y_start = QELEC0) annotation(Placement(visible = true, transformation(origin = {-70, 80}, extent = {{-7.5, -7.5}, {7.5, 7.5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag lag2(T = TUV, y_start = Vmag0) annotation(Placement(visible = true, transformation(origin = {-70, 60}, extent = {{-7.5, -7.5}, {7.5, 7.5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag lag3(T = TUP, y_start = P0_p) annotation(Placement(visible = true, transformation(origin = {-20, 0}, extent = {{-7.5, -7.5}, {7.5, 7.5}}, rotation = 0)));
  Modelica.Blocks.Math.Product product1 annotation(Placement(visible = true, transformation(origin = {-40, 0}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Auxiliary.Power power1(k = -M0) annotation(Placement(visible = true, transformation(origin = {-50, 30}, extent = {{-5, -5}, {5, 5}}, rotation = -90)));
  OpalRT.NonElectrical.Math.Auxiliary.Power power2(k = M1) annotation(Placement(visible = true, transformation(origin = {-30, 60}, extent = {{-5, -5}, {5, 5}}, rotation = 360)));
  Modelica.Blocks.Math.Product product2 annotation(Placement(visible = true, transformation(origin = {0, 60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));

  OpalRT.Electrical.Control.UnderExcitationLimiter.Internal.PQ_curve pq_curve1(
    P_vector=P_vector,
    Q_vector=Q_vector,
    M2=M2) annotation (Placement(visible=true, transformation(
        origin={-10,30},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  Modelica.Blocks.Math.Add3 add31(k1 = -1, k3 = -1) annotation(Placement(visible = true, transformation(origin = {30, 60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = KUF) annotation(Placement(visible = true, transformation(origin = {-70, -40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunctionNonWindup.PI_NonWindupLimit pi_non_windup_limit1(KI = KUI, KP = KUL, MAX = VUIMAX, MIN = VUIMIN, y_start = VUIMIN - KUL * (QREF0 - QELEC0)) annotation(Placement(visible = true, transformation(origin = {60, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1 annotation(Placement(visible = true, transformation(origin = {110, 60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.LeadLag lead_lag1(TA = TU1, TB = TU2, y_start = VULMIN) annotation(Placement(visible = true, transformation(origin = {140, 60}, extent = {{-7.5, -7.5}, {7.5, 7.5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.LeadLag lead_lag2(TA = TU3, TB = TU4, y_start = VULMIN) annotation(Placement(visible = true, transformation(origin = {170, 60}, extent = {{-7.5, -7.5}, {7.5, 7.5}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiter1(uMax = VULMAX, uMin = VULMIN) annotation(Placement(visible = true, transformation(origin = {200, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag lag4(T = if KFB == 0 then 0 else TUL, K = if KFB == 0 then 1 else KFB, y_start = y_fb0) annotation(Placement(visible = true, transformation(origin = {0, -60}, extent = {{-7.5, -7.5}, {7.5, 7.5}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = VFB) annotation(Placement(visible = true, transformation(origin = {-80, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression Qelec(y=QELEC) annotation(Placement(visible = true, transformation(origin={-103,95}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression Pelec(y=PELEC) annotation (Placement(visible=true, transformation(origin={-70,-3}, extent={{-10,-10},{10,10}}, rotation=0)));
  Modelica.Blocks.Sources.RealExpression Ecomp(y=ETERM) annotation(Placement(visible = true, transformation(origin={-94,60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Real VFB(fixed = false);
  parameter Real y_fb0(fixed = false);
protected
  parameter Real Vmag0(fixed = false);
  parameter Real Vang0(fixed = false);
  parameter Real Imag0(fixed = false);
  parameter Real Iang0(fixed = false);
  parameter Real PELEC0(fixed = false);
  parameter Real QELEC0(fixed = false);
  parameter Real P0_p(fixed = false);
  parameter Real Q0_p(fixed = false);
  parameter Real QREF0(fixed = false);
  parameter Real[11] P_vector(each fixed = false);
  parameter Real[11] Q_vector(each fixed = false);
  parameter Real P_z(fixed = false);
initial algorithm
  Vmag0 := EX_AUX[5];
  Vang0 := EX_AUX[6];
  Imag0 := EX_AUX[7];
  Iang0 := EX_AUX[8];
  PELEC0 := Vmag0 * Imag0 * cos(Vang0 - Iang0);
  QELEC0 := Vmag0 * Imag0 * sin(Vang0 - Iang0);
  P0_p := PELEC0 / Vmag0 ^ M0;
  P_vector := {P0, P1, P2, P3, P4, P5, P6, P7, P8, P9, P10};
  Q_vector := {Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8, Q9, Q10};
  P_z :=Internal.Pz_calc(P_vector, Q_vector);
  Q0_p :=Internal.pqCurveFunction(
    P0_p,
    P_vector,
    Q_vector,
    M2,
    P_z);
  QREF0 := Q0_p * Vmag0 ^ M1;
  y_fb0 := (-VUIMIN) + VULMIN;
  VFB := if KFB <> 0 then y_fb0 / KFB else y_fb0;
equation
  connect(const.y, lag4.u) annotation(Line(points = {{-69, -60}, {-7.89245, -60}, {-7.89245, -60}, {-7.5, -60}}, color = {0, 0, 127}));
  connect(lag4.y, add1.u2) annotation(Line(points = {{7.5, -60}, {92.2207, -60}, {92.2207, 57.4257}, {104, 57.4257}, {104, 57}}, color = {0, 0, 127}));
  connect(limiter1.y, VUEL) annotation(Line(points = {{211, 60}, {243.847, 60}, {243.847, 0}, {100, 0}}, color = {0, 0, 127}));
  connect(limiter1.u, lead_lag2.y) annotation(Line(points = {{188, 60}, {177.652, 60}, {177.652, 60}, {177.5, 60}}, color = {0, 0, 127}));
  connect(lead_lag1.y, lead_lag2.u) annotation(Line(points = {{147.5, 60}, {162.659, 60}, {162.659, 60}, {162.5, 60}}, color = {0, 0, 127}));
  connect(add1.y, lead_lag1.u) annotation(Line(points = {{115.5, 60}, {131.825, 60}, {131.825, 60}, {132.5, 60}}, color = {0, 0, 127}));
  connect(pi_non_windup_limit1.y, add1.u1) annotation(Line(points = {{70, 60}, {85.4314, 60}, {85.4314, 63.3663}, {104, 63.3663}, {104, 63}}, color = {0, 0, 127}));
  connect(add31.y, pi_non_windup_limit1.u) annotation(Line(points = {{35.5, 60}, {49.505, 60}, {49.505, 60}, {50, 60}}, color = {0, 0, 127}));
  connect(gain1.y, add31.u3) annotation(Line(points = {{-64.5, -40}, {8.20368, -40}, {8.20368, 56.2942}, {24, 56.2942}, {24, 56}}, color = {0, 0, 127}));
  connect(VF, gain1.u) annotation(Line(points = {{-100, -40}, {-76.9448, -40}, {-76.9448, -40}, {-76, -40}}, color = {0, 0, 127}));
  connect(product2.y, add31.u2) annotation(Line(points = {{5.5, 60}, {23.4795, 60}, {23.4795, 60}, {24, 60}}, color = {0, 0, 127}));
  connect(add31.u1, lag1.y) annotation(Line(points = {{24, 64}, {19.5191, 64}, {19.5191, 80.0566}, {-62.5, 80.0566}, {-62.5, 80}}, color = {0, 0, 127}));
  connect(Qelec.y, lag1.u) annotation (Line(points = {{-92,95}, {-83, 95}, {-83, 80}, {-77.5, 80}}, color = {0, 0, 127}));
  connect(pq_curve1.Q, product2.u2) annotation(Line(points = {{-10, 40}, {-10, 57.7086}, {-6.50636, 57.7086}, {-6.50636, 57}, {-6, 57}}, color = {0, 0, 127}));
  connect(lag3.y, pq_curve1.u) annotation(Line(points = {{-12.5, 0}, {-10.1839, 0}, {-10.1839, 20}, {-10, 20}}, color = {0, 0, 127}));
  connect(power2.y, product2.u1) annotation(Line(points = {{-25, 60}, {-19.59, 60}, {-19.59, 63.3257}, {-6, 63}, {-6, 63}}, color = {0, 0, 127}));
  connect(product1.y, lag3.u) annotation(Line(points = {{-34.5, 0}, {-28.246, 0}, {-28.246, 0}, {-27.5, 0}}, color = {0, 0, 127}));
  connect(Pelec.y, product1.u2) annotation(Line(points = {{-59, -3}, {-46, -3}}, color = {0, 0, 127}));
  connect(product1.u1, power1.y) annotation(Line(points = {{-46, 3}, {-50.3417, 3}, {-50.3417, 25}, {-50, 25}}, color = {0, 0, 127}));
  connect(power1.u, lag2.y) annotation(Line(points = {{-50, 35}, {-50, 59.9089}, {-62.5, 59.9089}, {-62.5, 60}}, color = {0, 0, 127}));
  connect(lag2.y, power2.u) annotation(Line(points = {{-62.5, 60}, {-35.3075, 60}, {-35.3075, 60}, {-35, 60}}, color = {0, 0, 127}));
  connect(Ecomp.y, lag2.u) annotation(Line(points = {{-83, 60}, {-77.5, 60}}, color = {0, 0, 127}));
  annotation(Documentation(info = "<html>

<p>
1- A maximum of 10 pairs may be specified. The unused pairs should be entered as zero.
</p><p>
2- VUIMIN and VULMIN should be set to 0.0 for excitation systems where VUEL is
added to the reference.
</p><p>
3- VF and VFB should be connected to the same signals in the connected exciter. If there are no such signals available in the exciter, their value would be zero.
</p><p>
<img src=\"modelica://OpalRT/resource/Under_Excitation_Limiter/UEL2.png\"
alt=\"UEL2.png\"><br>


</html>"), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1}), graphics = {Text(origin = {-6.08214, 10.1868}, lineColor = {255, 0, 0}, fillColor = {255, 0, 0}, extent = {{-2.40826, 0.849406}, {5.52, -6.79}}, textString = "P'"), Text(origin = {-6.54463, 49.6115}, lineColor = {255, 0, 0}, fillColor = {255, 0, 0}, extent = {{-2.41, 0.85}, {5.52, -6.79}}, textString = "Q'"), Text(origin = {8.82842, 66.4041}, lineColor = {255, 0, 0}, fillColor = {255, 0, 0}, extent = {{-2.41, 0.85}, {9.4804, -6.79}}, textString = "QREF")}), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1})));
end UEL2;
