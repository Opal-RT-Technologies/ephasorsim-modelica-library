within OpalRT.ePHASORSIM.WrappedModels;
block GENROU_AC8B_MAXEX2
  extends Wrappers.FMUTemplateVRef(redeclare ModelSets.TypeH.GENROU_AC8B_MAXEX2 modelSet(
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
      VPIDMAX_ex = VPIDMAX_ex,
      VPIDMIN_ex = VPIDMIN_ex,
      KA_ex = KA_ex,
      TA_ex = TA_ex,
      VRMAX_ex = VRMAX_ex,
      VRMIN_ex = VRMIN_ex,
      KC_ex = KC_ex,
      KD_ex = KD_ex,
      KE_ex = KE_ex,
      TE_ex = TE_ex,
      VFEMAX_ex = VFEMAX_ex,
      VEMIN_ex = VEMIN_ex,
      E1_ex = E1_ex,
      SE_E1_ex = SE_E1_ex,
      E2_ex = E2_ex,
      SE_E2_ex = SE_E2_ex,
      EFDRATED_OEL = EFDRATED_OEL,
      EFD1_OEL = EFD1_OEL,
      TIME1_OEL = TIME1_OEL,
      EFD2_OEL = EFD2_OEL,
      TIME2_OEL = TIME2_OEL,
      EFD3_OEL = EFD3_OEL,
      TIME3_OEL = TIME3_OEL,
      EFDDES_OEL = EFDDES_OEL,
      KMX_OEL = KMX_OEL,
      VLOW_OEL = VLOW_OEL,
      ICONM_OEL = ICONM_OEL));

