within OpalRT.ePHASORSIM.WrappedModels;
block GENROU_SCRX_PSS2A_GAST_UEL2
  extends Wrappers.FMUTemplateVRefGRef(redeclare ModelSets.TypeL.GENROU_SCRX_PSS2A_GAST_UEL2 modelSet(
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
      TA_TB_ex = TA_TB_ex,
      TB_ex = TB_ex,
      K_ex = K_ex,
      TE_ex = TE_ex,
      EMIN_ex = EMIN_ex,
      EMAX_ex = EMAX_ex,
      CSWITCH_ex = CSWITCH_ex,
      rc_rfd_ex = rc_rfd_ex,
      R_tg = R_tg,
      T1_tg = T1_tg,
      T2_tg = T2_tg,
      T3_tg = T3_tg,
      AT_tg = AT_tg,
      KT_tg = KT_tg,
      VMAX_tg = VMAX_tg,
      VMIN_tg = VMIN_tg,
      DTURB_tg = DTURB_tg,
      TW1_pss = TW1_pss,
      TW2_pss = TW2_pss,
      T6_pss = T6_pss,
      TW3_pss = TW3_pss,
      TW4_pss = TW4_pss,
      T7_pss = T7_pss,
      KS2_pss = KS2_pss,
      KS3_pss = KS3_pss,
      T8_pss = T8_pss,
      T9_pss = T9_pss,
      KS1_pss = KS1_pss,
      T1_pss = T1_pss,
      T2_pss = T2_pss,
      T3_pss = T3_pss,
      T4_pss = T4_pss,
      VSTMAX_pss = VSTMAX_pss,
      VSTMIN_pss = VSTMIN_pss,
      M0_pss = M0_pss,
      M1_pss = M1_pss,
      M2_pss = M2_pss,
      M3_pss = M3_pss,
      M4_pss = M4_pss,
      M5_pss = M5_pss,
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
  // GENROU Parameters
  parameter Integer IBUS = 100 "Located system bus" annotation(Dialog(tab = "General"));
  parameter String M_ID = "M1" "Machine Identifier" annotation(Dialog(tab = "GENROU Parameters"));
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
  // SCRX Parameters
  parameter Real TA_TB_ex = 4 "TA/TB" annotation(Dialog(tab = "SCRX Parameters"));
  parameter Real TB_ex = 1 "(>0) (sec)" annotation(Dialog(tab = "SCRX Parameters"));
  parameter Real K_ex = 100 annotation(Dialog(tab = "SCRX Parameters"));
  parameter Real TE_ex = 0.5 "(sec)" annotation(Dialog(tab = "SCRX Parameters"));
  parameter Real EMIN_ex = -1.2 "(pu on EFD base)" annotation(Dialog(tab = "SCRX Parameters"));
  parameter Real EMAX_ex = 2 "(pu on EFD base)" annotation(Dialog(tab = "SCRX Parameters"));
  parameter Real CSWITCH_ex = 1 "0 for bus fed, 1 for solid fed" annotation(Dialog(tab = "SCRX Parameters"));
  parameter Real rc_rfd_ex = 3 "rc/rfd, 0 with negative field current capability (EX=EFD)" annotation(Dialog(tab = "SCRX Parameters"));
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
  parameter Real TW1_pss = 10 ">0" annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real TW2_pss = 10 "To bypass second washout, first signal: set Tw2 = 0" annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real T6_pss = 0 "To bypass first signal transducer: set T6 = 0" annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real TW3_pss = 10 ">0" annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real TW4_pss = 0 "To bypass second washout, second signal: set Tw4 = 0" annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real T7_pss = 10 "To bypass second signal transducer: set T7 = 0" annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real KS2_pss = 1.13 "T7/(2*H)" annotation(Dialog(tab = "PSS2A Parameters"));
  //T7/(2*H);
  parameter Real KS3_pss = 1 annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real T8_pss = 0.3 annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real T9_pss = 0.15 ">0" annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real KS1_pss = 20 annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real T1_pss = 0.16 "To bypass first lead-lag: set T1 = T2 = 0" annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real T2_pss = 0.02 annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real T3_pss = 0.16 "To bypass first lead-lag: set T1 = T2 = 0" annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real T4_pss = 0.02 annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real VSTMAX_pss = 0.2 annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real VSTMIN_pss = -0.066 annotation(Dialog(tab = "PSS2A Parameters"));
  // PSS2A ICONs
  parameter Real M0_pss = 1 "ICS1, first stabilizer input code" annotation(Dialog(tab = "PSS2A Parameters", group = "ICONs"));
  parameter Real M1_pss = 0 "REMBUS1, first remote bus number" annotation(Dialog(tab = "PSS2A Parameters", group = "ICONs"));
  parameter Real M2_pss = 0 "ICS2, second stabilizer input code" annotation(Dialog(tab = "PSS2A Parameters", group = "ICONs"));
  parameter Real M3_pss = 0 "REMBUS2, second remote bus number" annotation(Dialog(tab = "PSS2A Parameters", group = "ICONs"));
  parameter Real M4_pss = 4 "M, ramp tracking filter" annotation(Dialog(tab = "PSS2A Parameters", group = "ICONs"));
  parameter Real M5_pss = 2 "N, ramp tracking filter" annotation(Dialog(tab = "PSS2A Parameters", group = "ICONs"));
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
// <<< AUTOGEN PARAMS (VERBATIM FROM MODELSETS) END

end GENROU_SCRX_PSS2A_GAST_UEL2;
