within OpalRT.ePHASORSIM.WrappedModels;
block GENROU_EXAC1_UEL2
  extends Wrappers.FMUTemplateVRef(redeclare ModelSets.TypeG.GENROU_EXAC1_UEL2 modelSet(
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
      TB_ex = TB_ex,
      TC_ex = TC_ex,
      KA_ex = KA_ex,
      TA_ex = TA_ex,
      VRMAX_ex = VRMAX_ex,
      VRMIN_ex = VRMIN_ex,
      TE_ex = TE_ex,
      KF_ex = KF_ex,
      TF_ex = TF_ex,
      KC_ex = KC_ex,
      KD_ex = KD_ex,
      KE_ex = KE_ex,
      E1_ex = E1_ex,
      SE_E1_ex = SE_E1_ex,
      E2_ex = E2_ex,
      SE_E2_ex = SE_E2_ex,
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

  // --------- GENROU Parameters (aliased from machineData / generalData) ---------
  parameter Integer IBUS = 100 "Located system bus" annotation(Dialog(tab = "General"));
  parameter String M_ID = "M1" "Machine Identifier" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real P_gen = 1000 "Bus Active Power, MW" annotation(Dialog(tab = "General"));
  parameter Real Q_gen = 100 "Bus Reactive Power, MVAR" annotation(Dialog(tab = "General"));
  parameter Real Vt_abs = 0.95 "Bus Voltage Magnitude, p.u." annotation(Dialog(tab = "General"));
  parameter Real Vt_ang = -2 "Bus Voltage Angle, deg." annotation(Dialog(tab = "General"));
  parameter Real SB = 1200 "Machine Base Power, MVA" annotation(Dialog(tab = "General"));
  parameter Real fn = 60 "Nominal frequency" annotation(Dialog(tab = "General"));
  parameter Real ZSOURCE_RE = 0 "Machine source impedence" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Tdo_p = 10.2 "d-axis transient time constant" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Tdo_s = 0.5 "d-axis sub-transient time constant, s" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Tqo_p = 1.02 "q-axis transient time constant, s" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Tqo_s = 0.01 "d-axis sub-transient time constant, s" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real H = 8.2 "Inertia constant" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real D = 0 "Speed damping" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xd = 3 "d-axis reactance, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xq = 0.5 "q-axis reactance, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xd_p = 0.5231 "d-axis transient reactance, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xq_p = 0.361 "q-axis transient reactance, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xd_s = 0.41 "d-axis sub-transient reactance, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xl = 0.2 "Reactance due to the leakage flux which does not cross the air gap, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real S1 = 0.5 "saturation function value for 1 p.u. input" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real S12 = 0.6 "saturation function value for 1.2 p.u. input" annotation(Dialog(tab = "GENROU Parameters"));

  // --------- EXAC1 Parameters (aliased from exciterData) ---------
  parameter Real TR_ex = 0.1 "(sec)" annotation(Dialog(tab = "EXAC1 Parameters"));
  parameter Real TB_ex = 12 "(sec)" annotation(Dialog(tab = "EXAC1 Parameters"));
  parameter Real TC_ex = 10 "(sec)" annotation(Dialog(tab = "EXAC1 Parameters"));
  parameter Real KA_ex = 400 annotation(Dialog(tab = "EXAC1 Parameters"));
  parameter Real TA_ex = 5 "(sec)" annotation(Dialog(tab = "EXAC1 Parameters"));
  parameter Real VRMAX_ex = 5 "or zero" annotation(Dialog(tab = "EXAC1 Parameters"));
  parameter Real VRMIN_ex = -5 annotation(Dialog(tab = "EXAC1 Parameters"));
  parameter Real TE_ex = 0.08 "(sec)" annotation(Dialog(tab = "EXAC1 Parameters"));
  parameter Real KF_ex = 0.2 annotation(Dialog(tab = "EXAC1 Parameters"));
  parameter Real TF_ex = 1.2 "(>0) (sec)" annotation(Dialog(tab = "EXAC1 Parameters"));
  parameter Real KC_ex = 0.4 annotation(Dialog(tab = "EXAC1 Parameters"));
  parameter Real KD_ex = 0.4 annotation(Dialog(tab = "EXAC1 Parameters"));
  parameter Real KE_ex = 0.5 "or zero" annotation(Dialog(tab = "EXAC1 Parameters"));
  parameter Real E1_ex = 4 annotation(Dialog(tab = "EXAC1 Parameters"));
  parameter Real SE_E1_ex = 0.4 annotation(Dialog(tab = "EXAC1 Parameters"));
  parameter Real E2_ex = 5 annotation(Dialog(tab = "EXAC1 Parameters"));
  parameter Real SE_E2_ex = 0.5 annotation(Dialog(tab = "EXAC1 Parameters"));

  // --------- UEL2 Parameters (aliased from uelData) ---------
  parameter Real TUV_uel = 5 "(sec) voltage filter time constant" annotation(Dialog(tab = "UEL2 Parameters"));
  parameter Real TUP_uel = 5 "(sec) real power filter time constant" annotation(Dialog(tab = "UEL2 Parameters"));
  parameter Real TUQ_uel = 0 "(sec) reactive power filter time constant" annotation(Dialog(tab = "UEL2 Parameters"));
  parameter Real KUI_uel = 0.5 "(pu) UEL integral gain" annotation(Dialog(tab = "UEL2 Parameters"));
  parameter Real KUL_uel = 0.8 "(pu) UEL proportional gain" annotation(Dialog(tab = "UEL2 Parameters"));
  parameter Real VUIMAX_uel = 0.25 "(pu) UEL integrator output maximum limit" annotation(Dialog(tab = "UEL2 Parameters"));
  parameter Real VUIMIN_uel = 0 "(pu) UEL integrator output minimum limit" annotation(Dialog(tab = "UEL2 Parameters"));
  parameter Real KUF_uel = 0 "(pu) UEL excitation system stabilizer gain" annotation(Dialog(tab = "UEL2 Parameters"));
  parameter Real KFB_uel = 0 "(pu)" annotation(Dialog(tab = "UEL2 Parameters"));
  parameter Real TUL_uel = 0 "(sec)" annotation(Dialog(tab = "UEL2 Parameters"));
  parameter Real TU1_uel = 0 "UEL lead time constant (sec)" annotation(Dialog(tab = "UEL2 Parameters"));
  parameter Real TU2_uel = 0 "UEL lag time constant (sec)" annotation(Dialog(tab = "UEL2 Parameters"));
  parameter Real TU3_uel = 0 "UEL lead time constant (sec)" annotation(Dialog(tab = "UEL2 Parameters"));
  parameter Real TU4_uel = 0 "UEL lag time constant (sec)" annotation(Dialog(tab = "UEL2 Parameters"));
  parameter Real P0_uel = 0.0 "(pu on gen. MVA base)" annotation(Dialog(tab = "UEL2 Parameters"));
  parameter Real Q0_uel = -0.31 "(pu on gen. MVA base)" annotation(Dialog(tab = "UEL2 Parameters"));
  parameter Real P1_uel = 0.3 "(pu on gen. MVA base)" annotation(Dialog(tab = "UEL2 Parameters"));
  parameter Real Q1_uel = -0.31 "(pu on gen. MVA base)" annotation(Dialog(tab = "UEL2 Parameters"));
  parameter Real P2_uel = 0.6 "(pu on gen. MVA base)" annotation(Dialog(tab = "UEL2 Parameters"));
  parameter Real Q2_uel = -0.28 "(pu on gen. MVA base)" annotation(Dialog(tab = "UEL2 Parameters"));
  parameter Real P3_uel = 0.9 "(pu on gen. MVA base)" annotation(Dialog(tab = "UEL2 Parameters"));
  parameter Real Q3_uel = -0.21 "(pu on gen. MVA base)" annotation(Dialog(tab = "UEL2 Parameters"));
  parameter Real P4_uel = 1.02 "(pu on gen. MVA base)" annotation(Dialog(tab = "UEL2 Parameters"));
  parameter Real Q4_uel = 0.0 "(pu on gen. MVA base)" annotation(Dialog(tab = "UEL2 Parameters"));
  parameter Real P5_uel = 0.0 "(pu on gen. MVA base)" annotation(Dialog(tab = "UEL2 Parameters"));
  parameter Real Q5_uel = 0.0 "(pu on gen. MVA base)" annotation(Dialog(tab = "UEL2 Parameters"));
  parameter Real P6_uel = 0.0 "(pu on gen. MVA base)" annotation(Dialog(tab = "UEL2 Parameters"));
  parameter Real Q6_uel = 0.0 "(pu on gen. MVA base)" annotation(Dialog(tab = "UEL2 Parameters"));
  parameter Real P7_uel = 0.0 "(pu on gen. MVA base)" annotation(Dialog(tab = "UEL2 Parameters"));
  parameter Real Q7_uel = 0.0 "(pu on gen. MVA base)" annotation(Dialog(tab = "UEL2 Parameters"));
  parameter Real P8_uel = 0.0 "(pu on gen. MVA base)" annotation(Dialog(tab = "UEL2 Parameters"));
  parameter Real Q8_uel = 0.0 "(pu on gen. MVA base)" annotation(Dialog(tab = "UEL2 Parameters"));
  parameter Real P9_uel = 0.0 "(pu on gen. MVA base)" annotation(Dialog(tab = "UEL2 Parameters"));
  parameter Real Q9_uel = 0.0 "(pu on gen. MVA base)" annotation(Dialog(tab = "UEL2 Parameters"));
  parameter Real P10_uel = 0.0 "(pu on gen. MVA base)" annotation(Dialog(tab = "UEL2 Parameters"));
  parameter Real Q10_uel = 0.0 "(pu on gen. MVA base)" annotation(Dialog(tab = "UEL2 Parameters"));
  parameter Real VULMAX_uel = 0.25 "(pu) UEL output maximum limit" annotation(Dialog(tab = "UEL2 Parameters"));
  parameter Real VULMIN_uel = 0 "(pu) UEL output minimum limit" annotation(Dialog(tab = "UEL2 Parameters"));
  parameter Real M0_uel = 0 "k1, exponent in function F1" annotation(Dialog(tab = "UEL2 Parameters"));
  parameter Real M1_uel = 0 "k2, exponent in function F2" annotation(Dialog(tab = "UEL2 Parameters"));
  parameter Real M2_uel = 0 "0: mirror around MVAR axis; 1: linear extrapolation" annotation(Dialog(tab = "UEL2 Parameters"));
// <<< AUTOGEN PARAMS (VERBATIM FROM MODELSETS) END


end GENROU_EXAC1_UEL2;
