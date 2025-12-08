within OpalRT.ePHASORSIM.WrappedModels;
block GENROU_EXAC2_PSS2A_GAST
  extends Wrappers.FMUTemplateVRefGRef(redeclare ModelSets.TypeF.GENROU_EXAC2_PSS2A_GAST modelSet(
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
      TB_ex = TB_ex,
      TC_ex = TC_ex,
      KA_ex = KA_ex,
      TA_ex = TA_ex,
      VAMAX_ex = VAMAX_ex,
      VAMIN_ex = VAMIN_ex,
      KB_ex = KB_ex,
      VRMAX_ex = VRMAX_ex,
      VRMIN_ex = VRMIN_ex,
      TE_ex = TE_ex,
      KL_ex = KL_ex,
      KH_ex = KH_ex,
      KF_ex = KF_ex,
      TF_ex = TF_ex,
      KC_ex = KC_ex,
      KD_ex = KD_ex,
      KE_ex = KE_ex,
      VLR_ex = VLR_ex,
      E1_ex = E1_ex,
      SE_E1_ex = SE_E1_ex,
      E2_ex = E2_ex,
      SE_E2_ex = SE_E2_ex,
      R_tg = R_tg,
      T1_tg = T1_tg,
      T2_tg = T2_tg,
      T3_tg = T3_tg,
      AT_tg = AT_tg,
      KT_tg = KT_tg,
      VMAX_tg = VMAX_tg,
      VMIN_tg = VMIN_tg,
      DTURB_tg = DTURB_tg,
      TW1_pss = TW1_pss,
      TW2_pss = TW2_pss,
      T6_pss = T6_pss,
      TW3_pss = TW3_pss,
      TW4_pss = TW4_pss,
      T7_pss = T7_pss,
      KS2_pss = KS2_pss,
      KS3_pss = KS3_pss,
      T8_pss = T8_pss,
      T9_pss = T9_pss,
      KS1_pss = KS1_pss,
      T1_pss = T1_pss,
      T2_pss = T2_pss,
      T3_pss = T3_pss,
      T4_pss = T4_pss,
      VSTMAX_pss = VSTMAX_pss,
      VSTMIN_pss = VSTMIN_pss,
      M0_pss = M0_pss,
      M1_pss = M1_pss,
      M2_pss = M2_pss,
      M3_pss = M3_pss,
      M4_pss = M4_pss,
      M5_pss = M5_pss));

