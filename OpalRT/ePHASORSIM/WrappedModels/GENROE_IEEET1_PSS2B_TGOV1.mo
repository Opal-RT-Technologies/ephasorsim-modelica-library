within OpalRT.ePHASORSIM.WrappedModels;
block GENROE_IEEET1_PSS2B_TGOV1
  extends Wrappers.FMUTemplateVRefGRef(redeclare ModelSets.TypeF.GENROE_IEEET1_PSS2B_TGOV1 modelSet(
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
      SE_E2_ex = SE_E2_ex,
      TW1_pss = TW1_pss,
      TW2_pss = TW2_pss,
      T6_pss = T6_pss,
      TW3_pss = TW3_pss,
      TW4_pss = TW4_pss,
      T7_pss = T7_pss,
      KS2_pss = KS2_pss,
      KS3_pss = KS3_pss,
      T10_pss = T10_pss,
      T11_pss = T11_pss,
      T8_pss = T8_pss,
      T9_pss = T9_pss,
      KS1_pss = KS1_pss,
      T1_pss = T1_pss,
      T2_pss = T2_pss,
      T3_pss = T3_pss,
      T4_pss = T4_pss,
      VS1MAX_pss = VS1MAX_pss,
      VS1MIN_pss = VS1MIN_pss,
      VS2MAX_pss = VS2MAX_pss,
      VS2MIN_pss = VS2MIN_pss,
      VSTMAX_pss = VSTMAX_pss,
      VSTMIN_pss = VSTMIN_pss,
      M0_pss = M0_pss,
      M1_pss = M1_pss,
      M2_pss = M2_pss,
      M3_pss = M3_pss,
      M4_pss = M4_pss,
      M5_pss = M5_pss,
      initType = initType,
      y_start = y_start,
      R_tg = R_tg,
      T1_tg = T1_tg,
      VMAX_tg = VMAX_tg,
      VMIN_tg = VMIN_tg,
      T2_tg = T2_tg,
      T3_tg = T3_tg,
      Dt_tg = Dt_tg));

