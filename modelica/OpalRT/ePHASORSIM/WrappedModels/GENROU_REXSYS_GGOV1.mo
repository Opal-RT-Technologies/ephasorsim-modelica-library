within OpalRT.ePHASORSIM.WrappedModels;
block GENROU_REXSYS_GGOV1
  extends Wrappers.FMUTemplateVRefGRef(redeclare ModelSets.TypeD.GENROU_REXSYS_GGOV1 modelSet(
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
      ZSOURCE_IM = ZSOURCE_IM,
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
      KVP_ex = KVP_ex,
      KVI_ex = KVI_ex,
      VIMAX_ex = VIMAX_ex,
      TA_ex = TA_ex,
      TB1_ex = TB1_ex,
      TC1_ex = TC1_ex,
      TB2_ex = TB2_ex,
      TC2_ex = TC2_ex,
      VRMAX_ex = VRMAX_ex,
      VRMIN_ex = VRMIN_ex,
      KF_ex = KF_ex,
      TF_ex = TF_ex,
      TF1_ex = TF1_ex,
      TF2_ex = TF2_ex,
      FBF_ex = FBF_ex,
      KIP_ex = KIP_ex,
      KII_ex = KII_ex,
      TP_ex = TP_ex,
      VFMAX_ex = VFMAX_ex,
      VFMIN_ex = VFMIN_ex,
      KH_ex = KH_ex,
      KE_ex = KE_ex,
      TE_ex = TE_ex,
      KC_ex = KC_ex,
      KD_ex = KD_ex,
      E1_ex = E1_ex,
      SE_E1_ex = SE_E1_ex,
      E2_ex = E2_ex,
      SE_E2_ex = SE_E2_ex,
      F1IMF_ex = F1IMF_ex,
      R_tg = R_tg,
      Tpelec_tg = Tpelec_tg,
      maxerr_tg = maxerr_tg,
      minerr_tg = minerr_tg,
      Kpgov_tg = Kpgov_tg,
      Kigov_tg = Kigov_tg,
      Kdgov_tg = Kdgov_tg,
      Tdgov_tg = Tdgov_tg,
      vmax_tg = vmax_tg,
      vmin_tg = vmin_tg,
      Tact_tg = Tact_tg,
      Kturb_tg = Kturb_tg,
      Wfnl_tg = Wfnl_tg,
      Tb_tg = Tb_tg,
      Tc_tg = Tc_tg,
      Teng_tg = Teng_tg,
      Tfload_tg = Tfload_tg,
      Kpload_tg = Kpload_tg,
      Kiload_tg = Kiload_tg,
      Ldref_tg = Ldref_tg,
      Dm_tg = Dm_tg,
      Ropen_tg = Ropen_tg,
      Rclose_tg = Rclose_tg,
      Kimw_tg = Kimw_tg,
      Aset_tg = Aset_tg,
      Ka_tg = Ka_tg,
      Ta_tg = Ta_tg,
      Trate_tg = Trate_tg,
      db_tg = db_tg,
      Tsa_tg = Tsa_tg,
      Tsb_tg = Tsb_tg,
      Rup_tg = Rup_tg,
      Rdown_tg = Rdown_tg,
      Rselect_tg = Rselect_tg,
      Flag_tg = Flag_tg,
      DELTA_tg = DELTA_tg));

