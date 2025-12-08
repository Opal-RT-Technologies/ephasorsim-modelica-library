within OpalRT.ModelSets.TypeB;
model GENROU_IEEEX1
  extends GenUnitTypeB1(redeclare Electrical.Machine.SynchronousMachine.GENROU synchronousGenerator(
      ID = M_ID,
      P_gen = P_gen,
      Q_gen = Q_gen,
      Vt_abs = Vt_abs,
      Vt_ang = Vt_ang,
      SB = SB,
      fn = fn,
      ZSOURCE_RE = ZSOURCE_RE,
      Tdo_p = Tdo_p,
      Tdo_s = Tdo_s,
      Tqo_p = Tqo_p,
      Tqo_s = Tqo_s,
      H = H,
      D = D,
      Xd = Xd,
      Xq = Xq,
      Xd_p = Xd_p,
      Xq_p = Xq_p,
      Xd_s = Xd_s,
      Xl = Xl,
      S1 = S1,
      S12 = S12), redeclare Electrical.Control.Excitation.IEEEX1 exciter(
      ID = M_ID,
      TR = TR_ex,
      KA = KA_ex,
      TA = TA_ex,
      TB = TB_ex,
      TC = TC_ex,
      VRMAX = VRMAX_ex,
      VRMIN = VRMIN_ex,
      KE = KE_ex,
      TE = TE_ex,
      KF = KF_ex,
      TF1 = TF1_ex,
      Switch = Switch_ex,
      E1 = E1_ex,
      SE_E1 = SE_E1_ex,
      E2 = E2_ex,
      SE_E2 = SE_E2_ex));

  parameter Real partType = 1;
  // GENROU Parameters
  parameter Integer IBUS = 100 "Located system bus";
  parameter String M_ID = "M1" "Machine Identifier";
  parameter Real P_gen = 1100 "Bus Active Power, MW";
  parameter Real Q_gen = 342.702 "Bus Reactive Power, MVAR";
  parameter Real Vt_abs = 1.03 "Bus Voltage Magnitude, p.u.";
  parameter Real Vt_ang = -10.96 "Bus Voltage Angle, deg.";
  parameter Real SB = 1000 "Machine Base Power, MVA";
  parameter Real fn = 50 "Nominal frequency";
  parameter Real ZSOURCE_RE = 0 "Machine source impedence";
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
  parameter Real Xl = 0.03 "Reactance due to the leakage flux which does not cross the air gap, p.u.";
  parameter Real S1 = 0.4 "saturation function value for 1 p.u. input";
  parameter Real S12 = 0.8 "saturation function value for 1.2 p.u. input";
  // // IEEEX1 Parameters
  parameter Real TR_ex = 0.025 "(sec)";
  parameter Real KA_ex = 98;
  parameter Real TA_ex = 0.2 "(sec)";
  parameter Real TB_ex = 0.5 "(sec)";
  parameter Real TC_ex = 1 "(sec)";
  parameter Real VRMAX_ex = 9 "or zero";
  parameter Real VRMIN_ex = -5;
  parameter Real KE_ex = 0.5 "or zero";
  parameter Real TE_ex = 0.35 "(>0) (sec)";
  parameter Real KF_ex = 0.01;
  parameter Real TF1_ex = 0.4 "(>0) (sec)";
  parameter Real Switch_ex = 0;
  parameter Real E1_ex = 4;
  parameter Real SE_E1_ex = 0.4;
  parameter Real E2_ex = 5;
  parameter Real SE_E2_ex = 0.5;

end GENROU_IEEEX1;