// >>> AUTOGEN PARAMS (VERBATIM FROM MODELSETS) BEGIN
  // -------- General (placement & operating point) --------------------
  parameter Integer IBUS = 100 "Located system bus" annotation(Dialog(tab = "General"));
  parameter String  M_ID = "M1" "Machine Identifier" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real    P_gen = 1100 "Bus Active Power, MW" annotation(Dialog(tab = "General"));
  parameter Real    Q_gen = 342.702 "Bus Reactive Power, MVAR" annotation(Dialog(tab = "General"));
  parameter Real    Vt_abs = 1.03 "Bus Voltage Magnitude, p.u." annotation(Dialog(tab = "General"));
  parameter Real    Vt_ang = -10.96 "Bus Voltage Angle, deg." annotation(Dialog(tab = "General"));
  parameter Real    SB = 1000 "Machine Base Power, MVA" annotation(Dialog(tab = "General"));
  parameter Real    fn = 50 "Nominal frequency" annotation(Dialog(tab = "General"));

  // -------- Machine (GENROU) ----------------------------------------
  parameter Real ZSOURCE_RE = 0 "Machine source impedence" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Tdo_p = 7 "d-axis transient time constant" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Tdo_s = 0.03 "d-axis sub-transient time constant, s" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Tqo_p = 0.7 "q-axis transient time constant, s" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Tqo_s = 0.04 "q-axis sub-transient time constant, s" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real H = 50 "Inertia constant" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real D = 0 "Speed damping" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xd = 0.2 "d-axis reactance, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xq = 0.19 "q-axis reactance, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xd_p = 0.06 "d-axis transient reactance, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xq_p = 0.06 "q-axis transient reactance, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xd_s = 0.02 "d-axis sub-transient reactance, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xl = 0.03 "Leakage reactance, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real S1 = 0.4 "Saturation function value at 1.0 p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real S12 = 0.8 "Saturation function value at 1.2 p.u." annotation(Dialog(tab = "GENROU Parameters"));

  // -------- Exciter (AC8B) ------------------------------------------
  parameter Real TR_ex = 0.02 "Regulator input filter time constant (sec)" annotation(Dialog(tab = "AC8B Parameters"));
  parameter Real KPR_ex = 10 "(pu) (> 0) voltage regulator proportional gain" annotation(Dialog(tab = "AC8B Parameters"));
  parameter Real KIR_ex = 0.01 "(pu) voltage regulator integral gain" annotation(Dialog(tab = "AC8B Parameters"));
  parameter Real KDR_ex = 2 "(pu) voltage regulator derivative gain" annotation(Dialog(tab = "AC8B Parameters"));
  parameter Real TDR_ex = 2 "Derivative channel time constant (sec)" annotation(Dialog(tab = "AC8B Parameters"));
  parameter Real VPIDMAX_ex = 1 "PID maximum limit" annotation(Dialog(tab = "AC8B Parameters"));
  parameter Real VPIDMIN_ex = -1 "PID minimum limit" annotation(Dialog(tab = "AC8B Parameters"));
  parameter Real KA_ex = 10 "(pu) voltage regulator gain" annotation(Dialog(tab = "AC8B Parameters"));
  parameter Real TA_ex = 0.02 "(sec) regulator time constant" annotation(Dialog(tab = "AC8B Parameters"));
  parameter Real VRMAX_ex = 10 "(pu) Voltage regulator output maximum limit" annotation(Dialog(tab = "AC8B Parameters"));
  parameter Real VRMIN_ex = -10 "(pu) Voltage regulator output minimum limit" annotation(Dialog(tab = "AC8B Parameters"));
  parameter Real KC_ex = 0.02 "Rectifier loading factor proportional to commutating reactance" annotation(Dialog(tab = "AC8B Parameters"));
  parameter Real KD_ex = 0.02 "Demagnetizing factor (function of AC exciter reactances)" annotation(Dialog(tab = "AC8B Parameters"));
  parameter Real KE_ex = 1 "Exciter constant related to self-excited field" annotation(Dialog(tab = "AC8B Parameters"));
  parameter Real TE_ex = 0.02 "Exciter time constant (>0)" annotation(Dialog(tab = "AC8B Parameters"));
  parameter Real VFEMAX_ex = 10 "Exciter field current limit (> 0)" annotation(Dialog(tab = "AC8B Parameters"));
  parameter Real VEMIN_ex = -10 "Minimum exciter voltage output" annotation(Dialog(tab = "AC8B Parameters"));
  parameter Real E1_ex = 4 "Exciter voltage @ saturation point E1" annotation(Dialog(tab = "AC8B Parameters"));
  parameter Real SE_E1_ex = 0.4 "Exciter saturation function value at E1" annotation(Dialog(tab = "AC8B Parameters"));
  parameter Real E2_ex = 5 "Exciter voltage @ saturation point E2" annotation(Dialog(tab = "AC8B Parameters"));
  parameter Real SE_E2_ex = 0.5 "Exciter saturation function value at E2" annotation(Dialog(tab = "AC8B Parameters"));

  // -------- OEL (MAXEX2) --------------------------------------------
  parameter Real EFDRATED_OEL = 2.8 annotation(Dialog(tab = "MAXEX2"));
  parameter Real EFD1_OEL = 1.2 annotation(Dialog(tab = "MAXEX2"));
  parameter Real TIME1_OEL = 50 annotation(Dialog(tab = "MAXEX2"));
  parameter Real EFD2_OEL = 1.3 annotation(Dialog(tab = "MAXEX2"));
  parameter Real TIME2_OEL = 30 annotation(Dialog(tab = "MAXEX2"));
  parameter Real EFD3_OEL = 1.5 annotation(Dialog(tab = "MAXEX2"));
  parameter Real TIME3_OEL = 5 annotation(Dialog(tab = "MAXEX2"));
  parameter Real EFDDES_OEL = 1.0 annotation(Dialog(tab = "MAXEX2"));
  parameter Real KMX_OEL = 1.5 annotation(Dialog(tab = "MAXEX2"));
  parameter Real VLOW_OEL = -0.1 annotation(Dialog(tab = "MAXEX2"));
  parameter Real ICONM_OEL = 0 annotation(Dialog(tab = "MAXEX2", group = "ICONs"));
// <<< AUTOGEN PARAMS (VERBATIM FROM MODELSETS) END


end GENROU_AC8B_MAXEX2;
