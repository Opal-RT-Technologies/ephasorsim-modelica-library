within OpalRT.ePHASORSIM.WrappedModels;
block GENSAE_HYGOV4
  extends Wrappers.FMUTemplateGRef(redeclare ModelSets.TypeC.GENSAE_HYGOV4 modelSet(
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
  // GENSAEL Parameters
  parameter Integer IBUS = 100 "Located system bus";
  parameter String ID = "M1" "Machine Identifier";
  parameter Real P_gen = 1100 "Bus Active Power, MW";
  parameter Real Q_gen = 342.702 "Bus Reactive Power, MVAR";
  parameter Real Vt_abs = 1.03 "Bus Voltage Magnitude, p.u.";
  parameter Real Vt_ang = -10.96 "Bus Voltage Angle, deg.";
  parameter Real SB = 1000 "Machine Base Power, MVA";
  parameter Real fn = 50 "Nominal frequency";
  parameter Real ZSOURCE_RE = 0 "Machine source impedence";
  parameter Real Tdo_p = 10 "d-axis transient time constant";
  parameter Real Tdo_s = 0.05 "d-axis sub-transient time constant, s";
  parameter Real Tqo_s = 0.01 "d-axis sub-transient time constant, s";
  parameter Real H = 50 "Inertia constant";
  parameter Real D = 0 "Speed damping";
  parameter Real Xd = 0.2 "d-axis reactance, p.u.";
  parameter Real Xq = 0.19 "q-axis reactance, p.u.";
  parameter Real Xd_p = 0.06 "d-axis transient reactance, p.u.";
  parameter Real Xd_s = 0.02 "d-axis sub-transient reactance, p.u.";
  parameter Real Xl = 0.03 "Reactance due to the leakage flux which does not cross the air gap, p.u.";
  parameter Real S1 = 0.4 "saturation function value for 1 p.u. input";
  parameter Real S12 = 0.8 "saturation function value for 1.2 p.u. input";
  //HYGOV4 parameter
  parameter Real db_tg = 0.06 "Hysteresis deadband" annotation(Dialog(tab = "HYGOV4"));
  parameter Real R_tg = 0.06 "Permanent Droop" annotation(Dialog(tab = "HYGOV4"));
  parameter Real r_tg = 0.4 "Temporary Droop" annotation(Dialog(tab = "HYGOV4"));
  parameter Real Tr_tg = 8 "(>0) Dashpot time constant" annotation(Dialog(tab = "HYGOV4"));
  parameter Real Tf_tg = 0.05 "(>0) Pilot valve time constant" annotation(Dialog(tab = "HYGOV4"));
  parameter Real Tg_tg = 0.2 "(>0) Actuator time const" annotation(Dialog(tab = "HYGOV4"));
  parameter Real Uopen_tg = 0.01 "Rate of gate Opening" annotation(Dialog(tab = "HYGOV4"));
  parameter Real Uclose_tg = -0.01 "(<0) Rate of gate clsoing" annotation(Dialog(tab = "HYGOV4"));
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
// <<< AUTOGEN PARAMS (VERBATIM FROM MODELSETS) END


end GENSAE_HYGOV4;