// >>> AUTOGEN PARAMS (VERBATIM FROM MODELSETS) BEGIN
  parameter Real partType = 1;
  // GENROU Parameters
  parameter Integer IBUS = 100 "Located system bus" annotation(Dialog(tab = "General"));
  parameter String ID = "M1" "Machine Identifier" annotation(Dialog(tab = "General"));
  parameter Real P_gen = 1100 "Bus Active Power, MW" annotation(Dialog(tab = "General"));
  parameter Real Q_gen = 342.702 "Bus Reactive Power, MVAR" annotation(Dialog(tab = "General"));
  parameter Real Vt_abs = 1.03 "Bus Voltage Magnitude, p.u." annotation(Dialog(tab = "General"));
  parameter Real Vt_ang = -10.96 "Bus Voltage Angle, deg." annotation(Dialog(tab = "General"));
  parameter Real SB = 1000 "Machine Base Power, MVA" annotation(Dialog(tab = "General"));
  parameter Real fn = 50 "Nominal frequency" annotation(Dialog(tab = "General"));
  parameter Real ZSOURCE_RE = 0 "Machine source impedence" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real ZSOURCE_IM = Xd_s "Machine source impedence" annotation(Dialog(tab = "GENROU Parameters"));
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
  //REXSYS
  parameter Real TR_ex = 0.02 "voltage transducer time constant (sec) " annotation(Dialog(tab = "REXSYS Parameters"));
  parameter Real KVP_ex = 600 "voltage regulator proportional gain " annotation(Dialog(tab = "REXSYS Parameters"));
  parameter Real KVI_ex = 0.5 "voltage regulator integral gain " annotation(Dialog(tab = "REXSYS Parameters"));
  parameter Real VIMAX_ex = 0.2 "voltage regulator input limit (pu) " annotation(Dialog(tab = "REXSYS Parameters"));
  parameter Real TA_ex = 0.02 "voltage regulator time constant (sec) " annotation(Dialog(tab = "REXSYS Parameters"));
  parameter Real TB1_ex = 1 "lag-time constant (sec) " annotation(Dialog(tab = "REXSYS Parameters"));
  parameter Real TC1_ex = 10 "lead-time constant (sec) " annotation(Dialog(tab = "REXSYS Parameters"));
  parameter Real TB2_ex = 1.0 "lag-time constant (sec) " annotation(Dialog(tab = "REXSYS Parameters"));
  parameter Real TC2_ex = 1.0 "lead-time constant (sec) " annotation(Dialog(tab = "REXSYS Parameters"));
  parameter Real VRMAX_ex = 10 "maximum controller output (pu) " annotation(Dialog(tab = "REXSYS Parameters"));
  parameter Real VRMIN_ex = -10 "minimum controller output (pu) " annotation(Dialog(tab = "REXSYS Parameters"));
  parameter Real KF_ex = 0.045 "rate feedback gain " annotation(Dialog(tab = "REXSYS Parameters"));
  parameter Real TF_ex = 5 "rate feedback >0 time constant (sec) " annotation(Dialog(tab = "REXSYS Parameters"));
  parameter Real TF1_ex = 1 "feedback lead-time constant (sec) " annotation(Dialog(tab = "REXSYS Parameters"));
  parameter Real TF2_ex = 1 "feedback lag-time constant (sec) " annotation(Dialog(tab = "REXSYS Parameters"));
  parameter Real FBF_ex = 1 "rate feedback signal flag " annotation(Dialog(tab = "REXSYS Parameters"));
  parameter Real KIP_ex = 5.0 "field current regulator proportional gain " annotation(Dialog(tab = "REXSYS Parameters"));
  parameter Real KII_ex = 0.5 "field current regulator integral gain " annotation(Dialog(tab = "REXSYS Parameters"));
  parameter Real TP_ex = 0.5 "field current bridge time constant (sec) " annotation(Dialog(tab = "REXSYS Parameters"));
  parameter Real VFMAX_ex = 99 "maximum exciter field current (pu " annotation(Dialog(tab = "REXSYS Parameters"));
  parameter Real VFMIN_ex = -99 "minimum exciter field current (pu) " annotation(Dialog(tab = "REXSYS Parameters"));
  parameter Real KH_ex = 0.5 "field voltage controller feedback gain " annotation(Dialog(tab = "REXSYS Parameters"));
  parameter Real KE_ex = 0.4 "exciter field proportional constant" annotation(Dialog(tab = "REXSYS Parameters"));
  parameter Real TE_ex = 1.2 "exciter field time constant (sec >0)" annotation(Dialog(tab = "REXSYS Parameters"));
  parameter Real KC_ex = 0.5 "rectifier regulation factor (pu)" annotation(Dialog(tab = "REXSYS Parameters"));
  parameter Real KD_ex = 0.7 "exciter regulation factor (pu)" annotation(Dialog(tab = "REXSYS Parameters"));
  parameter Real E1_ex = 2.4 "exciter flux at knee of curve (pu) " annotation(Dialog(tab = "REXSYS Parameters"));
  parameter Real SE_E1_ex = 0.05 "saturation factor at knee" annotation(Dialog(tab = "REXSYS Parameters"));
  parameter Real E2_ex = 3.2 "maximum exciter (pu)" annotation(Dialog(tab = "REXSYS Parameters"));
  parameter Real SE_E2_ex = 0.3 "saturation factor at maximum flux" annotation(Dialog(tab = "REXSYS Parameters"));
  parameter Real F1IMF_ex = 0.5 "power supply limit factor" annotation(Dialog(tab = "REXSYS Parameters"));
  // GGOV1 parameters
  parameter Real R_tg = 0.5 "Permanent droop (pu)" annotation(Dialog(tab = "GGOV1 parameters"));
  parameter Real Tpelec_tg = 0.6 "Electrical power transducer time constant (sec)" annotation(Dialog(tab = "GGOV1 parameters"));
  parameter Real maxerr_tg = 0.025 "Maximum value for speed error signal" annotation(Dialog(tab = "GGOV1 parameters"));
  parameter Real minerr_tg = -0.025 "Minimum value for speed error signal" annotation(Dialog(tab = "GGOV1 parameters"));
  parameter Real Kpgov_tg = 6 "Governor proportional gain" annotation(Dialog(tab = "GGOV1 parameters"));
  parameter Real Kigov_tg = 0.22 "Governor integral gain" annotation(Dialog(tab = "GGOV1 parameters"));
  parameter Real Kdgov_tg = 0 "Governor derivative gain" annotation(Dialog(tab = "GGOV1 parameters"));
  parameter Real Tdgov_tg = 1 "Governor derivative controller time constant (sec)" annotation(Dialog(tab = "GGOV1 parameters"));
  parameter Real vmax_tg = 1 "Maximum valve position limit" annotation(Dialog(tab = "GGOV1 parameters"));
  parameter Real vmin_tg = 0.24 "Minimum valve position limit" annotation(Dialog(tab = "GGOV1 parameters"));
  parameter Real Tact_tg = 0.6 "Actuator time constant (sec)" annotation(Dialog(tab = "GGOV1 parameters"));
  parameter Real Kturb_tg = 1.5 "Turbine gain" annotation(Dialog(tab = "GGOV1 parameters"));
  parameter Real Wfnl_tg = 0.25 "No load fuel flow (pu)" annotation(Dialog(tab = "GGOV1 parameters"));
  parameter Real Tb_tg = 1 "Turbine lag time constant (sec)" annotation(Dialog(tab = "GGOV1 parameters"));
  parameter Real Tc_tg = 1.1 "Turbine lead time constant (sec)" annotation(Dialog(tab = "GGOV1 parameters"));
  parameter Real Teng_tg = 0 "Transport lag time constant for diesel engine (sec)" annotation(Dialog(tab = "GGOV1 parameters"));
  parameter Real Tfload_tg = 0.3 "Load Limiter time constant (sec)" annotation(Dialog(tab = "GGOV1 parameters"));
  parameter Real Kpload_tg = 1.2 "Load limiter proportional gain for PI controller" annotation(Dialog(tab = "GGOV1 parameters"));
  parameter Real Kiload_tg = 3.3 "Load limiter integral gain for PI controller" annotation(Dialog(tab = "GGOV1 parameters"));
  parameter Real Ldref_tg = 1 "Load limiter reference value (pu)" annotation(Dialog(tab = "GGOV1 parameters"));
  parameter Real Dm_tg = -0.5 "Mechanical damping coefficient (pu)" annotation(Dialog(tab = "GGOV1 parameters"));
  parameter Real Ropen_tg = 99 "Maximum valve opening rate (pu/sec)" annotation(Dialog(tab = "GGOV1 parameters"));
  parameter Real Rclose_tg = -99 "Maximum valve closing rate (pu/sec)" annotation(Dialog(tab = "GGOV1 parameters"));
  parameter Real Kimw_tg = 0.01 "Power controller (reset) gain" annotation(Dialog(tab = "GGOV1 parameters"));
  parameter Real Aset_tg = 99 "Acceleration limiter setpoint (pu/sec)" annotation(Dialog(tab = "GGOV1 parameters"));
  parameter Real Ka_tg = 10 "Acceleration limiter gain" annotation(Dialog(tab = "GGOV1 parameters"));
  parameter Real Ta_tg = 1 "Acceleration limiter time constant( > 0) (sec)" annotation(Dialog(tab = "GGOV1 parameters"));
  parameter Real Trate_tg = 200 "Turbine rating (MW)" annotation(Dialog(tab = "GGOV1 parameters"));
  parameter Real db_tg = 0 "Speed governor deadband" annotation(Dialog(tab = "GGOV1 parameters"));
  parameter Real Tsa_tg = 1 "Temperature detection lead time constant (sec)" annotation(Dialog(tab = "GGOV1 parameters"));
  parameter Real Tsb_tg = 1 "Temperature detection lag time constant (sec)" annotation(Dialog(tab = "GGOV1 parameters"));
  parameter Real Rup_tg = 99 "Maximum rate of load limit increase" annotation(Dialog(tab = "GGOV1 parameters"));
  parameter Real Rdown_tg = -99 "Maximum rate of load limit decrease" annotation(Dialog(tab = "GGOV1 parameters"));
  parameter Real Rselect_tg = 1 "ICON(M), Feedback signal for governor droop" annotation(Dialog(tab = "GGOV1 parameters"));
  parameter Real Flag_tg = 1 "ICON(M+1),Switch for fuel source characteristic" annotation(Dialog(tab = "GGOV1 parameters"));
  parameter Real DELTA_tg = 0.01 "Simulation sample time, sec." annotation(Dialog(tab = "GGOV1 parameters"));
// <<< AUTOGEN PARAMS (VERBATIM FROM MODELSETS) END

end GENROU_REXSYS_GGOV1;
