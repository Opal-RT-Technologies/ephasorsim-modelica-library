within OpalRT.ePHASORSIM.WrappedModels;
block GENSAL_EXST1_IEEEST
  extends Wrappers.FMUTemplateVRef(redeclare ModelSets.TypeE.GENSAL_EXST1_IEEEST modelSet(
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
      TR_ex = TR_ex,
      VIMAX_ex = VIMAX_ex,
      VIMIN_ex = VIMIN_ex,
      TC_ex = TC_ex,
      TB_ex = TB_ex,
      KA_ex = KA_ex,
      TA_ex = TA_ex,
      VRMAX_ex = VRMAX_ex,
      VRMIN_ex = VRMIN_ex,
      KC_ex = KC_ex,
      KF_ex = KF_ex,
      TF_ex = TF_ex,
      A1_pss = A1_pss,
      A2_pss = A2_pss,
      A3_pss = A3_pss,
      A4_pss = A4_pss,
      A5_pss = A5_pss,
      A6_pss = A6_pss,
      T1_pss = T1_pss,
      T2_pss = T2_pss,
      T3_pss = T3_pss,
      T4_pss = T4_pss,
      T5_pss = T5_pss,
      T6_pss = T6_pss,
      KS_pss = KS_pss,
      LSMAX_pss = LSMAX_pss,
      LSMIN_pss = LSMIN_pss,
      VCU_pss = VCU_pss,
      VCL_pss = VCL_pss,
      M0_pss = M0_pss,
      M1_pss = M1_pss));

// >>> AUTOGEN PARAMS (VERBATIM FROM MODELSETS) BEGIN
  parameter Real partType = 1;
  // GENSAL Parameters
  parameter Integer IBUS = 100 "Located system bus" annotation(Dialog(tab = "General"));
  parameter String ID = "M1" "Machine Identifier" annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real P_gen = 1100 "Bus Active Power, MW" annotation(Dialog(tab = "General"));
  parameter Real Q_gen = 342.702 "Bus Reactive Power, MVAR" annotation(Dialog(tab = "General"));
  parameter Real Vt_abs = 1.03 "Bus Voltage Magnitude, p.u." annotation(Dialog(tab = "General"));
  parameter Real Vt_ang = -10.96 "Bus Voltage Angle, deg." annotation(Dialog(tab = "General"));
  parameter Real SB = 1000 "Machine Base Power, MVA" annotation(Dialog(tab = "General"));
  parameter Real fn = 50 "Nominal frequency" annotation(Dialog(tab = "General"));
  parameter Real ZSOURCE_RE = 0 "Machine source impedence" annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real Tdo_p = 7 "d-axis transient time constant" annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real Tdo_s = 0.05 "d-axis sub-transient time constant, s" annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real Tqo_s = 0.01 "d-axis sub-transient time constant, s" annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real H = 50 "Inertia constant" annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real D = 0 "Speed damping" annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real Xd = 0.2 "d-axis reactance, p.u." annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real Xq = 0.19 "q-axis reactance, p.u." annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real Xd_p = 0.06 "d-axis transient reactance, p.u." annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real Xd_s = 0.02 "d-axis sub-transient reactance, p.u." annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real Xl = 0.03 "Reactance due to the leakage flux which does not cross the air gap, p.u." annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real S1 = 0.4 "saturation function value for 1 p.u. input" annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real S12 = 0.8 "saturation function value for 1.2 p.u. input" annotation(Dialog(tab = "GENSAL Parameters"));
  // EXST1 Parameters
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
  // IEEEST Parameters
  parameter Real A1_pss = 2 annotation(Dialog(tab = "IEEEST Parameters"));
  parameter Real A2_pss = 1 annotation(Dialog(tab = "IEEEST Parameters"));
  parameter Real A3_pss = 2 annotation(Dialog(tab = "IEEEST Parameters"));
  parameter Real A4_pss = 1 annotation(Dialog(tab = "IEEEST Parameters"));
  parameter Real A5_pss = 2 annotation(Dialog(tab = "IEEEST Parameters"));
  parameter Real A6_pss = 1 annotation(Dialog(tab = "IEEEST Parameters"));
  parameter Real T1_pss = 1 "(sec)" annotation(Dialog(tab = "IEEEST Parameters"));
  parameter Real T2_pss = 1 "(sec)" annotation(Dialog(tab = "IEEEST Parameters"));
  parameter Real T3_pss = 1 "(sec)" annotation(Dialog(tab = "IEEEST Parameters"));
  parameter Real T4_pss = 1 "(sec)" annotation(Dialog(tab = "IEEEST Parameters"));
  parameter Real T5_pss = 7.5 "(sec)" annotation(Dialog(tab = "IEEEST Parameters"));
  parameter Real T6_pss = 7.5 "(>0)(sec)" annotation(Dialog(tab = "IEEEST Parameters"));
  parameter Real KS_pss = 15.38 annotation(Dialog(tab = "IEEEST Parameters"));
  parameter Real LSMAX_pss = 0.1 annotation(Dialog(tab = "IEEEST Parameters"));
  parameter Real LSMIN_pss = -0.1 annotation(Dialog(tab = "IEEEST Parameters"));
  parameter Real VCU_pss = 0 "(pu) (if equal zero, ignored)" annotation(Dialog(tab = "IEEEST Parameters"));
  parameter Real VCL_pss = 0 "(pu) (if equal zero, ignored)" annotation(Dialog(tab = "IEEEST Parameters"));
  // IEEEST ICONs
  parameter Real M0_pss = 1 "Stabilizer input code" annotation(Dialog(tab = "IEEEST Parameters", group = "ICONs"));
  parameter Real M1_pss = 0 "IB, remote bus number" annotation(Dialog(tab = "IEEEST Parameters", group = "ICONs"));
// <<< AUTOGEN PARAMS (VERBATIM FROM MODELSETS) END


end GENSAL_EXST1_IEEEST;
