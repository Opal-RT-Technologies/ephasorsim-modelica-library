within OpalRT.ePHASORSIM.WrappedModels;
block GENROU_ESAC2A_GAST
  extends Wrappers.FMUTemplateVRefGRef(redeclare ModelSets.TypeD.GENROU_ESAC2A_GAST modelSet(
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
      KB_ex = KB_ex,
      VRMAX_ex = VRMAX_ex,
      VRMIN_ex = VRMIN_ex,
      TE_ex = TE_ex,
      VFEMAX_ex = VFEMAX_ex,
      KH_ex = KH_ex,
      KF_ex = KF_ex,
      TF_ex = TF_ex,
      KC_ex = KC_ex,
      KD_ex = KD_ex,
      KE_ex = KE_ex,
      E1_ex = E1_ex,
      SE_E1_ex = SE_E1_ex,
      E2_ex = E2_ex,
      SE_E2_ex = SE_E2_ex,
      R_tg = R_tg,
      T1_tg = T1_tg,
      T2_tg = T2_tg,
      T3_tg = T3_tg,
      AT_tg = AT_tg,
      KT_tg = KT_tg,
      VMAX_tg = VMAX_tg,
      VMIN_tg = VMIN_tg,
      DTURB_tg = DTURB_tg));

// >>> AUTOGEN PARAMS (VERBATIM FROM MODELSETS) BEGIN
  parameter Real partType = 1;
  // GENROU Parameters
  parameter Integer IBUS = 100 "Located system bus";
  parameter String ID = "M1" "Machine Identifier" annotation(Dialog(tab = "GENROU"));
  parameter Real P_gen = 1100 "Bus Active Power, MW";
  parameter Real Q_gen = 342.702 "Bus Reactive Power, MVAR";
  parameter Real Vt_abs = 1.03 "Bus Voltage Magnitude, p.u.";
  parameter Real Vt_ang = -10.96 "Bus Voltage Angle, deg.";
  parameter Real SB = 1000 "Machine Base Power, MVA";
  parameter Real fn = 50 "Nominal frequency";
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
  parameter Real S1 = 0.4 "saturation function value for 1 p.u. input" annotation(Dialog(tab = "GENROU"));
  parameter Real S12 = 0.8 "saturation function value for 1.2 p.u. input" annotation(Dialog(tab = "GENROU"));
  // ESAC2A Parameters
  parameter Real TR_ex = 0.02 "regulator input filter time constant (sec)" annotation(Dialog(tab = "ESAC2A"));
  parameter Real TB_ex = 0.1 " lag time constant of voltage regulator (s)" annotation(Dialog(tab = "ESAC2A"));
  parameter Real TC_ex = 1 " lead time constant of voltage regulator (s)" annotation(Dialog(tab = "ESAC2A"));
  parameter Real KA_ex = 10 "(pu) voltage regulator gain" annotation(Dialog(tab = "ESAC2A"));
  parameter Real TA_ex = 0.02 "(sec) regulator time constant" annotation(Dialog(tab = "ESAC2A"));
  parameter Real VAMAX_ex = 10 "Maximum voltage regulator output" annotation(Dialog(tab = "ESAC2A"));
  parameter Real VAMIN_ex = -10 "Minimum voltage regulator output" annotation(Dialog(tab = "ESAC2A"));
  parameter Real KB_ex = 0.02 "Second stage regulator gain" annotation(Dialog(tab = "ESAC2A"));
  parameter Real VRMAX_ex = 10 "(pu) regulator output maximum limit" annotation(Dialog(tab = "ESAC2A"));
  parameter Real VRMIN_ex = -10 "(pu) regulator output minimum limit" annotation(Dialog(tab = "ESAC2A"));
  parameter Real TE_ex = 0.35 "Exciter time constant" annotation(Dialog(tab = "ESAC2A"));
  parameter Real VFEMAX_ex = 10 "exciter field current limit (> 0)" annotation(Dialog(tab = "ESAC2A"));
  parameter Real KH_ex = 0.02 "Exciter field current feedback gain" annotation(Dialog(tab = "ESAC2A"));
  parameter Real KF_ex = 1 "Excitation control system stabilizer gains" annotation(Dialog(tab = "ESAC2A"));
  parameter Real TF_ex = 1.0 "Excitation control system stabilizer time constant, sec" annotation(Dialog(tab = "ESAC2A"));
  parameter Real KC_ex = 0.02 "Rectifier loading factor proportional to commutating reactance" annotation(Dialog(tab = "ESAC2A"));
  parameter Real KD_ex = 0.02 "Demagnetizing factor" annotation(Dialog(tab = "ESAC2A"));
  parameter Real KE_ex = 1 "exciter constant related fo self-excited field" annotation(Dialog(tab = "ESAC2A"));
  parameter Real E1_ex = 4 "Exciter voltages at which exciter saturation is defined" annotation(Dialog(tab = "ESAC2A"));
  parameter Real SE_E1_ex = 0.4 "Exciter saturation function value at E1" annotation(Dialog(tab = "ESAC2A"));
  parameter Real E2_ex = 5 "Exciter voltages at which exciter saturation is defined" annotation(Dialog(tab = "ESAC2A"));
  parameter Real SE_E2_ex = 0.5 "Exciter saturation function value at E2" annotation(Dialog(tab = "ESAC2A"));
  // GAST Parameters
  parameter Real R_tg = 0.047 "Speed droop" annotation(Dialog(tab = "GAST"));
  parameter Real T1_tg = 0.4 "(>0) (sec)" annotation(Dialog(tab = "GAST"));
  parameter Real T2_tg = 0.1 "(>0) (sec)" annotation(Dialog(tab = "GAST"));
  parameter Real T3_tg = 3 "(>0) (sec)" annotation(Dialog(tab = "GAST"));
  parameter Real AT_tg = 1.5 "Ambient temperature load limit" annotation(Dialog(tab = "GAST"));
  parameter Real KT_tg = 2 annotation(Dialog(tab = "GAST"));
  parameter Real VMAX_tg = 1.5 annotation(Dialog(tab = "GAST"));
  parameter Real VMIN_tg = 0 annotation(Dialog(tab = "GAST"));
  parameter Real DTURB_tg = 0 annotation(Dialog(tab = "GAST"));
  //
// <<< AUTOGEN PARAMS (VERBATIM FROM MODELSETS) END

end GENROU_ESAC2A_GAST;
