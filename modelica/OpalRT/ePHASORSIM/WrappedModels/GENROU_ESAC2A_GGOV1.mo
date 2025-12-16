within OpalRT.ePHASORSIM.WrappedModels;
block GENROU_ESAC2A_GGOV1
  extends Wrappers.FMUTemplateVRefGRef(redeclare ModelSets.TypeD.GENROU_ESAC2A_GGOV1 modelSet(
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
  // GGOV1 Parameters
  parameter Real R_tg = 0.5 "Permanent droop (pu)" annotation(Dialog(tab = "GGOV1"));
  parameter Real Tpelec_tg = 0.6 "Electrical power transducer time constant (sec)" annotation(Dialog(tab = "GGOV1"));
  parameter Real maxerr_tg = 0.025 "Maximum value for speed error signal" annotation(Dialog(tab = "GGOV1"));
  parameter Real minerr_tg = -0.025 "Minimum value for speed error signal" annotation(Dialog(tab = "GGOV1"));
  parameter Real Kpgov_tg = 6 "Governor proportional gain" annotation(Dialog(tab = "GGOV1"));
  parameter Real Kigov_tg = 0.22 "Governor integral gain" annotation(Dialog(tab = "GGOV1"));
  parameter Real Kdgov_tg = 0 "Governor derivative gain" annotation(Dialog(tab = "GGOV1"));
  parameter Real Tdgov_tg = 1 "Governor derivative controller time constant (sec)" annotation(Dialog(tab = "GGOV1"));
  parameter Real vmax_tg = 1 "Maximum valve position limit" annotation(Dialog(tab = "GGOV1"));
  parameter Real vmin_tg = 0.24 "Minimum valve position limit" annotation(Dialog(tab = "GGOV1"));
  parameter Real Tact_tg = 0.6 "Actuator time constant (sec)" annotation(Dialog(tab = "GGOV1"));
  parameter Real Kturb_tg = 1.5 "Turbine gain" annotation(Dialog(tab = "GGOV1"));
  parameter Real Wfnl_tg = 0.25 "No load fuel flow (pu)" annotation(Dialog(tab = "GGOV1"));
  parameter Real Tb_tg = 1 "Turbine lag time constant (sec)" annotation(Dialog(tab = "GGOV1"));
  parameter Real Tc_tg = 1.1 "Turbine lead time constant (sec)" annotation(Dialog(tab = "GGOV1"));
  parameter Real Teng_tg = 0 "Transport lag time constant for diesel engine (sec)" annotation(Dialog(tab = "GGOV1"));
  parameter Real Tfload_tg = 0.3 "Load Limiter time constant (sec)" annotation(Dialog(tab = "GGOV1"));
  parameter Real Kpload_tg = 1.2 "Load limiter proportional gain for PI controller" annotation(Dialog(tab = "GGOV1"));
  parameter Real Kiload_tg = 3.3 "Load limiter integral gain for PI controller" annotation(Dialog(tab = "GGOV1"));
  parameter Real Ldref_tg = 1 "Load limiter reference value (pu)" annotation(Dialog(tab = "GGOV1"));
  parameter Real Dm_tg = -0.5 "Mechanical damping coefficient (pu)" annotation(Dialog(tab = "GGOV1"));
  parameter Real Ropen_tg = 99 "Maximum valve opening rate (pu/sec)" annotation(Dialog(tab = "GGOV1"));
  parameter Real Rclose_tg = -99 "Maximum valve closing rate (pu/sec)" annotation(Dialog(tab = "GGOV1"));
  parameter Real Kimw_tg = 0.01 "Power controller (reset) gain" annotation(Dialog(tab = "GGOV1"));
  parameter Real Aset_tg = 99 "Acceleration limiter setpoint (pu/sec)" annotation(Dialog(tab = "GGOV1"));
  parameter Real Ka_tg = 10 "Acceleration limiter gain" annotation(Dialog(tab = "GGOV1"));
  parameter Real Ta_tg = 1 "Acceleration limiter time constant( > 0) (sec)" annotation(Dialog(tab = "GGOV1"));
  parameter Real Trate_tg = 200 "Turbine rating (MW)" annotation(Dialog(tab = "GGOV1"));
  parameter Real db_tg = 0 "Speed governor deadband" annotation(Dialog(tab = "GGOV1"));
  parameter Real Tsa_tg = 1 "Temperature detection lead time constant (sec)" annotation(Dialog(tab = "GGOV1"));
  parameter Real Tsb_tg = 1 "Temperature detection lag time constant (sec)" annotation(Dialog(tab = "GGOV1"));
  parameter Real Rup_tg = 99 "Maximum rate of load limit increase" annotation(Dialog(tab = "GGOV1"));
  parameter Real Rdown_tg = -99 "Maximum rate of load limit decrease" annotation(Dialog(tab = "GGOV1"));
  parameter Real Rselect_tg = 1 "ICON(M), Feedback signal for governor droop" annotation(Dialog(tab = "GGOV1"));
  parameter Real Flag_tg = 1 "ICON(M+1),Switch for fuel source characteristic" annotation(Dialog(tab = "GGOV1"));
  parameter Real DELTA_tg = 0.01 "Simulation sample time, sec." annotation(Dialog(tab = "GGOV1"));
  //
// <<< AUTOGEN PARAMS (VERBATIM FROM MODELSETS) END

end GENROU_ESAC2A_GGOV1;
