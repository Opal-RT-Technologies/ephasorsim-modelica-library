within OpalRT.ePHASORSIM.WrappedModels;
block GENSAL_IEEET1_WEHGOV
  extends Wrappers.FMUTemplateVRefGRef(redeclare ModelSets.TypeD.GENSAL_IEEET1_WEHGOV modelSet(
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
      R_PERM_GATE_tg = R_PERM_GATE_tg,
      R_PERM_PE_tg = R_PERM_PE_tg,
      TPE_tg = TPE_tg,
      KP_tg = KP_tg,
      KI_tg = KI_tg,
      KD_tg = KD_tg,
      TD_tg = TD_tg,
      TP_tg = TP_tg,
      TDV_tg = TDV_tg,
      Tg_tg = Tg_tg,
      GTMXOP_tg = GTMXOP_tg,
      GTMXCL_tg = GTMXCL_tg,
      GMAX_tg = GMAX_tg,
      GMIN_tg = GMIN_tg,
      DTURB_tg = DTURB_tg,
      TW_tg = TW_tg,
      DBAND_tg = DBAND_tg,
      DPV_tg = DPV_tg,
      DICN_tg = DICN_tg,
      GATE1_tg = GATE1_tg,
      FLOWG1_tg = FLOWG1_tg,
      GATE2_tg = GATE2_tg,
      FLOWG2_tg = FLOWG2_tg,
      GATE3_tg = GATE3_tg,
      FLOWG3_tg = FLOWG3_tg,
      GATE4_tg = GATE4_tg,
      FLOWG4_tg = FLOWG4_tg,
      GATE5_tg = GATE5_tg,
      FLOWG5_tg = FLOWG5_tg,
      FLOWP1_tg = FLOWP1_tg,
      PMECH1_tg = PMECH1_tg,
      FLOWP2_tg = FLOWP2_tg,
      PMECH2_tg = PMECH2_tg,
      FLOWP3_tg = FLOWP3_tg,
      PMECH3_tg = PMECH3_tg,
      FLOWP4_tg = FLOWP4_tg,
      PMECH4_tg = PMECH4_tg,
      FLOWP5_tg = FLOWP5_tg,
      PMECH5_tg = PMECH5_tg,
      FLOWP6_tg = FLOWP6_tg,
      PMECH6_tg = PMECH6_tg,
      FLOWP7_tg = FLOWP7_tg,
      PMECH7_tg = PMECH7_tg,
      FLOWP8_tg = FLOWP8_tg,
      PMECH8_tg = PMECH8_tg,
      FLOWP9_tg = FLOWP9_tg,
      PMECH9_tg = PMECH9_tg,
      FLOWP10_tg = FLOWP10_tg,
      PMECH10_tg = PMECH10_tg,
      M_tg = M_tg,
      TR_ex = TR_ex,
      KA_ex = KA_ex,
      TA_ex = TA_ex,
      VRMAX_ex = VRMAX_ex,
      VRMIN_ex = VRMIN_ex,
      KE_ex = KE_ex,
      TE_ex = TE_ex,
      KF_ex = KF_ex,
      TF_ex = TF_ex,
      Switch_ex = Switch_ex,
      E1_ex = E1_ex,
      SE_E1_ex = SE_E1_ex,
      E2_ex = E2_ex,
      SE_E2_ex = SE_E2_ex));

