within OpalRT.ePHASORSIM.WrappedModels;
block GENROU_AC7B_PSS2B
  extends Wrappers.FMUTemplateVRef(redeclare ModelSets.TypeE.GENROU_AC7B_PSS2B modelSet(
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
      KPR_ex = KPR_ex,
      KIR_ex = KIR_ex,
      KDR_ex = KDR_ex,
      TDR_ex = TDR_ex,
      VRMAX_ex = VRMAX_ex,
      VRMIN_ex = VRMIN_ex,
      KPA_ex = KPA_ex,
      KIA_ex = KIA_ex,
      VAMAX_ex = VAMAX_ex,
      VAMIN_ex = VAMIN_ex,
      KP_ex = KP_ex,
      KL_ex = KL_ex,
      KF1_ex = KF1_ex,
      KF2_ex = KF2_ex,
      KF3_ex = KF3_ex,
      TF3_ex = TF3_ex,
      KC_ex = KC_ex,
      KD_ex = KD_ex,
      KE_ex = KE_ex,
      TE_ex = TE_ex,
      VFEMAX_ex = VFEMAX_ex,
      VEMIN_ex = VEMIN_ex,
      E1_ex = E1_ex,
      S_E1_ex = S_E1_ex,
      E2_ex = E2_ex,
      S_E2_ex = S_E2_ex,
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
      VS1MAX_pss = VS1MAX_pss,
      VS1MIN_pss = VS1MIN_pss,
      VS2MAX_pss = VS2MAX_pss,
      VS2MIN_pss = VS2MIN_pss,
      T10_pss = T10_pss,
      T11_pss = T11_pss,
      M0_pss = M0_pss,
      M1_pss = M1_pss,
      M2_pss = M2_pss,
      M3_pss = M3_pss,
      M4_pss = M4_pss,
      M5_pss = M5_pss));

