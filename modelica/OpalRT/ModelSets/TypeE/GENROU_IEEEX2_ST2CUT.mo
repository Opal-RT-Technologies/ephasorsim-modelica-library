within OpalRT.ModelSets.TypeE;
model GENROU_IEEEX2_ST2CUT
  extends GenUnitTypeE1(redeclare Electrical.Machine.SynchronousMachine.GENROU synchronousGenerator(
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
      S12 = S12), redeclare Electrical.Control.Excitation.IEEEX2 exciter(
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
      TF2 = TF2_ex,
      E1 = E1_ex,
      SE_E1 = SE_E1_ex,
      E2 = E2_ex,
      SE_E2 = SE_E2_ex), redeclare Electrical.Control.Stabilizer.ST2CUT stabilizer(
      K1 = K1_pss,
      K2 = K2_pss,
      T1 = T1_pss,
      T2 = T2_pss,
      T3 = T3_pss,
      T4 = T4_pss,
      T5 = T5_pss,
      T6 = T6_pss,
      T7 = T7_pss,
      T8 = T8_pss,
      T9 = T9_pss,
      T10 = T10_pss,
      LSMAX = LSMAX_pss,
      LSMIN = LSMIN_pss,
      VCU = VCU_pss,
      VCL = VCL_pss,
      M0 = M0_pss,
      M1 = M1_pss,
      M2 = M2_pss,
      M3 = M3_pss));

  parameter Real partType = 1;
  // GENROU Parameters
  parameter Integer IBUS = 100 "Located system bus" annotation(Dialog(tab = "General"));
  parameter String M_ID = "M1" "Machine Identifier" annotation(Dialog(tab = "GENROU"));
  parameter Real P_gen = 900 "Bus Active Power, MW" annotation(Dialog(tab = "General"));
  parameter Real Q_gen = 200 "Bus Reactive Power, MVAR" annotation(Dialog(tab = "General"));
  parameter Real Vt_abs = 1.03 "Bus Voltage Magnitude, p.u." annotation(Dialog(tab = "General"));
  parameter Real Vt_ang = -10.96 "Bus Voltage Angle, deg." annotation(Dialog(tab = "General"));
  parameter Real SB = 1000 "Machine Base Power, MVA" annotation(Dialog(tab = "General"));
  parameter Real fn = 50 "Nominal frequency" annotation(Dialog(tab = "General"));
  parameter Real ZSOURCE_RE = 0 "Machine source impedence" annotation(Dialog(tab = "GENROU"));
  parameter Real Tdo_p = 7 "d-axis transient time constant" annotation(Dialog(tab = "GENROU"));
  parameter Real Tdo_s = 0.3 "d-axis sub-transient time constant, s" annotation(Dialog(tab = "GENROU"));
  parameter Real Tqo_p = 0.04 "q-axis transient time constant, s" annotation(Dialog(tab = "GENROU"));
  parameter Real Tqo_s = 0.4 "d-axis sub-transient time constant, s" annotation(Dialog(tab = "GENROU"));
  parameter Real H = 2.6 "Inertia constant" annotation(Dialog(tab = "GENROU"));
  parameter Real D = 0 "Speed damping" annotation(Dialog(tab = "GENROU"));
  parameter Real Xd = 0.67 "d-axis reactance, p.u." annotation(Dialog(tab = "GENROU"));
  parameter Real Xq = 0.62 "q-axis reactance, p.u." annotation(Dialog(tab = "GENROU"));
  parameter Real Xd_p = 0.3 "d-axis transient reactance, p.u." annotation(Dialog(tab = "GENROU"));
  parameter Real Xq_p = 0.3 "q-axis transient reactance, p.u." annotation(Dialog(tab = "GENROU"));
  parameter Real Xd_s = 0.01 "d-axis sub-transient reactance, p.u." annotation(Dialog(tab = "GENROU"));
  parameter Real Xl = 0.04 "Reactance due to the leakage flux which does not cross the air gap, p.u." annotation(Dialog(tab = "GENROU"));
  parameter Real S1 = 0.1 "saturation function value for 1 p.u. input" annotation(Dialog(tab = "GENROU"));
  parameter Real S12 = 0.2 "saturation function value for 1.2 p.u. input" annotation(Dialog(tab = "GENROU"));
  // IEEEX2 Parameters
  parameter Real TR_ex = 0.025 annotation(Dialog(tab = "IEEEX2"));
  parameter Real KA_ex = 98 annotation(Dialog(tab = "IEEEX2"));
  parameter Real TA_ex = 0.2 annotation(Dialog(tab = "IEEEX2"));
  parameter Real TB_ex = 0.1 annotation(Dialog(tab = "IEEEX2"));
  parameter Real TC_ex = 0.2 annotation(Dialog(tab = "IEEEX2"));
  parameter Real VRMAX_ex = 9 annotation(Dialog(tab = "IEEEX2"));
  parameter Real VRMIN_ex = -5 annotation(Dialog(tab = "IEEEX2"));
  parameter Real KE_ex = 0.5 annotation(Dialog(tab = "IEEEX2"));
  parameter Real TE_ex = 0.35 annotation(Dialog(tab = "IEEEX2"));
  parameter Real KF_ex = 0.03 annotation(Dialog(tab = "IEEEX2"));
  parameter Real TF1_ex = 0.4 annotation(Dialog(tab = "IEEEX2"));
  parameter Real TF2_ex = 0.4 annotation(Dialog(tab = "IEEEX2"));
  parameter Real E1_ex = 4 annotation(Dialog(tab = "IEEEX2"));
  parameter Real SE_E1_ex = 0.4 annotation(Dialog(tab = "IEEEX2"));
  parameter Real E2_ex = 5 annotation(Dialog(tab = "IEEEX2"));
  parameter Real SE_E2_ex = 0.5 annotation(Dialog(tab = "IEEEX2"));
  //parameter String ID = M_ID "Located Bus No." annotation(Dialog(tab = "ST2CUT"));
  parameter Real K1_pss = 1 annotation(Dialog(tab = "ST2CUT"));
  parameter Real K2_pss = 1 annotation(Dialog(tab = "ST2CUT"));
  parameter Real T1_pss = 0.1 "sec" annotation(Dialog(tab = "ST2CUT"));
  parameter Real T2_pss = 0.1 "sec" annotation(Dialog(tab = "ST2CUT"));
  parameter Real T3_pss = 0.1 "T3>0 sec" annotation(Dialog(tab = "ST2CUT"));
  parameter Real T4_pss = 0.1 "T4>0 sec" annotation(Dialog(tab = "ST2CUT"));
  parameter Real T5_pss = 0.1 "sec" annotation(Dialog(tab = "ST2CUT"));
  parameter Real T6_pss = 0.1 "sec" annotation(Dialog(tab = "ST2CUT"));
  parameter Real T7_pss = 0.1 "sec" annotation(Dialog(tab = "ST2CUT"));
  parameter Real T8_pss = 0.1 "sec" annotation(Dialog(tab = "ST2CUT"));
  parameter Real T9_pss = 0.1 "sec" annotation(Dialog(tab = "ST2CUT"));
  parameter Real T10_pss = 0.1 "sec" annotation(Dialog(tab = "ST2CUT"));
  parameter Real LSMAX_pss = 0.3 annotation(Dialog(tab = "ST2CUT"));
  parameter Real LSMIN_pss = -0.3 annotation(Dialog(tab = "ST2CUT"));
  parameter Real VCU_pss = 1.2 "VCU (pu) (if equal zero, ignored)" annotation(Dialog(tab = "ST2CUT"));
  parameter Real VCL_pss = -0.1 "VCL (pu) (if equal zero, ignored)" annotation(Dialog(tab = "ST2CUT"));
  // ICONS
  parameter Real M0_pss = 1 "ICS1, first stabilizer input code" annotation(Dialog(tab = "ST2CUT"));
  parameter Real M1_pss = 2 "IB1, first remote bus number. CURRENLY DISABLED" annotation(Dialog(tab = "ST2CUT"));
  parameter Real M2_pss = 3 "ICS2, second stabilizer input code" annotation(Dialog(tab = "ST2CUT"));
  parameter Real M3_pss = 0 "B2, second remote bus number CURRENLY DISABLED" annotation(Dialog(tab = "ST2CUT"));

end GENROU_IEEEX2_ST2CUT;
