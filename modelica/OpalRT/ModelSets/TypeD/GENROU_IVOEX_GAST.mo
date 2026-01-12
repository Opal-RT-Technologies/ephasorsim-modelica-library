within OpalRT.ModelSets.TypeD;
model GENROU_IVOEX_GAST
  extends GenUnitTypeD1(redeclare Electrical.Machine.SynchronousMachine.GENROU synchronousGenerator(
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
      S12 = S12), redeclare Electrical.Control.Excitation.IVOEX exciter(
      IBUS = IBUS_ex,
      ID = ID_ex,
      K1 = K1_ex,
      A1 = A1_ex,
      A2 = A2_ex,
      T1 = T1_ex,
      T2 = T2_ex,
      MAX1 = MAX1_ex,
      MIN1 = MIN1_ex,
      K3 = K3_ex,
      A3 = A3_ex,
      A4 = A4_ex,
      T3 = T3_ex,
      T4 = T4_ex,
      MAX3 = MAX3_ex,
      MIN3 = MIN3_ex,
      K5 = K5_ex,
      A5 = A5_ex,
      A6 = A6_ex,
      T5 = T5_ex,
      T6 = T6_ex,
      MAX5 = MAX5_ex,
      MIN5 = MIN5_ex), redeclare Electrical.Control.TurbineGovernor.GAST turbineGovernor(
      R = R_tg,
      T1 = T1_tg,
      T2 = T2_tg,
      T3 = T3_tg,
      AT = AT_tg,
      KT = KT_tg,
      VMAX = VMAX_tg,
      VMIN = VMIN_tg,
      DTURB = DTURB_tg,
      IBUS = IBUS,
      ID = M_ID));

  parameter Real partType = 1;
  // GENROU Parameters
  parameter Integer IBUS = 100 "Located system bus" annotation(Dialog(tab = "General"));
  parameter String M_ID = "M1" "Machine Identifier" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real P_gen = 900 "Bus Active Power, MW" annotation(Dialog(tab = "General"));
  parameter Real Q_gen = 200 "Bus Reactive Power, MVAR" annotation(Dialog(tab = "General"));
  parameter Real Vt_abs = 1.03 "Bus Voltage Magnitude, p.u." annotation(Dialog(tab = "General"));
  parameter Real Vt_ang = -10.96 "Bus Voltage Angle, deg." annotation(Dialog(tab = "General"));
  parameter Real SB = 1000 "Machine Base Power, MVA" annotation(Dialog(tab = "General"));
  parameter Real fn = 50 "Nominal frequency" annotation(Dialog(tab = "General"));
  parameter Real ZSOURCE_RE = 0 "Machine source impedence" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Tdo_p = 7 "d-axis transient time constant" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Tdo_s = 0.3 "d-axis sub-transient time constant, s" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Tqo_p = 0.04 "q-axis transient time constant, s" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Tqo_s = 0.4 "d-axis sub-transient time constant, s" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real H = 2.6 "Inertia constant" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real D = 0 "Speed damping" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xd = 0.67 "d-axis reactance, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xq = 0.62 "q-axis reactance, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xd_p = 0.3 "d-axis transient reactance, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xq_p = 0.3 "q-axis transient reactance, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xd_s = 0.01 "d-axis sub-transient reactance, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xl = 0.04 "Reactance due to the leakage flux which does not cross the air gap, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real S1 = 0.1 "saturation function value for 1 p.u. input" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real S12 = 0.2 "saturation function value for 1.2 p.u. input" annotation(Dialog(tab = "GENROU Parameters"));
  // IVOEX Parameters
  parameter Integer IBUS_ex = 100 "Located system bus" annotation(Dialog(tab = "IVOEX Parameters"));
  parameter String ID_ex = "M1" "Machine Identifier" annotation(Dialog(tab = "IVOEX Parameters"));
  parameter Real K1_ex = 1 annotation(Dialog(tab = "IVOEX Parameters"));
  parameter Real A1_ex = 0.5 annotation(Dialog(tab = "IVOEX Parameters"));
  parameter Real A2_ex = 0.5 annotation(Dialog(tab = "IVOEX Parameters"));
  parameter Real T1_ex = 0.05 annotation(Dialog(tab = "IVOEX Parameters"));
  parameter Real T2_ex = 0.1 annotation(Dialog(tab = "IVOEX Parameters"));
  parameter Real MAX1_ex = 5 annotation(Dialog(tab = "IVOEX Parameters"));
  parameter Real MIN1_ex = -5 annotation(Dialog(tab = "IVOEX Parameters"));
  parameter Real K3_ex = 3 annotation(Dialog(tab = "IVOEX Parameters"));
  parameter Real A3_ex = 0.5 annotation(Dialog(tab = "IVOEX Parameters"));
  parameter Real A4_ex = 0.5 annotation(Dialog(tab = "IVOEX Parameters"));
  parameter Real T3_ex = 0.1 annotation(Dialog(tab = "IVOEX Parameters"));
  parameter Real T4_ex = 0.1 annotation(Dialog(tab = "IVOEX Parameters"));
  parameter Real MAX3_ex = 5 annotation(Dialog(tab = "IVOEX Parameters"));
  parameter Real MIN3_ex = -5 annotation(Dialog(tab = "IVOEX Parameters"));
  parameter Real K5_ex = 1 annotation(Dialog(tab = "IVOEX Parameters"));
  parameter Real A5_ex = 0.5 annotation(Dialog(tab = "IVOEX Parameters"));
  parameter Real A6_ex = 0.5 annotation(Dialog(tab = "IVOEX Parameters"));
  parameter Real T5_ex = 0.1 annotation(Dialog(tab = "IVOEX Parameters"));
  parameter Real T6_ex = 0.1 annotation(Dialog(tab = "IVOEX Parameters"));
  parameter Real MAX5_ex = 5 annotation(Dialog(tab = "IVOEX Parameters"));
  parameter Real MIN5_ex = -2 annotation(Dialog(tab = "IVOEX Parameters"));
  // GAST Parameters
  parameter Real R_tg = 0.01 "Speed droop" annotation(Dialog(tab = "GAST Parameters"));
  parameter Real T1_tg = 0.01 "(>0) (sec)" annotation(Dialog(tab = "GAST Parameters"));
  parameter Real T2_tg = 0.01 "(>0) (sec)" annotation(Dialog(tab = "GAST Parameters"));
  parameter Real T3_tg = 0.3 "(>0) (sec)" annotation(Dialog(tab = "GAST Parameters"));
  parameter Real AT_tg = 0.12 "Ambient temperature load limit" annotation(Dialog(tab = "GAST Parameters"));
  parameter Real KT_tg = 0.2 annotation(Dialog(tab = "GAST Parameters"));
  parameter Real VMAX_tg = 0.12 annotation(Dialog(tab = "GAST Parameters"));
  parameter Real VMIN_tg = 0.01 annotation(Dialog(tab = "GAST Parameters"));
  parameter Real DTURB_tg = 0.01 annotation(Dialog(tab = "GAST Parameters"));

end GENROU_IVOEX_GAST;
