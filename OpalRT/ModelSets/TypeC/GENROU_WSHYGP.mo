within OpalRT.ModelSets.TypeC;
model GENROU_WSHYGP
  extends GenUnitTypeC1(redeclare Electrical.Machine.SynchronousMachine.GENROU synchronousGenerator(
      IBUS = IBUS,
      ID = M_ID,
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
      S12 = S12), redeclare Electrical.Control.TurbineGovernor.WSHYGP turbineGovernor(
      db1 = db1_tg,
      err = err_tg,
      Td = Td_tg,
      KI = KI_tg,
      Tf = Tf_tg,
      KD = KD_tg,
      KP = KP_tg,
      R = R_tg,
      Tt = Tt_tg,
      KG = KG_tg,
      TP = TP_tg,
      VELopen = VELopen_tg,
      VELclose = VELclose_tg,
      PMAX = PMAX_tg,
      PMIN = PMIN_tg,
      db2 = db2_tg,
      GV1 = GV1_tg,
      PGV1 = PGV1_tg,
      GV2 = GV2_tg,
      PGV2 = PGV2_tg,
      GV3 = GV3_tg,
      PGV3 = PGV3_tg,
      GV4 = GV4_tg,
      PGV4 = PGV4_tg,
      GV5 = GV5_tg,
      PGV5 = PGV5_tg,
      Aturb = Aturb_tg,
      Bturb = Bturb_tg,
      Tturb = Tturb_tg,
      TRATE = TRATE_tg,
      IBUS = IBUS,
      ID = M_ID));

  parameter Real partType = 1;
  // GENROU Parameters
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
  // WSHYGP Parameters
  parameter Real db1_tg = 0 annotation(Dialog(tab = "WSHYGP"));
  parameter Real err_tg = 0 annotation(Dialog(tab = "WSHYGP"));
  parameter Real Td_tg = 1 "(sec)" annotation(Dialog(tab = "WSHYGP"));
  parameter Real KI_tg = 0.8 annotation(Dialog(tab = "WSHYGP"));
  parameter Real Tf_tg = 0.1 "(sec)" annotation(Dialog(tab = "WSHYGP"));
  parameter Real KD_tg = 0.8 annotation(Dialog(tab = "WSHYGP"));
  parameter Real KP_tg = 0.25 annotation(Dialog(tab = "WSHYGP"));
  parameter Real R_tg = 0.04 annotation(Dialog(tab = "WSHYGP"));
  parameter Real Tt_tg = 0.4 annotation(Dialog(tab = "WSHYGP"));
  parameter Real KG_tg = 2.0 annotation(Dialog(tab = "WSHYGP"));
  parameter Real TP_tg = 0.2 "(sec)" annotation(Dialog(tab = "WSHYGP"));
  parameter Real VELopen_tg = 0.007 "(>0)" annotation(Dialog(tab = "WSHYGP"));
  parameter Real VELclose_tg = 0.002 "(>0)" annotation(Dialog(tab = "WSHYGP"));
  parameter Real PMAX_tg = 1.0 annotation(Dialog(tab = "WSHYGP"));
  parameter Real PMIN_tg = 0 annotation(Dialog(tab = "WSHYGP"));
  parameter Real db2_tg = 0 annotation(Dialog(tab = "WSHYGP"));
  parameter Real GV1_tg = 0 annotation(Dialog(tab = "WSHYGP"));
  parameter Real PGV1_tg = 0 annotation(Dialog(tab = "WSHYGP"));
  parameter Real GV2_tg = 0.6 annotation(Dialog(tab = "WSHYGP"));
  parameter Real PGV2_tg = 0.7 annotation(Dialog(tab = "WSHYGP"));
  parameter Real GV3_tg = 0.7 annotation(Dialog(tab = "WSHYGP"));
  parameter Real PGV3_tg = 0.82 annotation(Dialog(tab = "WSHYGP"));
  parameter Real GV4_tg = 0.80 annotation(Dialog(tab = "WSHYGP"));
  parameter Real PGV4_tg = 0.90 annotation(Dialog(tab = "WSHYGP"));
  parameter Real GV5_tg = 0.90 annotation(Dialog(tab = "WSHYGP"));
  parameter Real PGV5_tg = 0.95 annotation(Dialog(tab = "WSHYGP"));
  parameter Real Aturb_tg = -1 annotation(Dialog(tab = "WSHYGP"));
  parameter Real Bturb_tg = 0.5 "(>0)" annotation(Dialog(tab = "WSHYGP"));
  parameter Real Tturb_tg = 0.9 "(>0)(sec)" annotation(Dialog(tab = "WSHYGP"));
  parameter Real TRATE_tg = 900 annotation(Dialog(tab = "WSHYGP"));

end GENROU_WSHYGP;
