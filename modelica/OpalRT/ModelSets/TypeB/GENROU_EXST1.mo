within OpalRT.ModelSets.TypeB;
model GENROU_EXST1
  extends GenUnitTypeB1(redeclare Electrical.Machine.SynchronousMachine.GENROU synchronousGenerator(
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
      S12 = S12), redeclare Electrical.Control.Excitation.EXST1 exciter(
      ID = EX_ID,
      TR = TR_ex,
      VIMIN = VIMIN_ex,
      VIMAX = VIMAX_ex,
      TC = TC_ex,
      TB = TB_ex,
      KA = KA_ex,
      TA = TA_ex,
      VRMAX = VRMAX_ex,
      VRMIN = VRMIN_ex,
      KC = KC_ex,
      KF = KF_ex,
      TF = TF_ex));

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
  // EXST1 Parameters
  parameter String EX_ID = M_ID "Machine Identifier" annotation(Dialog(tab = "EXST1 Parameters"));
  parameter Real TR_ex = 0.02 annotation(Dialog(tab = "EXST1 Parameters"));
  parameter Real VIMAX_ex = 1 annotation(Dialog(tab = "EXST1 Parameters"));
  parameter Real VIMIN_ex = -1 annotation(Dialog(tab = "EXST1 Parameters"));
  parameter Real TC_ex = 1 annotation(Dialog(tab = "EXST1 Parameters"));
  parameter Real TB_ex = 1 annotation(Dialog(tab = "EXST1 Parameters"));
  parameter Real KA_ex = 100 annotation(Dialog(tab = "EXST1 Parameters"));
  parameter Real TA_ex = 0.2 annotation(Dialog(tab = "EXST1 Parameters"));
  parameter Real VRMAX_ex = 9 annotation(Dialog(tab = "EXST1 Parameters"));
  parameter Real VRMIN_ex = -9 annotation(Dialog(tab = "EXST1 Parameters"));
  parameter Real KC_ex = 0.01 annotation(Dialog(tab = "EXST1 Parameters"));
  parameter Real KF_ex = 0.3 annotation(Dialog(tab = "EXST1 Parameters"));
  parameter Real TF_ex = 0.1 annotation(Dialog(tab = "EXST1 Parameters"));

end GENROU_EXST1;
