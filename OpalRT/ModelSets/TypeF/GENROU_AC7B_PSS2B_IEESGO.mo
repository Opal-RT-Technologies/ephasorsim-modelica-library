within OpalRT.ModelSets.TypeF;
model GENROU_AC7B_PSS2B_IEESGO
  extends GenUnitTypeF1(redeclare Electrical.Machine.SynchronousMachine.GENROU synchronousGenerator(
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
      S12 = S12), redeclare Electrical.Control.Excitation.AC7B exciter(
      TR = TR_ex,
      KPR = KPR_ex,
      KIR = KIR_ex,
      KDR = KDR_ex,
      TDR = TDR_ex,
      VRMAX = VRMAX_ex,
      VRMIN = VRMIN_ex,
      KPA = KPA_ex,
      KIA = KIA_ex,
      VAMAX = VAMAX_ex,
      VAMIN = VAMIN_ex,
      KP = KP_ex,
      KL = KL_ex,
      KF1 = KF1_ex,
      KF2 = KF2_ex,
      KF3 = KF3_ex,
      TF3 = TF3_ex,
      KC = KC_ex,
      KD = KD_ex,
      KE = KE_ex,
      TE = TE_ex,
      VFEMAX = VFEMAX_ex,
      VEMIN = VEMIN_ex,
      E1 = E1_ex,
      S_E1 = S_E1_ex,
      E2 = E2_ex,
      S_E2 = S_E2_ex), redeclare Electrical.Control.Stabilizer.PSS2B stabilizer(
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
      ID = M_ID,
      T10 = T10_pss,
      T11 = T11_pss,
      VS1MAX = VS1MAX_pss,
      VS1MIN = VS1MIN_pss,
      VS2MAX = VS2MAX_pss,
      VS2MIN = VS2MIN_pss), redeclare Electrical.Control.TurbineGovernor.IEESGO turbineGovernor(
      T1 = T1_tg,
      T2 = T2_tg,
      T3 = T3_tg,
      T4 = T4_tg,
      T5 = T5_tg,
      T6 = T6_tg,
      K1 = K1_tg,
      K2 = K2_tg,
      K3 = K3_tg,
      PMAX = PMAX_tg,
      PMIN = PMIN_tg));

  parameter Real partType = 1;
  // GENROU parameters
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
  // PSS2B Parameters
  parameter Real TW1_pss = 2 ">0" annotation(Dialog(tab = "PSS2B Parameters"));
  parameter Real TW2_pss = 2 "To bypass second washout, first signal: set Tw2 = 0" annotation(Dialog(tab = "PSS2B Parameters"));
  parameter Real T6_pss = 0.05 "To bypass first signal transducer: set T6 = 0" annotation(Dialog(tab = "PSS2B Parameters"));
  parameter Real TW3_pss = 2 ">0" annotation(Dialog(tab = "PSS2B Parameters"));
  parameter Real TW4_pss = 1.5 "To bypass second washout, second signal: set Tw4 = 0" annotation(Dialog(tab = "PSS2B Parameters"));
  parameter Real T7_pss = 2 "To bypass second signal transducer: set T7 = 0" annotation(Dialog(tab = "PSS2B Parameters"));
  parameter Real KS2_pss = 0.259 "T7/(2*H)" annotation(Dialog(tab = "PSS2B Parameters"));
  parameter Real KS3_pss = 1 annotation(Dialog(tab = "PSS2B Parameters"));
  parameter Real T8_pss = 0.5 annotation(Dialog(tab = "PSS2B Parameters"));
  parameter Real T9_pss = 0.1 ">0" annotation(Dialog(tab = "PSS2B Parameters"));
  parameter Real KS1_pss = 15 annotation(Dialog(tab = "PSS2B Parameters"));
  parameter Real T1_pss = 0.15 "To bypass first lead-lag: set T1 = T2 = 0" annotation(Dialog(tab = "PSS2B Parameters"));
  parameter Real T2_pss = 0.05 annotation(Dialog(tab = "PSS2B Parameters"));
  parameter Real T3_pss = 0.15 "To bypass first lead-lag: set T1 = T2 = 0" annotation(Dialog(tab = "PSS2B Parameters"));
  parameter Real T4_pss = 0.05 annotation(Dialog(tab = "PSS2B Parameters"));
  parameter Real VSTMAX_pss = 0.1 annotation(Dialog(tab = "PSS2B Parameters"));
  parameter Real VSTMIN_pss = -0.1 annotation(Dialog(tab = "PSS2B Parameters"));
  parameter Real VS1MAX_pss = 0.1 annotation(Dialog(tab = "PSS2B Parameters"));
  parameter Real VS1MIN_pss = -0.1 annotation(Dialog(tab = "PSS2B Parameters"));
  parameter Real VS2MAX_pss = 0.1 annotation(Dialog(tab = "PSS2B Parameters"));
  parameter Real VS2MIN_pss = -0.1 annotation(Dialog(tab = "PSS2B Parameters"));
  parameter Real T10_pss = 0.3 annotation(Dialog(tab = "PSS2B Parameters"));
  parameter Real T11_pss = 0.15 ">0" annotation(Dialog(tab = "PSS2B Parameters"));
  /// PSS2B ICONs
  parameter Real M0_pss = 1 "ICS1, first stabilizer input code" annotation(Dialog(tab = "PSS2B Parameters", group = "ICONs"));
  parameter Real M1_pss = 0 "REMBUS1, first remote bus number" annotation(Dialog(tab = "PSS2B Parameters", group = "ICONs"));
  parameter Real M2_pss = 3 "ICS2, second stabilizer input code" annotation(Dialog(tab = "PSS2B Parameters", group = "ICONs"));
  parameter Real M3_pss = 0 "REMBUS2, second remote bus number" annotation(Dialog(tab = "PSS2B Parameters", group = "ICONs"));
  parameter Real M4_pss = 5 "M, ramp tracking filter" annotation(Dialog(tab = "PSS2B Parameters", group = "ICONs"));
  parameter Real M5_pss = 1 "N, ramp tracking filter" annotation(Dialog(tab = "PSS2B Parameters", group = "ICONs"));
  // IEESGO Parameters
  parameter Real T1_tg = 1 "Controller Lag" annotation(Dialog(tab = "IEESGO Parameters"));
  parameter Real T2_tg = 1 "Controller Lead Compensation" annotation(Dialog(tab = "IEESGO Parameters"));
  parameter Real T3_tg = 1 "Governor Lag (> 0)" annotation(Dialog(tab = "IEESGO Parameters"));
  parameter Real T4_tg = 1 "Delay Due To Steam Inlet Volumes" annotation(Dialog(tab = "IEESGO Parameters"));
  parameter Real T5_tg = 1 "Reheater Delay" annotation(Dialog(tab = "IEESGO Parameters"));
  parameter Real T6_tg = 1 "Turbine pipe hood Delay" annotation(Dialog(tab = "IEESGO Parameters"));
  parameter Real K1_tg = 0.5 "1/Per Unit Regulation" annotation(Dialog(tab = "IEESGO Parameters"));
  parameter Real K2_tg = 0.5 "Fraction" annotation(Dialog(tab = "IEESGO Parameters"));
  parameter Real K3_tg = 0.5 "fraction" annotation(Dialog(tab = "IEESGO Parameters"));
  parameter Real PMAX_tg = 1 "Upper Power Limit" annotation(Dialog(tab = "IEESGO Parameters"));
  parameter Real PMIN_tg = -1 "Lower Power Limit" annotation(Dialog(tab = "IEESGO Parameters"));

end GENROU_AC7B_PSS2B_IEESGO;
