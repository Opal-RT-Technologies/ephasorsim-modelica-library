within OpalRT.ePHASORSIM.WrappedModels;
block GENSAL_ESST1A_PSS2A_HYGOV4
  extends Wrappers.FMUTemplateVRefGRef(redeclare ModelSets.TypeF.GENSAL_ESST1A_PSS2A_HYGOV4 modelSet(
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
      db_tg = db_tg,
      R_tg = R_tg,
      r_tg = r_tg,
      Tr_tg = Tr_tg,
      Tf_tg = Tf_tg,
      Tg_tg = Tg_tg,
      Uopen_tg = Uopen_tg,
      Uclose_tg = Uclose_tg,
      GMAX_tg = GMAX_tg,
      GMIN_tg = GMIN_tg,
      Dturb_tg = Dturb_tg,
      TW_tg = TW_tg,
      G0_tg = G0_tg,
      Q0_tg = Q0_tg,
      G1_tg = G1_tg,
      Q1_tg = Q1_tg,
      G2_tg = G2_tg,
      Q2_tg = Q2_tg,
      G3_tg = G3_tg,
      Q3_tg = Q3_tg,
      G4_tg = G4_tg,
      Q4_tg = Q4_tg,
      F0_tg = F0_tg,
      P0_tg = P0_tg,
      F1_tg = F1_tg,
      P1_tg = P1_tg,
      F2_tg = F2_tg,
      P2_tg = P2_tg,
      F3_tg = F3_tg,
      P3_tg = P3_tg,
      F4_tg = F4_tg,
      P4_tg = P4_tg,
      F5_tg = F5_tg,
      P5_tg = P5_tg,
      F6_tg = F6_tg,
      P6_tg = P6_tg,
      F7_tg = F7_tg,
      P7_tg = P7_tg,
      F8_tg = F8_tg,
      P8_tg = P8_tg,
      F9_tg = F9_tg,
      P9_tg = P9_tg));

// >>> AUTOGEN PARAMS (VERBATIM FROM MODELSETS) BEGIN
  parameter Real partType = 1;
  // GENSAL Parameters
  parameter Integer IBUS = 100 "Located system bus" annotation(Dialog(tab = "General"));
  parameter String M_ID = "M1" "Machine Identifier" annotation(Dialog(tab = "GENSAL"));
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
  //HYGOV4 parameter
  parameter Real db_tg = 0.06 "Hysteresis deadband" annotation(Dialog(tab = "HYGOV4"));
  parameter Real R_tg = 0.06 "Permanent Droop" annotation(Dialog(tab = "HYGOV4"));
  parameter Real r_tg = 0.4 "Temporary Droop" annotation(Dialog(tab = "HYGOV4"));
  parameter Real Tr_tg = 8 "(>0) Dashpot time constant" annotation(Dialog(tab = "HYGOV4"));
  parameter Real Tf_tg = 0.05 "(>0) Pilot valve time constant" annotation(Dialog(tab = "HYGOV4"));
  parameter Real Tg_tg = 0.2 "(>0) Actuator time const" annotation(Dialog(tab = "HYGOV4"));
  parameter Real Uopen_tg = 0.07 "Rate of gate Opening" annotation(Dialog(tab = "HYGOV4"));
  parameter Real Uclose_tg = -0.11 "(<0) Rate of gate clsoing" annotation(Dialog(tab = "HYGOV4"));
  parameter Real GMAX_tg = 1.0 annotation(Dialog(tab = "HYGOV4"));
  parameter Real GMIN_tg = 0.0 annotation(Dialog(tab = "HYGOV4"));
  parameter Real Dturb_tg = 0.01 annotation(Dialog(tab = "HYGOV4"));
  parameter Real TW_tg = 1.0 annotation(Dialog(tab = "HYGOV4"));
  parameter Real G0_tg = 0.0 annotation(Dialog(tab = "HYGOV4"));
  parameter Real Q0_tg = 0.0 annotation(Dialog(tab = "HYGOV4"));
  parameter Real G1_tg = 1.0 annotation(Dialog(tab = "HYGOV4"));
  parameter Real Q1_tg = 1.0 annotation(Dialog(tab = "HYGOV4"));
  parameter Real G2_tg = 1.0 annotation(Dialog(tab = "HYGOV4"));
  parameter Real Q2_tg = 1.0 annotation(Dialog(tab = "HYGOV4"));
  parameter Real G3_tg = 1.0 annotation(Dialog(tab = "HYGOV4"));
  parameter Real Q3_tg = 1.0 annotation(Dialog(tab = "HYGOV4"));
  parameter Real G4_tg = 1.0 annotation(Dialog(tab = "HYGOV4"));
  parameter Real Q4_tg = 1.0 annotation(Dialog(tab = "HYGOV4"));
  parameter Real F0_tg = 0.0 annotation(Dialog(tab = "HYGOV4"));
  parameter Real P0_tg = 0.0 annotation(Dialog(tab = "HYGOV4"));
  parameter Real F1_tg = 0.0 annotation(Dialog(tab = "HYGOV4"));
  parameter Real P1_tg = 0.0 annotation(Dialog(tab = "HYGOV4"));
  parameter Real F2_tg = 0.1 annotation(Dialog(tab = "HYGOV4"));
  parameter Real P2_tg = 0.1 annotation(Dialog(tab = "HYGOV4"));
  parameter Real F3_tg = 0.2 annotation(Dialog(tab = "HYGOV4"));
  parameter Real P3_tg = 0.1 annotation(Dialog(tab = "HYGOV4"));
  parameter Real F4_tg = 0.3 annotation(Dialog(tab = "HYGOV4"));
  parameter Real P4_tg = 0.3 annotation(Dialog(tab = "HYGOV4"));
  parameter Real F5_tg = 0.4 annotation(Dialog(tab = "HYGOV4"));
  parameter Real P5_tg = 0.4 annotation(Dialog(tab = "HYGOV4"));
  parameter Real F6_tg = 0.5 annotation(Dialog(tab = "HYGOV4"));
  parameter Real P6_tg = 0.5 annotation(Dialog(tab = "HYGOV4"));
  parameter Real F7_tg = 0.6 annotation(Dialog(tab = "HYGOV4"));
  parameter Real P7_tg = 0.6 annotation(Dialog(tab = "HYGOV4"));
  parameter Real F8_tg = 0.7 annotation(Dialog(tab = "HYGOV4"));
  parameter Real P8_tg = 0.7 annotation(Dialog(tab = "HYGOV4"));
  parameter Real F9_tg = 0.8 annotation(Dialog(tab = "HYGOV4"));
  parameter Real P9_tg = 0.8 annotation(Dialog(tab = "HYGOV4"));
  //
// <<< AUTOGEN PARAMS (VERBATIM FROM MODELSETS) END


end GENSAL_ESST1A_PSS2A_HYGOV4;
