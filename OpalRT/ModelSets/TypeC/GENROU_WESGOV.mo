within OpalRT.ModelSets.TypeC;
model GENROU_WESGOV
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
      S12 = S12), redeclare Electrical.Control.TurbineGovernor.WESGOV turbineGovernor(
      ID = M_ID,
      IBUS = IBUS,
      delTC = delTC_tg,
      delTP = delTP_tg,
      Droop = Droop_tg,
      Kp = Kp_tg,
      TI = TI_tg,
      T1 = T1_tg,
      T2 = T2_tg,
      ALIM = ALIM_tg,
      Tpe = Tpe_tg,
      DELTA = DELTA_tg));

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
  // WESGOV Parameters
  parameter Real delTC_tg = 0.1 "(sec), delta_t sample for controls" annotation(Dialog(tab = "WESGOV Parameters"));
  parameter Real delTP_tg = 0.1 "(sec), delta_t sample for PE" annotation(Dialog(tab = "WESGOV Parameters"));
  parameter Real Droop_tg = 0.05 "Droop" annotation(Dialog(tab = "WESGOV Parameters"));
  parameter Real Kp_tg = 15 annotation(Dialog(tab = "WESGOV Parameters"));
  parameter Real TI_tg = 1.0 "(>0)(sec)" annotation(Dialog(tab = "WESGOV Parameters"));
  parameter Real T1_tg = 0.1 "(sec)" annotation(Dialog(tab = "WESGOV Parameters"));
  parameter Real T2_tg = 0.25 "(sec)" annotation(Dialog(tab = "WESGOV Parameters"));
  parameter Real ALIM_tg = 0.2 annotation(Dialog(tab = "WESGOV Parameters"));
  parameter Real Tpe_tg = 0.1 "(sec)" annotation(Dialog(tab = "WESGOV Parameters"));
  parameter Real DELTA_tg = 0.01 "(sec)" annotation(Dialog(tab = "WESGOV Parameters"));

end GENROU_WESGOV;
