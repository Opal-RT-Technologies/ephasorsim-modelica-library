within OpalRT.ModelSets.TypeH;
model GENSAL_IEEET1_MAXEX2 "GENSAL + IEEET1 + MAXEX2 using the TypeH GenUnitTypeH1 template"
  extends GenUnitTypeH1(redeclare Electrical.Machine.SynchronousMachine.GENSAL synchronousGenerator(
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
      Tqo_s = Tqo_s,
      H = H,
      D = D,
      Xd = Xd,
      Xq = Xq,
      Xd_p = Xd_p,
      Xd_s = Xd_s,
      Xl = Xl,
      S1 = S1,
      S12 = S12), redeclare Electrical.Control.Excitation.IEEET1 exciter(
      ID = M_ID,
      TR = TR_ex,
      KA = KA_ex,
      TA = TA_ex,
      VRMAX = VRMAX_ex,
      VRMIN = VRMIN_ex,
      KE = KE_ex,
      TE = TE_ex,
      KF = KF_ex,
      TF = TF_ex,
      Switch = Switch_ex,
      E1 = E1_ex,
      SE_E1 = SE_E1_ex,
      E2 = E2_ex,
      SE_E2 = SE_E2_ex), redeclare Electrical.Control.OverExcitationLimiter.MAXEX2 oel(
      EFDRATED = EFDRATED_OEL,
      EFD1 = EFD1_OEL,
      TIME1 = TIME1_OEL,
      EFD2 = EFD2_OEL,
      TIME2 = TIME2_OEL,
      EFD3 = EFD3_OEL,
      TIME3 = TIME3_OEL,
      EFDDES = EFDDES_OEL,
      KMX = KMX_OEL,
      VLOW = VLOW_OEL,
      ICONM = ICONM_OEL));

  // -------- General (placement & operating point) --------------------
  parameter Integer IBUS = 100 "Located system bus" annotation(Dialog(tab = "General"));
  parameter String M_ID = "M1" "Machine Identifier" annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real P_gen = 1100 "Bus Active Power, MW" annotation(Dialog(tab = "General"));
  parameter Real Q_gen = 342.702 "Bus Reactive Power, MVAR" annotation(Dialog(tab = "General"));
  parameter Real Vt_abs = 1.03 "Bus Voltage Magnitude, p.u." annotation(Dialog(tab = "General"));
  parameter Real Vt_ang = -10.96 "Bus Voltage Angle, deg." annotation(Dialog(tab = "General"));
  parameter Real SB = 1000 "Machine Base Power, MVA" annotation(Dialog(tab = "General"));
  parameter Real fn = 50 "Nominal frequency" annotation(Dialog(tab = "General"));

  // -------- Machine (GENSAL) ----------------------------------------
  parameter Real ZSOURCE_RE = 0 "Machine source impedence" annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real Tdo_p = 10 "d-axis transient time constant" annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real Tdo_s = 0.01 "d-axis sub-transient time constant, s" annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real Tqo_s = 0.01 "q-axis sub-transient time constant, s" annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real H = 50 "Inertia constant" annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real D = 0 "Speed damping" annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real Xd = 0.2 "d-axis reactance, p.u." annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real Xq = 0.19 "q-axis reactance, p.u." annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real Xd_p = 0.06 "d-axis transient reactance, p.u." annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real Xd_s = 0.02 "d-axis sub-transient reactance, p.u." annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real Xl = 0.03 "Leakage reactance, p.u." annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real S1 = 0 "Saturation function value at 1.0 p.u." annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real S12 = 0 "Saturation function value at 1.2 p.u." annotation(Dialog(tab = "GENSAL Parameters"));

  // -------- Exciter (IEEET1) ----------------------------------------
  parameter Real TR_ex = 0.025 "(s)" annotation(Dialog(tab = "IEEET1 Parameters"));
  parameter Real KA_ex = 98 "Regulator gain" annotation(Dialog(tab = "IEEET1 Parameters"));
  parameter Real TA_ex = 0.2 "(s) regulator time constant" annotation(Dialog(tab = "IEEET1 Parameters"));
  parameter Real VRMAX_ex = 9 "or zero" annotation(Dialog(tab = "IEEET1 Parameters"));
  parameter Real VRMIN_ex = -5 "" annotation(Dialog(tab = "IEEET1 Parameters"));
  parameter Real KE_ex = 0.5 "or zero" annotation(Dialog(tab = "IEEET1 Parameters"));
  parameter Real TE_ex = 0.35 "(>0) (s)" annotation(Dialog(tab = "IEEET1 Parameters"));
  parameter Real KF_ex = 0.03 "" annotation(Dialog(tab = "IEEET1 Parameters"));
  parameter Real TF_ex = 0.4 "(>0) (s)" annotation(Dialog(tab = "IEEET1 Parameters"));
  parameter Real Switch_ex = 0 "" annotation(Dialog(tab = "IEEET1 Parameters"));
  parameter Real E1_ex = 4 "" annotation(Dialog(tab = "IEEET1 Parameters"));
  parameter Real SE_E1_ex = 0.4 "" annotation(Dialog(tab = "IEEET1 Parameters"));
  parameter Real E2_ex = 5 "" annotation(Dialog(tab = "IEEET1 Parameters"));
  parameter Real SE_E2_ex = 0.5 "" annotation(Dialog(tab = "IEEET1 Parameters"));

  // -------- OEL (MAXEX2) --------------------------------------------
  parameter Real EFDRATED_OEL = 2.8 annotation(Dialog(tab = "MAXEX2 Parameters"));
  parameter Real EFD1_OEL = 1.2 annotation(Dialog(tab = "MAXEX2 Parameters"));
  parameter Real TIME1_OEL = 50 annotation(Dialog(tab = "MAXEX2 Parameters"));
  parameter Real EFD2_OEL = 1.3 annotation(Dialog(tab = "MAXEX2 Parameters"));
  parameter Real TIME2_OEL = 30 annotation(Dialog(tab = "MAXEX2 Parameters"));
  parameter Real EFD3_OEL = 1.5 annotation(Dialog(tab = "MAXEX2 Parameters"));
  parameter Real TIME3_OEL = 5 annotation(Dialog(tab = "MAXEX2 Parameters"));
  parameter Real EFDDES_OEL = 1.0 annotation(Dialog(tab = "MAXEX2 Parameters"));
  parameter Real KMX_OEL = 1.5 annotation(Dialog(tab = "MAXEX2 Parameters"));
  parameter Real VLOW_OEL = -0.1 annotation(Dialog(tab = "MAXEX2 Parameters"));
  parameter Real ICONM_OEL = 0 annotation(Dialog(tab = "MAXEX2 Parameters", group = "ICONs"));

end GENSAL_IEEET1_MAXEX2;