// >>> AUTOGEN PARAMS (VERBATIM FROM MODELSETS) BEGIN
  parameter Real partType = 1;
  // GENROE Parameters
  parameter Integer IBUS = 100 "Located system bus";
  parameter String M_ID = "M1" "Machine Identifier";
  parameter Real P_gen = 1100 "Bus Active Power, MW";
  parameter Real Q_gen = 342.702 "Bus Reactive Power, MVAR";
  parameter Real Vt_abs = 1.03 "Bus Voltage Magnitude, p.u.";
  parameter Real Vt_ang = -10.96 "Bus Voltage Angle, deg.";
  parameter Real SB = 1000 "Machine Base Power, MVA";
  parameter Real fn = 50 "Nominal frequency";
  parameter Real ZSOURCE_RE = 0 "Machine source impedence" annotation(Dialog(tab = "GENROE"));
  parameter Real Tdo_p = 7 "d-axis transient time constant" annotation(Dialog(tab = "GENROE"));
  parameter Real Tdo_s = 0.03 "d-axis sub-transient time constant, s" annotation(Dialog(tab = "GENROE"));
  parameter Real Tqo_p = 0.7 "q-axis transient time constant, s" annotation(Dialog(tab = "GENROE"));
  parameter Real Tqo_s = 0.04 "d-axis sub-transient time constant, s" annotation(Dialog(tab = "GENROE"));
  parameter Real H = 50 "Inertia constant" annotation(Dialog(tab = "GENROE"));
  parameter Real D = 0 "Speed damping" annotation(Dialog(tab = "GENROE"));
  parameter Real Xd = 0.2 "d-axis reactance, p.u." annotation(Dialog(tab = "GENROE"));
  parameter Real Xq = 0.19 "q-axis reactance, p.u." annotation(Dialog(tab = "GENROE"));
  parameter Real Xd_p = 0.06 "d-axis transient reactance, p.u." annotation(Dialog(tab = "GENROE"));
  parameter Real Xq_p = 0.06 "q-axis transient reactance, p.u." annotation(Dialog(tab = "GENROE"));
  parameter Real Xd_s = 0.02 "d-axis sub-transient reactance, p.u." annotation(Dialog(tab = "GENROE"));
  parameter Real Xl = 0.03 "Reactance due to the leakage flux which does not cross the air gap, p.u." annotation(Dialog(tab = "GENROE"));
  parameter Real S1 = 0.4 "saturation function value for 1 p.u. input" annotation(Dialog(tab = "GENROE"));
  parameter Real S12 = 0.8 "saturation function value for 1.2 p.u. input" annotation(Dialog(tab = "GENROE"));
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
  //PSS2B parameters
  parameter Real TW1_pss = 10 ">0" annotation(Dialog(tab = "PSS2B"));
  parameter Real TW2_pss = 10 "To bypass second washout, first signal: set Tw2 = 0" annotation(Dialog(tab = "PSS2B"));
  parameter Real T6_pss = 0 "To bypass first signal transducer: set T6 = 0" annotation(Dialog(tab = "PSS2B"));
  parameter Real TW3_pss = 10 ">0" annotation(Dialog(tab = "PSS2B"));
  parameter Real TW4_pss = 0 "To bypass second washout, second signal: set Tw4 = 0" annotation(Dialog(tab = "PSS2B"));
  parameter Real T7_pss = 10 "To bypass second signal transducer: set T7 = 0" annotation(Dialog(tab = "PSS2B"));
  parameter Real KS2_pss = 1.13 annotation(Dialog(tab = "PSS2B"));
  parameter Real KS3_pss = 1 annotation(Dialog(tab = "PSS2B"));
  parameter Real T10_pss = 0.3 annotation(Dialog(tab = "PSS2B"));
  parameter Real T11_pss = 0.15 ">0" annotation(Dialog(tab = "PSS2B"));
  parameter Real T8_pss = 0.3 annotation(Dialog(tab = "PSS2B"));
  parameter Real T9_pss = 0.15 ">0" annotation(Dialog(tab = "PSS2B"));
  parameter Real KS1_pss = 20 annotation(Dialog(tab = "PSS2B"));
  parameter Real T1_pss = 0.16 "To bypass first lead-lag: set T1 = T2 = 0" annotation(Dialog(tab = "PSS2B"));
  parameter Real T2_pss = 0.02 annotation(Dialog(tab = "PSS2B"));
  parameter Real T3_pss = 0.16 "To bypass first lead-lag: set T1 = T2 = 0" annotation(Dialog(tab = "PSS2B"));
  parameter Real T4_pss = 0.02 annotation(Dialog(tab = "PSS2B"));
  parameter Real VS1MAX_pss = 0.1 annotation(Dialog(tab = "PSS2B"));
  parameter Real VS1MIN_pss = -0.1 annotation(Dialog(tab = "PSS2B"));
  parameter Real VS2MAX_pss = 0.1 annotation(Dialog(tab = "PSS2B"));
  parameter Real VS2MIN_pss = -0.1 annotation(Dialog(tab = "PSS2B"));
  parameter Real VSTMAX_pss = 0.2 annotation(Dialog(tab = "PSS2B"));
  parameter Real VSTMIN_pss = -0.066 annotation(Dialog(tab = "PSS2B"));
  parameter Real M0_pss = 1 annotation(Dialog(tab = "PSS2B", group = "ICONs"));
  parameter Real M1_pss = 0 "currently disabled" annotation(Dialog(tab = "PSS2B", group = "ICONs"));
  parameter Real M2_pss = 1 annotation(Dialog(tab = "PSS2B", group = "ICONs"));
  parameter Real M3_pss = 0 "currently disabled" annotation(Dialog(tab = "PSS2B", group = "ICONs"));
  parameter Real M4_pss = 5 ">= 0, To bypass Ramp Tracking Filter: set M = N = 0" annotation(Dialog(tab = "PSS2B", group = "ICONs"));
  parameter Real M5_pss = 1 ">= 0, M * N <= 8" annotation(Dialog(tab = "PSS2B", group = "ICONs"));
  parameter Modelica.Blocks.Types.Init initType = Modelica.Blocks.Types.Init.InitialOutput "Type of initialization (1: no init, 2: steady state, 3,4: initial output)";
  parameter Real y_start = 0 "Initial or guess value of output (= state)";
  // TGOV1 Parameters
  parameter Real R_tg = 0.05 annotation(Dialog(tab = "TGOV1 Parameters"));
  parameter Real T1_tg = 0.5 "(>0) (sec)" annotation(Dialog(tab = "TGOV1 Parameters"));
  parameter Real VMAX_tg = 3 annotation(Dialog(tab = "TGOV1 Parameters"));
  parameter Real VMIN_tg = 0 annotation(Dialog(tab = "TGOV1 Parameters"));
  parameter Real T2_tg = 2.1 annotation(Dialog(tab = "TGOV1 Parameters"));
  parameter Real T3_tg = 7 "(>0) (sec)" annotation(Dialog(tab = "TGOV1 Parameters"));
  parameter Real Dt_tg = 0 annotation(Dialog(tab = "TGOV1 Parameters"));
// <<< AUTOGEN PARAMS (VERBATIM FROM MODELSETS) END


end GENROE_IEEET1_PSS2B_TGOV1;
