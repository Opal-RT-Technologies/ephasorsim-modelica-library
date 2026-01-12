within OpalRT.ePHASORSIM.WrappedModels;
block GENROU_ESAC3A_PSS2B_WSIEG1
  extends Wrappers.FMUTemplateVRefGRef(redeclare ModelSets.TypeF.GENROU_ESAC3A_PSS2B_WSIEG1 modelSet(
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
      VAMAX_ex = VAMAX_ex,
      VAMIN_ex = VAMIN_ex,
      TE_ex = TE_ex,
      VEMIN_ex = VEMIN_ex,
      KR_ex = KR_ex,
      KF_ex = KF_ex,
      TF_ex = TF_ex,
      KN_ex = KN_ex,
      EFDN_ex = EFDN_ex,
      KC_ex = KC_ex,
      KD_ex = KD_ex,
      KE_ex = KE_ex,
      VFEMAX_ex = VFEMAX_ex,
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
      T8_pss = T8_pss,
      T9_pss = T9_pss,
      KS1_pss = KS1_pss,
      T1_pss = T1_pss,
      T2_pss = T2_pss,
      T3_pss = T3_pss,
      T4_pss = T4_pss,
      VSTMAX_pss = VSTMAX_pss,
      VSTMIN_pss = VSTMIN_pss,
      VS1MAX_pss = VS1MAX_pss,
      VS1MIN_pss = VS1MIN_pss,
      VS2MAX_pss = VS2MAX_pss,
      VS2MIN_pss = VS2MIN_pss,
      T10_pss = T10_pss,
      T11_pss = T11_pss,
      M0_pss = M0_pss,
      M1_pss = M1_pss,
      M2_pss = M2_pss,
      M3_pss = M3_pss,
      M4_pss = M4_pss,
      M5_pss = M5_pss,
      K_tg = K_tg,
      T1_tg = T1_tg,
      T2_tg = T2_tg,
      T3_tg = T3_tg,
      Uo_tg = Uo_tg,
      Uc_tg = Uc_tg,
      PMAX_tg = PMAX_tg,
      PMIN_tg = PMIN_tg,
      T4_tg = T4_tg,
      K1_tg = K1_tg,
      K2_tg = K2_tg,
      T5_tg = T5_tg,
      K3_tg = K3_tg,
      K4_tg = K4_tg,
      T6_tg = T6_tg,
      K5_tg = K5_tg,
      K6_tg = K6_tg,
      T7_tg = T7_tg,
      K7_tg = K7_tg,
      K8_tg = K8_tg,
      db1_tg = db1_tg,
      err_tg = err_tg,
      db2_tg = db2_tg,
      GV1_tg = GV1_tg,
      PGV1_tg = PGV1_tg,
      GV2_tg = GV2_tg,
      PGV2_tg = PGV2_tg,
      GV3_tg = GV3_tg,
      PGV3_tg = PGV3_tg,
      GV4_tg = GV4_tg,
      PGV4_tg = PGV4_tg,
      GV5_tg = GV5_tg,
      PGV5_tg = PGV5_tg,
      IBLOCK_tg = IBLOCK_tg,
      JBUS = JBUS,
      M = M));

