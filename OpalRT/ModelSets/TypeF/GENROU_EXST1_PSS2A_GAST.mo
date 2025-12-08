within OpalRT.ModelSets.TypeF;
model GENROU_EXST1_PSS2A_GAST
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
      S12 = S12), redeclare Electrical.Control.Excitation.EXST1 exciter(
      ID = EX_ID,
      TR = TR_ex,
      VIMIN = VIMIN_ex,
      VIMAX = VIMAX_ex,
      TC = TC_ex,
      TB = TB_ex,
      KA = KA_ex,
      TA = TA_ex,
      VRMAX = VRMAX_ex,
      VRMIN = VRMIN_ex,
      KC = KC_ex,
      KF = KF_ex,
      TF = TF_ex), redeclare Electrical.Control.Stabilizer.PSS2A stabilizer(
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
      ID = M_ID), redeclare Electrical.Control.TurbineGovernor.GAST turbineGovernor(
      R = R_tg,
      T1 = T1_tg,
      T2 = T2_tg,
      T3 = T3_tg,
      AT = AT_tg,
      KT = KT_tg,
      VMAX = VMAX_tg,
      VMIN = VMIN_tg,
      DTURB = DTURB_tg,
      IBUS = IBUS,
      ID = M_ID));

  parameter Real partType = 1;
  // GENROU Parameters
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
  // EXST1 Parameters
  parameter String EX_ID = "M1" "Machine Identifier" annotation(Dialog(tab = "EXST1 Parameters"));
  parameter Real TR_ex = 0.02 annotation(Dialog(tab = "EXST1 Parameters"));
  parameter Real VIMAX_ex = 0.2 annotation(Dialog(tab = "EXST1 Parameters"));
  parameter Real VIMIN_ex = 0 annotation(Dialog(tab = "EXST1 Parameters"));
  parameter Real TC_ex = 1 annotation(Dialog(tab = "EXST1 Parameters"));
  parameter Real TB_ex = 1 annotation(Dialog(tab = "EXST1 Parameters"));
  parameter Real KA_ex = 500 annotation(Dialog(tab = "EXST1 Parameters"));
  parameter Real TA_ex = 0.05 annotation(Dialog(tab = "EXST1 Parameters"));
  parameter Real VRMAX_ex = 8 annotation(Dialog(tab = "EXST1 Parameters"));
  parameter Real VRMIN_ex = -3 annotation(Dialog(tab = "EXST1 Parameters"));
  parameter Real KC_ex = 0.2 annotation(Dialog(tab = "EXST1 Parameters"));
  parameter Real KF_ex = 0.1 annotation(Dialog(tab = "EXST1 Parameters"));
  parameter Real TF_ex = 1 annotation(Dialog(tab = "EXST1 Parameters"));
  // GAST Parameters
  parameter Real R_tg = 0.01 "Speed droop" annotation(Dialog(tab = "GAST Parameters"));
  parameter Real T1_tg = 0.01 "(>0) (sec)" annotation(Dialog(tab = "GAST Parameters"));
  parameter Real T2_tg = 0.01 "(>0) (sec)" annotation(Dialog(tab = "GAST Parameters"));
  parameter Real T3_tg = 0.3 "(>0) (sec)" annotation(Dialog(tab = "GAST Parameters"));
  parameter Real AT_tg = 0.12 "Ambient temperature load limit" annotation(Dialog(tab = "GAST Parameters"));
  parameter Real KT_tg = 0.2 annotation(Dialog(tab = "GAST Parameters"));
  parameter Real VMAX_tg = 0.12 annotation(Dialog(tab = "GAST Parameters"));
  parameter Real VMIN_tg = 0.01 annotation(Dialog(tab = "GAST Parameters"));
  parameter Real DTURB_tg = 0.01 annotation(Dialog(tab = "GAST Parameters"));
  // PSS2A Parameters
  parameter Real TW1_pss = 0.1 ">0" annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real TW2_pss = 1 "To bypass second washout, first signal: set Tw2 = 0" annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real T6_pss = 1 "To bypass first signal transducer: set T6 = 0" annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real TW3_pss = 1.5 ">0" annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real TW4_pss = 0.2 "To bypass second washout, second signal: set Tw4 = 0" annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real T7_pss = 0.2 "To bypass second signal transducer: set T7 = 0" annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real KS2_pss = 0.1 "T7/(2*H)" annotation(Dialog(tab = "PSS2A Parameters"));
  //T7/(2*H);
  parameter Real KS3_pss = 0.1 annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real T8_pss = 0.05 annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real T9_pss = 0.01 ">0" annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real KS1_pss = 0.15 annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real T1_pss = 0.1 "To bypass first lead-lag: set T1 = T2 = 0" annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real T2_pss = 0.1 annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real T3_pss = 0.01 "To bypass first lead-lag: set T1 = T2 = 0" annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real T4_pss = 1 annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real VSTMAX_pss = 1 annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real VSTMIN_pss = -1 annotation(Dialog(tab = "PSS2A Parameters"));
  // PSS2A ICONs
  parameter Real M0_pss = 2 "ICS1, first stabilizer input code" annotation(Dialog(tab = "PSS2A Parameters", group = "ICONs"));
  parameter Real M1_pss = 2 "REMBUS1, first remote bus number" annotation(Dialog(tab = "PSS2A Parameters", group = "ICONs"));
  parameter Real M2_pss = 2 "ICS2, second stabilizer input code" annotation(Dialog(tab = "PSS2A Parameters", group = "ICONs"));
  parameter Real M3_pss = 2 "REMBUS2, second remote bus number" annotation(Dialog(tab = "PSS2A Parameters", group = "ICONs"));
  parameter Real M4_pss = 1 "M, ramp tracking filter" annotation(Dialog(tab = "PSS2A Parameters", group = "ICONs"));
  parameter Real M5_pss = 2 "N, ramp tracking filter" annotation(Dialog(tab = "PSS2A Parameters", group = "ICONs"));

end GENROU_EXST1_PSS2A_GAST;
