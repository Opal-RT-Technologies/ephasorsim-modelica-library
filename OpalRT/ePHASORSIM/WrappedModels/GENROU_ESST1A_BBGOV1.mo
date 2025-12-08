within OpalRT.ePHASORSIM.WrappedModels;
block GENROU_ESST1A_BBGOV1
  extends Wrappers.FMUTemplateVRefGRef(redeclare ModelSets.TypeD.GENROU_ESST1A_BBGOV1 modelSet(
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
      VIMAX_ex = VIMAX_ex,
      VIMIN_ex = VIMIN_ex,
      TC_ex = TC_ex,
      TB_ex = TB_ex,
      TC1_ex = TC1_ex,
      TB1_ex = TB1_ex,
      KA_ex = KA_ex,
      TA_ex = TA_ex,
      VAMAX_ex = VAMAX_ex,
      VAMIN_ex = VAMIN_ex,
      VRMAX_ex = VRMAX_ex,
      VRMIN_ex = VRMIN_ex,
      KC_ex = KC_ex,
      KF_ex = KF_ex,
      TF_ex = TF_ex,
      KLR_ex = KLR_ex,
      ILR_ex = ILR_ex,
      UEL_ex = UEL_ex,
      VOS_ex = VOS_ex,
      fcut_tg = fcut_tg,
      KS_tg = KS_tg,
      KLS_tg = KLS_tg,
      KG_tg = KG_tg,
      KP_tg = KP_tg,
      TN_tg = TN_tg,
      KD_tg = KD_tg,
      TD_tg = TD_tg,
      T4_tg = T4_tg,
      K2_tg = K2_tg,
      T5_tg = T5_tg,
      K3_tg = K3_tg,
      T6_tg = T6_tg,
      T1_tg = T1_tg,
      SWITCH_tg = SWITCH_tg,
      PMAX_tg = PMAX_tg,
      PMIN_tg = PMIN_tg));

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
  // ESST1A parameters
  parameter Real TR_ex = 0.02 "(sec)" annotation(Dialog(tab = "ESST1A Parameters"));
  parameter Real VIMAX_ex = 10 annotation(Dialog(tab = "ESST1A Parameters"));
  parameter Real VIMIN_ex = -10 annotation(Dialog(tab = "ESST1A Parameters"));
  parameter Real TC_ex = 1 "(sec)" annotation(Dialog(tab = "ESST1A Parameters"));
  parameter Real TB_ex = 1 "(sec)" annotation(Dialog(tab = "ESST1A Parameters"));
  parameter Real TC1_ex = 0 "(sec)" annotation(Dialog(tab = "ESST1A Parameters"));
  parameter Real TB1_ex = 0 "(sec)" annotation(Dialog(tab = "ESST1A Parameters"));
  parameter Real KA_ex = 210 annotation(Dialog(tab = "ESST1A Parameters"));
  parameter Real TA_ex = 0 "(sec)" annotation(Dialog(tab = "ESST1A Parameters"));
  parameter Real VAMAX_ex = 10 annotation(Dialog(tab = "ESST1A Parameters"));
  parameter Real VAMIN_ex = -10 annotation(Dialog(tab = "ESST1A Parameters"));
  parameter Real VRMAX_ex = 6.43 annotation(Dialog(tab = "ESST1A Parameters"));
  parameter Real VRMIN_ex = -6 annotation(Dialog(tab = "ESST1A Parameters"));
  parameter Real KC_ex = 0.038 annotation(Dialog(tab = "ESST1A Parameters"));
  parameter Real KF_ex = 0 annotation(Dialog(tab = "ESST1A Parameters"));
  parameter Real TF_ex = 0 "> 0 (sec)" annotation(Dialog(tab = "ESST1A Parameters"));
  parameter Real KLR_ex = 4.54 annotation(Dialog(tab = "ESST1A Parameters"));
  parameter Real ILR_ex = 4.4 annotation(Dialog(tab = "ESST1A Parameters"));
  // ICONS
  parameter Real UEL_ex = 1 "1,2 or 3" annotation(Dialog(tab = "ESST1A Parameters"));
  parameter Real VOS_ex = 1 "1 or 2" annotation(Dialog(tab = "ESST1A Parameters"));
  // BBGOV1 Parameters
  parameter Real fcut_tg = 1 "(>=0)(pu)" annotation(Dialog(tab = "BBGOV1"));
  parameter Real KS_tg = 1 annotation(Dialog(tab = "BBGOV1"));
  parameter Real KLS_tg = 1 "(> 0)" annotation(Dialog(tab = "BBGOV1"));
  parameter Real KG_tg = 1 annotation(Dialog(tab = "BBGOV1"));
  parameter Real KP_tg = 1 annotation(Dialog(tab = "BBGOV1"));
  parameter Real TN_tg = 1 "(sec)(> 0)" annotation(Dialog(tab = "BBGOV1"));
  parameter Real KD_tg = 0.5 annotation(Dialog(tab = "BBGOV1"));
  parameter Real TD_tg = 0.5 "(sec)(> 0)" annotation(Dialog(tab = "BBGOV1"));
  parameter Real T4_tg = 0.5 "(sec)" annotation(Dialog(tab = "BBGOV1"));
  parameter Real K2_tg = 1 annotation(Dialog(tab = "BBGOV1"));
  parameter Real T5_tg = 0.5 "(sec)" annotation(Dialog(tab = "BBGOV1"));
  parameter Real K3_tg = 1 annotation(Dialog(tab = "BBGOV1"));
  parameter Real T6_tg = 0.5 "(sec)" annotation(Dialog(tab = "BBGOV1"));
  parameter Real T1_tg = 0.5 "(sec)" annotation(Dialog(tab = "BBGOV1"));
  parameter Real SWITCH_tg = 1 annotation(Dialog(tab = "BBGOV1"));
  parameter Real PMAX_tg = 1 annotation(Dialog(tab = "BBGOV1"));
  parameter Real PMIN_tg = -1 annotation(Dialog(tab = "BBGOV1"));
  //
// <<< AUTOGEN PARAMS (VERBATIM FROM MODELSETS) END

end GENROU_ESST1A_BBGOV1;