// >>> AUTOGEN PARAMS (VERBATIM FROM MODELSETS) BEGIN
  parameter Real partType = 1;
  parameter Integer IBUS = 100 "Located system bus" annotation(Dialog(tab = "General"));
  parameter String M_ID = "M1" "Machine Identifier" annotation(Dialog(tab = "General"));
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
  // AC7B parameters
  parameter Real TR_ex = 0.04 "(sec) regulator input filter time constant" annotation(Dialog(tab = "AC7B Parameters"));
  parameter Real KPR_ex = 4.24 "(pu) regulator proportional gain" annotation(Dialog(tab = "AC7B Parameters"));
  parameter Real KIR_ex = 4.24 "(pu) regulator integral gain" annotation(Dialog(tab = "AC7B Parameters"));
  parameter Real KDR_ex = 0 "(pu) regulator derivative gain" annotation(Dialog(tab = "AC7B Parameters"));
  parameter Real TDR_ex = 0 "(sec) regulator derivative block time constant" annotation(Dialog(tab = "AC7B Parameters"));
  parameter Real VRMAX_ex = 5.79 "(pu) regulator output maximum limit" annotation(Dialog(tab = "AC7B Parameters"));
  parameter Real VRMIN_ex = -5.79 "(pu) regulator output minimum limit" annotation(Dialog(tab = "AC7B Parameters"));
  parameter Real KPA_ex = 65.36 "(pu) voltage regulator proportional gain" annotation(Dialog(tab = "AC7B Parameters"));
  parameter Real KIA_ex = 59.69 "(pu) voltage regulator integral gain" annotation(Dialog(tab = "AC7B Parameters"));
  parameter Real VAMAX_ex = 1 "(pu) regulator output maximum limit" annotation(Dialog(tab = "AC7B Parameters"));
  parameter Real VAMIN_ex = -0.95 "(pu) regulator output minimum limit" annotation(Dialog(tab = "AC7B Parameters"));
  parameter Real KP_ex = 4.96 "(pu)" annotation(Dialog(tab = "AC7B Parameters"));
  parameter Real KL_ex = 10 "(pu)" annotation(Dialog(tab = "AC7B Parameters"));
  parameter Real KF1_ex = 0.212 "(pu)" annotation(Dialog(tab = "AC7B Parameters"));
  parameter Real KF2_ex = 0 "(pu)" annotation(Dialog(tab = "AC7B Parameters"));
  parameter Real KF3_ex = 0 "(pu)" annotation(Dialog(tab = "AC7B Parameters"));
  parameter Real TF3_ex = 1 "(sec) time constant (> 0)" annotation(Dialog(tab = "AC7B Parameters"));
  parameter Real KC_ex = 0.18 "(pu) rectifier loading factor proportional to commutating reactance" annotation(Dialog(tab = "AC7B Parameters"));
  parameter Real KD_ex = 0.02 "(pu) demagnetizing factor, function of AC exciter reactances" annotation(Dialog(tab = "AC7B Parameters"));
  parameter Real KE_ex = 1 "(pu) exciter constant related fo self-excited field" annotation(Dialog(tab = "AC7B Parameters"));
  parameter Real TE_ex = 1.1 "(pu) exciter time constant" annotation(Dialog(tab = "AC7B Parameters"));
  parameter Real VFEMAX_ex = 6.9 "(pu) exciter field current limit (> 0)" annotation(Dialog(tab = "AC7B Parameters"));
  parameter Real VEMIN_ex = 0 "(pu)" annotation(Dialog(tab = "AC7B Parameters"));
  parameter Real E1_ex = 6.67 annotation(Dialog(tab = "AC7B Parameters"));
  parameter Real S_E1_ex = 1.951 annotation(Dialog(tab = "AC7B Parameters"));
  parameter Real E2_ex = 5 annotation(Dialog(tab = "AC7B Parameters"));
  parameter Real S_E2_ex = 0.156 annotation(Dialog(tab = "AC7B Parameters"));
  // PSS2B Parameters
  parameter Real TW1_pss = 2 ">0" annotation(Dialog(tab = "PSS2B Parameters"));
  parameter Real TW2_pss = 2 "To bypass second washout, first signal: set Tw2 = 0" annotation(Dialog(tab = "PSS2B Parameters"));
  parameter Real T6_pss = 0.05 "To bypass first signal transducer: set T6 = 0" annotation(Dialog(tab = "PSS2B Parameters"));
  parameter Real TW3_pss = 2 ">0" annotation(Dialog(tab = "PSS2B Parameters"));
  parameter Real TW4_pss = 1.5 "To bypass second washout, second signal: set Tw4 = 0" annotation(Dialog(tab = "PSS2B Parameters"));
  parameter Real T7_pss = 2 "To bypass second signal transducer: set T7 = 0" annotation(Dialog(tab = "PSS2B Parameters"));
  parameter Real KS2_pss = 0.259 "T7/(2*H)" annotation(Dialog(tab = "PSS2B Parameters"));
  //T7/(2*H);
  parameter Real KS3_pss = 1 annotation(Dialog(tab = "PSS2B Parameters"));
  parameter Real T8_pss = 0.5 annotation(Dialog(tab = "PSS2B Parameters"));
  parameter Real T9_pss = 0.1 ">0" annotation(Dialog(tab = "PSS2B Parameters"));
  parameter Real KS1_pss = 15 annotation(Dialog(tab = "PSS2B Parameters"));
  parameter Real T1_pss = 0.15 "To bypass first lead-lag: set T1 = T2 = 0" annotation(Dialog(tab = "PSS2B Parameters"));
  parameter Real T2_pss = 0.05 annotation(Dialog(tab = "PSS2B Parameters"));
  parameter Real T3_pss = 0.15 "To bypass first lead-lag: set T1 = T2 = 0" annotation(Dialog(tab = "PSS2B Parameters"));
  parameter Real T4_pss = 0.05 annotation(Dialog(tab = "PSS2B Parameters"));
  parameter Real VSTMAX_pss = 0.1 annotation(Dialog(tab = "PSS2B Parameters"));
  parameter Real VSTMIN_pss = -0.1 annotation(Dialog(tab = "PSS2B Parameters"));
  parameter Real VS1MAX_pss = 0.1 annotation(Dialog(tab = "PSS2B Parameters"));
  parameter Real VS1MIN_pss = -0.1 annotation(Dialog(tab = "PSS2B Parameters"));
  parameter Real VS2MAX_pss = 0.1 annotation(Dialog(tab = "PSS2B Parameters"));
  parameter Real VS2MIN_pss = -0.1 annotation(Dialog(tab = "PSS2B Parameters"));
  parameter Real T10_pss = 0.3 annotation(Dialog(tab = "PSS2B Parameters"));
  parameter Real T11_pss = 0.15 ">0" annotation(Dialog(tab = "PSS2B Parameters"));
  /// PSS2B ICONs
  parameter Real M0_pss = 1 "ICS1, first stabilizer input code" annotation(Dialog(tab = "PSS2B Parameters", group = "ICONs"));
  parameter Real M1_pss = 0 "REMBUS1, first remote bus number" annotation(Dialog(tab = "PSS2B Parameters", group = "ICONs"));
  parameter Real M2_pss = 3 "ICS2, second stabilizer input code" annotation(Dialog(tab = "PSS2B Parameters", group = "ICONs"));
  parameter Real M3_pss = 0 "REMBUS2, second remote bus number" annotation(Dialog(tab = "PSS2B Parameters", group = "ICONs"));
  parameter Real M4_pss = 5 "M, ramp tracking filter" annotation(Dialog(tab = "PSS2B Parameters", group = "ICONs"));
  parameter Real M5_pss = 1 "N, ramp tracking filter" annotation(Dialog(tab = "PSS2B Parameters", group = "ICONs"));
// <<< AUTOGEN PARAMS (VERBATIM FROM MODELSETS) END


end GENROU_AC7B_PSS2B;
