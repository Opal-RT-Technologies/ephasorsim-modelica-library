within OpalRT.ePHASORSIM.WrappedModels;
block GENSAL_ESDC2A_HYGOV
  extends Wrappers.FMUTemplateVRefGRef(redeclare ModelSets.TypeD.GENSAL_ESDC2A_HYGOV modelSet(
      partType = partType,
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
      S12 = S12,
      ZSOURCE_IM = ZSOURCE_IM,
      TR_ex = TR_ex,
      KA_ex = KA_ex,
      TA_ex = TA_ex,
      TB_ex = TB_ex,
      TC_ex = TC_ex,
      VRMAX_ex = VRMAX_ex,
      VRMIN_ex = VRMIN_ex,
      KE_ex = KE_ex,
      TE_ex = TE_ex,
      KF_ex = KF_ex,
      TF1_ex = TF1_ex,
      Switch_ex = Switch_ex,
      E1_ex = E1_ex,
      SE_E1_ex = SE_E1_ex,
      E2_ex = E2_ex,
      SE_E2_ex = SE_E2_ex,
      R_tg = R_tg,
      r_tg = r_tg,
      Tr_tg = Tr_tg,
      Tf_tg = Tf_tg,
      Tg_tg = Tg_tg,
      VELM_tg = VELM_tg,
      GMAX_tg = GMAX_tg,
      GMIN_tg = GMIN_tg,
      TW_tg = TW_tg,
      At_tg = At_tg,
      Dturb_tg = Dturb_tg,
      qNL_tg = qNL_tg));

// >>> AUTOGEN PARAMS (VERBATIM FROM MODELSETS) BEGIN
  parameter Real partType = 1;
  //GENSAL
  parameter Integer IBUS = 100 "Located system bus";
  parameter String ID = "M1" "Machine Identifier";
  parameter Real P_gen = 1100 "Bus Active Power, MW";
  parameter Real Q_gen = 342.702 "Bus Reactive Power, MVAR";
  parameter Real Vt_abs = 1.03 "Bus Voltage Magnitude, p.u.";
  parameter Real Vt_ang = -10.96 "Bus Voltage Angle, deg.";
  parameter Real SB = 1000 "Machine Base Power, MVA";
  parameter Real fn = 50 "Nominal frequency";
  parameter Real ZSOURCE_RE = 0 "Machine source impedence";
  parameter Real Tdo_p = 7 "d-axis transient time constant";
  parameter Real Tdo_s = 0.03 "d-axis sub-transient time constant, s";
  parameter Real Tqo_s = 0.04 "d-axis sub-transient time constant, s";
  parameter Real H = 50 "Inertia constant";
  parameter Real D = 0 "Speed damping";
  parameter Real Xd = 0.2 "d-axis reactance, p.u.";
  parameter Real Xq = 0.19 "q-axis reactance, p.u.";
  parameter Real Xd_p = 0.06 "d-axis transient reactance, p.u.";
  parameter Real Xd_s = 0.02 "d-axis sub-transient reactance, p.u.";
  parameter Real Xl = 0.03 "Reactance due to the leakage flux which does not cross the air gap, p.u.";
  parameter Real S1 = 0.4 "saturation function value for 1 p.u. input";
  parameter Real S12 = 0.8 "saturation function value for 1.2 p.u. input";
  parameter Real ZSOURCE_IM = Xd_s "Machine source impedence";
  //ESDC2A
  parameter Real TR_ex = 0.1 "(sec)" annotation(Dialog(tab = "ESDC1A parameters"));
  parameter Real KA_ex = 400 annotation(Dialog(tab = "ESDC1A parameters"));
  parameter Real TA_ex = 5 "(sec)" annotation(Dialog(tab = "ESDC1A parameters"));
  parameter Real TB_ex = 12 "(sec)" annotation(Dialog(tab = "ESDC1A parameters"));
  parameter Real TC_ex = 10 "(sec)" annotation(Dialog(tab = "ESDC1A parameters"));
  parameter Real VRMAX_ex = 5 "or zero" annotation(Dialog(tab = "ESDC1A parameters"));
  parameter Real VRMIN_ex = -5 annotation(Dialog(tab = "ESDC1A parameters"));
  parameter Real KE_ex = 0.5 "or zero" annotation(Dialog(tab = "ESDC1A parameters"));
  parameter Real TE_ex = 0.08 "(sec)" annotation(Dialog(tab = "ESDC1A parameters"));
  parameter Real KF_ex = 0.2 annotation(Dialog(tab = "ESDC1A parameters"));
  parameter Real TF1_ex = 1.2 "(>0) (sec)" annotation(Dialog(tab = "ESDC1A parameters"));
  parameter Real Switch_ex = 0 annotation(Dialog(tab = "ESDC1A parameters"));
  parameter Real E1_ex = 4 annotation(Dialog(tab = "ESDC1A parameters"));
  parameter Real SE_E1_ex = 0.4 annotation(Dialog(tab = "ESDC1A parameters"));
  parameter Real E2_ex = 5 annotation(Dialog(tab = "ESDC1A parameters"));
  parameter Real SE_E2_ex = 0.5 annotation(Dialog(tab = "ESDC1A parameters"));
  //HYGOV
  parameter Real R_tg = 0.06 "Permanent Droop";
  parameter Real r_tg = 0.4 "Temporary Droop";
  parameter Real Tr_tg = 8 "(>0) Governor time constant";
  parameter Real Tf_tg = 0.05 "(>0) Filter time constant";
  parameter Real Tg_tg = 0.2 "(>0) Servo time constant";
  parameter Real VELM_tg = 0.01 "Gate velocity limit";
  parameter Real GMAX_tg = 0.601 "Maximum gate limit";
  parameter Real GMIN_tg = 0 "Minimum gate limit";
  parameter Real TW_tg = 1.2 "(>0) Water time constant";
  parameter Real At_tg = 2.5 "Trubine gain";
  parameter Real Dturb_tg = 0 "Turbine damping";
  parameter Real qNL_tg = 0.5 "No power flow";
  //
// <<< AUTOGEN PARAMS (VERBATIM FROM MODELSETS) END

end GENSAL_ESDC2A_HYGOV;
