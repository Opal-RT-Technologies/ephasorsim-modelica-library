within OpalRT.ModelSets.TypeB;
model GENROU_AC8B
  extends GenUnitTypeB1(redeclare Electrical.Machine.SynchronousMachine.GENROU synchronousGenerator(
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
      S12 = S12), redeclare Electrical.Control.Excitation.AC8B exciter(
      TR = TR_ex,
      KPR = KPR_ex,
      KIR = KIR_ex,
      KDR = KDR_ex,
      TDR = TDR_ex,
      VPIDMAX = VPIDMAX_ex,
      VPIDMIN = VPIDMIN_ex,
      KA = KA_ex,
      TA = TA_ex,
      VRMAX = VRMAX_ex,
      VRMIN = VRMIN_ex,
      KC = KC_ex,
      KD = KD_ex,
      KE = KE_ex,
      TE = TE_ex,
      VFEMAX = VFEMAX_ex,
      VEMIN = VEMIN_ex,
      E1 = E1_ex,
      SE_E1 = SE_E1_ex,
      E2 = E2_ex,
      SE_E2 = SE_E2_ex));

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
  // This Model is located at system bus IBUS
  parameter Real TR_ex = 0.02 "regulator input filter time constant (sec)" annotation(Dialog(tab = "AC8B Parameters"));
  parameter Real KPR_ex = 10 "(pu) (> 0) voltage regulator proportional gain" annotation(Dialog(tab = "AC8B Parameters"));
  parameter Real KIR_ex = 0.01 "(pu) voltage regulator integral gain" annotation(Dialog(tab = "AC8B Parameters"));
  parameter Real KDR_ex = 2 "(pu) voltage regulator derivative gain" annotation(Dialog(tab = "AC8B Parameters"));
  parameter Real TDR_ex = 2 "voltage regulator derivative channel time constant (sec)" annotation(Dialog(tab = "AC8B Parameters"));
  parameter Real VPIDMAX_ex = 1 "PID maximum limit" annotation(Dialog(tab = "AC8B Parameters"));
  parameter Real VPIDMIN_ex = -1 "PID minimum limit" annotation(Dialog(tab = "AC8B Parameters"));
  parameter Real KA_ex = 10 "(pu) voltage regulator gain" annotation(Dialog(tab = "AC8B Parameters"));
  parameter Real TA_ex = 0.02 "(sec) regulator time constant" annotation(Dialog(tab = "AC8B Parameters"));
  parameter Real VRMAX_ex = 10 "(pu) Voltage regulator output maximum limit" annotation(Dialog(tab = "AC8B Parameters"));
  parameter Real VRMIN_ex = -10 "(pu) Voltage regulator output minimum limit" annotation(Dialog(tab = "AC8B Parameters"));
  parameter Real KC_ex = 0.02 "rectifier loading factor proportional to commutating reactance" annotation(Dialog(tab = "AC8B Parameters"));
  parameter Real KD_ex = 0.02 "demagnetizing factor, function of AC exciter reactances" annotation(Dialog(tab = "AC8B Parameters"));
  parameter Real KE_ex = 1 "exciter constant related fo self-excited field" annotation(Dialog(tab = "AC8B Parameters"));
  parameter Real TE_ex = 0.02 "exciter time constant (>0)" annotation(Dialog(tab = "AC8B Parameters"));
  parameter Real VFEMAX_ex = 10 "exciter field current limit (> 0)" annotation(Dialog(tab = "AC8B Parameters"));
  parameter Real VEMIN_ex = -10 "Minimum exciter voltage output" annotation(Dialog(tab = "AC8B Parameters"));
  parameter Real E1_ex = 4 "Exciter voltages at which exciter saturation is defined" annotation(Dialog(tab = "AC8B Parameters"));
  parameter Real SE_E1_ex = 0.4 "Exciter saturation function value at E1" annotation(Dialog(tab = "AC8B Parameters"));
  parameter Real E2_ex = 5 "Exciter voltages at which exciter saturation is defined" annotation(Dialog(tab = "AC8B Parameters"));
  parameter Real SE_E2_ex = 0.5 "Exciter saturation function value at E2" annotation(Dialog(tab = "AC8B Parameters"));

end GENROU_AC8B;
