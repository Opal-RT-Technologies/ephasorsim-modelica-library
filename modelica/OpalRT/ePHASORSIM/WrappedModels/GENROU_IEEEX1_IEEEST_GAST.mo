within OpalRT.ePHASORSIM.WrappedModels;
block GENROU_IEEEX1_IEEEST_GAST
  extends Wrappers.FMUTemplateVRefGRef(redeclare ModelSets.TypeF.GENROU_IEEEX1_IEEEST_GAST modelSet(
      partType = partType,
      IBUS = IBUS,
      M_ID = M_ID,
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
      S12 = S12,
      TR_ex = TR_ex,
      KA_ex = KA_ex,
      TA_ex = TA_ex,
      TB_ex = TB_ex,
      TC_ex = TC_ex,
      VRMAX_ex = VRMAX_ex,
      VRMIN_ex = VRMIN_ex,
      KE_ex = KE_ex,
      TE_ex = TE_ex,
      KF_ex = KF_ex,
      TF1_ex = TF1_ex,
      Switch_ex = Switch_ex,
      E1_ex = E1_ex,
      SE_E1_ex = SE_E1_ex,
      E2_ex = E2_ex,
      SE_E2_ex = SE_E2_ex,
      A1_pss = A1_pss,
      A2_pss = A2_pss,
      A3_pss = A3_pss,
      A4_pss = A4_pss,
      A5_pss = A5_pss,
      A6_pss = A6_pss,
      T1_pss = T1_pss,
      T2_pss = T2_pss,
      T3_pss = T3_pss,
      T4_pss = T4_pss,
      T5_pss = T5_pss,
      T6_pss = T6_pss,
      KS_pss = KS_pss,
      LSMAX_pss = LSMAX_pss,
      LSMIN_pss = LSMIN_pss,
      VCU_pss = VCU_pss,
      VCL_pss = VCL_pss,
      M0_pss = M0_pss,
      M1_pss = M1_pss,
      R_tg = R_tg,
      T1_tg = T1_tg,
      T2_tg = T2_tg,
      T3_tg = T3_tg,
      AT_tg = AT_tg,
      KT_tg = KT_tg,
      VMAX_tg = VMAX_tg,
      VMIN_tg = VMIN_tg,
      DTURB_tg = DTURB_tg));

