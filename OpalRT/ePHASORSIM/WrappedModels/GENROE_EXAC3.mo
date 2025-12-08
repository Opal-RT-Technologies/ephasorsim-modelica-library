within OpalRT.ePHASORSIM.WrappedModels;
block GENROE_EXAC3
  extends Wrappers.FMUTemplateVRef(redeclare ModelSets.TypeB.GENROE_EXAC3 modelSet(
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
      KLV_ex = KLV_ex,
      KR_ex = KR_ex,
      KF_ex = KF_ex,
      TF_ex = TF_ex,
      KN_ex = KN_ex,
      EFDN_ex = EFDN_ex,
      KC_ex = KC_ex,
      KD_ex = KD_ex,
      KE_ex = KE_ex,
      VLV_ex = VLV_ex,
      E1_ex = E1_ex,
      SE_E1_ex = SE_E1_ex,
      E2_ex = E2_ex,
      SE_E2_ex = SE_E2_ex));

// >>> AUTOGEN PARAMS (VERBATIM FROM MODELSETS) BEGIN
  parameter Real partType = 1;
  // GENROE Parameters
  parameter Integer IBUS = 100 "Located system bus" annotation(Dialog(tab = "General"));
  parameter String M_ID = "M1" "Machine Identifier" annotation(Dialog(tab = "GENROE Parameters"));
  parameter Real P_gen = 1100 "Bus Active Power, MW" annotation(Dialog(tab = "General"));
  parameter Real Q_gen = 342.702 "Bus Reactive Power, MVAR" annotation(Dialog(tab = "General"));
  parameter Real Vt_abs = 1.03 "Bus Voltage Magnitude, p.u." annotation(Dialog(tab = "General"));
  parameter Real Vt_ang = -10.96 "Bus Voltage Angle, deg." annotation(Dialog(tab = "General"));
  parameter Real SB = 1000 "Machine Base Power, MVA" annotation(Dialog(tab = "General"));
  parameter Real fn = 50 "Nominal frequency" annotation(Dialog(tab = "General"));
  parameter Real ZSOURCE_RE = 0 "Machine source impedence" annotation(Dialog(tab = "GENROE Parameters"));
  parameter Real Tdo_p = 7 "d-axis transient time constant" annotation(Dialog(tab = "GENROE Parameters"));
  parameter Real Tdo_s = 0.03 "d-axis sub-transient time constant, s" annotation(Dialog(tab = "GENROE Parameters"));
  parameter Real Tqo_p = 0.7 "q-axis transient time constant, s" annotation(Dialog(tab = "GENROE Parameters"));
  parameter Real Tqo_s = 0.04 "d-axis sub-transient time constant, s" annotation(Dialog(tab = "GENROE Parameters"));
  parameter Real H = 50 "Inertia constant" annotation(Dialog(tab = "GENROE Parameters"));
  parameter Real D = 0 "Speed damping" annotation(Dialog(tab = "GENROE Parameters"));
  parameter Real Xd = 0.2 "d-axis reactance, p.u." annotation(Dialog(tab = "GENROE Parameters"));
  parameter Real Xq = 0.19 "q-axis reactance, p.u." annotation(Dialog(tab = "GENROE Parameters"));
  parameter Real Xd_p = 0.06 "d-axis transient reactance, p.u." annotation(Dialog(tab = "GENROE Parameters"));
  parameter Real Xq_p = 0.06 "q-axis transient reactance, p.u." annotation(Dialog(tab = "GENROE Parameters"));
  parameter Real Xd_s = 0.02 "d-axis sub-transient reactance, p.u." annotation(Dialog(tab = "GENROE Parameters"));
  parameter Real Xl = 0.03 "Reactance due to the leakage flux which does not cross the air gap, p.u." annotation(Dialog(tab = "GENROE Parameters"));
  parameter Real S1 = 0.4 "saturation function value for 1 p.u. input" annotation(Dialog(tab = "GENROE Parameters"));
  parameter Real S12 = 0.8 "saturation function value for 1.2 p.u. input" annotation(Dialog(tab = "GENROE Parameters"));
  // EXAC3 Parameters
  parameter Real TR_ex = 0.02 "regulator input filter time constant (sec)" annotation(Dialog(tab = "EXAC3"));
  parameter Real TB_ex = 0.1 " lag time constant of voltage regulator (s)" annotation(Dialog(tab = "EXAC3"));
  parameter Real TC_ex = 1 " lead time constant of voltage regulator (s)" annotation(Dialog(tab = "EXAC3"));
  parameter Real KA_ex = 10 "(pu) voltage regulator gain" annotation(Dialog(tab = "EXAC3"));
  parameter Real TA_ex = 0.02 "(sec) regulator time constant" annotation(Dialog(tab = "EXAC3"));
  parameter Real VAMAX_ex = 10 "(pu) regulator output maximum limit" annotation(Dialog(tab = "EXAC3"));
  parameter Real VAMIN_ex = -10 "(pu) regulator output minimum limit" annotation(Dialog(tab = "EXAC3"));
  parameter Real TE_ex = 0.35 "Exciter time constant" annotation(Dialog(tab = "EXAC3"));
  parameter Real KLV_ex = 0.4 "Gain used in the minimum field voltage limiter loop" annotation(Dialog(tab = "EXAC3"));
  parameter Real KR_ex = 0.4 "Constant associated with regulator and alternator field" annotation(Dialog(tab = "EXAC3"));
  parameter Real KF_ex = 1 "Excitation control system stabilizer gains" annotation(Dialog(tab = "EXAC3"));
  parameter Real TF_ex = 1.0 "Excitation control system stabilizer time constant, sec" annotation(Dialog(tab = "EXAC3"));
  parameter Real KN_ex = 0.4 "Excitation control system stabilizer gain" annotation(Dialog(tab = "EXAC3"));
  parameter Real EFDN_ex = 0.4 "Value of EFD at which feedback gain changes" annotation(Dialog(tab = "EXAC3"));
  parameter Real KC_ex = 0.02 "Rectifier loading factor proportional to commutating reactance" annotation(Dialog(tab = "EXAC3"));
  parameter Real KD_ex = 0.02 "Demagnetizing factor" annotation(Dialog(tab = "EXAC3"));
  parameter Real KE_ex = 1 "exciter constant related fo self-excited field" annotation(Dialog(tab = "EXAC3"));
  parameter Real VLV_ex = 0.4 "Field voltage used in the minimum field voltage limiter loop" annotation(Dialog(tab = "EXAC3"));
  parameter Real E1_ex = 4 "Exciter voltages at which exciter saturation is defined" annotation(Dialog(tab = "EXAC3"));
  parameter Real SE_E1_ex = 0.4 "Exciter saturation function value at E1" annotation(Dialog(tab = "EXAC3"));
  parameter Real E2_ex = 5 "Exciter voltages at which exciter saturation is defined" annotation(Dialog(tab = "EXAC3"));
  parameter Real SE_E2_ex = 0.5 "Exciter saturation function value at E2" annotation(Dialog(tab = "EXAC3"));
// <<< AUTOGEN PARAMS (VERBATIM FROM MODELSETS) END


end GENROE_EXAC3;
