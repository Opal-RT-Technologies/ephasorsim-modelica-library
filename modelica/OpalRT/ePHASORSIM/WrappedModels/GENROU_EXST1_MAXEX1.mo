within OpalRT.ePHASORSIM.WrappedModels;
block GENROU_EXST1_MAXEX1
  extends Wrappers.FMUTemplateVRef(redeclare ModelSets.TypeH.GENROU_EXST1_MAXEX1 modelSet(
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
      EX_ID = EX_ID,
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
      KF_ex = KF_ex,
      TF_ex = TF_ex,
      EFDRATED_OEL = EFDRATED_OEL,
      EFD1_OEL = EFD1_OEL,
      TIME1_OEL = TIME1_OEL,
      EFD2_OEL = EFD2_OEL,
      TIME2_OEL = TIME2_OEL,
      EFD3_OEL = EFD3_OEL,
      TIME3_OEL = TIME3_OEL,
      EFDDES_OEL = EFDDES_OEL,
      KMX_OEL = KMX_OEL,
      VLOW_OEL = VLOW_OEL));

// >>> AUTOGEN PARAMS (VERBATIM FROM MODELSETS) BEGIN
  // -------- General (placement & operating point) --------------------
  parameter Integer IBUS = 100 "Located system bus" annotation(Dialog(tab = "General"));
  parameter String M_ID = "M1" "Machine Identifier" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real P_gen = 900 "Bus Active Power, MW" annotation(Dialog(tab = "General"));
  parameter Real Q_gen = 200 "Bus Reactive Power, MVAR" annotation(Dialog(tab = "General"));
  parameter Real Vt_abs = 1.03 "Bus Voltage Magnitude, p.u." annotation(Dialog(tab = "General"));
  parameter Real Vt_ang = -10.96 "Bus Voltage Angle, deg." annotation(Dialog(tab = "General"));
  parameter Real SB = 1000 "Machine Base Power, MVA" annotation(Dialog(tab = "General"));
  parameter Real fn = 50 "Nominal frequency" annotation(Dialog(tab = "General"));

  // -------- Machine (GENROU) ----------------------------------------
  parameter Real ZSOURCE_RE = 0 "Machine source impedence" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Tdo_p = 7 "d-axis transient time constant" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Tdo_s = 0.3 "d-axis sub-transient time constant, s" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Tqo_p = 0.04 "q-axis transient time constant, s" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Tqo_s = 0.4 "q-axis sub-transient time constant, s" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real H = 2.6 "Inertia constant" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real D = 0 "Speed damping" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xd = 0.67 "d-axis reactance, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xq = 0.62 "q-axis reactance, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xd_p = 0.3 "d-axis transient reactance, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xq_p = 0.3 "q-axis transient reactance, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xd_s = 0.01 "d-axis sub-transient reactance, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xl = 0.04 "Leakage reactance, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real S1 = 0.1 "Saturation function value at 1.0 p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real S12 = 0.2 "Saturation function value at 1.2 p.u." annotation(Dialog(tab = "GENROU Parameters"));

  // -------- Exciter (EXST1) -----------------------------------------
  parameter String EX_ID = M_ID "Machine/Exciter Identifier" annotation(Dialog(tab = "EXST1 Parameters"));
  parameter Real TR_ex = 0.02 "Regulator input filter time constant (s)" annotation(Dialog(tab = "EXST1 Parameters"));
  parameter Real VIMAX_ex = 1 "Input max (pu)" annotation(Dialog(tab = "EXST1 Parameters"));
  parameter Real VIMIN_ex = -1 "Input min (pu)" annotation(Dialog(tab = "EXST1 Parameters"));
  parameter Real TC_ex = 1 "Lead time constant (s)" annotation(Dialog(tab = "EXST1 Parameters"));
  parameter Real TB_ex = 1 "Lag time constant (s)" annotation(Dialog(tab = "EXST1 Parameters"));
  parameter Real KA_ex = 100 "Regulator gain (pu)" annotation(Dialog(tab = "EXST1 Parameters"));
  parameter Real TA_ex = 0.2 "Regulator time constant (s)" annotation(Dialog(tab = "EXST1 Parameters"));
  parameter Real VRMAX_ex = 9 "Regulator output maximum (pu)" annotation(Dialog(tab = "EXST1 Parameters"));
  parameter Real VRMIN_ex = -9 "Regulator output minimum (pu)" annotation(Dialog(tab = "EXST1 Parameters"));
  parameter Real KC_ex = 0.01 "Rectifier loading factor" annotation(Dialog(tab = "EXST1 Parameters"));
  parameter Real KF_ex = 0.3 "Exciter stabilizer gain" annotation(Dialog(tab = "EXST1 Parameters"));
  parameter Real TF_ex = 0.1 "Exciter stabilizer time constant (s)" annotation(Dialog(tab = "EXST1 Parameters"));

  // -------- OEL (MAXEX1) --------------------------------------------
  parameter Real EFDRATED_OEL = 2.8 annotation(Dialog(tab = "MAXEX1 Parameters"));
  parameter Real EFD1_OEL = 1.2 annotation(Dialog(tab = "MAXEX1 Parameters"));
  parameter Real TIME1_OEL = 50 annotation(Dialog(tab = "MAXEX1 Parameters"));
  parameter Real EFD2_OEL = 1.3 annotation(Dialog(tab = "MAXEX1 Parameters"));
  parameter Real TIME2_OEL = 30 annotation(Dialog(tab = "MAXEX1 Parameters"));
  parameter Real EFD3_OEL = 1.5 annotation(Dialog(tab = "MAXEX1 Parameters"));
  parameter Real TIME3_OEL = 5 annotation(Dialog(tab = "MAXEX1 Parameters"));
  parameter Real EFDDES_OEL = 1.0 annotation(Dialog(tab = "MAXEX1 Parameters"));
  parameter Real KMX_OEL = 1.5 annotation(Dialog(tab = "MAXEX1 Parameters"));
  parameter Real VLOW_OEL = -0.1 annotation(Dialog(tab = "MAXEX1 Parameters"));
// <<< AUTOGEN PARAMS (VERBATIM FROM MODELSETS) END


end GENROU_EXST1_MAXEX1;
