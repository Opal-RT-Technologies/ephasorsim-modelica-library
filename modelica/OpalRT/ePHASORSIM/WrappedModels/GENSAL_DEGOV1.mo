within OpalRT.ePHASORSIM.WrappedModels;
block GENSAL_DEGOV1
  extends Wrappers.FMUTemplateGRef(redeclare ModelSets.TypeC.GENSAL_DEGOV1 modelSet(
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
      M_tg = M_tg,
      T1_tg = T1_tg,
      T2_tg = T2_tg,
      T3_tg = T3_tg,
      K_tg = K_tg,
      T4_tg = T4_tg,
      T5_tg = T5_tg,
      T6_tg = T6_tg,
      TD_tg = TD_tg,
      TMAX_tg = TMAX_tg,
      TMIN_tg = TMIN_tg,
      DROOP_tg = DROOP_tg,
      TE_tg = TE_tg));

// >>> AUTOGEN PARAMS (VERBATIM FROM MODELSETS) BEGIN
  parameter Real partType = 1;
  // GENSAL Parameters
  parameter Integer IBUS = 100 "Located system bus" annotation(Dialog(tab = "General"));
  parameter String ID = "M1" "Machine Identifier" annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real P_gen = 1100 "Bus Active Power, MW" annotation(Dialog(tab = "General"));
  parameter Real Q_gen = 342.702 "Bus Reactive Power, MVAR" annotation(Dialog(tab = "General"));
  parameter Real Vt_abs = 1.03 "Bus Voltage Magnitude, p.u." annotation(Dialog(tab = "General"));
  parameter Real Vt_ang = -10.96 "Bus Voltage Angle, deg." annotation(Dialog(tab = "General"));
  parameter Real SB = 1000 "Machine Base Power, MVA" annotation(Dialog(tab = "General"));
  parameter Real fn = 50 "Nominal frequency" annotation(Dialog(tab = "General"));
  parameter Real ZSOURCE_RE = 0 "Machine source impedence" annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real Tdo_p = 7 "d-axis transient time constant" annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real Tdo_s = 0.05 "d-axis sub-transient time constant, s" annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real Tqo_s = 0.01 "d-axis sub-transient time constant, s" annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real H = 50 "Inertia constant" annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real D = 0 "Speed damping" annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real Xd = 0.2 "d-axis reactance, p.u." annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real Xq = 0.19 "q-axis reactance, p.u." annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real Xd_p = 0.06 "d-axis transient reactance, p.u." annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real Xd_s = 0.02 "d-axis sub-transient reactance, p.u." annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real Xl = 0.03 "Reactance due to the leakage flux which does not cross the air gap, p.u." annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real S1 = 0.4 "saturation function value for 1 p.u. input" annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real S12 = 0.8 "saturation function value for 1.2 p.u. input" annotation(Dialog(tab = "GENSAL Parameters"));
  // DEGOV1 Parameters
  parameter Real M_tg = 1 "Feedback signal flag. 0: Throttle feedback, 1: Electrical power feedback" annotation(Dialog(tab = "DEGOV1"));
  parameter Real T1_tg = 0 "(sec)" annotation(Dialog(tab = "DEGOV1"));
  parameter Real T2_tg = 0 "(sec)" annotation(Dialog(tab = "DEGOV1"));
  parameter Real T3_tg = 1 "(sec)" annotation(Dialog(tab = "DEGOV1"));
  parameter Real K_tg = 0.8 annotation(Dialog(tab = "DEGOV1"));
  parameter Real T4_tg = 0.1 "(sec)" annotation(Dialog(tab = "DEGOV1"));
  parameter Real T5_tg = 0.8 "(sec)" annotation(Dialog(tab = "DEGOV1"));
  parameter Real T6_tg = 0.25 "(sec)" annotation(Dialog(tab = "DEGOV1"));
  parameter Real TD_tg = 0.04 "(0<= TD <= 12*DELT)(sec)" annotation(Dialog(tab = "DEGOV1"));
  parameter Real TMAX_tg = 2.0 annotation(Dialog(tab = "DEGOV1"));
  parameter Real TMIN_tg = 0.5 annotation(Dialog(tab = "DEGOV1"));
  parameter Real DROOP_tg = 0.2 annotation(Dialog(tab = "DEGOV1"));
  parameter Real TE_tg = 0.007 annotation(Dialog(tab = "DEGOV1"));
// <<< AUTOGEN PARAMS (VERBATIM FROM MODELSETS) END


end GENSAL_DEGOV1;
