within OpalRT.ePHASORSIM.WrappedModels;
block GENROU_AC7B_WESGOV
  extends Wrappers.FMUTemplateVRefGRef(redeclare ModelSets.TypeD.GENROU_AC7B_WESGOV modelSet(
      partType = partType,
      IBUS = IBUS,
      M_ID = M_ID,
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
      S12 = S12,
      TR_ex = TR_ex,
      KPR_ex = KPR_ex,
      KIR_ex = KIR_ex,
      KDR_ex = KDR_ex,
      TDR_ex = TDR_ex,
      VRMAX_ex = VRMAX_ex,
      VRMIN_ex = VRMIN_ex,
      KPA_ex = KPA_ex,
      KIA_ex = KIA_ex,
      VAMAX_ex = VAMAX_ex,
      VAMIN_ex = VAMIN_ex,
      KP_ex = KP_ex,
      KL_ex = KL_ex,
      KF1_ex = KF1_ex,
      KF2_ex = KF2_ex,
      KF3_ex = KF3_ex,
      TF3_ex = TF3_ex,
      KC_ex = KC_ex,
      KD_ex = KD_ex,
      KE_ex = KE_ex,
      TE_ex = TE_ex,
      VFEMAX_ex = VFEMAX_ex,
      VEMIN_ex = VEMIN_ex,
      E1_ex = E1_ex,
      S_E1_ex = S_E1_ex,
      E2_ex = E2_ex,
      S_E2_ex = S_E2_ex,
      delTC_tg = delTC_tg,
      delTP_tg = delTP_tg,
      Droop_tg = Droop_tg,
      Kp_tg = Kp_tg,
      TI_tg = TI_tg,
      T1_tg = T1_tg,
      T2_tg = T2_tg,
      ALIM_tg = ALIM_tg,
      Tpe_tg = Tpe_tg,
      DELTA_tg = DELTA_tg));

// >>> AUTOGEN PARAMS (VERBATIM FROM MODELSETS) BEGIN
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
  // AC7B parameters
  parameter Real TR_ex = 0.04 "(sec) regulator input filter time constant" annotation(Dialog(tab = "AC7B Parameters"));
  parameter Real KPR_ex = 4.24 "(pu) regulator proportional gain" annotation(Dialog(tab = "AC7B Parameters"));
  parameter Real KIR_ex = 4.24 "(pu) regulator integral gain" annotation(Dialog(tab = "AC7B Parameters"));
  parameter Real KDR_ex = 0 "(pu) regulator derivative gain" annotation(Dialog(tab = "AC7B Parameters"));
  parameter Real TDR_ex = 0 "(sec) regulator derivative block time constant" annotation(Dialog(tab = "AC7B Parameters"));
  parameter Real VRMAX_ex = 5.79 "(pu) regulator output maximum limit" annotation(Dialog(tab = "AC7B Parameters"));
  parameter Real VRMIN_ex = -5.79 "(pu) regulator output minimum limit" annotation(Dialog(tab = "AC7B Parameters"));
  parameter Real KPA_ex = 65.36 "(pu) voltage regulator proportional gain" annotation(Dialog(tab = "AC7B Parameters"));
  parameter Real KIA_ex = 59.69 "(pu) voltage regulator integral gain" annotation(Dialog(tab = "AC7B Parameters"));
  parameter Real VAMAX_ex = 1 "(pu) regulator output maximum limit" annotation(Dialog(tab = "AC7B Parameters"));
  parameter Real VAMIN_ex = -0.95 "(pu) regulator output minimum limit" annotation(Dialog(tab = "AC7B Parameters"));
  parameter Real KP_ex = 4.96 "(pu)" annotation(Dialog(tab = "AC7B Parameters"));
  parameter Real KL_ex = 10 "(pu)" annotation(Dialog(tab = "AC7B Parameters"));
  parameter Real KF1_ex = 0.212 "(pu)" annotation(Dialog(tab = "AC7B Parameters"));
  parameter Real KF2_ex = 0 "(pu)" annotation(Dialog(tab = "AC7B Parameters"));
  parameter Real KF3_ex = 0 "(pu)" annotation(Dialog(tab = "AC7B Parameters"));
  parameter Real TF3_ex = 1 "(sec) time constant (> 0)" annotation(Dialog(tab = "AC7B Parameters"));
  parameter Real KC_ex = 0.18 "(pu) rectifier loading factor proportional to commutating reactance" annotation(Dialog(tab = "AC7B Parameters"));
  parameter Real KD_ex = 0.02 "(pu) demagnetizing factor, function of AC exciter reactances" annotation(Dialog(tab = "AC7B Parameters"));
  parameter Real KE_ex = 1 "(pu) exciter constant related fo self-excited field" annotation(Dialog(tab = "AC7B Parameters"));
  parameter Real TE_ex = 1.1 "(pu) exciter time constant" annotation(Dialog(tab = "AC7B Parameters"));
  parameter Real VFEMAX_ex = 6.9 "(pu) exciter field current limit (> 0)" annotation(Dialog(tab = "AC7B Parameters"));
  parameter Real VEMIN_ex = 0 "(pu)" annotation(Dialog(tab = "AC7B Parameters"));
  parameter Real E1_ex = 6.67 annotation(Dialog(tab = "AC7B Parameters"));
  parameter Real S_E1_ex = 1.951 annotation(Dialog(tab = "AC7B Parameters"));
  parameter Real E2_ex = 5 annotation(Dialog(tab = "AC7B Parameters"));
  parameter Real S_E2_ex = 0.156 annotation(Dialog(tab = "AC7B Parameters"));
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
// <<< AUTOGEN PARAMS (VERBATIM FROM MODELSETS) END

end GENROU_AC7B_WESGOV;
