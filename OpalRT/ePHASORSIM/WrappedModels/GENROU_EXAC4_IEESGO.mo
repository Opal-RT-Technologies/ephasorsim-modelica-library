within OpalRT.ePHASORSIM.WrappedModels;
block GENROU_EXAC4_IEESGO
  extends Wrappers.FMUTemplateVRefGRef(redeclare ModelSets.TypeD.GENROU_EXAC4_IEESGO modelSet(
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
      T1_tg = T1_tg,
      T2_tg = T2_tg,
      T3_tg = T3_tg,
      T4_tg = T4_tg,
      T5_tg = T5_tg,
      T6_tg = T6_tg,
      K1_tg = K1_tg,
      K2_tg = K2_tg,
      K3_tg = K3_tg,
      PMAX_tg = PMAX_tg,
      PMIN_tg = PMIN_tg));

// >>> AUTOGEN PARAMS (VERBATIM FROM MODELSETS) BEGIN
  // GENROU Parameters
  parameter Integer IBUS = 100 "Located system bus" annotation(Dialog(tab = "General"));
  parameter String M_ID = "M1" "Machine Identifier" annotation(Dialog(tab = "GENROU"));
  parameter Real P_gen = 1100 "Bus Active Power, MW" annotation(Dialog(tab = "General"));
  parameter Real Q_gen = 342.702 "Bus Reactive Power, MVAR" annotation(Dialog(tab = "General"));
  parameter Real Vt_abs = 1.03 "Bus Voltage Magnitude, p.u." annotation(Dialog(tab = "General"));
  parameter Real Vt_ang = -10.96 "Bus Voltage Angle, deg." annotation(Dialog(tab = "General"));
  parameter Real SB = 1000 "Machine Base Power, MVA" annotation(Dialog(tab = "General"));
  parameter Real fn = 50 "Nominal frequency" annotation(Dialog(tab = "General"));
  parameter Real ZSOURCE_RE = 0 "Machine source impedence" annotation(Dialog(tab = "GENROU"));
  parameter Real Tdo_p = 7 "d-axis transient time constant" annotation(Dialog(tab = "GENROU"));
  parameter Real Tdo_s = 0.03 "d-axis sub-transient time constant, s" annotation(Dialog(tab = "GENROU"));
  parameter Real Tqo_p = 0.7 "q-axis transient time constant, s" annotation(Dialog(tab = "GENROU"));
  parameter Real Tqo_s = 0.04 "d-axis sub-transient time constant, s" annotation(Dialog(tab = "GENROU"));
  parameter Real H = 50 "Inertia constant" annotation(Dialog(tab = "GENROU"));
  parameter Real D = 0 "Speed damping" annotation(Dialog(tab = "GENROU"));
  parameter Real Xd = 0.2 "d-axis reactance, p.u." annotation(Dialog(tab = "GENROU"));
  parameter Real Xq = 0.19 "q-axis reactance, p.u." annotation(Dialog(tab = "GENROU"));
  parameter Real Xd_p = 0.06 "d-axis transient reactance, p.u." annotation(Dialog(tab = "GENROU"));
  parameter Real Xq_p = 0.06 "q-axis transient reactance, p.u." annotation(Dialog(tab = "GENROU"));
  parameter Real Xd_s = 0.02 "d-axis sub-transient reactance, p.u." annotation(Dialog(tab = "GENROU"));
  parameter Real Xl = 0.03 "Reactance due to the leakage flux which does not cross the air gap, p.u." annotation(Dialog(tab = "GENROU"));
  parameter Real S1 = 0.4 "saturation function value for 1 p.u. input" annotation(Dialog(tab = "GENROU"));
  parameter Real S12 = 0.8 "saturation function value for 1.2 p.u. input" annotation(Dialog(tab = "GENROU"));
  // EXAC4 Parameters
  parameter Real TR_ex = 0.01 annotation(Dialog(tab = "EXAC4"));
  parameter Real VIMAX_ex = 0.01 annotation(Dialog(tab = "EXAC4"));
  parameter Real VIMIN_ex = 0.01 annotation(Dialog(tab = "EXAC4"));
  parameter Real TC_ex = 0.01 annotation(Dialog(tab = "EXAC4"));
  parameter Real TB_ex = 0.01 "sec" annotation(Dialog(tab = "EXAC4"));
  parameter Real KA_ex = 0.01 annotation(Dialog(tab = "EXAC4"));
  parameter Real TA_ex = 0.01 annotation(Dialog(tab = "EXAC4"));
  parameter Real VRMAX_ex = 0.01 annotation(Dialog(tab = "EXAC4"));
  parameter Real VRMIN_ex = 0.01 annotation(Dialog(tab = "EXAC4"));
  parameter Real KC_ex = 0.01 annotation(Dialog(tab = "EXAC4"));
  //IEESGO  parameters
  parameter Real T1_tg = 1 "Controller Lag, sec" annotation(Dialog(tab = "IEESGO"));
  parameter Real T2_tg = 1 "Controller Lead Compensation, sec" annotation(Dialog(tab = "IEESGO"));
  parameter Real T3_tg = 1 "Governor Lag (> 0), sec";
  parameter Real T4_tg = 1 "Delay Due To Steam Inlet Volumes, sec" annotation(Dialog(tab = "IEESGO"));
  parameter Real T5_tg = 1 "Reheater Delay, sec" annotation(Dialog(tab = "IEESGO"));
  parameter Real T6_tg = 1 "Turbine pipe hood Delay, sec" annotation(Dialog(tab = "IEESGO"));
  parameter Real K1_tg = 0.5 "1/Per Unit Regulation, sec" annotation(Dialog(tab = "IEESGO"));
  parameter Real K2_tg = 0.5 "Fraction" annotation(Dialog(tab = "IEESGO"));
  parameter Real K3_tg = 0.5 "Fraction" annotation(Dialog(tab = "IEESGO"));
  parameter Real PMAX_tg = 1 "Upper Power Limit" annotation(Dialog(tab = "IEESGO"));
  parameter Real PMIN_tg = -1 "Lower Power Limit" annotation(Dialog(tab = "IEESGO"));
// <<< AUTOGEN PARAMS (VERBATIM FROM MODELSETS) END

end GENROU_EXAC4_IEESGO;
