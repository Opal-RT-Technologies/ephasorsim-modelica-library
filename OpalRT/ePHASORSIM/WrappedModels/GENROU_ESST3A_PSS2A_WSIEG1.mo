within OpalRT.ePHASORSIM.WrappedModels;
block GENROU_ESST3A_PSS2A_WSIEG1
  extends Wrappers.FMUTemplateVRefGRef(redeclare ModelSets.TypeF.GENROU_ESST3A_PSS2A_WSIEG1 modelSet(
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
      VIMAX_ex = VIMAX_ex,
      VIMIN_ex = VIMIN_ex,
      KM_ex = KM_ex,
      TC_ex = TC_ex,
      TB_ex = TB_ex,
      KA_ex = KA_ex,
      TA_ex = TA_ex,
      VRMAX_ex = VRMAX_ex,
      VRMIN_ex = VRMIN_ex,
      KG_ex = KG_ex,
      KP_ex = KP_ex,
      KI_ex = KI_ex,
      VBMAX_ex = VBMAX_ex,
      KC_ex = KC_ex,
      XL_ex = XL_ex,
      VGMAX_ex = VGMAX_ex,
      THETAP_ex = THETAP_ex,
      TM_ex = TM_ex,
      VMMAX_ex = VMMAX_ex,
      VMMIN_ex = VMMIN_ex,
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
      y_start = y_start,
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
  //parameter Real ZSOURCE_IM = Xq_s "Machine source impedence" annotation(Dialog(tab = "GENROU"));
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
  //parameter Real Xq_s = Xd_s "q-axis sub-transient reactance, p.u." annotation(Dialog(tab = "GENROU"));
  parameter Real Xl = 0.03 "Reactance due to the leakage flux which does not cross the air gap, p.u." annotation(Dialog(tab = "GENROU"));
  parameter Real S1 = 0.4 "saturation function value for 1 p.u. input" annotation(Dialog(tab = "GENROU"));
  parameter Real S12 = 0.8 "saturation function value for 1.2 p.u. input" annotation(Dialog(tab = "GENROU"));
  // ESST3A parameters
  parameter Real TR_ex = 0.02 "(sec) regulator input filter time constant" annotation(Dialog(tab = "ESST3A"));
  parameter Real VIMAX_ex = 10 "(pu) Voltage regulator input maximum limit" annotation(Dialog(tab = "ESST3A"));
  parameter Real VIMIN_ex = -10 "(pu) Voltage regulator input minimum limit" annotation(Dialog(tab = "ESST3A"));
  parameter Real KM_ex = 0.02 "Forward gain constant of the inner loop field regulator" annotation(Dialog(tab = "ESST3A"));
  parameter Real TC_ex = 1 " lead time constant of voltage regulator (s)" annotation(Dialog(tab = "ESST3A"));
  parameter Real TB_ex = 0.1 " lag time constant of voltage regulator (s)" annotation(Dialog(tab = "ESST3A"));
  parameter Real KA_ex = 10 "(pu) voltage regulator gain" annotation(Dialog(tab = "ESST3A"));
  parameter Real TA_ex = 0.02 "(sec) regulator time constant" annotation(Dialog(tab = "ESST3A"));
  parameter Real VRMAX_ex = 10 "(pu) regulator output maximum limit" annotation(Dialog(tab = "ESST3A"));
  parameter Real VRMIN_ex = -10 "(pu) regulator output minimum limit" annotation(Dialog(tab = "ESST3A"));
  parameter Real KG_ex = 1 "Feedback gain constant of the inner loop field regulator" annotation(Dialog(tab = "ESST3A"));
  parameter Real KP_ex = 1 "Potential circuit gain coefficient" annotation(Dialog(tab = "ESST3A"));
  parameter Real KI_ex = 0.02 "Potential circuit gain coefficient" annotation(Dialog(tab = "ESST3A"));
  parameter Real VBMAX_ex = 10 "(pu) regulator output maximum limit" annotation(Dialog(tab = "ESST3A"));
  parameter Real KC_ex = 1 "Rectifier loading factor proportional to commutating reactance" annotation(Dialog(tab = "ESST3A"));
  parameter Real XL_ex = 0.02 "Reactance associated with potential source" annotation(Dialog(tab = "ESST3A"));
  parameter Real VGMAX_ex = 10 "(pu) regulator output maximum limit" annotation(Dialog(tab = "ESST3A"));
  parameter Real THETAP_ex = 0.52 "Potential circuit phase angle (degrees)" annotation(Dialog(tab = "ESST3A"));
  parameter Real TM_ex = 0.02 "Forward time constant of the inner loop field regulator" annotation(Dialog(tab = "ESST3A"));
  parameter Real VMMAX_ex = 10 "(pu) regulator output maximum limit" annotation(Dialog(tab = "ESST3A"));
  parameter Real VMMIN_ex = -10 "(pu) regulator output minimum limit" annotation(Dialog(tab = "ESST3A"));
  //PSS2A parameters
  parameter Real TW1_pss = 0.1 ">0" annotation(Dialog(tab = "PSS2A"));
  parameter Real TW2_pss = 1 "To bypass second washout, first signal: set Tw2 = 0" annotation(Dialog(tab = "PSS2A"));
  parameter Real T6_pss = 1 "To bypass first signal transducer: set T6 = 0" annotation(Dialog(tab = "PSS2A"));
  parameter Real TW3_pss = 1.5 ">0" annotation(Dialog(tab = "PSS2A"));
  parameter Real TW4_pss = 0.2 "To bypass second washout, second signal: set Tw4 = 0" annotation(Dialog(tab = "PSS2A"));
  parameter Real T7_pss = 0.2 "To bypass second signal transducer: set T7 = 0" annotation(Dialog(tab = "PSS2A"));
  parameter Real KS2_pss = 0.1 annotation(Dialog(tab = "PSS2A"));
  parameter Real KS3_pss = 0.1 annotation(Dialog(tab = "PSS2A"));
  parameter Real T8_pss = 0.05;
  parameter Real T9_pss = 0.01 ">0" annotation(Dialog(tab = "PSS2A"));
  parameter Real KS1_pss = 0.15 annotation(Dialog(tab = "PSS2A"));
  parameter Real T1_pss = 0.1 "To bypass first lead-lag: set T1 = T2 = 0" annotation(Dialog(tab = "PSS2A"));
  parameter Real T2_pss = 0.1 annotation(Dialog(tab = "PSS2A"));
  parameter Real T3_pss = 0.01 "To bypass first lead-lag: set T1 = T2 = 0" annotation(Dialog(tab = "PSS2A"));
  parameter Real T4_pss = 1 annotation(Dialog(tab = "PSS2A"));
  parameter Real VSTMAX_pss = 1 annotation(Dialog(tab = "PSS2A"));
  parameter Real VSTMIN_pss = -1 annotation(Dialog(tab = "PSS2A"));
  parameter Real M0_pss = 2 annotation(Dialog(tab = "PSS2A", group = "ICONs"));
  parameter Real M1_pss = 2 "currently disabled" annotation(Dialog(tab = "PSS2A", group = "ICONs"));
  parameter Real M2_pss = 2 annotation(Dialog(tab = "PSS2A", group = "ICONs"));
  parameter Real M3_pss = 2 "currently disabled" annotation(Dialog(tab = "PSS2A", group = "ICONs"));
  parameter Real M4_pss = 1 ">= 0, To bypass Ramp Tracking Filter: set M = N = 0" annotation(Dialog(tab = "PSS2A", group = "ICONs"));
  parameter Real M5_pss = 2 ">= 0, M*N <= 8" annotation(Dialog(tab = "PSS2A", group = "ICONs"));
  parameter Real y_start = 0 "Initial or guess value of output (= state)";
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


end GENROU_ESST3A_PSS2A_WSIEG1;