// >>> AUTOGEN PARAMS (VERBATIM FROM MODELSETS) BEGIN
  parameter Real partType = 1;
  // GENROU Parameters
  parameter Integer IBUS = 100 "Located system bus" annotation(Dialog(tab = "General"));
  parameter String M_ID = "M1" "Machine Identifier" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real P_gen = 1000 "Bus Active Power, MW" annotation(Dialog(tab = "General"));
  parameter Real Q_gen = 100 "Bus Reactive Power, MVAR" annotation(Dialog(tab = "General"));
  parameter Real Vt_abs = 0.95 "Bus Voltage Magnitude, p.u." annotation(Dialog(tab = "General"));
  parameter Real Vt_ang = -2 "Bus Voltage Angle, deg." annotation(Dialog(tab = "General"));
  parameter Real SB = 1200 "Machine Base Power, MVA" annotation(Dialog(tab = "General"));
  parameter Real fn = 60 "Nominal frequency" annotation(Dialog(tab = "General"));
  parameter Real ZSOURCE_RE = 0 "Machine source impedence" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Tdo_p = 10.2 "d-axis transient time constant" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Tdo_s = 0.5 "d-axis sub-transient time constant, s" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Tqo_p = 1.02 "q-axis transient time constant, s" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Tqo_s = 0.01 "d-axis sub-transient time constant, s" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real H = 8.2 "Inertia constant" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real D = 0 "Speed damping" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xd = 3 "d-axis reactance, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xq = 0.5 "q-axis reactance, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xd_p = 0.5231 "d-axis transient reactance, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xq_p = 0.361 "q-axis transient reactance, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xd_s = 0.41 "d-axis sub-transient reactance, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xl = 0.2 "Reactance due to the leakage flux which does not cross the air gap, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real S1 = 0.5 "saturation function value for 1 p.u. input" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real S12 = 0.6 "saturation function value for 1.2 p.u. input" annotation(Dialog(tab = "GENROU Parameters"));
  // EXAC2 Parameters
  parameter Real TR_ex = 0.1 "(sec)" annotation(Dialog(tab = "EXAC2 Parameters"));
  parameter Real TB_ex = 12 "(sec)" annotation(Dialog(tab = "EXAC2 Parameters"));
  parameter Real TC_ex = 10 "(sec)" annotation(Dialog(tab = "EXAC2 Parameters"));
  parameter Real KA_ex = 400 annotation(Dialog(tab = "EXAC2 Parameters"));
  parameter Real TA_ex = 5 "(sec)" annotation(Dialog(tab = "EXAC2 Parameters"));
  parameter Real VAMAX_ex = 5 "or zero" annotation(Dialog(tab = "EXAC2 Parameters"));
  parameter Real VAMIN_ex = -5 annotation(Dialog(tab = "EXAC2 Parameters"));
  parameter Real KB_ex = 0.4 annotation(Dialog(tab = "EXAC2 Parameters"));
  parameter Real VRMAX_ex = 5 "or zero" annotation(Dialog(tab = "EXAC2 Parameters"));
  parameter Real VRMIN_ex = -5 annotation(Dialog(tab = "EXAC2 Parameters"));
  parameter Real TE_ex = 0.08 "(sec)" annotation(Dialog(tab = "EXAC2 Parameters"));
  parameter Real KL_ex = 0.4 annotation(Dialog(tab = "EXAC2 Parameters"));
  parameter Real KH_ex = 0.4 annotation(Dialog(tab = "EXAC2 Parameters"));
  parameter Real KF_ex = 0.2 annotation(Dialog(tab = "EXAC2 Parameters"));
  parameter Real TF_ex = 1.2 "(>0) (sec)" annotation(Dialog(tab = "EXAC2 Parameters"));
  parameter Real KC_ex = 0.4 annotation(Dialog(tab = "EXAC2 Parameters"));
  parameter Real KD_ex = 0.4 annotation(Dialog(tab = "EXAC2 Parameters"));
  parameter Real KE_ex = 0.5 "or zero" annotation(Dialog(tab = "EXAC2 Parameters"));
  parameter Real VLR_ex = 4 annotation(Dialog(tab = "EXAC2 Parameters"));
  parameter Real E1_ex = 4 annotation(Dialog(tab = "EXAC2 Parameters"));
  parameter Real SE_E1_ex = 0.4 annotation(Dialog(tab = "EXAC2 Parameters"));
  parameter Real E2_ex = 5 annotation(Dialog(tab = "EXAC2 Parameters"));
  parameter Real SE_E2_ex = 0.5 annotation(Dialog(tab = "EXAC2 Parameters"));
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
  // PSS2A Parameters
  parameter Real TW1_pss = 0.1 ">0" annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real TW2_pss = 1 "To bypass second washout, first signal: set Tw2 = 0" annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real T6_pss = 1 "To bypass first signal transducer: set T6 = 0" annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real TW3_pss = 1.5 ">0" annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real TW4_pss = 0.2 "To bypass second washout, second signal: set Tw4 = 0" annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real T7_pss = 0.2 "To bypass second signal transducer: set T7 = 0" annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real KS2_pss = 0.1 "T7/(2*H)" annotation(Dialog(tab = "PSS2A Parameters"));
  //T7/(2*H);
  parameter Real KS3_pss = 0.1 annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real T8_pss = 0.05 annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real T9_pss = 0.01 ">0" annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real KS1_pss = 0.15 annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real T1_pss = 0.1 "To bypass first lead-lag: set T1 = T2 = 0" annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real T2_pss = 0.1 annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real T3_pss = 0.01 "To bypass first lead-lag: set T1 = T2 = 0" annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real T4_pss = 1 annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real VSTMAX_pss = 1 annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real VSTMIN_pss = -1 annotation(Dialog(tab = "PSS2A Parameters"));
  // PSS2A ICONs
  parameter Real M0_pss = 2 "ICS1, first stabilizer input code" annotation(Dialog(tab = "PSS2A Parameters", group = "ICONs"));
  parameter Real M1_pss = 2 "REMBUS1, first remote bus number" annotation(Dialog(tab = "PSS2A Parameters", group = "ICONs"));
  parameter Real M2_pss = 2 "ICS2, second stabilizer input code" annotation(Dialog(tab = "PSS2A Parameters", group = "ICONs"));
  parameter Real M3_pss = 2 "REMBUS2, second remote bus number" annotation(Dialog(tab = "PSS2A Parameters", group = "ICONs"));
  parameter Real M4_pss = 1 "M, ramp tracking filter" annotation(Dialog(tab = "PSS2A Parameters", group = "ICONs"));
  parameter Real M5_pss = 2 "N, ramp tracking filter" annotation(Dialog(tab = "PSS2A Parameters", group = "ICONs"));
// <<< AUTOGEN PARAMS (VERBATIM FROM MODELSETS) END


end GENROU_EXAC2_PSS2A_GAST;
