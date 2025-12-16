within OpalRT.ModelSets.TypeF;
model GENSAL_ESST1A_PSS2A_WEHGOV
  extends GenUnitTypeF1(redeclare Electrical.Machine.SynchronousMachine.GENSAL synchronousGenerator(
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
      S12 = S12), redeclare Electrical.Control.Excitation.ESST1A exciter(
      UEL = UEL_ex,
      VOS = VOS_ex,
      TR = TR_ex,
      VIMAX = VIMAX_ex,
      VIMIN = VIMIN_ex,
      TC = TC_ex,
      TB = TB_ex,
      TC1 = TC1_ex,
      TB1 = TB1_ex,
      KA = KA_ex,
      TA = TA_ex,
      VAMAX = VAMAX_ex,
      VAMIN = VAMIN_ex,
      VRMAX = VRMAX_ex,
      VRMIN = VRMIN_ex,
      KC = KC_ex,
      KF = KF_ex,
      TF = TF_ex,
      KLR = KLR_ex,
      ILR = ILR_ex), redeclare Electrical.Control.Stabilizer.PSS2A stabilizer(
      M2 = M2_pss,
      TW1 = TW1_pss,
      TW2 = TW2_pss,
      T6 = T6_pss,
      TW3 = TW3_pss,
      TW4 = TW4_pss,
      T7 = T7_pss,
      KS2 = KS2_pss,
      KS3 = KS3_pss,
      T8 = T8_pss,
      T9 = T9_pss,
      KS1 = KS1_pss,
      T1 = T1_pss,
      T2 = T2_pss,
      T3 = T3_pss,
      T4 = T4_pss,
      VSTMAX = VSTMAX_pss,
      VSTMIN = VSTMIN_pss,
      M0 = M0_pss,
      M1 = M1_pss,
      M3 = M3_pss,
      M4 = M4_pss,
      M5 = M5_pss,
      initType = Modelica.Blocks.Types.Init.InitialOutput,
      ID = ID), redeclare Electrical.Control.TurbineGovernor.WEHGOV turbineGovernor(
      R_PERM_GATE = R_PERM_GATE_tg,
      R_PERM_PE = R_PERM_PE_tg,
      TPE = TPE_tg,
      KP = KP_tg,
      KI = KI_tg,
      KD = KD_tg,
      TD = TD_tg,
      TP = TP_tg,
      TDV = TDV_tg,
      Tg = Tg_tg,
      GTMXOP = GTMXOP_tg,
      GTMXCL = GTMXCL_tg,
      GMAX = GMAX_tg,
      GMIN = GMIN_tg,
      DTURB = DTURB_tg,
      TW = TW_tg,
      DBAND = DBAND_tg,
      DPV = DPV_tg,
      DICN = DICN_tg,
      GATE1 = GATE1_tg,
      FLOWG1 = FLOWG1_tg,
      GATE2 = GATE2_tg,
      FLOWG2 = FLOWG2_tg,
      GATE3 = GATE3_tg,
      FLOWG3 = FLOWG3_tg,
      GATE4 = GATE4_tg,
      FLOWG4 = FLOWG4_tg,
      GATE5 = GATE5_tg,
      FLOWG5 = FLOWG5_tg,
      FLOWP1 = FLOWP1_tg,
      PMECH1 = PMECH1_tg,
      FLOWP2 = FLOWP2_tg,
      PMECH2 = PMECH2_tg,
      FLOWP3 = FLOWP3_tg,
      PMECH3 = PMECH3_tg,
      FLOWP4 = FLOWP4_tg,
      PMECH4 = PMECH4_tg,
      FLOWP5 = FLOWP5_tg,
      PMECH5 = PMECH5_tg,
      FLOWP6 = FLOWP6_tg,
      PMECH6 = PMECH6_tg,
      FLOWP7 = FLOWP7_tg,
      PMECH7 = PMECH7_tg,
      FLOWP8 = FLOWP8_tg,
      PMECH8 = PMECH8_tg,
      FLOWP9 = FLOWP9_tg,
      PMECH9 = PMECH9_tg,
      FLOWP10 = FLOWP10_tg,
      PMECH10 = PMECH10_tg,
      M = M_tg), constVUEL(k = noVUEL), constVOEL(k = noVOEL));

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
  // ESST1A parameters
  parameter Real TR_ex = 0.02 "(sec)" annotation(Dialog(tab = "ESST1A"));
  parameter Real VIMAX_ex = 10 annotation(Dialog(tab = "ESST1A"));
  parameter Real VIMIN_ex = -10 annotation(Dialog(tab = "ESST1A"));
  parameter Real TC_ex = 1 "(sec)" annotation(Dialog(tab = "ESST1A"));
  parameter Real TB_ex = 1 "(sec)" annotation(Dialog(tab = "ESST1A"));
  parameter Real TC1_ex = 0 "(sec)" annotation(Dialog(tab = "ESST1A"));
  parameter Real TB1_ex = 0 "(sec)" annotation(Dialog(tab = "ESST1A"));
  parameter Real KA_ex = 210 annotation(Dialog(tab = "ESST1A"));
  parameter Real TA_ex = 0 "(sec)" annotation(Dialog(tab = "ESST1A"));
  parameter Real VAMAX_ex = 10 annotation(Dialog(tab = "ESST1A"));
  parameter Real VAMIN_ex = -10 annotation(Dialog(tab = "ESST1A"));
  parameter Real VRMAX_ex = 6.43 annotation(Dialog(tab = "ESST1A"));
  parameter Real VRMIN_ex = -6 annotation(Dialog(tab = "ESST1A"));
  parameter Real KC_ex = 0.038 annotation(Dialog(tab = "ESST1A"));
  parameter Real KF_ex = 0 annotation(Dialog(tab = "ESST1A"));
  parameter Real TF_ex = 0 "> 0 (sec)" annotation(Dialog(tab = "ESST1A"));
  parameter Real KLR_ex = 4.54 annotation(Dialog(tab = "ESST1A"));
  parameter Real ILR_ex = 4.4 annotation(Dialog(tab = "ESST1A"));
  // ICONS
  parameter Real UEL_ex = 1 "1,2 or 3" annotation(Dialog(tab = "ESST1A"));
  parameter Real VOS_ex = 1 "1 or 2" annotation(Dialog(tab = "ESST1A"));
  // PSS2A Parameters
  parameter Real TW1_pss = 0.1 ">0" annotation(Dialog(tab = "PSS2A"));
  parameter Real TW2_pss = 1 "To bypass second washout, first signal: set Tw2 = 0" annotation(Dialog(tab = "PSS2A"));
  parameter Real T6_pss = 1 "To bypass first signal transducer: set T6 = 0" annotation(Dialog(tab = "PSS2A"));
  parameter Real TW3_pss = 1.5 ">0" annotation(Dialog(tab = "PSS2A"));
  parameter Real TW4_pss = 0.2 "To bypass second washout, second signal: set Tw4 = 0" annotation(Dialog(tab = "PSS2A"));
  parameter Real T7_pss = 0.2 "To bypass second signal transducer: set T7 = 0" annotation(Dialog(tab = "PSS2A"));
  parameter Real KS2_pss = 0.1 "T7/(2*H)" annotation(Dialog(tab = "PSS2A"));
  //T7/(2*H);
  parameter Real KS3_pss = 0.1 annotation(Dialog(tab = "PSS2A"));
  parameter Real T8_pss = 0.05 annotation(Dialog(tab = "PSS2A"));
  parameter Real T9_pss = 0.01 ">0" annotation(Dialog(tab = "PSS2A"));
  parameter Real KS1_pss = 0.15 annotation(Dialog(tab = "PSS2A"));
  parameter Real T1_pss = 0.1 "To bypass first lead-lag: set T1 = T2 = 0" annotation(Dialog(tab = "PSS2A"));
  parameter Real T2_pss = 0.1 annotation(Dialog(tab = "PSS2A"));
  parameter Real T3_pss = 0.01 "To bypass first lead-lag: set T1 = T2 = 0" annotation(Dialog(tab = "PSS2A"));
  parameter Real T4_pss = 1 annotation(Dialog(tab = "PSS2A"));
  parameter Real VSTMAX_pss = 1 annotation(Dialog(tab = "PSS2A"));
  parameter Real VSTMIN_pss = -1 annotation(Dialog(tab = "PSS2A"));
  // PSS2A ICONs
  parameter Real M0_pss = 2 "ICS1, first stabilizer input code" annotation(Dialog(tab = "PSS2A", group = "ICONs"));
  parameter Real M1_pss = 2 "REMBUS1, first remote bus number" annotation(Dialog(tab = "PSS2A", group = "ICONs"));
  parameter Real M2_pss = 2 "ICS2, second stabilizer input code" annotation(Dialog(tab = "PSS2A", group = "ICONs"));
  parameter Real M3_pss = 2 "REMBUS2, second remote bus number" annotation(Dialog(tab = "PSS2A", group = "ICONs"));
  parameter Real M4_pss = 1 "M, ramp tracking filter" annotation(Dialog(tab = "PSS2A", group = "ICONs"));
  parameter Real M5_pss = 2 "N, ramp tracking filter" annotation(Dialog(tab = "PSS2A", group = "ICONs"));
  //WEHGOV parameters
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
  parameter Real noVOEL(fixed = false, start = 1) "Constant output value";
  parameter Real noVUEL(fixed = false, start = 1);

initial equation
  noVOEL = Modelica.Constants.inf;
  noVUEL = if UEL_ex <> 1 then -Modelica.Constants.inf else 0;

end GENSAL_ESST1A_PSS2A_WEHGOV;
