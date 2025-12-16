within OpalRT.ModelSets.TypeI;
model GENROU_IEEET1_IEEEG2_UEL1 "GENROU + IEEET1 + IEEEG2 + UEL1 using the TypeI GenUnitTypeI1 template"
  extends GenUnitTypeI1(redeclare Electrical.Machine.SynchronousMachine.GENROU synchronousGenerator(
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
      SE_E2 = SE_E2_ex), redeclare Electrical.Control.TurbineGovernor.IEEEG2 turbineGovernor(
      ID = M_ID,
      K = K_tg,
      T1 = T1_tg,
      T2 = T2_tg,
      T3 = T3_tg,
      PMAX = PMAX_tg,
      PMIN = PMIN_tg,
      T4 = T4_tg), redeclare Electrical.Control.UnderExcitationLimiter.UEL1 uel(
      KUR = KUR_uel,
      KUC = KUC_uel,
      KUF = KUF_uel,
      VURMAX = VURMAX_uel,
      VUCMAX = VUCMAX_uel,
      KUI = KUI_uel,
      KUL = KUL_uel,
      VUIMAX = VUIMAX_uel,
      VUIMIN = VUIMIN_uel,
      TU1 = TU1_uel,
      TU2 = TU2_uel,
      TU3 = TU3_uel,
      TU4 = TU4_uel,
      VULMAX = VULMAX_uel,
      VULMIN = VULMIN_uel));

    // Data records (adjust concrete classes to yours as needed)

  // -------- General --------------------------------------------------
  parameter Integer IBUS = 100 "Located system bus" annotation(Dialog(tab = "General"));
  parameter String M_ID = "M1" "Machine Identifier" annotation(Dialog(tab = "General"));
  parameter Real P_gen = 1100 "Bus Active Power, MW" annotation(Dialog(tab = "General"));
  parameter Real Q_gen = 342.702 "Bus Reactive Power, MVAR" annotation(Dialog(tab = "General"));
  parameter Real Vt_abs = 1.03 "Bus Voltage Magnitude, p.u." annotation(Dialog(tab = "General"));
  parameter Real Vt_ang = -10.96 "Bus Voltage Angle, deg." annotation(Dialog(tab = "General"));
  parameter Real SB = 1000 "Machine Base Power, MVA" annotation(Dialog(tab = "General"));
  parameter Real fn = 50 "Nominal frequency" annotation(Dialog(tab = "General"));

  // -------- Machine (GENROU) ----------------------------------------
  parameter Real ZSOURCE_RE = 0 "Machine source impedence" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Tdo_p = 7 "d-axis transient time constant" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Tdo_s = 0.03 "d-axis sub-transient time constant, s" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Tqo_p = 0.7 "q-axis transient time constant, s" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Tqo_s = 0.04 "q-axis sub-transient time constant, s" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real H = 50 "Inertia constant" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real D = 0 "Speed damping" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xd = 0.2 "d-axis reactance, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xq = 0.19 "q-axis reactance, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xd_p = 0.06 "d-axis transient reactance, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xq_p = 0.06 "q-axis transient reactance, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xd_s = 0.02 "d-axis sub-transient reactance, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xl = 0.03 "Leakage reactance, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real S1 = 0.4 "Saturation function value at 1.0 p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real S12 = 0.8 "Saturation function value at 1.2 p.u." annotation(Dialog(tab = "GENROU Parameters"));

  // -------- Exciter (IEEET1) ----------------------------------------
  parameter Real TR_ex = 0.025 "(s)" annotation(Dialog(tab = "IEEET1 Parameters"));
  parameter Real KA_ex = 98 "Regulator gain" annotation(Dialog(tab = "IEEET1 Parameters"));
  parameter Real TA_ex = 0.2 "(s)" annotation(Dialog(tab = "IEEET1 Parameters"));
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

  // -------- Governor (IEEEG2) ---------------------------------------
  parameter Real K_tg = 20 annotation(Dialog(tab = "IEEEG2 Parameters"));
  parameter Real T1_tg = 20 "(s)" annotation(Dialog(tab = "IEEEG2 Parameters"));
  parameter Real T2_tg = 20 "(s)" annotation(Dialog(tab = "IEEEG2 Parameters"));
  parameter Real T3_tg = 20 "(>0)(s)" annotation(Dialog(tab = "IEEEG2 Parameters"));
  parameter Real PMAX_tg = 20 "(pu on machine MVA rating)" annotation(Dialog(tab = "IEEEG2 Parameters"));
  parameter Real PMIN_tg = 20 "(pu on machine MVA rating)" annotation(Dialog(tab = "IEEEG2 Parameters"));
  parameter Real T4_tg = 20 "(s)" annotation(Dialog(tab = "IEEEG2 Parameters"));

  // -------- UEL (UEL1) ----------------------------------------------
  parameter Real KUR_uel = 2 "UEL radius setting (pu)" annotation(Dialog(tab = "UEL1 Parameters"));
  parameter Real KUC_uel = 1 "(pu) UEL center setting (pu)" annotation(Dialog(tab = "UEL1 Parameters"));
  parameter Real KUF_uel = 1 "(pu) UEL exciter stabilizer gain" annotation(Dialog(tab = "UEL1 Parameters"));
  parameter Real VURMAX_uel = 1 "UEL max limit for radius phasor magnitude (pu)" annotation(Dialog(tab = "UEL1 Parameters"));
  parameter Real VUCMAX_uel = 1 "UEL max limit for operating point phasor magnitude (pu)" annotation(Dialog(tab = "UEL1 Parameters"));
  parameter Real KUI_uel = 1 "UEL integral gain (pu)" annotation(Dialog(tab = "UEL1 Parameters"));
  parameter Real KUL_uel = 1 "UEL proportional gain (pu)" annotation(Dialog(tab = "UEL1 Parameters"));
  parameter Real VUIMAX_uel = 1 "(pu) UEL integrator output maximum" annotation(Dialog(tab = "UEL1 Parameters"));
  parameter Real VUIMIN_uel = 1 "(pu) UEL integrator output minimum" annotation(Dialog(tab = "UEL1 Parameters"));
  parameter Real TU1_uel = 1 "UEL lead time constant (s)" annotation(Dialog(tab = "UEL1 Parameters"));
  parameter Real TU2_uel = 1 "UEL lag time constant (s)" annotation(Dialog(tab = "UEL1 Parameters"));
  parameter Real TU3_uel = 1 "UEL lead time constant (s)" annotation(Dialog(tab = "UEL1 Parameters"));
  parameter Real TU4_uel = 1 "UEL lag time constant (s)" annotation(Dialog(tab = "UEL1 Parameters"));
  parameter Real VULMAX_uel = 1 "(pu) UEL output maximum limit" annotation(Dialog(tab = "UEL1 Parameters"));
  parameter Real VULMIN_uel = 1 "(pu) UEL output minimum limit" annotation(Dialog(tab = "UEL1 Parameters"));

end GENROU_IEEET1_IEEEG2_UEL1;
