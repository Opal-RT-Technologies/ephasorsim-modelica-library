within OpalRT.ePHASORSIM.WrappedModels;
block GENROU_EXAC2_GAST2A
  extends Wrappers.FMUTemplateVRefGRef(redeclare ModelSets.TypeD.GENROU_EXAC2_GAST2A modelSet(
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
      KB_ex = KB_ex,
      VRMAX_ex = VRMAX_ex,
      VRMIN_ex = VRMIN_ex,
      TE_ex = TE_ex,
      KL_ex = KL_ex,
      KH_ex = KH_ex,
      KF_ex = KF_ex,
      TF_ex = TF_ex,
      KC_ex = KC_ex,
      KD_ex = KD_ex,
      KE_ex = KE_ex,
      VLR_ex = VLR_ex,
      E1_ex = E1_ex,
      SE_E1_ex = SE_E1_ex,
      E2_ex = E2_ex,
      SE_E2_ex = SE_E2_ex,
      TG_ID = TG_ID,
      MBASE = MBASE,
      W_tg = W_tg,
      X_tg = X_tg,
      Y_tg = Y_tg,
      Z_tg = Z_tg,
      ETD_tg = ETD_tg,
      TCD_tg = TCD_tg,
      TRATE_tg = TRATE_tg,
      T_tg = T_tg,
      MAX_tg = MAX_tg,
      MIN_tg = MIN_tg,
      ECR_tg = ECR_tg,
      K3_tg = K3_tg,
      a_tg = a_tg,
      b_tg = b_tg,
      c_tg = c_tg,
      Tf_tg = Tf_tg,
      Kf_tg = Kf_tg,
      K5_tg = K5_tg,
      K4_tg = K4_tg,
      T3_tg = T3_tg,
      T4_tg = T4_tg,
      Tt_tg = Tt_tg,
      T5_tg = T5_tg,
      af1_tg = af1_tg,
      bf1_tg = bf1_tg,
      af2_tg = af2_tg,
      bf2_tg = bf2_tg,
      cf2_tg = cf2_tg,
      TR_T_tg = TR_T_tg,
      K6_tg = K6_tg,
      TC_T_tg = TC_T_tg));

