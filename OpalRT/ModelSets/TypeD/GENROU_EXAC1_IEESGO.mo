within OpalRT.ModelSets.TypeD;
model GENROU_EXAC1_IEESGO
  extends GenUnitTypeD1(redeclare Electrical.Machine.SynchronousMachine.GENROU synchronousGenerator(
      IBUS = IBUS,
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
      S12 = S12), redeclare Electrical.Control.Excitation.EXAC1 exciter(
      ID = M_ID,
      TR = TR_ex,
      TB = TB_ex,
      TC = TC_ex,
      KA = KA_ex,
      TA = TA_ex,
      VRMAX = VRMAX_ex,
      VRMIN = VRMIN_ex,
      TE = TE_ex,
      KF = KF_ex,
      TF = TF_ex,
      KC = KC_ex,
      KD = KD_ex,
      KE = KE_ex,
      E1 = E1_ex,
      SE_E1 = SE_E1_ex,
      E2 = E2_ex,
      SE_E2 = SE_E2_ex), redeclare Electrical.Control.TurbineGovernor.IEESGO turbineGovernor(
      T1 = T1_tg,
      T2 = T2_tg,
      T3 = T3_tg,
      T4 = T4_tg,
      T5 = T5_tg,
      T6 = T6_tg,
      K1 = K1_tg,
      K2 = K2_tg,
      K3 = K3_tg,
      PMAX = PMAX_tg,
      PMIN = PMIN_tg));

  parameter Real partType = 1;
  // GENROU Parameters
  parameter Integer IBUS = 100 "Located system bus" annotation(Dialog(tab = "General"));
  parameter String M_ID = "M1" "Machine Identifier" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real P_gen = 1100 "Bus Active Power, MW" annotation(Dialog(tab = "General"));
  parameter Real Q_gen = 342.702 "Bus Reactive Power, MVAR" annotation(Dialog(tab = "General"));
  parameter Real Vt_abs = 1.03 "Bus Voltage Magnitude, p.u." annotation(Dialog(tab = "General"));
  parameter Real Vt_ang = -10.96 "Bus Voltage Angle, deg." annotation(Dialog(tab = "General"));
  parameter Real SB = 1000 "Machine Base Power, MVA" annotation(Dialog(tab = "General"));
  parameter Real fn = 50 "Nominal frequency" annotation(Dialog(tab = "General"));
  parameter Real ZSOURCE_RE = 0 "Machine source impedence" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Tdo_p = 7 "d-axis transient time constant" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Tdo_s = 0.03 "d-axis sub-transient time constant, s" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Tqo_p = 0.7 "q-axis transient time constant, s" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Tqo_s = 0.04 "d-axis sub-transient time constant, s" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real H = 50 "Inertia constant" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real D = 0 "Speed damping" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xd = 0.2 "d-axis reactance, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xq = 0.19 "q-axis reactance, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xd_p = 0.06 "d-axis transient reactance, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xq_p = 0.06 "q-axis transient reactance, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xd_s = 0.02 "d-axis sub-transient reactance, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xl = 0.03 "Reactance due to the leakage flux which does not cross the air gap, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real S1 = 0.4 "saturation function value for 1 p.u. input" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real S12 = 0.8 "saturation function value for 1.2 p.u. input" annotation(Dialog(tab = "GENROU Parameters"));
  // EXAC1 Parameters
  parameter Real TR_ex = 0.1 "(sec)";
  parameter Real TB_ex = 12 "(sec)";
  parameter Real TC_ex = 10 "(sec)";
  parameter Real KA_ex = 400;
  parameter Real TA_ex = 5 "(sec)";
  parameter Real VRMAX_ex = 5 "or zero";
  parameter Real VRMIN_ex = -5;
  parameter Real TE_ex = 0.08 "(sec)";
  parameter Real KF_ex = 0.2;
  parameter Real TF_ex = 1.2 "(>0) (sec)";
  parameter Real KC_ex = 0.4;
  parameter Real KD_ex = 0.4;
  parameter Real KE_ex = 0.5 "or zero";
  parameter Real E1_ex = 4;
  parameter Real SE_E1_ex = 0.4;
  parameter Real E2_ex = 5;
  parameter Real SE_E2_ex = 0.5;
  //IEESGO  parameters
  parameter Real T1_tg = 1 "Controller Lag";
  parameter Real T2_tg = 1 "Controller Lead Compensation";
  parameter Real T3_tg = 1 "Governor Lag (> 0)";
  parameter Real T4_tg = 1 "Delay Due To Steam Inlet Volumes";
  parameter Real T5_tg = 1 "Reheater Delay";
  parameter Real T6_tg = 1 "Turbine pipe hood Delay";
  parameter Real K1_tg = 0.5 "1/Per Unit Regulation";
  parameter Real K2_tg = 0.5 "Fraction";
  parameter Real K3_tg = 0.5 "fraction";
  parameter Real PMAX_tg = 1 "Upper Power Limit";
  parameter Real PMIN_tg = -1 "Lower Power Limit";

end GENROU_EXAC1_IEESGO;
