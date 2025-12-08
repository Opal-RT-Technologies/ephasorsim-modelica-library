within OpalRT.ePHASORSIM.WrappedModels;
block GENSAL_ESST1A_PSS2A_WEHGOV
  extends Wrappers.FMUTemplateVRefGRef(redeclare ModelSets.TypeF.GENSAL_ESST1A_PSS2A_WEHGOV modelSet(
      partType = partType,
      IBUS = IBUS,
      ID = ID,
      P_gen = P_gen,
      Q_gen = Q_gen,
      Vt_abs = Vt_abs,
      Vt_ang = Vt_ang,
      SB = SB,
      fn = fn,
      ZSOURCE_RE = ZSOURCE_RE,
      Tdo_p = Tdo_p,
      Tdo_s = Tdo_s,
      Tqo_s = Tqo_s,
      H = H,
      D = D,
      Xd = Xd,
      Xq = Xq,
      Xd_p = Xd_p,
      Xd_s = Xd_s,
      Xl = Xl,
      S1 = S1,
      S12 = S12,
      TR_ex = TR_ex,
      VIMAX_ex = VIMAX_ex,
      VIMIN_ex = VIMIN_ex,
      TC_ex = TC_ex,
      TB_ex = TB_ex,
      TC1_ex = TC1_ex,
      TB1_ex = TB1_ex,
      KA_ex = KA_ex,
      TA_ex = TA_ex,
      VAMAX_ex = VAMAX_ex,
      VAMIN_ex = VAMIN_ex,
      VRMAX_ex = VRMAX_ex,
      VRMIN_ex = VRMIN_ex,
      KC_ex = KC_ex,
      KF_ex = KF_ex,
      TF_ex = TF_ex,
      KLR_ex = KLR_ex,
      ILR_ex = ILR_ex,
      UEL_ex = UEL_ex,
      VOS_ex = VOS_ex,
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
      M5_pss = M5_pss,
      R_PERM_GATE_tg = R_PERM_GATE_tg,
      R_PERM_PE_tg = R_PERM_PE_tg,
      TPE_tg = TPE_tg,
      KP_tg = KP_tg,
      KI_tg = KI_tg,
      KD_tg = KD_tg,
      TD_tg = TD_tg,
      TP_tg = TP_tg,
      TDV_tg = TDV_tg,
      Tg_tg = Tg_tg,
      GTMXOP_tg = GTMXOP_tg,
      GTMXCL_tg = GTMXCL_tg,
      GMAX_tg = GMAX_tg,
      GMIN_tg = GMIN_tg,
      DTURB_tg = DTURB_tg,
      TW_tg = TW_tg,
      DBAND_tg = DBAND_tg,
      DPV_tg = DPV_tg,
      DICN_tg = DICN_tg,
      GATE1_tg = GATE1_tg,
      FLOWG1_tg = FLOWG1_tg,
      GATE2_tg = GATE2_tg,
      FLOWG2_tg = FLOWG2_tg,
      GATE3_tg = GATE3_tg,
      FLOWG3_tg = FLOWG3_tg,
      GATE4_tg = GATE4_tg,
      FLOWG4_tg = FLOWG4_tg,
      GATE5_tg = GATE5_tg,
      FLOWG5_tg = FLOWG5_tg,
      FLOWP1_tg = FLOWP1_tg,
      PMECH1_tg = PMECH1_tg,
      FLOWP2_tg = FLOWP2_tg,
      PMECH2_tg = PMECH2_tg,
      FLOWP3_tg = FLOWP3_tg,
      PMECH3_tg = PMECH3_tg,
      FLOWP4_tg = FLOWP4_tg,
      PMECH4_tg = PMECH4_tg,
      FLOWP5_tg = FLOWP5_tg,
      PMECH5_tg = PMECH5_tg,
      FLOWP6_tg = FLOWP6_tg,
      PMECH6_tg = PMECH6_tg,
      FLOWP7_tg = FLOWP7_tg,
      PMECH7_tg = PMECH7_tg,
      FLOWP8_tg = FLOWP8_tg,
      PMECH8_tg = PMECH8_tg,
      FLOWP9_tg = FLOWP9_tg,
      PMECH9_tg = PMECH9_tg,
      FLOWP10_tg = FLOWP10_tg,
      PMECH10_tg = PMECH10_tg,
      M_tg = M_tg));

