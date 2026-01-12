within OpalRT.ModelSets.TypeJ;
model GENROU_AC8B_GGOV1_MAXEX2
  extends GenUnitTypeJ1(redeclare Electrical.Machine.SynchronousMachine.GENROU synchronousGenerator(
      IBUS = IBUS,
      ID = M_ID,
      P_gen = P_gen,
      Q_gen = Q_gen,
      Vt_abs = Vt_abs,
      Vt_ang = Vt_ang,
      SB = SB,
      fn = fn,
      ZSOURCE_RE= ZSOURCE_RE,
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
      S12 = S12), redeclare Electrical.Control.Excitation.AC8B exciter(
      TR = TR_ex,
      KPR = KPR_ex,
      KIR = KIR_ex,
      KDR = KDR_ex,
      TDR = TDR_ex,
      VPIDMAX = VPIDMAX_ex,
      VPIDMIN = VPIDMIN_ex,
      KA = KA_ex,
      TA = TA_ex,
      VRMAX = VRMAX_ex,
      VRMIN = VRMIN_ex,
      KC = KC_ex,
      KD = KD_ex,
      KE = KE_ex,
      TE = TE_ex,
      VFEMAX = VFEMAX_ex,
      VEMIN = VEMIN_ex,
      E1 = E1_ex,
      SE_E1 = SE_E1_ex,
      E2 = E2_ex,
      SE_E2 = SE_E2_ex), redeclare Electrical.Control.TurbineGovernor.GGOV1 turbineGovernor(
      R = R_tg,
      Tpelec = Tpelec_tg,
      maxerr = maxerr_tg,
      minerr = minerr_tg,
      Kpgov = Kpgov_tg,
      Kigov = Kigov_tg,
      Kdgov = Kdgov_tg,
      Tdgov = Tdgov_tg,
      vmax = vmax_tg,
      vmin = vmin_tg,
      Tact = Tact_tg,
      Kturb = Kturb_tg,
      Wfnl = Wfnl_tg,
      Tb = Tb_tg,
      Tc = Tc_tg,
      Teng = Teng_tg,
      Tfload = Tfload_tg,
      Kpload = Kpload_tg,
      Kiload = Kiload_tg,
      Ldref = Ldref_tg,
      Dm = Dm_tg,
      Ropen = Ropen_tg,
      Rclose = Rclose_tg,
      Kimw = Kimw_tg,
      Aset = Aset_tg,
      Ka = Ka_tg,
      Ta = Ta_tg,
      Trate = Trate_tg,
      db = db_tg,
      Tsa = Tsa_tg,
      Tsb = Tsb_tg,
      Rup = Rup_tg,
      Rdown = Rdown_tg,
      Rselect = Rselect_tg,
      Flag = Flag_tg,
      DELTA = DELTA_tg), redeclare Electrical.Control.OverExcitationLimiter.MAXEX2 oel(
      EFDRATED = EFDRATED_OEL,
      EFD1 = EFD1_OEL,
      TIME1 = TIME1_OEL,
      EFD2 = EFD2_OEL,
      TIME2 = TIME2_OEL,
      EFD3 = EFD3_OEL,
      TIME3 = TIME3_OEL,
      EFDDES = EFDDES_OEL,
      KMX = KMX_OEL,
      VLOW = VLOW_OEL,
      ICONM = ICONM_OEL));

  // -------- General (placement & operating point) --------------------
  parameter Integer IBUS = 100 "Located system bus" annotation(Dialog(tab = "General"));
  parameter String M_ID = "M1" "Machine Identifier" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real P_gen = 1100 "Bus Active Power, MW" annotation(Dialog(tab = "General"));
  parameter Real Q_gen = 342.702 "Bus Reactive Power, MVAR" annotation(Dialog(tab = "General"));
  parameter Real Vt_abs = 1.03 "Bus Voltage Magnitude, p.u." annotation(Dialog(tab = "General"));
  parameter Real Vt_ang = -10.96 "Bus Voltage Angle, deg." annotation(Dialog(tab = "General"));
  parameter Real SB = 1000 "Machine Base Power, MVA" annotation(Dialog(tab = "General"));
  parameter Real fn = 50 "Nominal frequency" annotation(Dialog(tab = "General"));

  // -------- Machine (GENROU) ----------------------------------------
  parameter Real ZSOURCE_RE = 0 "Machine source impedence" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Tdo_p = 7 "d-axis transient time constant" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Tdo_s = 0.03 "d-axis sub-transient time constant, s" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Tqo_p = 0.7 "q-axis transient time constant, s" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Tqo_s = 0.04 "q-axis sub-transient time constant, s" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real H = 50 "Inertia constant" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real D = 0 "Speed damping" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xd = 0.2 "d-axis reactance, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xq = 0.19 "q-axis reactance, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xd_p = 0.06 "d-axis transient reactance, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xq_p = 0.06 "q-axis transient reactance, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xd_s = 0.02 "d-axis sub-transient reactance, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xl = 0.03 "Leakage reactance, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real S1 = 0.4 "Saturation function value at 1.0 p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real S12 = 0.8 "Saturation function value at 1.2 p.u." annotation(Dialog(tab = "GENROU Parameters"));

  // -------- Exciter (AC8B) ------------------------------------------
  parameter Real TR_ex = 0.02 "Regulator input filter time constant (sec)" annotation(Dialog(tab = "AC8B Parameters"));
  parameter Real KPR_ex = 10 "(pu) (> 0) voltage regulator proportional gain" annotation(Dialog(tab = "AC8B Parameters"));
  parameter Real KIR_ex = 0.01 "(pu) voltage regulator integral gain" annotation(Dialog(tab = "AC8B Parameters"));
  parameter Real KDR_ex = 2 "(pu) voltage regulator derivative gain" annotation(Dialog(tab = "AC8B Parameters"));
  parameter Real TDR_ex = 2 "Derivative channel time constant (sec)" annotation(Dialog(tab = "AC8B Parameters"));
  parameter Real VPIDMAX_ex = 1 "PID maximum limit" annotation(Dialog(tab = "AC8B Parameters"));
  parameter Real VPIDMIN_ex = -1 "PID minimum limit" annotation(Dialog(tab = "AC8B Parameters"));
  parameter Real KA_ex = 10 "(pu) voltage regulator gain" annotation(Dialog(tab = "AC8B Parameters"));
  parameter Real TA_ex = 0.02 "(sec) regulator time constant" annotation(Dialog(tab = "AC8B Parameters"));
  parameter Real VRMAX_ex = 10 "(pu) Voltage regulator output maximum limit" annotation(Dialog(tab = "AC8B Parameters"));
  parameter Real VRMIN_ex = -10 "(pu) Voltage regulator output minimum limit" annotation(Dialog(tab = "AC8B Parameters"));
  parameter Real KC_ex = 0.02 "Rectifier loading factor proportional to commutating reactance" annotation(Dialog(tab = "AC8B Parameters"));
  parameter Real KD_ex = 0.02 "Demagnetizing factor (function of AC exciter reactances)" annotation(Dialog(tab = "AC8B Parameters"));
  parameter Real KE_ex = 1 "Exciter constant related to self-excited field" annotation(Dialog(tab = "AC8B Parameters"));
  parameter Real TE_ex = 0.02 "Exciter time constant (>0)" annotation(Dialog(tab = "AC8B Parameters"));
  parameter Real VFEMAX_ex = 10 "Exciter field current limit (> 0)" annotation(Dialog(tab = "AC8B Parameters"));
  parameter Real VEMIN_ex = -10 "Minimum exciter voltage output" annotation(Dialog(tab = "AC8B Parameters"));
  parameter Real E1_ex = 4 "Exciter voltage @ saturation point E1" annotation(Dialog(tab = "AC8B Parameters"));
  parameter Real SE_E1_ex = 0.4 "Exciter saturation function value at E1" annotation(Dialog(tab = "AC8B Parameters"));
  parameter Real E2_ex = 5 "Exciter voltage @ saturation point E2" annotation(Dialog(tab = "AC8B Parameters"));
  parameter Real SE_E2_ex = 0.5 "Exciter saturation function value at E2" annotation(Dialog(tab = "AC8B Parameters"));

  // -------- Turbine-governor (GGOV1) ------------------------------------------
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

  // -------- OEL (MAXEX2) --------------------------------------------
  parameter Real EFDRATED_OEL = 2.8 annotation(Dialog(tab = "MAXEX2"));
  parameter Real EFD1_OEL = 1.2 annotation(Dialog(tab = "MAXEX2"));
  parameter Real TIME1_OEL = 50 annotation(Dialog(tab = "MAXEX2"));
  parameter Real EFD2_OEL = 1.3 annotation(Dialog(tab = "MAXEX2"));
  parameter Real TIME2_OEL = 30 annotation(Dialog(tab = "MAXEX2"));
  parameter Real EFD3_OEL = 1.5 annotation(Dialog(tab = "MAXEX2"));
  parameter Real TIME3_OEL = 5 annotation(Dialog(tab = "MAXEX2"));
  parameter Real EFDDES_OEL = 1.0 annotation(Dialog(tab = "MAXEX2"));
  parameter Real KMX_OEL = 1.5 annotation(Dialog(tab = "MAXEX2"));
  parameter Real VLOW_OEL = -0.1 annotation(Dialog(tab = "MAXEX2"));
  parameter Real ICONM_OEL = 0 annotation(Dialog(tab = "MAXEX2", group = "ICONs"));

end GENROU_AC8B_GGOV1_MAXEX2;
