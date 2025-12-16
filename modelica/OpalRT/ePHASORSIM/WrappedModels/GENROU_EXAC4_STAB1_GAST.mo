within OpalRT.ePHASORSIM.WrappedModels;
block GENROU_EXAC4_STAB1_GAST
  extends Wrappers.FMUTemplateVRefGRef(redeclare ModelSets.TypeF.GENROU_EXAC4_STAB1_GAST modelSet(
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
      VIMAX_ex = VIMAX_ex,
      VIMIN_ex = VIMIN_ex,
      TC_ex = TC_ex,
      TB_ex = TB_ex,
      KA_ex = KA_ex,
      TA_ex = TA_ex,
      VRMAX_ex = VRMAX_ex,
      VRMIN_ex = VRMIN_ex,
      KC_ex = KC_ex,
      R_tg = R_tg,
      T1_tg = T1_tg,
      T2_tg = T2_tg,
      T3_tg = T3_tg,
      AT_tg = AT_tg,
      KT_tg = KT_tg,
      VMAX_tg = VMAX_tg,
      VMIN_tg = VMIN_tg,
      DTURB_tg = DTURB_tg,
      K_T_pss = K_T_pss,
      T_pss = T_pss,
      T1_T3_pss = T1_T3_pss,
      T3_pss = T3_pss,
      T2_T4_pss = T2_T4_pss,
      T4_pss = T4_pss,
      HLIM_pss = HLIM_pss));

// >>> AUTOGEN PARAMS (VERBATIM FROM MODELSETS) BEGIN
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
  // EXAC4 Parameters
  parameter Real TR_ex = 0.01 annotation(Dialog(tab = "EXAC4 Parameters"));
  parameter Real VIMAX_ex = 0.01 annotation(Dialog(tab = "EXAC4 Parameters"));
  parameter Real VIMIN_ex = 0.01 annotation(Dialog(tab = "EXAC4 Parameters"));
  parameter Real TC_ex = 0.01 annotation(Dialog(tab = "EXAC4 Parameters"));
  parameter Real TB_ex = 0.01 "sec" annotation(Dialog(tab = "EXAC4 Parameters"));
  parameter Real KA_ex = 0.01 annotation(Dialog(tab = "EXAC4 Parameters"));
  parameter Real TA_ex = 0.01 annotation(Dialog(tab = "EXAC4 Parameters"));
  parameter Real VRMAX_ex = 0.01 annotation(Dialog(tab = "EXAC4 Parameters"));
  parameter Real VRMIN_ex = 0.01 annotation(Dialog(tab = "EXAC4 Parameters"));
  parameter Real KC_ex = 0.01 annotation(Dialog(tab = "EXAC4 Parameters"));
  // GAST Parameters
  parameter Real R_tg = 0.047 "Speed droop" annotation(Dialog(tab = "GAST Parameters"));
  parameter Real T1_tg = 0.4 "(>0) (sec)" annotation(Dialog(tab = "GAST Parameters"));
  parameter Real T2_tg = 0.1 "(>0) (sec)" annotation(Dialog(tab = "GAST Parameters"));
  parameter Real T3_tg = 3 "(>0) (sec)" annotation(Dialog(tab = "GAST Parameters"));
  parameter Real AT_tg = 1.5 "Ambient temperature load limit" annotation(Dialog(tab = "GAST Parameters"));
  parameter Real KT_tg = 2 annotation(Dialog(tab = "GAST Parameters"));
  parameter Real VMAX_tg = 1.5 annotation(Dialog(tab = "GAST Parameters"));
  parameter Real VMIN_tg = 0 annotation(Dialog(tab = "GAST Parameters"));
  parameter Real DTURB_tg = 0 annotation(Dialog(tab = "GAST Parameters"));
  // STAB Parameters
  parameter Real K_T_pss = 0.01 "sec^-1" annotation(Dialog(tab = "STAB1 Parameters"));
  parameter Real T_pss = 0.01 "sec" annotation(Dialog(tab = "STAB1 Parameters"));
  parameter Real T1_T3_pss = 0.01 annotation(Dialog(tab = "STAB1 Parameters"));
  parameter Real T3_pss = 0.01 "sec" annotation(Dialog(tab = "STAB1 Parameters"));
  parameter Real T2_T4_pss = 0.01 annotation(Dialog(tab = "STAB1 Parameters"));
  parameter Real T4_pss = 0.01 "sec" annotation(Dialog(tab = "STAB1 Parameters"));
  parameter Real HLIM_pss = 0.01 "high limit" annotation(Dialog(tab = "STAB1 Parameters"));
// <<< AUTOGEN PARAMS (VERBATIM FROM MODELSETS) END


end GENROU_EXAC4_STAB1_GAST;
