within OpalRT.ePHASORSIM.WrappedModels;
block GENROU_ESST1A_UEL2
  extends Wrappers.FMUTemplateVRef(redeclare ModelSets.TypeG.GENROU_ESST1A_UEL2 modelSet(
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
      UEL_ex = UEL_ex,
      VOS_ex = VOS_ex,
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
      TUV_uel = TUV_uel,
      TUP_uel = TUP_uel,
      TUQ_uel = TUQ_uel,
      KUI_uel = KUI_uel,
      KUL_uel = KUL_uel,
      VUIMAX_uel = VUIMAX_uel,
      VUIMIN_uel = VUIMIN_uel,
      KUF_uel = KUF_uel,
      KFB_uel = KFB_uel,
      TUL_uel = TUL_uel,
      TU1_uel = TU1_uel,
      TU2_uel = TU2_uel,
      TU3_uel = TU3_uel,
      TU4_uel = TU4_uel,
      P0_uel = P0_uel,
      Q0_uel = Q0_uel,
      P1_uel = P1_uel,
      Q1_uel = Q1_uel,
      P2_uel = P2_uel,
      Q2_uel = Q2_uel,
      P3_uel = P3_uel,
      Q3_uel = Q3_uel,
      P4_uel = P4_uel,
      Q4_uel = Q4_uel,
      P5_uel = P5_uel,
      Q5_uel = Q5_uel,
      P6_uel = P6_uel,
      Q6_uel = Q6_uel,
      P7_uel = P7_uel,
      Q7_uel = Q7_uel,
      P8_uel = P8_uel,
      Q8_uel = Q8_uel,
      P9_uel = P9_uel,
      Q9_uel = Q9_uel,
      P10_uel = P10_uel,
      Q10_uel = Q10_uel,
      VULMAX_uel = VULMAX_uel,
      VULMIN_uel = VULMIN_uel,
      M0_uel = M0_uel,
      M1_uel = M1_uel,
      M2_uel = M2_uel));

