within OpalRT.ePHASORSIM.WrappedModels;
block GENSAL_ESAC6A
  extends Wrappers.FMUTemplateVRef(redeclare ModelSets.TypeB.GENSAL_ESAC6A modelSet(
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
      KA_ex = KA_ex,
      TA_ex = TA_ex,
      TK_ex = TK_ex,
      TB_ex = TB_ex,
      TC_ex = TC_ex,
      VAMAX_ex = VAMAX_ex,
      VAMIN_ex = VAMIN_ex,
      VRMAX_ex = VRMAX_ex,
      VRMIN_ex = VRMIN_ex,
      TE_ex = TE_ex,
      VFELIM_ex = VFELIM_ex,
      KH_ex = KH_ex,
      VHMAX_ex = VHMAX_ex,
      TH_ex = TH_ex,
      TJ_ex = TJ_ex,
      KC_ex = KC_ex,
      KD_ex = KD_ex,
      KE_ex = KE_ex,
      E1_ex = E1_ex,
      SE_E1_ex = SE_E1_ex,
      E2_ex = E2_ex,
      SE_E2_ex = SE_E2_ex));

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
  parameter Real Tdo_s = 0.03 "d-axis sub-transient time constant, s" annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real Tqo_s = 0.04 "d-axis sub-transient time constant, s" annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real H = 50 "Inertia constant" annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real D = 0 "Speed damping" annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real Xd = 0.2 "d-axis reactance, p.u." annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real Xq = 0.19 "q-axis reactance, p.u." annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real Xd_p = 0.06 "d-axis transient reactance, p.u." annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real Xd_s = 0.02 "d-axis sub-transient reactance, p.u." annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real Xl = 0.03 "Reactance due to the leakage flux which does not cross the air gap, p.u." annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real S1 = 0.4 "saturation function value for 1 p.u. input" annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real S12 = 0.8 "saturation function value for 1.2 p.u. input" annotation(Dialog(tab = "GENSAL Parameters"));
  // ESAC6A parameters
  parameter Real TR_ex = 0.02;
  parameter Real KA_ex = 536;
  parameter Real TA_ex = 0.086;
  parameter Real TK_ex = 0.18;
  parameter Real TB_ex = 9;
  parameter Real TC_ex = 3;
  parameter Real VAMAX_ex = 75;
  parameter Real VAMIN_ex = -75;
  parameter Real VRMAX_ex = 44;
  parameter Real VRMIN_ex = -36;
  parameter Real TE_ex = 1;
  parameter Real VFELIM_ex = 19;
  parameter Real KH_ex = 92;
  parameter Real VHMAX_ex = 75;
  parameter Real TH_ex = 0.08;
  parameter Real TJ_ex = 0.02;
  parameter Real KC_ex = 0.173;
  parameter Real KD_ex = 1.91;
  parameter Real KE_ex = 1.6;
  parameter Real E1_ex = 7.4;
  parameter Real SE_E1_ex = 0.214;
  parameter Real E2_ex = 5.55;
  parameter Real SE_E2_ex = 0.044;
// <<< AUTOGEN PARAMS (VERBATIM FROM MODELSETS) END


end GENSAL_ESAC6A;
