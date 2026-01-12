within OpalRT.ePHASORSIM.WrappedModels;
block GENROU_URST5T
  extends Wrappers.FMUTemplateVRef(redeclare ModelSets.TypeB.GENROU_URST5T modelSet(
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
      Tr_ex = Tr_ex,
      TC1_ex = TC1_ex,
      TB1_ex = TB1_ex,
      TC2_ex = TC2_ex,
      TB2_ex = TB2_ex,
      KR_ex = KR_ex,
      VRMAX_ex = VRMAX_ex,
      VRMIN_ex = VRMIN_ex,
      T1_ex = T1_ex,
      KC_ex = KC_ex));

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
  // URST5T parameters
  parameter Real Tr_ex = 0.01 "(sec)" annotation(Dialog(tab = "URST5T Parameters"));
  parameter Real TC1_ex = 0.01 "(sec)" annotation(Dialog(tab = "URST5T Parameters"));
  parameter Real TB1_ex = 0.01 "(sec)" annotation(Dialog(tab = "URST5T Parameters"));
  parameter Real TC2_ex = 0.01 "(sec)" annotation(Dialog(tab = "URST5T Parameters"));
  parameter Real TB2_ex = 0.01 "(sec)" annotation(Dialog(tab = "URST5T Parameters"));
  parameter Real KR_ex = 0.01 annotation(Dialog(tab = "URST5T Parameters"));
  parameter Real VRMAX_ex = 0.01 annotation(Dialog(tab = "URST5T Parameters"));
  parameter Real VRMIN_ex = 0.01 annotation(Dialog(tab = "URST5T Parameters"));
  parameter Real T1_ex = 0.01 "(sec)" annotation(Dialog(tab = "URST5T Parameters"));
  parameter Real KC_ex = 0.01 annotation(Dialog(tab = "URST5T Parameters"));
  //
// <<< AUTOGEN PARAMS (VERBATIM FROM MODELSETS) END


end GENROU_URST5T;
