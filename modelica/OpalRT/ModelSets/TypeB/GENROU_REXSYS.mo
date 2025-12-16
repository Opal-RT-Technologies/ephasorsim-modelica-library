within OpalRT.ModelSets.TypeB;
model GENROU_REXSYS
  extends GenUnitTypeB1(redeclare Electrical.Machine.SynchronousMachine.GENROU synchronousGenerator(
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
      S1 = S1,
      S12 = S12,
      Xl = Xl), redeclare Electrical.Control.Excitation.REXSYS exciter(
      TR = TR_ex,
      KVP = KVP_ex,
      KVI = KVI_ex,
      VIMAX = VIMAX_ex,
      TA = TA_ex,
      TB1 = TB1_ex,
      TC1 = TC1_ex,
      TB2 = TB2_ex,
      TC2 = TC2_ex,
      VRMAX = VRMAX_ex,
      VRMIN = VRMIN_ex,
      KF = KF_ex,
      TF = TF_ex,
      TF1 = TF1_ex,
      TF2 = TF2_ex,
      FBF = FBF_ex,
      KIP = KIP_ex,
      KII = KII_ex,
      TP = TP_ex,
      VFMAX = VFMAX_ex,
      VFMIN = VFMIN_ex,
      KH = KH_ex,
      KE = KE_ex,
      TE = TE_ex,
      KC = KC_ex,
      KD = KD_ex,
      E1 = E1_ex,
      SE_E1 = SE_E1_ex,
      E2 = E2_ex,
      SE_E2 = SE_E2_ex,
      F1IMF = F1IMF_ex));

  parameter Real partType = 1;
  // GENROU Parameters
  parameter Integer IBUS = 100 "Located system bus" annotation(Dialog(tab = "General"));
  parameter String ID = "M1" "Machine Identifier" annotation(Dialog(tab = "General"));
  parameter Real P_gen = 1100 "Bus Active Power, MW" annotation(Dialog(tab = "General"));
  parameter Real Q_gen = 342.702 "Bus Reactive Power, MVAR" annotation(Dialog(tab = "General"));
  parameter Real Vt_abs = 1.03 "Bus Voltage Magnitude, p.u." annotation(Dialog(tab = "General"));
  parameter Real Vt_ang = -10.96 "Bus Voltage Angle, deg." annotation(Dialog(tab = "General"));
  parameter Real SB = 1000 "Machine Base Power, MVA" annotation(Dialog(tab = "General"));
  parameter Real fn = 50 "Nominal frequency" annotation(Dialog(tab = "General"));
  parameter Real ZSOURCE_RE = 0 "Machine source impedence" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real ZSOURCE_IM = Xd_s "Machine source impedence" annotation(Dialog(tab = "GENROU Parameters"));
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
  //REXSYS
  parameter Real TR_ex = 0.02 "voltage transducer time constant (sec) " annotation(Dialog(tab = "REXSYS Parameters"));
  parameter Real KVP_ex = 600 "voltage regulator proportional gain " annotation(Dialog(tab = "REXSYS Parameters"));
  parameter Real KVI_ex = 0.5 "voltage regulator integral gain " annotation(Dialog(tab = "REXSYS Parameters"));
  parameter Real VIMAX_ex = 0.2 "voltage regulator input limit (pu) " annotation(Dialog(tab = "REXSYS Parameters"));
  parameter Real TA_ex = 0.02 "voltage regulator time constant (sec) " annotation(Dialog(tab = "REXSYS Parameters"));
  parameter Real TB1_ex = 1 "lag-time constant (sec) " annotation(Dialog(tab = "REXSYS Parameters"));
  parameter Real TC1_ex = 10 "lead-time constant (sec) " annotation(Dialog(tab = "REXSYS Parameters"));
  parameter Real TB2_ex = 1.0 "lag-time constant (sec) " annotation(Dialog(tab = "REXSYS Parameters"));
  parameter Real TC2_ex = 1.0 "lead-time constant (sec) " annotation(Dialog(tab = "REXSYS Parameters"));
  parameter Real VRMAX_ex = 10 "maximum controller output (pu) " annotation(Dialog(tab = "REXSYS Parameters"));
  parameter Real VRMIN_ex = -10 "minimum controller output (pu) " annotation(Dialog(tab = "REXSYS Parameters"));
  parameter Real KF_ex = 0.045 "rate feedback gain " annotation(Dialog(tab = "REXSYS Parameters"));
  parameter Real TF_ex = 5 "rate feedback >0 time constant (sec) " annotation(Dialog(tab = "REXSYS Parameters"));
  parameter Real TF1_ex = 1 "feedback lead-time constant (sec) " annotation(Dialog(tab = "REXSYS Parameters"));
  parameter Real TF2_ex = 1 "feedback lag-time constant (sec) " annotation(Dialog(tab = "REXSYS Parameters"));
  parameter Real FBF_ex = 1 "rate feedback signal flag " annotation(Dialog(tab = "REXSYS Parameters"));
  parameter Real KIP_ex = 5.0 "field current regulator proportional gain " annotation(Dialog(tab = "REXSYS Parameters"));
  parameter Real KII_ex = 0.5 "field current regulator integral gain " annotation(Dialog(tab = "REXSYS Parameters"));
  parameter Real TP_ex = 0.5 "field current bridge time constant (sec) " annotation(Dialog(tab = "REXSYS Parameters"));
  parameter Real VFMAX_ex = 99 "maximum exciter field current (pu " annotation(Dialog(tab = "REXSYS Parameters"));
  parameter Real VFMIN_ex = -99 "minimum exciter field current (pu) " annotation(Dialog(tab = "REXSYS Parameters"));
  parameter Real KH_ex = 0.5 "field voltage controller feedback gain " annotation(Dialog(tab = "REXSYS Parameters"));
  parameter Real KE_ex = 0.4 "exciter field proportional constant" annotation(Dialog(tab = "REXSYS Parameters"));
  parameter Real TE_ex = 1.2 "exciter field time constant (sec >0)" annotation(Dialog(tab = "REXSYS Parameters"));
  parameter Real KC_ex = 0.5 "rectifier regulation factor (pu)" annotation(Dialog(tab = "REXSYS Parameters"));
  parameter Real KD_ex = 0.7 "exciter regulation factor (pu)" annotation(Dialog(tab = "REXSYS Parameters"));
  parameter Real E1_ex = 2.4 "exciter flux at knee of curve (pu) " annotation(Dialog(tab = "REXSYS Parameters"));
  parameter Real SE_E1_ex = 0.05 "saturation factor at knee" annotation(Dialog(tab = "REXSYS Parameters"));
  parameter Real E2_ex = 3.2 "maximum exciter (pu)" annotation(Dialog(tab = "REXSYS Parameters"));
  parameter Real SE_E2_ex = 0.3 "saturation factor at maximum flux" annotation(Dialog(tab = "REXSYS Parameters"));
  parameter Real F1IMF_ex = 0.5 "power supply limit factor" annotation(Dialog(tab = "REXSYS Parameters"));

end GENROU_REXSYS;
