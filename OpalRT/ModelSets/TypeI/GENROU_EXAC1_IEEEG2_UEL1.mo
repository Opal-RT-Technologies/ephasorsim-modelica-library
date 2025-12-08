within OpalRT.ModelSets.TypeI;
model GENROU_EXAC1_IEEEG2_UEL1 "GENROU + EXAC1 + IEEEG2 + UEL1 using the TypeI GenUnitTypeI1 template"
  extends GenUnitTypeI1(redeclare Electrical.Machine.SynchronousMachine.GENROU synchronousGenerator(
      IBUS = IBUS, ID = M_ID, P_gen = P_gen, Q_gen = Q_gen, Vt_abs = Vt_abs, Vt_ang = Vt_ang, SB = SB, fn = fn,
      ZSOURCE_RE = ZSOURCE_RE, Tdo_p = Tdo_p, Tdo_s = Tdo_s, Tqo_p = Tqo_p, Tqo_s = Tqo_s, H = H, D = D,
      Xd = Xd, Xq = Xq, Xd_p = Xd_p, Xq_p = Xq_p, Xd_s = Xd_s, Xl = Xl, S1 = S1, S12 = S12), redeclare Electrical.Control.Excitation.EXAC1 exciter(
      ID = M_ID, TR = TR_ex, TB = TB_ex, TC = TC_ex, KA = KA_ex, TA = TA_ex, VRMAX = VRMAX_ex, VRMIN = VRMIN_ex,
      TE = TE_ex, KF = KF_ex, TF = TF_ex, KC = KC_ex, KD = KD_ex, KE = KE_ex, E1 = E1_ex, SE_E1 = SE_E1_ex, E2 = E2_ex, SE_E2 = SE_E2_ex), redeclare Electrical.Control.TurbineGovernor.IEEEG2 turbineGovernor(
      ID = M_ID, K = K_tg, T1 = T1_tg, T2 = T2_tg, T3 = T3_tg, PMAX = PMAX_tg, PMIN = PMIN_tg, T4 = T4_tg), redeclare Electrical.Control.UnderExcitationLimiter.UEL1 uel(
      KUR = KUR_uel, KUC = KUC_uel, KUF = KUF_uel, VURMAX = VURMAX_uel, VUCMAX = VUCMAX_uel,
      KUI = KUI_uel, KUL = KUL_uel, VUIMAX = VUIMAX_uel, VUIMIN = VUIMIN_uel, TU1 = TU1_uel, TU2 = TU2_uel,
      TU3 = TU3_uel, TU4 = TU4_uel, VULMAX = VULMAX_uel, VULMIN = VULMIN_uel));

  // General
  parameter Integer IBUS = 100 annotation(Dialog(tab = "General"));
  parameter String M_ID = "M1" annotation(Dialog(tab = "General"));
  parameter Real P_gen = 1100 annotation(Dialog(tab = "General"));
  parameter Real Q_gen = 342.702 annotation(Dialog(tab = "General"));
  parameter Real Vt_abs = 1.03 annotation(Dialog(tab = "General"));
  parameter Real Vt_ang = -10.96 annotation(Dialog(tab = "General"));
  parameter Real SB = 1000 annotation(Dialog(tab = "General"));
  parameter Real fn = 50 annotation(Dialog(tab = "General"));

  // Machine
  parameter Real ZSOURCE_RE = 0 annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Tdo_p = 7 annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Tdo_s = 0.03 annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Tqo_p = 0.7 annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Tqo_s = 0.04 annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real H = 50 annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real D = 0 annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xd = 0.2 annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xq = 0.19 annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xd_p = 0.06 annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xq_p = 0.06 annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xd_s = 0.02 annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xl = 0.03 annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real S1 = 0.4 annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real S12 = 0.8 annotation(Dialog(tab = "GENROU Parameters"));

  // Exciter (EXAC1)
  parameter Real TR_ex = 0.1 annotation(Dialog(tab = "EXAC1 Parameters"));
  parameter Real TB_ex = 12 annotation(Dialog(tab = "EXAC1 Parameters"));
  parameter Real TC_ex = 10 annotation(Dialog(tab = "EXAC1 Parameters"));
  parameter Real KA_ex = 400 annotation(Dialog(tab = "EXAC1 Parameters"));
  parameter Real TA_ex = 5 annotation(Dialog(tab = "EXAC1 Parameters"));
  parameter Real VRMAX_ex = 5 annotation(Dialog(tab = "EXAC1 Parameters"));
  parameter Real VRMIN_ex = -5 annotation(Dialog(tab = "EXAC1 Parameters"));
  parameter Real TE_ex = 0.08 annotation(Dialog(tab = "EXAC1 Parameters"));
  parameter Real KF_ex = 0.2 annotation(Dialog(tab = "EXAC1 Parameters"));
  parameter Real TF_ex = 1.2 annotation(Dialog(tab = "EXAC1 Parameters"));
  parameter Real KC_ex = 0.4 annotation(Dialog(tab = "EXAC1 Parameters"));
  parameter Real KD_ex = 0.4 annotation(Dialog(tab = "EXAC1 Parameters"));
  parameter Real KE_ex = 0.5 annotation(Dialog(tab = "EXAC1 Parameters"));
  parameter Real E1_ex = 4 annotation(Dialog(tab = "EXAC1 Parameters"));
  parameter Real SE_E1_ex = 0.4 annotation(Dialog(tab = "EXAC1 Parameters"));
  parameter Real E2_ex = 5 annotation(Dialog(tab = "EXAC1 Parameters"));
  parameter Real SE_E2_ex = 0.5 annotation(Dialog(tab = "EXAC1 Parameters"));

  // Governor (IEEEG2)
  parameter Real K_tg = 20 annotation(Dialog(tab = "IEEEG2 Parameters"));
  parameter Real T1_tg = 20 "(s)" annotation(Dialog(tab = "IEEEG2 Parameters"));
  parameter Real T2_tg = 20 "(s)" annotation(Dialog(tab = "IEEEG2 Parameters"));
  parameter Real T3_tg = 20 "(>0)(s)" annotation(Dialog(tab = "IEEEG2 Parameters"));
  parameter Real PMAX_tg = 20 "(pu on machine MVA rating)" annotation(Dialog(tab = "IEEEG2 Parameters"));
  parameter Real PMIN_tg = 20 "(pu on machine MVA rating)" annotation(Dialog(tab = "IEEEG2 Parameters"));
  parameter Real T4_tg = 20 "(s)" annotation(Dialog(tab = "IEEEG2 Parameters"));

  // UEL (UEL1)
  parameter Real KUR_uel = 2 annotation(Dialog(tab = "UEL1 Parameters"));
  parameter Real KUC_uel = 1 annotation(Dialog(tab = "UEL1 Parameters"));
  parameter Real KUF_uel = 1 annotation(Dialog(tab = "UEL1 Parameters"));
  parameter Real VURMAX_uel = 1 annotation(Dialog(tab = "UEL1 Parameters"));
  parameter Real VUCMAX_uel = 1 annotation(Dialog(tab = "UEL1 Parameters"));
  parameter Real KUI_uel = 1 annotation(Dialog(tab = "UEL1 Parameters"));
  parameter Real KUL_uel = 1 annotation(Dialog(tab = "UEL1 Parameters"));
  parameter Real VUIMAX_uel = 1 annotation(Dialog(tab = "UEL1 Parameters"));
  parameter Real VUIMIN_uel = 1 annotation(Dialog(tab = "UEL1 Parameters"));
  parameter Real TU1_uel = 1 annotation(Dialog(tab = "UEL1 Parameters"));
  parameter Real TU2_uel = 1 annotation(Dialog(tab = "UEL1 Parameters"));
  parameter Real TU3_uel = 1 annotation(Dialog(tab = "UEL1 Parameters"));
  parameter Real TU4_uel = 1 annotation(Dialog(tab = "UEL1 Parameters"));
  parameter Real VULMAX_uel = 1 annotation(Dialog(tab = "UEL1 Parameters"));
  parameter Real VULMIN_uel = 1 annotation(Dialog(tab = "UEL1 Parameters"));

end GENROU_EXAC1_IEEEG2_UEL1;