// >>> AUTOGEN PARAMS (VERBATIM FROM MODELSETS) BEGIN
  parameter Real partType = 1;

  // General / machine
  parameter Integer IBUS = 100 "Located system bus" annotation(Dialog(tab="General"));
  parameter String  M_ID = "M1" "Machine Identifier"  annotation(Dialog(tab="GENROU Parameters"));
  parameter Real P_gen = 900 "Bus Active Power, MW" annotation(Dialog(tab="General"));
  parameter Real Q_gen = 200 "Bus Reactive Power, MVAR" annotation(Dialog(tab="General"));
  parameter Real Vt_abs = 1.03 "Bus Voltage Magnitude, p.u." annotation(Dialog(tab="General"));
  parameter Real Vt_ang = -10.96 "Bus Voltage Angle, deg." annotation(Dialog(tab="General"));
  parameter Real SB = 1000     "Machine Base Power, MVA" annotation(Dialog(tab="General"));
  parameter Real fn = 50     "Nominal frequency" annotation(Dialog(tab="General"));

  parameter Real ZSOURCE_RE = 0 annotation(Dialog(tab="GENROU Parameters"));
  parameter Real Tdo_p = 7 annotation(Dialog(tab="GENROU Parameters"));
  parameter Real Tdo_s = 0.3 annotation(Dialog(tab="GENROU Parameters"));
  parameter Real Tqo_p = 0.04 annotation(Dialog(tab="GENROU Parameters"));
  parameter Real Tqo_s = 0.4 annotation(Dialog(tab="GENROU Parameters"));
  parameter Real H = 2.6 annotation(Dialog(tab="GENROU Parameters"));
  parameter Real D = 0 annotation(Dialog(tab="GENROU Parameters"));
  parameter Real Xd = 0.67 annotation(Dialog(tab="GENROU Parameters"));
  parameter Real Xq = 0.62 annotation(Dialog(tab="GENROU Parameters"));
  parameter Real Xd_p = 0.3 annotation(Dialog(tab="GENROU Parameters"));
  parameter Real Xq_p = 0.3 annotation(Dialog(tab="GENROU Parameters"));
  parameter Real Xd_s = 0.01 annotation(Dialog(tab="GENROU Parameters"));
  parameter Real Xl = 0.04   annotation(Dialog(tab="GENROU Parameters"));
  parameter Real S1 = 0.1   annotation(Dialog(tab="GENROU Parameters"));
  parameter Real S12 = 0.2  annotation(Dialog(tab="GENROU Parameters"));

  // ESST1A
  parameter Real UEL_ex = 1 annotation(Dialog(tab="ESST1A Parameters"));
  parameter Real VOS_ex = 1 annotation(Dialog(tab="ESST1A Parameters"));
  parameter Real TR_ex = 0.02  annotation(Dialog(tab="ESST1A Parameters"));
  parameter Real VIMAX_ex = 10 annotation(Dialog(tab="ESST1A Parameters"));
  parameter Real VIMIN_ex = -10 annotation(Dialog(tab="ESST1A Parameters"));
  parameter Real TC_ex = 1  annotation(Dialog(tab="ESST1A Parameters"));
  parameter Real TB_ex = 1  annotation(Dialog(tab="ESST1A Parameters"));
  parameter Real TC1_ex = 0 annotation(Dialog(tab="ESST1A Parameters"));
  parameter Real TB1_ex = 0 annotation(Dialog(tab="ESST1A Parameters"));
  parameter Real KA_ex = 210  annotation(Dialog(tab="ESST1A Parameters"));
  parameter Real TA_ex = 0  annotation(Dialog(tab="ESST1A Parameters"));
  parameter Real VAMAX_ex = 10 annotation(Dialog(tab="ESST1A Parameters"));
  parameter Real VAMIN_ex = -10 annotation(Dialog(tab="ESST1A Parameters"));
  parameter Real VRMAX_ex = 6.43 annotation(Dialog(tab="ESST1A Parameters"));
  parameter Real VRMIN_ex = -6 annotation(Dialog(tab="ESST1A Parameters"));
  parameter Real KC_ex = 0.038   annotation(Dialog(tab="ESST1A Parameters"));
  parameter Real KF_ex = 0   annotation(Dialog(tab="ESST1A Parameters"));
  parameter Real TF_ex = 0   annotation(Dialog(tab="ESST1A Parameters"));
  parameter Real KLR_ex = 4.54  annotation(Dialog(tab="ESST1A Parameters"));
  parameter Real ILR_ex = 4.4  annotation(Dialog(tab="ESST1A Parameters"));

  // UEL2
  parameter Real TUV_uel = 5 annotation(Dialog(tab="UEL2 Parameters"));
  parameter Real TUP_uel = 5 annotation(Dialog(tab="UEL2 Parameters"));
  parameter Real TUQ_uel = 0 annotation(Dialog(tab="UEL2 Parameters"));
  parameter Real KUI_uel = 0.5 annotation(Dialog(tab="UEL2 Parameters"));
  parameter Real KUL_uel = 0.8 annotation(Dialog(tab="UEL2 Parameters"));
  parameter Real VUIMAX_uel = 0.25 annotation(Dialog(tab="UEL2 Parameters"));
  parameter Real VUIMIN_uel = 0 annotation(Dialog(tab="UEL2 Parameters"));
  parameter Real KUF_uel = 0 annotation(Dialog(tab="UEL2 Parameters"));
  parameter Real KFB_uel = 0 annotation(Dialog(tab="UEL2 Parameters"));
  parameter Real TUL_uel = 0 annotation(Dialog(tab="UEL2 Parameters"));
  parameter Real TU1_uel = 0 annotation(Dialog(tab="UEL2 Parameters"));
  parameter Real TU2_uel = 0 annotation(Dialog(tab="UEL2 Parameters"));
  parameter Real TU3_uel = 0 annotation(Dialog(tab="UEL2 Parameters"));
  parameter Real TU4_uel = 0 annotation(Dialog(tab="UEL2 Parameters"));
  parameter Real P0_uel = 0.0;
  parameter Real Q0_uel = -0.31;
  parameter Real P1_uel = 0.3;
  parameter Real Q1_uel = -0.31;
  parameter Real P2_uel = 0.6;
  parameter Real Q2_uel = -0.28;
  parameter Real P3_uel = 0.9;
  parameter Real Q3_uel = -0.21;
  parameter Real P4_uel = 1.02;
  parameter Real Q4_uel = 0.0;
  parameter Real P5_uel = 0.0;
  parameter Real Q5_uel = 0.0;
  parameter Real P6_uel = 0.0;
  parameter Real Q6_uel = 0.0;
  parameter Real P7_uel = 0.0;
  parameter Real Q7_uel = 0.0;
  parameter Real P8_uel = 0.0;
  parameter Real Q8_uel = 0.0;
  parameter Real P9_uel = 0.0;
  parameter Real Q9_uel = 0.0;
  parameter Real P10_uel = 0.0;
  parameter Real Q10_uel = 0.0;
  parameter Real VULMAX_uel = 0.25 annotation(Dialog(tab="UEL2 Parameters"));
  parameter Real VULMIN_uel = 0 annotation(Dialog(tab="UEL2 Parameters"));
  parameter Real M0_uel = 0 annotation(Dialog(tab="UEL2 Parameters"));
  parameter Real M1_uel = 0 annotation(Dialog(tab="UEL2 Parameters"));
  parameter Real M2_uel = 0 annotation(Dialog(tab="UEL2 Parameters"));
  //
// <<< AUTOGEN PARAMS (VERBATIM FROM MODELSETS) END


end GENROU_ESST1A_UEL2;