// >>> AUTOGEN PARAMS (VERBATIM FROM MODELSETS) BEGIN
  parameter Real partType = 1;
  // GENSAL Parameters
  parameter Integer IBUS = 100 "Located system bus" annotation(Dialog(tab = "General"));
  parameter String ID = "M1" "Machine Identifier" annotation(Dialog(tab = "GENSAL"));
  parameter Real P_gen = 1100 "Bus Active Power, MW" annotation(Dialog(tab = "General"));
  parameter Real Q_gen = 342.702 "Bus Reactive Power, MVAR" annotation(Dialog(tab = "General"));
  parameter Real Vt_abs = 1.03 "Bus Voltage Magnitude, p.u." annotation(Dialog(tab = "General"));
  parameter Real Vt_ang = -10.96 "Bus Voltage Angle, deg." annotation(Dialog(tab = "General"));
  parameter Real SB = 1000 "Machine Base Power, MVA" annotation(Dialog(tab = "General"));
  parameter Real fn = 50 "Nominal frequency" annotation(Dialog(tab = "General"));
  parameter Real ZSOURCE_RE = 0 "Machine source impedence" annotation(Dialog(tab = "GENSAL"));
  parameter Real Tdo_p = 7 "d-axis transient time constant" annotation(Dialog(tab = "GENSAL"));
  parameter Real Tdo_s = 0.03 "d-axis sub-transient time constant, s" annotation(Dialog(tab = "GENSAL"));
  parameter Real Tqo_s = 0.04 "d-axis sub-transient time constant, s" annotation(Dialog(tab = "GENSAL"));
  parameter Real H = 50 "Inertia constant" annotation(Dialog(tab = "GENSAL"));
  parameter Real D = 0 "Speed damping" annotation(Dialog(tab = "GENSAL"));
  parameter Real Xd = 0.2 "d-axis reactance, p.u." annotation(Dialog(tab = "GENSAL"));
  parameter Real Xq = 0.19 "q-axis reactance, p.u." annotation(Dialog(tab = "GENSAL"));
  parameter Real Xd_p = 0.06 "d-axis transient reactance, p.u." annotation(Dialog(tab = "GENSAL"));
  parameter Real Xd_s = 0.02 "d-axis sub-transient reactance, p.u." annotation(Dialog(tab = "GENSAL"));
  parameter Real Xl = 0.03 "Reactance due to the leakage flux which does not cross the air gap, p.u." annotation(Dialog(tab = "GENSAL"));
  parameter Real S1 = 0.4 "saturation function value for 1 p.u. input" annotation(Dialog(tab = "GENSAL"));
  parameter Real S12 = 0.8 "saturation function value for 1.2 p.u. input" annotation(Dialog(tab = "GENSAL"));
  //WEHGOV parameter
  parameter Real R_PERM_GATE_tg = 0.04 annotation(Dialog(tab = "WEHGOV"));
  parameter Real R_PERM_PE_tg = 0.05 annotation(Dialog(tab = "WEHGOV"));
  parameter Real TPE_tg = 1.0 annotation(Dialog(tab = "WEHGOV"));
  parameter Real KP_tg = 1.0 annotation(Dialog(tab = "WEHGOV"));
  parameter Real KI_tg = 0.1 annotation(Dialog(tab = "WEHGOV"));
  parameter Real KD_tg = 0.01 annotation(Dialog(tab = "WEHGOV"));
  parameter Real TD_tg = 0.01 annotation(Dialog(tab = "WEHGOV"));
  parameter Real TP_tg = 0.2 annotation(Dialog(tab = "WEHGOV"));
  parameter Real TDV_tg = 0.3 annotation(Dialog(tab = "WEHGOV"));
  parameter Real Tg_tg = 0.2 annotation(Dialog(tab = "WEHGOV"));
  parameter Real GTMXOP_tg = 0.01 annotation(Dialog(tab = "WEHGOV"));
  parameter Real GTMXCL_tg = -0.01 annotation(Dialog(tab = "WEHGOV"));
  parameter Real GMAX_tg = 1.0 annotation(Dialog(tab = "WEHGOV"));
  parameter Real GMIN_tg = 0.0 annotation(Dialog(tab = "WEHGOV"));
  parameter Real DTURB_tg = 0.01 annotation(Dialog(tab = "WEHGOV"));
  parameter Real TW_tg = 1.0 annotation(Dialog(tab = "WEHGOV"));
  parameter Real DBAND_tg = 0.01 annotation(Dialog(tab = "WEHGOV"));
  parameter Real DPV_tg = 0.0 annotation(Dialog(tab = "WEHGOV"));
  parameter Real DICN_tg = 0.04 annotation(Dialog(tab = "WEHGOV"));
  parameter Real GATE1_tg = 0.0 annotation(Dialog(tab = "WEHGOV"));
  parameter Real FLOWG1_tg = 0.0 annotation(Dialog(tab = "WEHGOV"));
  parameter Real GATE2_tg = 1.0 annotation(Dialog(tab = "WEHGOV"));
  parameter Real FLOWG2_tg = 1.0 annotation(Dialog(tab = "WEHGOV"));
  parameter Real GATE3_tg = 1.0 annotation(Dialog(tab = "WEHGOV"));
  parameter Real FLOWG3_tg = 1.0 annotation(Dialog(tab = "WEHGOV"));
  parameter Real GATE4_tg = 1.0 annotation(Dialog(tab = "WEHGOV"));
  parameter Real FLOWG4_tg = 1.0 annotation(Dialog(tab = "WEHGOV"));
  parameter Real GATE5_tg = 1.0 annotation(Dialog(tab = "WEHGOV"));
  parameter Real FLOWG5_tg = 1.0 annotation(Dialog(tab = "WEHGOV"));
  parameter Real FLOWP1_tg = 0.0 annotation(Dialog(tab = "WEHGOV"));
  parameter Real PMECH1_tg = 0.0 annotation(Dialog(tab = "WEHGOV"));
  parameter Real FLOWP2_tg = 0.1 annotation(Dialog(tab = "WEHGOV"));
  parameter Real PMECH2_tg = 0.1 annotation(Dialog(tab = "WEHGOV"));
  parameter Real FLOWP3_tg = 0.2 annotation(Dialog(tab = "WEHGOV"));
  parameter Real PMECH3_tg = 0.1 annotation(Dialog(tab = "WEHGOV"));
  parameter Real FLOWP4_tg = 0.3 annotation(Dialog(tab = "WEHGOV"));
  parameter Real PMECH4_tg = 0.3 annotation(Dialog(tab = "WEHGOV"));
  parameter Real FLOWP5_tg = 0.4 annotation(Dialog(tab = "WEHGOV"));
  parameter Real PMECH5_tg = 0.4 annotation(Dialog(tab = "WEHGOV"));
  parameter Real FLOWP6_tg = 0.5 annotation(Dialog(tab = "WEHGOV"));
  parameter Real PMECH6_tg = 0.5 annotation(Dialog(tab = "WEHGOV"));
  parameter Real FLOWP7_tg = 0.6 annotation(Dialog(tab = "WEHGOV"));
  parameter Real PMECH7_tg = 0.6 annotation(Dialog(tab = "WEHGOV"));
  parameter Real FLOWP8_tg = 0.7 annotation(Dialog(tab = "WEHGOV"));
  parameter Real PMECH8_tg = 0.7 annotation(Dialog(tab = "WEHGOV"));
  parameter Real FLOWP9_tg = 0.8 annotation(Dialog(tab = "WEHGOV"));
  parameter Real PMECH9_tg = 0.8 annotation(Dialog(tab = "WEHGOV"));
  parameter Real FLOWP10_tg = 1.00 annotation(Dialog(tab = "WEHGOV"));
  parameter Real PMECH10_tg = 1.00 annotation(Dialog(tab = "WEHGOV"));
  parameter Real M_tg = 0 annotation(Dialog(tab = "WEHGOV"));
  // IEEET1 Parameters
  parameter Real TR_ex = 0.025 "(sec)" annotation(Dialog(tab = "IEEET1"));
  parameter Real KA_ex = 98 annotation(Dialog(tab = "IEEET1"));
  parameter Real TA_ex = 0.2 "(sec)" annotation(Dialog(tab = "IEEET1"));
  parameter Real VRMAX_ex = 9 "or zero" annotation(Dialog(tab = "IEEET1"));
  parameter Real VRMIN_ex = -5 annotation(Dialog(tab = "IEEET1"));
  parameter Real KE_ex = 0.5 "or zero" annotation(Dialog(tab = "IEEET1"));
  parameter Real TE_ex = 0.35 "(>0) (sec)" annotation(Dialog(tab = "IEEET1"));
  parameter Real KF_ex = 0.03 annotation(Dialog(tab = "IEEET1"));
  parameter Real TF_ex = 0.4 "(>0) (sec)" annotation(Dialog(tab = "IEEET1"));
  parameter Real Switch_ex = 0 annotation(Dialog(tab = "IEEET1"));
  parameter Real E1_ex = 4 annotation(Dialog(tab = "IEEET1"));
  parameter Real SE_E1_ex = 0.4 annotation(Dialog(tab = "IEEET1"));
  parameter Real E2_ex = 5 annotation(Dialog(tab = "IEEET1"));
  parameter Real SE_E2_ex = 0.5 annotation(Dialog(tab = "IEEET1"));
// <<< AUTOGEN PARAMS (VERBATIM FROM MODELSETS) END

end GENSAL_IEEET1_WEHGOV;