// >>> AUTOGEN PARAMS (VERBATIM FROM MODELSETS) BEGIN
  parameter Real partType = 1;
  // GENROU Parameters
  parameter Integer IBUS = 100 "Located system bus" annotation(Dialog(tab = "General"));
  parameter String M_ID = "M1" "Machine Identifier" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real P_gen = 900 "Bus Active Power, MW" annotation(Dialog(tab = "General"));
  parameter Real Q_gen = 200 "Bus Reactive Power, MVAR" annotation(Dialog(tab = "General"));
  parameter Real Vt_abs = 1.03 "Bus Voltage Magnitude, p.u." annotation(Dialog(tab = "General"));
  parameter Real Vt_ang = -10.96 "Bus Voltage Angle, deg." annotation(Dialog(tab = "General"));
  parameter Real SB = 1000 "Machine Base Power, MVA" annotation(Dialog(tab = "General"));
  parameter Real fn = 50 "Nominal frequency" annotation(Dialog(tab = "General"));
  parameter Real ZSOURCE_RE = 0 "Machine source impedence" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Tdo_p = 7 "d-axis transient time constant" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Tdo_s = 0.3 "d-axis sub-transient time constant, s" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Tqo_p = 0.04 "q-axis transient time constant, s" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Tqo_s = 0.4 "d-axis sub-transient time constant, s" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real H = 2.6 "Inertia constant" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real D = 0 "Speed damping" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xd = 0.67 "d-axis reactance, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xq = 0.62 "q-axis reactance, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xd_p = 0.3 "d-axis transient reactance, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xq_p = 0.3 "q-axis transient reactance, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xd_s = 0.01 "d-axis sub-transient reactance, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xl = 0.04 "Reactance due to the leakage flux which does not cross the air gap, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real S1 = 0.1 "saturation function value for 1 p.u. input" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real S12 = 0.2 "saturation function value for 1.2 p.u. input" annotation(Dialog(tab = "GENROU Parameters"));
  // EXAC2 Parameters
  parameter Real TR_ex = 0.1 "(sec)" annotation(Dialog(tab = "EXAC2 Parameters"));
  parameter Real TB_ex = 12 "(sec)" annotation(Dialog(tab = "EXAC2 Parameters"));
  parameter Real TC_ex = 10 "(sec)" annotation(Dialog(tab = "EXAC2 Parameters"));
  parameter Real KA_ex = 400 annotation(Dialog(tab = "EXAC2 Parameters"));
  parameter Real TA_ex = 5 "(sec)" annotation(Dialog(tab = "EXAC2 Parameters"));
  parameter Real VAMAX_ex = 5 "or zero" annotation(Dialog(tab = "EXAC2 Parameters"));
  parameter Real VAMIN_ex = -5 annotation(Dialog(tab = "EXAC2 Parameters"));
  parameter Real KB_ex = 0.4 annotation(Dialog(tab = "EXAC2 Parameters"));
  parameter Real VRMAX_ex = 5 "or zero" annotation(Dialog(tab = "EXAC2 Parameters"));
  parameter Real VRMIN_ex = -5 annotation(Dialog(tab = "EXAC2 Parameters"));
  parameter Real TE_ex = 0.08 "(sec)" annotation(Dialog(tab = "EXAC2 Parameters"));
  parameter Real KL_ex = 0.4 annotation(Dialog(tab = "EXAC2 Parameters"));
  parameter Real KH_ex = 0.4 annotation(Dialog(tab = "EXAC2 Parameters"));
  parameter Real KF_ex = 0.2 annotation(Dialog(tab = "EXAC2 Parameters"));
  parameter Real TF_ex = 1.2 "(>0) (sec)" annotation(Dialog(tab = "EXAC2 Parameters"));
  parameter Real KC_ex = 0.4 annotation(Dialog(tab = "EXAC2 Parameters"));
  parameter Real KD_ex = 0.4 annotation(Dialog(tab = "EXAC2 Parameters"));
  parameter Real KE_ex = 0.5 "or zero" annotation(Dialog(tab = "EXAC2 Parameters"));
  parameter Real VLR_ex = 4 annotation(Dialog(tab = "EXAC2 Parameters"));
  parameter Real E1_ex = 4 annotation(Dialog(tab = "EXAC2 Parameters"));
  parameter Real SE_E1_ex = 0.4 annotation(Dialog(tab = "EXAC2 Parameters"));
  parameter Real E2_ex = 5 annotation(Dialog(tab = "EXAC2 Parameters"));
  parameter Real SE_E2_ex = 0.5 annotation(Dialog(tab = "EXAC2 Parameters"));
  // GAST2A Parameters
  parameter String TG_ID = "M1" "Machine Identifier" annotation(Dialog(tab = "GAST2A Parameters"));
  parameter Real MBASE = SB "base Power, MVA" annotation(Dialog(tab = "GAST2A Parameters"));
  parameter Real W_tg = 10 "governor gain (1/droop) (on turbine rating)" annotation(Dialog(tab = "GAST2A Parameters"));
  parameter Real X_tg = 0.01 "governor lead time constant, sec." annotation(Dialog(tab = "GAST2A Parameters"));
  parameter Real Y_tg = 0.5 "(> 0) governor lag time constant, sec." annotation(Dialog(tab = "GAST2A Parameters"));
  parameter Real Z_tg = 0.1 "governor mode: 1 Droop, 0 ISO" annotation(Dialog(tab = "GAST2A Parameters"));
  parameter Real ETD_tg = 0.1 "sec" annotation(Dialog(tab = "GAST2A Parameters"));
  parameter Real TCD_tg = 0.01 "sec" annotation(Dialog(tab = "GAST2A Parameters"));
  parameter Real TRATE_tg = 100 "trubine rating, MW" annotation(Dialog(tab = "GAST2A Parameters"));
  parameter Real T_tg = 0.3 "sec" annotation(Dialog(tab = "GAST2A Parameters"));
  parameter Real MAX_tg = 6 "Maximum limit on turbine rating, p.u." annotation(Dialog(tab = "GAST2A Parameters"));
  parameter Real MIN_tg = -6 "Minimum limit on turbine rating, p.u." annotation(Dialog(tab = "GAST2A Parameters"));
  parameter Real ECR_tg = 0.1 "sec" annotation(Dialog(tab = "GAST2A Parameters"));
  parameter Real K3_tg = 0.1 annotation(Dialog(tab = "GAST2A Parameters"));
  parameter Real a_tg = 0.1 "(> 0) valve positioner" annotation(Dialog(tab = "GAST2A Parameters"));
  parameter Real b_tg = 0.5 "(> 0) valve positioner, sec." annotation(Dialog(tab = "GAST2A Parameters"));
  parameter Real c_tg = 0.1 "valve positioner" annotation(Dialog(tab = "GAST2A Parameters"));
  parameter Real Tf_tg = 0.04 "(> 0), sec" annotation(Dialog(tab = "GAST2A Parameters"));
  parameter Real Kf_tg = 0.04 annotation(Dialog(tab = "GAST2A Parameters"));
  parameter Real K5_tg = 0.02 annotation(Dialog(tab = "GAST2A Parameters"));
  parameter Real K4_tg = 2 annotation(Dialog(tab = "GAST2A Parameters"));
  parameter Real T3_tg = 5 "(> 0), sec" annotation(Dialog(tab = "GAST2A Parameters"));
  parameter Real T4_tg = 0.25 "(> 0), sec" annotation(Dialog(tab = "GAST2A Parameters"));
  parameter Real Tt_tg = 150 "(> 0)" annotation(Dialog(tab = "GAST2A Parameters"));
  parameter Real T5_tg = 0.3 "(> 0), sec" annotation(Dialog(tab = "GAST2A Parameters"));
  parameter Real af1_tg = 100 annotation(Dialog(tab = "GAST2A Parameters"));
  parameter Real bf1_tg = 150 annotation(Dialog(tab = "GAST2A Parameters"));
  parameter Real af2_tg = -0.2 annotation(Dialog(tab = "GAST2A Parameters"));
  parameter Real bf2_tg = 0.3 annotation(Dialog(tab = "GAST2A Parameters"));
  parameter Real cf2_tg = 0.1 annotation(Dialog(tab = "GAST2A Parameters"));
  parameter Real TR_T_tg = 250 "Rated temperature" annotation(Dialog(tab = "GAST2A Parameters"));
  parameter Real K6_tg = 0.03 "Minimum fuel flow, p.u." annotation(Dialog(tab = "GAST2A Parameters"));
  parameter Real TC_T_tg = 150 "Temperature control" annotation(Dialog(tab = "GAST2A Parameters"));
// <<< AUTOGEN PARAMS (VERBATIM FROM MODELSETS) END

end GENROU_EXAC2_GAST2A;