// >>> AUTOGEN PARAMS (VERBATIM FROM MODELSETS) BEGIN
  parameter Real partType = 1;
  // GENROU Parameters
  parameter Integer IBUS = 100 "Located system bus" annotation(Dialog(tab = "General"));
  parameter String M_ID = "M1" "Machine Identifier" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real P_gen = 900 "Bus Active Power, MW" annotation(Dialog(tab = "General"));
  parameter Real Q_gen = 200 "Bus Reactive Power, MVAR" annotation(Dialog(tab = "General"));
  parameter Real Vt_abs = 1.03 "Bus Voltage Magnitude, p.u." annotation(Dialog(tab = "General"));
  parameter Real Vt_ang = -10.96 "Bus Voltage Angle, deg." annotation(Dialog(tab = "General"));
  parameter Real SB = 1000 "Machine Base Power, MVA" annotation(Dialog(tab = "General"));
  parameter Real fn = 50 "Nominal frequency" annotation(Dialog(tab = "General"));
  parameter Real ZSOURCE_RE = 0 "Machine source impedence" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Tdo_p = 7 "d-axis transient time constant" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Tdo_s = 0.3 "d-axis sub-transient time constant, s" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Tqo_p = 0.04 "q-axis transient time constant, s" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Tqo_s = 0.4 "d-axis sub-transient time constant, s" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real H = 2.6 "Inertia constant" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real D = 0 "Speed damping" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xd = 0.67 "d-axis reactance, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xq = 0.62 "q-axis reactance, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xd_p = 0.3 "d-axis transient reactance, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xq_p = 0.3 "q-axis transient reactance, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xd_s = 0.01 "d-axis sub-transient reactance, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xl = 0.04 "Reactance due to the leakage flux which does not cross the air gap, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real S1 = 0.1 "saturation function value for 1 p.u. input" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real S12 = 0.2 "saturation function value for 1.2 p.u. input" annotation(Dialog(tab = "GENROU Parameters"));
  // IEEEX1 Parameters
  parameter Real TR_ex = 0.025 "(sec)" annotation(Dialog(tab = "IEEEX1"));
  parameter Real KA_ex = 98 annotation(Dialog(tab = "IEEEX1"));
  parameter Real TA_ex = 0.2 "(sec)" annotation(Dialog(tab = "IEEEX1"));
  parameter Real TB_ex = 0.5 "(sec)" annotation(Dialog(tab = "IEEEX1"));
  parameter Real TC_ex = 1 "(sec)" annotation(Dialog(tab = "IEEEX1"));
  parameter Real VRMAX_ex = 9 "or zero" annotation(Dialog(tab = "IEEEX1"));
  parameter Real VRMIN_ex = -5 annotation(Dialog(tab = "IEEEX1"));
  parameter Real KE_ex = 0.5 "or zero" annotation(Dialog(tab = "IEEEX1"));
  parameter Real TE_ex = 0.35 "(>0) (sec)" annotation(Dialog(tab = "IEEEX1"));
  parameter Real KF_ex = 0.03 annotation(Dialog(tab = "IEEEX1"));
  parameter Real TF1_ex = 0.4 "(>0) (sec)" annotation(Dialog(tab = "IEEEX1"));
  parameter Real Switch_ex = 0 annotation(Dialog(tab = "IEEEX1"));
  parameter Real E1_ex = 4 annotation(Dialog(tab = "IEEEX1"));
  parameter Real SE_E1_ex = 0.4 annotation(Dialog(tab = "IEEEX1"));
  parameter Real E2_ex = 5 annotation(Dialog(tab = "IEEEX1"));
  parameter Real SE_E2_ex = 0.5 annotation(Dialog(tab = "IEEEX1"));
  // IEEEST Parameters
  parameter Real A1_pss = 0 annotation(Dialog(tab = "IEEEST Parameters"));
  parameter Real A2_pss = 0 annotation(Dialog(tab = "IEEEST Parameters"));
  parameter Real A3_pss = 0 annotation(Dialog(tab = "IEEEST Parameters"));
  parameter Real A4_pss = 0 annotation(Dialog(tab = "IEEEST Parameters"));
  parameter Real A5_pss = 0 annotation(Dialog(tab = "IEEEST Parameters"));
  parameter Real A6_pss = 0 annotation(Dialog(tab = "IEEEST Parameters"));
  parameter Real T1_pss = 0.03 "(sec)" annotation(Dialog(tab = "IEEEST Parameters"));
  parameter Real T2_pss = 0.01 "(sec)" annotation(Dialog(tab = "IEEEST Parameters"));
  parameter Real T3_pss = 0.02 "(sec)" annotation(Dialog(tab = "IEEEST Parameters"));
  parameter Real T4_pss = 0.01 "(sec)" annotation(Dialog(tab = "IEEEST Parameters"));
  parameter Real T5_pss = 0.2 "(sec)" annotation(Dialog(tab = "IEEEST Parameters"));
  parameter Real T6_pss = 0.1 "(>0)(sec)" annotation(Dialog(tab = "IEEEST Parameters"));
  parameter Real KS_pss = -5 annotation(Dialog(tab = "IEEEST Parameters"));
  parameter Real LSMAX_pss = 6 annotation(Dialog(tab = "IEEEST Parameters"));
  parameter Real LSMIN_pss = -6 annotation(Dialog(tab = "IEEEST Parameters"));
  parameter Real VCU_pss = 1 "(pu) (if equal zero, ignored)" annotation(Dialog(tab = "IEEEST Parameters"));
  parameter Real VCL_pss = 1 "(pu) (if equal zero, ignored)" annotation(Dialog(tab = "IEEEST Parameters"));
  // IEEEST ICONs
  parameter Real M0_pss = 1 "Stabilizer input code" annotation(Dialog(tab = "IEEEST Parameters", group = "ICONs"));
  parameter Real M1_pss = 1 "IB, remote bus number" annotation(Dialog(tab = "IEEEST Parameters", group = "ICONs"));
  // GAST Parameters
  parameter Real R_tg = 0.01 "Speed droop" annotation(Dialog(tab = "GAST Parameters"));
  parameter Real T1_tg = 0.01 "(>0) (sec)" annotation(Dialog(tab = "GAST Parameters"));
  parameter Real T2_tg = 0.01 "(>0) (sec)" annotation(Dialog(tab = "GAST Parameters"));
  parameter Real T3_tg = 0.3 "(>0) (sec)" annotation(Dialog(tab = "GAST Parameters"));
  parameter Real AT_tg = 0.12 "Ambient temperature load limit" annotation(Dialog(tab = "GAST Parameters"));
  parameter Real KT_tg = 0.2 annotation(Dialog(tab = "GAST Parameters"));
  parameter Real VMAX_tg = 0.12 annotation(Dialog(tab = "GAST Parameters"));
  parameter Real VMIN_tg = 0.01 annotation(Dialog(tab = "GAST Parameters"));
  parameter Real DTURB_tg = 0.01 annotation(Dialog(tab = "GAST Parameters"));
// <<< AUTOGEN PARAMS (VERBATIM FROM MODELSETS) END


end GENROU_IEEEX1_IEEEST_GAST;
