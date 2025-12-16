within OpalRT.ModelSets.TypeF;
model GENSAE_IEEET1_PSS2B_HYGOV
  extends GenUnitTypeF1(redeclare Electrical.Machine.SynchronousMachine.GENSAE synchronousGenerator(
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
      Tqo_s = Tqo_s,
      H = H,
      D = D,
      Xd = Xd,
      Xq = Xq,
      Xd_p = Xd_p,
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
      SE_E2 = SE_E2_ex), redeclare Electrical.Control.Stabilizer.PSS2B stabilizer(
      TW1 = TW1_pss,
      TW2 = TW2_pss,
      T6 = T6_pss,
      TW3 = TW3_pss,
      TW4 = TW4_pss,
      T7 = T7_pss,
      KS2 = KS2_pss,
      KS3 = KS3_pss,
      T10 = T10_pss,
      T11 = T11_pss,
      T8 = T8_pss,
      T9 = T9_pss,
      KS1 = KS1_pss,
      T1 = T1_pss,
      T2 = T2_pss,
      T3 = T3_pss,
      T4 = T4_pss,
      VS1MAX = VS1MAX_pss,
      VS1MIN = VS1MIN_pss,
      VS2MAX = VS2MAX_pss,
      VS2MIN = VS2MIN_pss,
      VSTMIN = VSTMIN_pss,
      VSTMAX = VSTMAX_pss,
      M0 = M0_pss,
      M1 = M1_pss,
      M2 = M2_pss,
      M3 = M3_pss,
      M4 = M4_pss,
      M5 = M5_pss), redeclare Electrical.Control.TurbineGovernor.HYGOV turbineGovernor(
      R = R_tg,
      r = r_tg,
      Tr = Tr_tg,
      Tf = Tf_tg,
      Tg = Tg_tg,
      VELM = VELM_tg,
      GMAX = GMAX_tg,
      GMIN = GMIN_tg,
      TW = TW_tg,
      At = At_tg,
      Dturb = Dturb_tg,
      qNL = qNL_tg));

  parameter Real partType = 1;
  // GENSAE Parameters
  parameter Integer IBUS = 100 "Located system bus" annotation(Dialog(tab = "General"));
  parameter String M_ID = "M1" "Machine Identifier" annotation(Dialog(tab = "GENSAE"));
  parameter Real P_gen = 1100 "Bus Active Power, MW" annotation(Dialog(tab = "General"));
  parameter Real Q_gen = 342.702 "Bus Reactive Power, MVAR" annotation(Dialog(tab = "General"));
  parameter Real Vt_abs = 1.03 "Bus Voltage Magnitude, p.u." annotation(Dialog(tab = "General"));
  parameter Real Vt_ang = -10.96 "Bus Voltage Angle, deg." annotation(Dialog(tab = "General"));
  parameter Real SB = 1000 "Machine Base Power, MVA" annotation(Dialog(tab = "General"));
  parameter Real fn = 50 "Nominal frequency" annotation(Dialog(tab = "General"));
  parameter Real ZSOURCE_RE = 0 "Machine source impedence" annotation(Dialog(tab = "GENSAE"));
  parameter Real Tdo_p = 10 "d-axis transient time constant" annotation(Dialog(tab = "GENSAE"));
  parameter Real Tdo_s = 0.05 "d-axis sub-transient time constant, s" annotation(Dialog(tab = "GENSAE"));
  parameter Real Tqo_s = 0.01 "d-axis sub-transient time constant, s" annotation(Dialog(tab = "GENSAE"));
  parameter Real H = 50 "Inertia constant" annotation(Dialog(tab = "GENSAE"));
  parameter Real D = 0 "Speed damping" annotation(Dialog(tab = "GENSAE"));
  parameter Real Xd = 0.2 "d-axis reactance, p.u." annotation(Dialog(tab = "GENSAE"));
  parameter Real Xq = 0.19 "q-axis reactance, p.u." annotation(Dialog(tab = "GENSAE"));
  parameter Real Xd_p = 0.06 "d-axis transient reactance, p.u." annotation(Dialog(tab = "GENSAE"));
  parameter Real Xd_s = 0.02 "d-axis sub-transient reactance, p.u." annotation(Dialog(tab = "GENSAE"));
  parameter Real Xl = 0.03 "Reactance due to the leakage flux which does not cross the air gap, p.u." annotation(Dialog(tab = "GENSAE"));
  parameter Real S1 = 0.4 "saturation function value for 1 p.u. input" annotation(Dialog(tab = "GENSAE"));
  parameter Real S12 = 0.8 "saturation function value for 1.2 p.u. input" annotation(Dialog(tab = "GENSAE"));
  // IEEET1 Parameters
  parameter Real TR_ex = 0.025 "(sec)" annotation(Dialog(tab = "IEEET1"));
  parameter Real KA_ex = 98 annotation(Dialog(tab = "IEEET1"));
  parameter Real TA_ex = 0.2 "(sec)" annotation(Dialog(tab = "IEEET1"));
  parameter Real VRMAX_ex = 9 "or zero" annotation(Dialog(tab = "IEEET1"));
  parameter Real VRMIN_ex = -5 "or zero" annotation(Dialog(tab = "IEEET1"));
  parameter Real KE_ex = 0.5 "or zero" annotation(Dialog(tab = "IEEET1"));
  parameter Real TE_ex = 0.35 "(>0) (sec)" annotation(Dialog(tab = "IEEET1"));
  parameter Real KF_ex = 0.03 "(>0) (sec)" annotation(Dialog(tab = "IEEET1"));
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
  parameter Real M0_pss = 1 annotation(Dialog(tab = "ICONs"));
  parameter Real M1_pss = 0 "currently disabled" annotation(Dialog(tab = "ICONs"));
  parameter Real M2_pss = 1 annotation(Dialog(tab = "ICONs"));
  parameter Real M3_pss = 0 "currently disabled" annotation(Dialog(tab = "ICONs"));
  parameter Real M4_pss = 5 ">= 0, To bypass Ramp Tracking Filter: set M = N = 0" annotation(Dialog(tab = "ICONs"));
  parameter Real M5_pss = 1 ">= 0, M * N <= 8" annotation(Dialog(tab = "ICONs"));
  parameter Modelica.Blocks.Types.Init initType = Modelica.Blocks.Types.Init.InitialOutput "Type of initialization (1: no init, 2: steady state, 3,4: initial output)" annotation(Dialog(tab = "PSS2B"));
  parameter Real y_start = 0 "Initial or guess value of output (= state)" annotation(Dialog(tab = "PSS2B"));
  // HYGOV parameters
  parameter Real R_tg = 0.06 "Permanent Droop" annotation(Dialog(tab = "HYGOV"));
  parameter Real r_tg = 0.4 "Temporary Droop" annotation(Dialog(tab = "HYGOV"));
  parameter Real Tr_tg = 8 "(>0) Governor time constant" annotation(Dialog(tab = "HYGOV"));
  parameter Real Tf_tg = 0.05 "(>0) Filter time constant" annotation(Dialog(tab = "HYGOV"));
  parameter Real Tg_tg = 0.2 "(>0) Servo time constant" annotation(Dialog(tab = "HYGOV"));
  parameter Real VELM_tg = 0.01 "Gate velocity limit" annotation(Dialog(tab = "HYGOV"));
  parameter Real GMAX_tg = 0.601 "Maximum gate limit" annotation(Dialog(tab = "HYGOV"));
  parameter Real GMIN_tg = 0 "Minimum gate limit" annotation(Dialog(tab = "HYGOV"));
  parameter Real TW_tg = 1.2 "(>0) Water time constant" annotation(Dialog(tab = "HYGOV"));
  parameter Real At_tg = 2.5 "Trubine gain" annotation(Dialog(tab = "HYGOV"));
  parameter Real Dturb_tg = 0 "Turbine damping" annotation(Dialog(tab = "HYGOV"));
  parameter Real qNL_tg = 0.5 "No power flow" annotation(Dialog(tab = "HYGOV"));

end GENSAE_IEEET1_PSS2B_HYGOV;