// >>> AUTOGEN PARAMS (VERBATIM FROM MODELSETS) BEGIN
  parameter Real partType = 1;
  // GENROU Parameters
  parameter Integer IBUS = 100 "Located system bus" annotation(Dialog(tab = "General"));
  parameter String M_ID = "M1" "Machine Identifier" annotation(Dialog(tab = "GENROU"));
  parameter Real P_gen = 1100 "Bus Active Power, MW" annotation(Dialog(tab = "General"));
  parameter Real Q_gen = 342.702 "Bus Reactive Power, MVAR" annotation(Dialog(tab = "General"));
  parameter Real Vt_abs = 1.03 "Bus Voltage Magnitude, p.u." annotation(Dialog(tab = "General"));
  parameter Real Vt_ang = -10.96 "Bus Voltage Angle, deg." annotation(Dialog(tab = "General"));
  parameter Real SB = 1000 "Machine Base Power, MVA" annotation(Dialog(tab = "General"));
  parameter Real fn = 50 "Nominal frequency" annotation(Dialog(tab = "General"));
  parameter Real ZSOURCE_RE = 0 "Machine source impedence" annotation(Dialog(tab = "GENROU"));
  parameter Real Tdo_p = 7 "d-axis transient time constant" annotation(Dialog(tab = "GENROU"));
  parameter Real Tdo_s = 0.03 "d-axis sub-transient time constant, s" annotation(Dialog(tab = "GENROU"));
  parameter Real Tqo_p = 0.7 "q-axis transient time constant, s" annotation(Dialog(tab = "GENROU"));
  parameter Real Tqo_s = 0.04 "d-axis sub-transient time constant, s" annotation(Dialog(tab = "GENROU"));
  parameter Real H = 50 "Inertia constant" annotation(Dialog(tab = "GENROU"));
  parameter Real D = 0 "Speed damping" annotation(Dialog(tab = "GENROU"));
  parameter Real Xd = 0.2 "d-axis reactance, p.u." annotation(Dialog(tab = "GENROU"));
  parameter Real Xq = 0.19 "q-axis reactance, p.u." annotation(Dialog(tab = "GENROU"));
  parameter Real Xd_p = 0.06 "d-axis transient reactance, p.u." annotation(Dialog(tab = "GENROU"));
  parameter Real Xq_p = 0.06 "q-axis transient reactance, p.u." annotation(Dialog(tab = "GENROU"));
  parameter Real Xd_s = 0.02 "d-axis sub-transient reactance, p.u." annotation(Dialog(tab = "GENROU"));
  parameter Real Xl = 0.03 "Reactance due to the leakage flux which does not cross the air gap, p.u." annotation(Dialog(tab = "GENROU"));
  // ESAC3A Parameters
  parameter Real S1 = 0.4 "saturation function value for 1 p.u. input" annotation(Dialog(tab = "GENROU"));
  parameter Real S12 = 0.8 "saturation function value for 1.2 p.u. input" annotation(Dialog(tab = "GENROU"));
  parameter Real TR_ex = 0.02 "regulator input filter time constant (sec)" annotation(Dialog(tab = "ESAC3A"));
  parameter Real TB_ex = 0.1 " lag time constant of voltage regulator (s)" annotation(Dialog(tab = "ESAC3A"));
  parameter Real TC_ex = 1 " lead time constant of voltage regulator (s)" annotation(Dialog(tab = "ESAC3A"));
  parameter Real KA_ex = 10 "(pu) voltage regulator gain" annotation(Dialog(tab = "ESAC3A"));
  parameter Real TA_ex = 0.02 "(sec) regulator time constant" annotation(Dialog(tab = "ESAC3A"));
  parameter Real VAMAX_ex = 10 "(pu) regulator output maximum limit" annotation(Dialog(tab = "ESAC3A"));
  parameter Real VAMIN_ex = -10 "(pu) regulator output minimum limit" annotation(Dialog(tab = "ESAC3A"));
  parameter Real TE_ex = 0.35 "Exciter time constant" annotation(Dialog(tab = "ESAC3A"));
  parameter Real VEMIN_ex = -10 "exciter field current minimum limit" annotation(Dialog(tab = "ESAC3A"));
  parameter Real KR_ex = 0.4 "Constant associated with regulator and alternator field power" annotation(Dialog(tab = "ESAC3A"));
  parameter Real KF_ex = 1 "Excitation control system stabilizer gains" annotation(Dialog(tab = "ESAC3A"));
  parameter Real TF_ex = 1.0 "Excitation control system stabilizer time constant, sec" annotation(Dialog(tab = "ESAC3A"));
  parameter Real KN_ex = 0.4 "Excitation control system stabilizer gain" annotation(Dialog(tab = "ESAC3A"));
  parameter Real EFDN_ex = 0.4 "Value of EFD at which feedback gain changes" annotation(Dialog(tab = "ESAC3A"));
  parameter Real KC_ex = 0.02 "Rectifier loading factor proportional to commutating reactance" annotation(Dialog(tab = "ESAC3A"));
  parameter Real KD_ex = 0.02 "Demagnetizing factor" annotation(Dialog(tab = "ESAC3A"));
  parameter Real KE_ex = 1 "exciter constant related fo self-excited field" annotation(Dialog(tab = "ESAC3A"));
  parameter Real VFEMAX_ex = 10 "exciter field current maximum limit" annotation(Dialog(tab = "ESAC3A"));
  parameter Real E1_ex = 4 "Exciter voltages at which exciter saturation is defined" annotation(Dialog(tab = "ESAC3A"));
  parameter Real SE_E1_ex = 0.4 "Exciter saturation function value at E1" annotation(Dialog(tab = "ESAC3A"));
  parameter Real E2_ex = 5 "Exciter voltages at which exciter saturation is defined" annotation(Dialog(tab = "ESAC3A"));
  parameter Real SE_E2_ex = 0.5 "Exciter saturation function value at E2" annotation(Dialog(tab = "ESAC3A"));
  // PSS2B Parameters
  parameter Real TW1_pss = 2 ">0" annotation(Dialog(tab = "PSS2B"));
  parameter Real TW2_pss = 2 "To bypass second washout, first signal: set Tw2 = 0" annotation(Dialog(tab = "PSS2B"));
  parameter Real T6_pss = 0.05 "To bypass first signal transducer: set T6 = 0" annotation(Dialog(tab = "PSS2B"));
  parameter Real TW3_pss = 2 ">0" annotation(Dialog(tab = "PSS2B"));
  parameter Real TW4_pss = 1.5 "To bypass second washout, second signal: set Tw4 = 0" annotation(Dialog(tab = "PSS2B"));
  parameter Real T7_pss = 2 "To bypass second signal transducer: set T7 = 0" annotation(Dialog(tab = "PSS2B"));
  parameter Real KS2_pss = 0.259 "T7/(2*H)" annotation(Dialog(tab = "PSS2B"));
  parameter Real KS3_pss = 1 annotation(Dialog(tab = "PSS2B"));
  parameter Real T8_pss = 0.5 annotation(Dialog(tab = "PSS2B"));
  parameter Real T9_pss = 0.1 ">0" annotation(Dialog(tab = "PSS2B"));
  parameter Real KS1_pss = 15 annotation(Dialog(tab = "PSS2B"));
  parameter Real T1_pss = 0.15 "To bypass first lead-lag: set T1 = T2 = 0" annotation(Dialog(tab = "PSS2B"));
  parameter Real T2_pss = 0.05 annotation(Dialog(tab = "PSS2B"));
  parameter Real T3_pss = 0.15 "To bypass first lead-lag: set T1 = T2 = 0" annotation(Dialog(tab = "PSS2B"));
  parameter Real T4_pss = 0.05 annotation(Dialog(tab = "PSS2B"));
  parameter Real VSTMAX_pss = 0.1 annotation(Dialog(tab = "PSS2B"));
  parameter Real VSTMIN_pss = -0.1 annotation(Dialog(tab = "PSS2B"));
  parameter Real VS1MAX_pss = 0.1 annotation(Dialog(tab = "PSS2B"));
  parameter Real VS1MIN_pss = -0.1 annotation(Dialog(tab = "PSS2B"));
  parameter Real VS2MAX_pss = 0.1 annotation(Dialog(tab = "PSS2B"));
  parameter Real VS2MIN_pss = -0.1 annotation(Dialog(tab = "PSS2B"));
  parameter Real T10_pss = 0.3 annotation(Dialog(tab = "PSS2B"));
  parameter Real T11_pss = 0.15 ">0" annotation(Dialog(tab = "PSS2B"));
  /// PSS2B ICONs
  parameter Real M0_pss = 1 "ICS1, first stabilizer input code" annotation(Dialog(tab = "PSS2B", group = "ICONs"));
  parameter Real M1_pss = 0 "REMBUS1, first remote bus number" annotation(Dialog(tab = "PSS2B", group = "ICONs"));
  parameter Real M2_pss = 3 "ICS2, second stabilizer input code" annotation(Dialog(tab = "PSS2B", group = "ICONs"));
  parameter Real M3_pss = 0 "REMBUS2, second remote bus number" annotation(Dialog(tab = "PSS2B", group = "ICONs"));
  parameter Real M4_pss = 5 "M, ramp tracking filter" annotation(Dialog(tab = "PSS2B", group = "ICONs"));
  parameter Real M5_pss = 1 "N, ramp tracking filter" annotation(Dialog(tab = "PSS2B", group = "ICONs"));
  // WSIEG1 parameters
  parameter Real K_tg = 15 annotation(Dialog(tab = "WSIG1"));
  parameter Real T1_tg = 1.5 "(sec)" annotation(Dialog(tab = "WSIG1"));
  parameter Real T2_tg = 0.3 "(sec)" annotation(Dialog(tab = "WSIG1"));
  parameter Real T3_tg = 0.02 "(>0)(sec)" annotation(Dialog(tab = "WSIG1"));
  parameter Real Uo_tg = 0.1 "(pu/sec)" annotation(Dialog(tab = "WSIG1"));
  parameter Real Uc_tg = -0.5 "(<0)(pu/sec)" annotation(Dialog(tab = "WSIG1"));
  parameter Real PMAX_tg = 0.5 "(pu on machine MVA rating)" annotation(Dialog(tab = "WSIG1"));
  parameter Real PMIN_tg = 0 "(pu on machine MVA rating)" annotation(Dialog(tab = "WSIG1"));
  parameter Real T4_tg = 0.1 "(sec)" annotation(Dialog(tab = "WSIG1"));
  parameter Real K1_tg = 0.1 annotation(Dialog(tab = "WSIG1"));
  parameter Real K2_tg = 0.1 annotation(Dialog(tab = "WSIG1"));
  parameter Real T5_tg = 0.2 "(sec)" annotation(Dialog(tab = "WSIG1"));
  parameter Real K3_tg = 0.5 annotation(Dialog(tab = "WSIG1"));
  parameter Real K4_tg = 0.1 annotation(Dialog(tab = "WSIG1"));
  parameter Real T6_tg = 0.1 "(sec)" annotation(Dialog(tab = "WSIG1"));
  parameter Real K5_tg = 0.6 annotation(Dialog(tab = "WSIG1"));
  parameter Real K6_tg = 0.2 annotation(Dialog(tab = "WSIG1"));
  parameter Real T7_tg = 0.3 "(sec)" annotation(Dialog(tab = "WSIG1"));
  parameter Real K7_tg = 0.2 annotation(Dialog(tab = "WSIG1"));
  parameter Real K8_tg = 0.6 annotation(Dialog(tab = "WSIG1"));
  parameter Real db1_tg = 0 annotation(Dialog(tab = "WSIG1"));
  parameter Real err_tg = 0 annotation(Dialog(tab = "WSIG1"));
  parameter Real db2_tg = 0 annotation(Dialog(tab = "WSIG1"));
  parameter Real GV1_tg = 0 annotation(Dialog(tab = "WSIG1"));
  parameter Real PGV1_tg = 0 annotation(Dialog(tab = "WSIG1"));
  parameter Real GV2_tg = 99 annotation(Dialog(tab = "WSIG1"));
  parameter Real PGV2_tg = 99 annotation(Dialog(tab = "WSIG1"));
  parameter Real GV3_tg = 0 annotation(Dialog(tab = "WSIG1"));
  parameter Real PGV3_tg = 0 annotation(Dialog(tab = "WSIG1"));
  parameter Real GV4_tg = 0 annotation(Dialog(tab = "WSIG1"));
  parameter Real PGV4_tg = 0 annotation(Dialog(tab = "WSIG1"));
  parameter Real GV5_tg = 0 annotation(Dialog(tab = "WSIG1"));
  parameter Real PGV5_tg = 0 annotation(Dialog(tab = "WSIG1"));
  parameter Real IBLOCK_tg = 0 annotation(Dialog(tab = "WSIG1"));
  parameter Real JBUS = 0 "Bus Identifier (NOT USED)" annotation(Dialog(tab = "WSIG1"));
  parameter Real M = 0 "Machine Identifier (NOT USED)" annotation(Dialog(tab = "WSIG1"));
  //
// <<< AUTOGEN PARAMS (VERBATIM FROM MODELSETS) END



end GENROU_ESAC3A_PSS2B_WSIEG1;
