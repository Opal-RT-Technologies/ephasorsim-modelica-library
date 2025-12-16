within OpalRT.ePHASORSIM.WrappedModels;
block GENROU_EXST3_PSS3B_IEEEG3
  extends Wrappers.FMUTemplateVRefGRef(redeclare ModelSets.TypeF.GENROU_EXST3_PSS3B_IEEEG3 modelSet(
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
      KJ_ex = KJ_ex,
      TC_ex = TC_ex,
      TB_ex = TB_ex,
      KA_ex = KA_ex,
      TA_ex = TA_ex,
      VRMAX_ex = VRMAX_ex,
      VRMIN_ex = VRMIN_ex,
      KG_ex = KG_ex,
      KP_ex = KP_ex,
      KI_ex = KI_ex,
      EFDMAX_ex = EFDMAX_ex,
      KC_ex = KC_ex,
      XL_ex = XL_ex,
      VGMAX_ex = VGMAX_ex,
      THETAP_ex = THETAP_ex,
      KS1_pss = KS1_pss,
      T1_pss = T1_pss,
      TW1_pss = TW1_pss,
      KS2_pss = KS2_pss,
      T2_pss = T2_pss,
      TW2_pss = TW2_pss,
      TW3_pss = TW3_pss,
      A1_pss = A1_pss,
      A2_pss = A2_pss,
      A3_pss = A3_pss,
      A4_pss = A4_pss,
      A5_pss = A5_pss,
      A6_pss = A6_pss,
      A7_pss = A7_pss,
      A8_pss = A8_pss,
      VSTMAX_pss = VSTMAX_pss,
      VSTMIN_pss = VSTMIN_pss,
      M0_pss = M0_pss,
      M1_pss = M1_pss,
      M2_pss = M2_pss,
      M3_pss = M3_pss,
      TG_tg = TG_tg,
      TP_tg = TP_tg,
      Uo_tg = Uo_tg,
      Uc_tg = Uc_tg,
      PMAX_tg = PMAX_tg,
      PMIN_tg = PMIN_tg,
      Sigma_tg = Sigma_tg,
      Delta_tg = Delta_tg,
      TR_tg = TR_tg,
      TW_tg = TW_tg,
      a11_tg = a11_tg,
      a13_tg = a13_tg,
      a21_tg = a21_tg,
      a23_tg = a23_tg));

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
  // EXST3 Parameters
  parameter Real TR_ex = 0.1 "(sec)" annotation(Dialog(tab = "EXST3 Parameters"));
  parameter Real VIMAX_ex = 3 annotation(Dialog(tab = "EXST3 Parameters"));
  parameter Real VIMIN_ex = -3 annotation(Dialog(tab = "EXST3 Parameters"));
  parameter Real KJ_ex = 0.2 annotation(Dialog(tab = "EXST3 Parameters"));
  parameter Real TC_ex = 12 "(sec)" annotation(Dialog(tab = "EXST3 Parameters"));
  parameter Real TB_ex = 12 "(sec)" annotation(Dialog(tab = "EXST3 Parameters"));
  parameter Real KA_ex = 0.2 annotation(Dialog(tab = "EXST3 Parameters"));
  parameter Real TA_ex = 12 "(sec)" annotation(Dialog(tab = "EXST3 Parameters"));
  parameter Real VRMAX_ex = 5 annotation(Dialog(tab = "EXST3 Parameters"));
  parameter Real VRMIN_ex = -5 annotation(Dialog(tab = "EXST3 Parameters"));
  parameter Real KG_ex = 0.2 annotation(Dialog(tab = "EXST3 Parameters"));
  parameter Real KP_ex = 0.4 annotation(Dialog(tab = "EXST3 Parameters"));
  parameter Real KI_ex = 0.5 annotation(Dialog(tab = "EXST3 Parameters"));
  parameter Real EFDMAX_ex = 5 annotation(Dialog(tab = "EXST3 Parameters"));
  parameter Real KC_ex = 0.5 annotation(Dialog(tab = "EXST3 Parameters"));
  parameter Real XL_ex = 0.4 annotation(Dialog(tab = "EXST3 Parameters"));
  parameter Real VGMAX_ex = 10 annotation(Dialog(tab = "EXST3 Parameters"));
  parameter Real THETAP_ex = 0.4 annotation(Dialog(tab = "EXST3 Parameters"));
  // PSS3B Parameters:
  parameter Real KS1_pss = 1 "(pu) (?0), input channel #1 gain" annotation(Dialog(tab = "PSS3B Parameters"));
  parameter Real T1_pss = 1 "input channel #1 transducer time constant (sec)" annotation(Dialog(tab = "PSS3B Parameters"));
  parameter Real TW1_pss = 1 "input channel #1 washout time constant (sec)" annotation(Dialog(tab = "PSS3B Parameters"));
  parameter Real KS2_pss = 1 "(pu) (?0), input channel #2 gain" annotation(Dialog(tab = "PSS3B Parameters"));
  parameter Real T2_pss = 1 "input channel #2 transducer time constant (sec)" annotation(Dialog(tab = "PSS3B Parameters"));
  parameter Real TW2_pss = 1 "input channel #2 washout time constant (sec)" annotation(Dialog(tab = "PSS3B Parameters"));
  parameter Real TW3_pss = 1 "(0), main washout time constant (sec)" annotation(Dialog(tab = "PSS3B Parameters"));
  parameter Real A1_pss = 1 annotation(Dialog(tab = "PSS3B Parameters"));
  parameter Real A2_pss = 1 annotation(Dialog(tab = "PSS3B Parameters"));
  parameter Real A3_pss = 1 annotation(Dialog(tab = "PSS3B Parameters"));
  parameter Real A4_pss = 1 annotation(Dialog(tab = "PSS3B Parameters"));
  parameter Real A5_pss = 1 annotation(Dialog(tab = "PSS3B Parameters"));
  parameter Real A6_pss = 1 annotation(Dialog(tab = "PSS3B Parameters"));
  parameter Real A7_pss = 1 annotation(Dialog(tab = "PSS3B Parameters"));
  parameter Real A8_pss = 1 annotation(Dialog(tab = "PSS3B Parameters"));
  parameter Real VSTMAX_pss = 10 "(pu), stabilizer output maximum limit" annotation(Dialog(tab = "PSS3B Parameters"));
  parameter Real VSTMIN_pss = -10 "(pu), stabilizer output minimum limit" annotation(Dialog(tab = "PSS3B Parameters"));
  parameter Real M0_pss = 1 "code for first channel stabilizer input variable" annotation(Dialog(tab = "PSS3B Parameters"));
  parameter Real M1_pss = 1 "currently disabled" annotation(Dialog(tab = "PSS3B Parameters"));
  parameter Real M2_pss = 1 "code for first channel stabilizer input variable" annotation(Dialog(tab = "PSS3B Parameters"));
  parameter Real M3_pss = 1 "currently disabled" annotation(Dialog(tab = "PSS3B Parameters"));
  // IEEEG3 Parameters
  parameter Real TG_tg = 1 "?(>0) (sec), gate servomotor time constant";
  parameter Real TP_tg = 0.5 "(sec)";
  parameter Real Uo_tg = 0.1 "(pu/sec)";
  parameter Real Uc_tg = -0.2 "(<0)(pu/sec)";
  parameter Real PMAX_tg = 1 "(pu on machine MVA rating)";
  parameter Real PMIN_tg = 0 "(pu on machine MVA rating)";
  parameter Real Sigma_tg = 0.4 "permanent speed droop coefficient";
  parameter Real Delta_tg = 0.4 "transient speed droop coefficient";
  parameter Real TR_tg = 0.2;
  parameter Real TW_tg = 0;
  parameter Real a11_tg = 7 "(sec)";
  parameter Real a13_tg = 0.1;
  parameter Real a21_tg = 0;
  parameter Real a23_tg = 0.6 "(sec)";
// <<< AUTOGEN PARAMS (VERBATIM FROM MODELSETS) END


end GENROU_EXST3_PSS3B_IEEEG3;
