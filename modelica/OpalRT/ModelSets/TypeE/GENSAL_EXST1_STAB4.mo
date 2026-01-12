within OpalRT.ModelSets.TypeE;
model GENSAL_EXST1_STAB4
  extends GenUnitTypeE1(redeclare Electrical.Machine.SynchronousMachine.GENSAL synchronousGenerator(
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
      S12 = S12), redeclare Electrical.Control.Excitation.EXST1 exciter(
      IBUS = IBUS,
      ID = ID,
      TR = TR_ex,
      VIMAX = VIMAX_ex,
      VIMIN = VIMIN_ex,
      TC = TC_ex,
      TB = TB_ex,
      KA = KA_ex,
      TA = TA_ex,
      VRMAX = VRMAX_ex,
      VRMIN = VRMIN_ex,
      KC = KC_ex,
      KF = KF_ex,
      TF = TF_ex), redeclare Electrical.Control.Stabilizer.STAB4 stabilizer(
      KX = KX_pss,
      TT = TT_pss,
      TX1 = TX1_pss,
      TX2 = TX2_pss,
      Ta = Ta_pss,
      Tb = Tb_pss,
      Tc = Tc_pss,
      Td = Td_pss,
      Te = Te_pss,
      L1 = L1_pss,
      L2 = L2_pss));

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
  // EXST1 Parameters
  parameter Real TR_ex = 0.02 annotation(Dialog(tab = "EXST1 Parameters"));
  parameter Real VIMAX_ex = 0.02 annotation(Dialog(tab = "EXST1 Parameters"));
  parameter Real VIMIN_ex = -0.02 annotation(Dialog(tab = "EXST1 Parameters"));
  parameter Real TC_ex = 1 annotation(Dialog(tab = "EXST1 Parameters"));
  parameter Real TB_ex = 1 annotation(Dialog(tab = "EXST1 Parameters"));
  parameter Real KA_ex = 500 annotation(Dialog(tab = "EXST1 Parameters"));
  parameter Real TA_ex = 0.01 annotation(Dialog(tab = "EXST1 Parameters"));
  parameter Real VRMAX_ex = 8 annotation(Dialog(tab = "EXST1 Parameters"));
  parameter Real VRMIN_ex = -3 annotation(Dialog(tab = "EXST1 Parameters"));
  parameter Real KC_ex = 0.2 annotation(Dialog(tab = "EXST1 Parameters"));
  parameter Real KF_ex = 0.01 annotation(Dialog(tab = "EXST1 Parameters"));
  parameter Real TF_ex = 0.1 annotation(Dialog(tab = "EXST1 Parameters"));
  // STAB4 Parameters
  parameter Real KX_pss = 1 "(Gain)" annotation(Dialog(tab = "STAB4 Parameters"));
  parameter Real TT_pss = 1 "Watt Transducer Time Constant" annotation(Dialog(tab = "STAB4 Parameters"));
  parameter Real TX1_pss = 1 "(> 0)" annotation(Dialog(tab = "STAB4 Parameters"));
  parameter Real TX2_pss = 1 "Reset Time Constant (> 0)" annotation(Dialog(tab = "STAB4 Parameters"));
  parameter Real Ta_pss = 1 annotation(Dialog(tab = "STAB4 Parameters"));
  parameter Real Tb_pss = 1 annotation(Dialog(tab = "STAB4 Parameters"));
  parameter Real Tc_pss = 1 "(> 0)" annotation(Dialog(tab = "STAB4 Parameters"));
  parameter Real Td_pss = 1 annotation(Dialog(tab = "STAB4 Parameters"));
  parameter Real Te_pss = 1 annotation(Dialog(tab = "STAB4 Parameters"));
  parameter Real L1_pss = -1 "Low Limit" annotation(Dialog(tab = "STAB4 Parameters"));
  parameter Real L2_pss = 1 "High Limit" annotation(Dialog(tab = "STAB4 Parameters"));

end GENSAL_EXST1_STAB4;
