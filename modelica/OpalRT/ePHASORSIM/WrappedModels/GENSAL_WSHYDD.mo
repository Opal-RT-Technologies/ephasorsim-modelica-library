within OpalRT.ePHASORSIM.WrappedModels;
block GENSAL_WSHYDD
  extends Wrappers.FMUTemplateGRef(redeclare ModelSets.TypeC.GENSAL_WSHYDD modelSet(
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
      db1_tg = db1_tg,
      err_tg = err_tg,
      Td_tg = Td_tg,
      K1_tg = K1_tg,
      Tf_tg = Tf_tg,
      KD_tg = KD_tg,
      KP_tg = KP_tg,
      R_tg = R_tg,
      Tt_tg = Tt_tg,
      KG_tg = KG_tg,
      TP_tg = TP_tg,
      VELopen_tg = VELopen_tg,
      VELclose_tg = VELclose_tg,
      PMAX_tg = PMAX_tg,
      PMIN_tg = PMIN_tg,
      db2_tg = db2_tg,
      GV1_tg = GV1_tg,
      PGV1_tg = PGV1_tg,
      GV2_tg = GV2_tg,
      PGV2_tg = PGV2_tg,
      GV3_tg = GV3_tg,
      PGV3_tg = PGV3_tg,
      GV4_tg = GV4_tg,
      PGV4_tg = PGV4_tg,
      GV5_tg = GV5_tg,
      PGV5_tg = PGV5_tg,
      Aturb_tg = Aturb_tg,
      Bturb_tg = Bturb_tg,
      Tturb_tg = Tturb_tg,
      TRATE_tg = TRATE_tg));

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
  // WSHYDD Parameters
  parameter Real db1_tg = 0 annotation(Dialog(tab = "WSHYDD"));
  parameter Real err_tg = 0 annotation(Dialog(tab = "WSHYDD"));
  parameter Real Td_tg = 1 "(sec)" annotation(Dialog(tab = "WSHYDD"));
  parameter Real K1_tg = 0.8 annotation(Dialog(tab = "WSHYDD"));
  parameter Real Tf_tg = 0.1 "(sec)" annotation(Dialog(tab = "WSHYDD"));
  parameter Real KD_tg = 0.8 annotation(Dialog(tab = "WSHYDD"));
  parameter Real KP_tg = 0.25 annotation(Dialog(tab = "WSHYDD"));
  parameter Real R_tg = 0.04 annotation(Dialog(tab = "WSHYDD"));
  parameter Real Tt_tg = 0.4 annotation(Dialog(tab = "WSHYDD"));
  parameter Real KG_tg = 2.0 annotation(Dialog(tab = "WSHYDD"));
  parameter Real TP_tg = 0.2 "(sec)" annotation(Dialog(tab = "WSHYDD"));
  parameter Real VELopen_tg = 0.007 "(>0)" annotation(Dialog(tab = "WSHYDD"));
  parameter Real VELclose_tg = 0.002 "(>0)" annotation(Dialog(tab = "WSHYDD"));
  parameter Real PMAX_tg = 1.0 annotation(Dialog(tab = "WSHYDD"));
  parameter Real PMIN_tg = 0 annotation(Dialog(tab = "WSHYDD"));
  parameter Real db2_tg = 0 annotation(Dialog(tab = "WSHYDD"));
  parameter Real GV1_tg = 0 annotation(Dialog(tab = "WSHYDD"));
  parameter Real PGV1_tg = 0 annotation(Dialog(tab = "WSHYDD"));
  parameter Real GV2_tg = 0.6 annotation(Dialog(tab = "WSHYDD"));
  parameter Real PGV2_tg = 0.7 annotation(Dialog(tab = "WSHYDD"));
  parameter Real GV3_tg = 0.7 annotation(Dialog(tab = "WSHYDD"));
  parameter Real PGV3_tg = 0.82 annotation(Dialog(tab = "WSHYDD"));
  parameter Real GV4_tg = 0.80 annotation(Dialog(tab = "WSHYDD"));
  parameter Real PGV4_tg = 0.90 annotation(Dialog(tab = "WSHYDD"));
  parameter Real GV5_tg = 0.90 annotation(Dialog(tab = "WSHYDD"));
  parameter Real PGV5_tg = 0.95 annotation(Dialog(tab = "WSHYDD"));
  parameter Real Aturb_tg = -1 annotation(Dialog(tab = "WSHYDD"));
  parameter Real Bturb_tg = 0.5 "(>0)" annotation(Dialog(tab = "WSHYDD"));
  parameter Real Tturb_tg = 0.9 "(>0)(sec)" annotation(Dialog(tab = "WSHYDD"));
  parameter Real TRATE_tg = 900 annotation(Dialog(tab = "WSHYDD"));
// <<< AUTOGEN PARAMS (VERBATIM FROM MODELSETS) END


end GENSAL_WSHYDD;
