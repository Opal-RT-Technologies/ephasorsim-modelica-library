within OpalRT.ePHASORSIM.WrappedModels;
block GENROU_ESST4B_IEEEST_GGOV1
  extends Wrappers.FMUTemplateVRefGRef(redeclare ModelSets.TypeF.GENROU_ESST4B_IEEEST_GGOV1 modelSet(
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
      M1_pss = M1_pss,
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
      DELTA_tg = DELTA_tg,
      TR_ex = TR_ex,
      KPR_ex = KPR_ex,
      KIR_ex = KIR_ex,
      VRMAX_ex = VRMAX_ex,
      VRMIN_ex = VRMIN_ex,
      TA_ex = TA_ex,
      KPM_ex = KPM_ex,
      KIM_ex = KIM_ex,
      VMMAX_ex = VMMAX_ex,
      VMMIN_ex = VMMIN_ex,
      KG_ex = KG_ex,
      KP_ex = KP_ex,
      KI_ex = KI_ex,
      VBMAX_ex = VBMAX_ex,
      KC_ex = KC_ex,
      XL_ex = XL_ex,
      THETAP_ex = THETAP_ex));

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
  // IEEEST Parameters
  parameter Real A1_pss = 0 annotation(Dialog(tab = "IEEEST Parameters"));
  parameter Real A2_pss = 0 annotation(Dialog(tab = "IEEEST Parameters"));
  parameter Real A3_pss = 0 annotation(Dialog(tab = "IEEEST Parameters"));
  parameter Real A4_pss = 0 annotation(Dialog(tab = "IEEEST Parameters"));
  parameter Real A5_pss = 0 annotation(Dialog(tab = "IEEEST Parameters"));
  parameter Real A6_pss = 0 annotation(Dialog(tab = "IEEEST Parameters"));
  parameter Real T1_pss = 0.03 "(sec)" annotation(Dialog(tab = "IEEEST Parameters"));
  parameter Real T2_pss = 0.01 "(sec)" annotation(Dialog(tab = "IEEEST Parameters"));
  parameter Real T3_pss = 0.02 "(sec)" annotation(Dialog(tab = "IEEEST Parameters"));
  parameter Real T4_pss = 0.01 "(sec)" annotation(Dialog(tab = "IEEEST Parameters"));
  parameter Real T5_pss = 0.2 "(sec)" annotation(Dialog(tab = "IEEEST Parameters"));
  parameter Real T6_pss = 0.1 "(>0)(sec)" annotation(Dialog(tab = "IEEEST Parameters"));
  parameter Real KS_pss = -5 annotation(Dialog(tab = "IEEEST Parameters"));
  parameter Real LSMAX_pss = 6 annotation(Dialog(tab = "IEEEST Parameters"));
  parameter Real LSMIN_pss = -6 annotation(Dialog(tab = "IEEEST Parameters"));
  parameter Real VCU_pss = 1 "(pu) (if equal zero, ignored)" annotation(Dialog(tab = "IEEEST Parameters"));
  parameter Real VCL_pss = 1 "(pu) (if equal zero, ignored)" annotation(Dialog(tab = "IEEEST Parameters"));
  // IEEEST ICONs
  parameter Real M0_pss = 1 "Stabilizer input code" annotation(Dialog(tab = "IEEEST Parameters", group = "ICONs"));
  parameter Real M1_pss = 1 "IB, remote bus number" annotation(Dialog(tab = "IEEEST Parameters", group = "ICONs"));
  // GGOV1 parameters
  parameter Real R_tg = 0.5 "Permanent droop (pu)";
  parameter Real Tpelec_tg = 0.6 "Electrical power transducer time constant (sec)";
  parameter Real maxerr_tg = 0.025 "Maximum value for speed error signal";
  parameter Real minerr_tg = -0.025 "Minimum value for speed error signal";
  parameter Real Kpgov_tg = 6 "Governor proportional gain";
  parameter Real Kigov_tg = 0.22 "Governor integral gain";
  parameter Real Kdgov_tg = 0 "Governor derivative gain";
  parameter Real Tdgov_tg = 1 "Governor derivative controller time constant (sec)";
  parameter Real vmax_tg = 1 "Maximum valve position limit";
  parameter Real vmin_tg = 0.24 "Minimum valve position limit";
  parameter Real Tact_tg = 0.6 "Actuator time constant (sec)";
  parameter Real Kturb_tg = 1.5 "Turbine gain";
  parameter Real Wfnl_tg = 0.25 "No load fuel flow (pu)";
  parameter Real Tb_tg = 1 "Turbine lag time constant (sec)";
  parameter Real Tc_tg = 1.1 "Turbine lead time constant (sec)";
  parameter Real Teng_tg = 0 "Transport lag time constant for diesel engine (sec)";
  parameter Real Tfload_tg = 0.3 "Load Limiter time constant (sec)";
  parameter Real Kpload_tg = 1.2 "Load limiter proportional gain for PI controller";
  parameter Real Kiload_tg = 3.3 "Load limiter integral gain for PI controller";
  parameter Real Ldref_tg = 1 "Load limiter reference value (pu)";
  parameter Real Dm_tg = -0.5 "Mechanical damping coefficient (pu)";
  parameter Real Ropen_tg = 99 "Maximum valve opening rate (pu/sec)";
  parameter Real Rclose_tg = -99 "Maximum valve closing rate (pu/sec)";
  parameter Real Kimw_tg = 0.01 "Power controller (reset) gain";
  parameter Real Aset_tg = 99 "Acceleration limiter setpoint (pu/sec)";
  parameter Real Ka_tg = 10 "Acceleration limiter gain";
  parameter Real Ta_tg = 1 "Acceleration limiter time constant( > 0) (sec)";
  parameter Real Trate_tg = 200 "Turbine rating (MW)";
  parameter Real db_tg = 0 "Speed governor deadband";
  parameter Real Tsa_tg = 1 "Temperature detection lead time constant (sec)";
  parameter Real Tsb_tg = 1 "Temperature detection lag time constant (sec)";
  parameter Real Rup_tg = 99 "Maximum rate of load limit increase";
  parameter Real Rdown_tg = -99 "Maximum rate of load limit decrease";
  parameter Real Rselect_tg = 1 "ICON(M), Feedback signal for governor droop";
  parameter Real Flag_tg = 1 "ICON(M+1),Switch for fuel source characteristic";
  parameter Real DELTA_tg = 0.01 "Simulation sample time, sec.";
  // ESST4B Parameters
  parameter Real TR_ex = 0.02 annotation(Dialog(tab = "ESST4B Parameters"));
  parameter Real KPR_ex = 1 annotation(Dialog(tab = "ESST4B Parameters"));
  parameter Real KIR_ex = 0.03 annotation(Dialog(tab = "ESST4B Parameters"));
  parameter Real VRMAX_ex = 10 annotation(Dialog(tab = "ESST4B Parameters"));
  parameter Real VRMIN_ex = -10 annotation(Dialog(tab = "ESST4B Parameters"));
  parameter Real TA_ex = 0.2 annotation(Dialog(tab = "ESST4B Parameters"));
  parameter Real KPM_ex = 0.02 annotation(Dialog(tab = "ESST4B Parameters"));
  parameter Real KIM_ex = 0.02 annotation(Dialog(tab = "ESST4B Parameters"));
  parameter Real VMMAX_ex = 0.02 annotation(Dialog(tab = "ESST4B Parameters"));
  parameter Real VMMIN_ex = 0.02 annotation(Dialog(tab = "ESST4B Parameters"));
  parameter Real KG_ex = 0.02 annotation(Dialog(tab = "ESST4B Parameters"));
  parameter Real KP_ex = 0.02 annotation(Dialog(tab = "ESST4B Parameters"));
  parameter Real KI_ex = 0.02 annotation(Dialog(tab = "ESST4B Parameters"));
  parameter Real VBMAX_ex = 0.02 annotation(Dialog(tab = "ESST4B Parameters"));
  parameter Real KC_ex = 0.02 annotation(Dialog(tab = "ESST4B Parameters"));
  parameter Real XL_ex = 0.02 annotation(Dialog(tab = "ESST4B Parameters"));
  parameter Real THETAP_ex = 0.52 annotation(Dialog(tab = "ESST4B Parameters"));
// <<< AUTOGEN PARAMS (VERBATIM FROM MODELSETS) END


end GENROU_ESST4B_IEEEST_GGOV1;