// >>> AUTOGEN PARAMS (VERBATIM FROM MODELSETS) BEGIN
  parameter Real partType = 1;
  // GENSAL Parameters
  parameter Integer IBUS = 100 "Located system bus" annotation(Dialog(tab = "General"));
  parameter String ID = "M1" "Machine Identifier" annotation(Dialog(tab = "GENSAL"));
  parameter Real P_gen = 1100 "Bus Active Power, MW" annotation(Dialog(tab = "General"));
  parameter Real Q_gen = 342.702 "Bus Reactive Power, MVAR" annotation(Dialog(tab = "General"));
  parameter Real Vt_abs = 1.03 "Bus Voltage Magnitude, p.u." annotation(Dialog(tab = "General"));
  parameter Real Vt_ang = -10.96 "Bus Voltage Angle, deg." annotation(Dialog(tab = "General"));
  parameter Real SB = 1000 "Machine Base Power, MVA" annotation(Dialog(tab = "General"));
  parameter Real fn = 50 "Nominal frequency" annotation(Dialog(tab = "General"));
  parameter Real ZSOURCE_RE = 0 "Machine source impedence" annotation(Dialog(tab = "GENSAL"));
  parameter Real Tdo_p = 7 "d-axis transient time constant" annotation(Dialog(tab = "GENSAL"));
  parameter Real Tdo_s = 0.03 "d-axis sub-transient time constant, s" annotation(Dialog(tab = "GENSAL"));
  parameter Real Tqo_s = 0.04 "d-axis sub-transient time constant, s" annotation(Dialog(tab = "GENSAL"));
  parameter Real H = 50 "Inertia constant" annotation(Dialog(tab = "GENSAL"));
  parameter Real D = 0 "Speed damping" annotation(Dialog(tab = "GENSAL"));
  parameter Real Xd = 0.2 "d-axis reactance, p.u." annotation(Dialog(tab = "GENSAL"));
  parameter Real Xq = 0.19 "q-axis reactance, p.u." annotation(Dialog(tab = "GENSAL"));
  parameter Real Xd_p = 0.06 "d-axis transient reactance, p.u." annotation(Dialog(tab = "GENSAL"));
  parameter Real Xd_s = 0.02 "d-axis sub-transient reactance, p.u." annotation(Dialog(tab = "GENSAL"));
  parameter Real Xl = 0.03 "Reactance due to the leakage flux which does not cross the air gap, p.u." annotation(Dialog(tab = "GENSAL"));
  parameter Real S1 = 0.4 "saturation function value for 1 p.u. input" annotation(Dialog(tab = "GENSAL"));
  parameter Real S12 = 0.8 "saturation function value for 1.2 p.u. input" annotation(Dialog(tab = "GENSAL"));
  // ESST1A parameters
  parameter Real TR_ex = 0.02 "(sec)" annotation(Dialog(tab = "ESST1A"));
  parameter Real VIMAX_ex = 10 annotation(Dialog(tab = "ESST1A"));
  parameter Real VIMIN_ex = -10 annotation(Dialog(tab = "ESST1A"));
  parameter Real TC_ex = 1 "(sec)" annotation(Dialog(tab = "ESST1A"));
  parameter Real TB_ex = 1 "(sec)" annotation(Dialog(tab = "ESST1A"));
  parameter Real TC1_ex = 0 "(sec)" annotation(Dialog(tab = "ESST1A"));
  parameter Real TB1_ex = 0 "(sec)" annotation(Dialog(tab = "ESST1A"));
  parameter Real KA_ex = 210 annotation(Dialog(tab = "ESST1A"));
  parameter Real TA_ex = 0 "(sec)" annotation(Dialog(tab = "ESST1A"));
  parameter Real VAMAX_ex = 10 annotation(Dialog(tab = "ESST1A"));
  parameter Real VAMIN_ex = -10 annotation(Dialog(tab = "ESST1A"));
  parameter Real VRMAX_ex = 6.43 annotation(Dialog(tab = "ESST1A"));
  parameter Real VRMIN_ex = -6 annotation(Dialog(tab = "ESST1A"));
  parameter Real KC_ex = 0.038 annotation(Dialog(tab = "ESST1A"));
  parameter Real KF_ex = 0 annotation(Dialog(tab = "ESST1A"));
  parameter Real TF_ex = 0 "> 0 (sec)" annotation(Dialog(tab = "ESST1A"));
  parameter Real KLR_ex = 4.54 annotation(Dialog(tab = "ESST1A"));
  parameter Real ILR_ex = 4.4 annotation(Dialog(tab = "ESST1A"));
  // ICONS
  parameter Real UEL_ex = 1 "1,2 or 3" annotation(Dialog(tab = "ESST1A"));
  parameter Real VOS_ex = 1 "1 or 2" annotation(Dialog(tab = "ESST1A"));
  // PSS2A Parameters
  parameter Real TW1_pss = 0.1 ">0" annotation(Dialog(tab = "PSS2A"));
  parameter Real TW2_pss = 1 "To bypass second washout, first signal: set Tw2 = 0" annotation(Dialog(tab = "PSS2A"));
  parameter Real T6_pss = 1 "To bypass first signal transducer: set T6 = 0" annotation(Dialog(tab = "PSS2A"));
  parameter Real TW3_pss = 1.5 ">0" annotation(Dialog(tab = "PSS2A"));
  parameter Real TW4_pss = 0.2 "To bypass second washout, second signal: set Tw4 = 0" annotation(Dialog(tab = "PSS2A"));
  parameter Real T7_pss = 0.2 "To bypass second signal transducer: set T7 = 0" annotation(Dialog(tab = "PSS2A"));
  parameter Real KS2_pss = 0.1 "T7/(2*H)" annotation(Dialog(tab = "PSS2A"));
  //T7/(2*H);
  parameter Real KS3_pss = 0.1 annotation(Dialog(tab = "PSS2A"));
  parameter Real T8_pss = 0.05 annotation(Dialog(tab = "PSS2A"));
  parameter Real T9_pss = 0.01 ">0" annotation(Dialog(tab = "PSS2A"));
  parameter Real KS1_pss = 0.15 annotation(Dialog(tab = "PSS2A"));
  parameter Real T1_pss = 0.1 "To bypass first lead-lag: set T1 = T2 = 0" annotation(Dialog(tab = "PSS2A"));
  parameter Real T2_pss = 0.1 annotation(Dialog(tab = "PSS2A"));
  parameter Real T3_pss = 0.01 "To bypass first lead-lag: set T1 = T2 = 0" annotation(Dialog(tab = "PSS2A"));
  parameter Real T4_pss = 1 annotation(Dialog(tab = "PSS2A"));
  parameter Real VSTMAX_pss = 1 annotation(Dialog(tab = "PSS2A"));
  parameter Real VSTMIN_pss = -1 annotation(Dialog(tab = "PSS2A"));
  // PSS2A ICONs
  parameter Real M0_pss = 2 "ICS1, first stabilizer input code" annotation(Dialog(tab = "PSS2A", group = "ICONs"));
  parameter Real M1_pss = 2 "REMBUS1, first remote bus number" annotation(Dialog(tab = "PSS2A", group = "ICONs"));
  parameter Real M2_pss = 2 "ICS2, second stabilizer input code" annotation(Dialog(tab = "PSS2A", group = "ICONs"));
  parameter Real M3_pss = 2 "REMBUS2, second remote bus number" annotation(Dialog(tab = "PSS2A", group = "ICONs"));
  parameter Real M4_pss = 1 "M, ramp tracking filter" annotation(Dialog(tab = "PSS2A", group = "ICONs"));
  parameter Real M5_pss = 2 "N, ramp tracking filter" annotation(Dialog(tab = "PSS2A", group = "ICONs"));
  //WEHGOV parameters
  parameter Real R_PERM_GATE_tg = 0.04 annotation(Dialog(tab = "WEHGOV"));
  parameter Real R_PERM_PE_tg = 0.05 annotation(Dialog(tab = "WEHGOV"));
  parameter Real TPE_tg = 1.0 annotation(Dialog(tab = "WEHGOV"));
  parameter Real KP_tg = 1.0 annotation(Dialog(tab = "WEHGOV"));
  parameter Real KI_tg = 0.1 annotation(Dialog(tab = "WEHGOV"));
  parameter Real KD_tg = 0.01 annotation(Dialog(tab = "WEHGOV"));
  parameter Real TD_tg = 0.01 annotation(Dialog(tab = "WEHGOV"));
  parameter Real TP_tg = 0.2 annotation(Dialog(tab = "WEHGOV"));
  parameter Real TDV_tg = 0.3 annotation(Dialog(tab = "WEHGOV"));
  parameter Real Tg_tg = 0.2 annotation(Dialog(tab = "WEHGOV"));
  parameter Real GTMXOP_tg = 0.01 annotation(Dialog(tab = "WEHGOV"));
  parameter Real GTMXCL_tg = -0.01 annotation(Dialog(tab = "WEHGOV"));
  parameter Real GMAX_tg = 1.0 annotation(Dialog(tab = "WEHGOV"));
  parameter Real GMIN_tg = 0.0 annotation(Dialog(tab = "WEHGOV"));
  parameter Real DTURB_tg = 0.01 annotation(Dialog(tab = "WEHGOV"));
  parameter Real TW_tg = 1.0 annotation(Dialog(tab = "WEHGOV"));
  parameter Real DBAND_tg = 0.01 annotation(Dialog(tab = "WEHGOV"));
  parameter Real DPV_tg = 0.0 annotation(Dialog(tab = "WEHGOV"));
  parameter Real DICN_tg = 0.04 annotation(Dialog(tab = "WEHGOV"));
  parameter Real GATE1_tg = 0.0 annotation(Dialog(tab = "WEHGOV"));
  parameter Real FLOWG1_tg = 0.0 annotation(Dialog(tab = "WEHGOV"));
  parameter Real GATE2_tg = 1.0 annotation(Dialog(tab = "WEHGOV"));
  parameter Real FLOWG2_tg = 1.0 annotation(Dialog(tab = "WEHGOV"));
  parameter Real GATE3_tg = 1.0 annotation(Dialog(tab = "WEHGOV"));
  parameter Real FLOWG3_tg = 1.0 annotation(Dialog(tab = "WEHGOV"));
  parameter Real GATE4_tg = 1.0 annotation(Dialog(tab = "WEHGOV"));
  parameter Real FLOWG4_tg = 1.0 annotation(Dialog(tab = "WEHGOV"));
  parameter Real GATE5_tg = 1.0 annotation(Dialog(tab = "WEHGOV"));
  parameter Real FLOWG5_tg = 1.0 annotation(Dialog(tab = "WEHGOV"));
  parameter Real FLOWP1_tg = 0.0 annotation(Dialog(tab = "WEHGOV"));
  parameter Real PMECH1_tg = 0.0 annotation(Dialog(tab = "WEHGOV"));
  parameter Real FLOWP2_tg = 0.1 annotation(Dialog(tab = "WEHGOV"));
  parameter Real PMECH2_tg = 0.1 annotation(Dialog(tab = "WEHGOV"));
  parameter Real FLOWP3_tg = 0.2 annotation(Dialog(tab = "WEHGOV"));
  parameter Real PMECH3_tg = 0.1 annotation(Dialog(tab = "WEHGOV"));
  parameter Real FLOWP4_tg = 0.3 annotation(Dialog(tab = "WEHGOV"));
  parameter Real PMECH4_tg = 0.3 annotation(Dialog(tab = "WEHGOV"));
  parameter Real FLOWP5_tg = 0.4 annotation(Dialog(tab = "WEHGOV"));
  parameter Real PMECH5_tg = 0.4 annotation(Dialog(tab = "WEHGOV"));
  parameter Real FLOWP6_tg = 0.5 annotation(Dialog(tab = "WEHGOV"));
  parameter Real PMECH6_tg = 0.5 annotation(Dialog(tab = "WEHGOV"));
  parameter Real FLOWP7_tg = 0.6 annotation(Dialog(tab = "WEHGOV"));
  parameter Real PMECH7_tg = 0.6 annotation(Dialog(tab = "WEHGOV"));
  parameter Real FLOWP8_tg = 0.7 annotation(Dialog(tab = "WEHGOV"));
  parameter Real PMECH8_tg = 0.7 annotation(Dialog(tab = "WEHGOV"));
  parameter Real FLOWP9_tg = 0.8 annotation(Dialog(tab = "WEHGOV"));
  parameter Real PMECH9_tg = 0.8 annotation(Dialog(tab = "WEHGOV"));
  parameter Real FLOWP10_tg = 1.00 annotation(Dialog(tab = "WEHGOV"));
  parameter Real PMECH10_tg = 1.00 annotation(Dialog(tab = "WEHGOV"));
  parameter Real M_tg = 0 annotation(Dialog(tab = "WEHGOV"));
// <<< AUTOGEN PARAMS (VERBATIM FROM MODELSETS) END


end GENSAL_ESST1A_PSS2A_WEHGOV;
