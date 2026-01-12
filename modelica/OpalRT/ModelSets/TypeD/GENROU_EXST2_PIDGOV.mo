within OpalRT.ModelSets.TypeD;
model GENROU_EXST2_PIDGOV
  extends GenUnitTypeD1(redeclare Electrical.Machine.SynchronousMachine.GENROU synchronousGenerator(
      ID = M_ID,
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
      S12 = S12), redeclare Electrical.Control.Excitation.EXST2 exciter(
      TR = TR_ex,
      KA = KA_ex,
      TA = TA_ex,
      VRMAX = VRMAX_ex,
      VRMIN = VRMIN_ex,
      KE = KE_ex,
      TE = TE_ex,
      KF = KF_ex,
      TF = TF_ex,
      KP = KP_ex,
      KI = KI_ex,
      KC = KC_ex,
      EFDMAX = EFDMAX_ex), redeclare Electrical.Control.TurbineGovernor.PIDGOV turbineGovernor(
      Rperm = Rperm_tg,
      Treg = Treg_tg,
      Kp = Kp_tg,
      Ki = Ki_tg,
      Kd = Kd_tg,
      Ta = Ta_tg,
      Tb = Tb_tg,
      Dturb = Dturb_tg,
      G0 = G0_tg,
      G1 = G1_tg,
      P1 = P1_tg,
      G2 = G2_tg,
      P2 = P2_tg,
      P3 = P3_tg,
      Gmax = Gmax_tg,
      Gmin = Gmin_tg,
      Atw = Atw_tg,
      Tw = Tw_tg,
      Velmax = Velmax_tg,
      Velmin = Velmin_tg,
      M = M_tg));

  parameter Real partType = 1;
  // GENROU Parameters
  parameter Integer IBUS = 100 "Located system bus" annotation(Dialog(tab = "General"));
  parameter String M_ID = "M1" "Machine Identifier" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real P_gen = 1100 "Bus Active Power, MW" annotation(Dialog(tab = "General"));
  parameter Real Q_gen = 342.702 "Bus Reactive Power, MVAR" annotation(Dialog(tab = "General"));
  parameter Real Vt_abs = 1.03 "Bus Voltage Magnitude, p.u." annotation(Dialog(tab = "General"));
  parameter Real Vt_ang = -10.96 "Bus Voltage Angle, deg." annotation(Dialog(tab = "General"));
  parameter Real SB = 1000 "Machine Base Power, MVA" annotation(Dialog(tab = "General"));
  parameter Real fn = 50 "Nominal frequency" annotation(Dialog(tab = "General"));
  parameter Real ZSOURCE_RE = 0 "Machine source impedence" annotation(Dialog(tab = "GENROU Parameters"));
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
  // EXST2 Parameters
  parameter Real TR_ex = 0.1 "(sec)" annotation(Dialog(tab = "EXST2 Parameters"));
  parameter Real KA_ex = 0.2 annotation(Dialog(tab = "EXST2 Parameters"));
  parameter Real TA_ex = 12 "(sec)" annotation(Dialog(tab = "EXST2 Parameters"));
  parameter Real VRMAX_ex = 5 "or zero" annotation(Dialog(tab = "EXST2 Parameters"));
  parameter Real VRMIN_ex = -5 annotation(Dialog(tab = "EXST2 Parameters"));
  parameter Real KE_ex = 0.2 annotation(Dialog(tab = "EXST2 Parameters"));
  parameter Real TE_ex = 0.08 "(sec)" annotation(Dialog(tab = "EXST2 Parameters"));
  parameter Real KF_ex = 0.2 annotation(Dialog(tab = "EXST2 Parameters"));
  parameter Real TF_ex = 1.2 "(sec)" annotation(Dialog(tab = "EXST2 Parameters"));
  parameter Real KP_ex = 0.4 annotation(Dialog(tab = "EXST2 Parameters"));
  parameter Real KI_ex = 0.5 "or zero" annotation(Dialog(tab = "EXST2 Parameters"));
  parameter Real KC_ex = 0.4 annotation(Dialog(tab = "EXST2 Parameters"));
  parameter Real EFDMAX_ex = 5 annotation(Dialog(tab = "EXST2 Parameters"));
  // PIDGOV Parameters
  parameter Real Rperm_tg = 0.05 "permanent drop, pu" annotation(Dialog(tab = "PIDGOV Parameters"));
  parameter Real Treg_tg = 0.03 "(sec) speed detector time constant" annotation(Dialog(tab = "PIDGOV Parameters"));
  parameter Real Kp_tg = 6 "proportional gain, pu/sec" annotation(Dialog(tab = "PIDGOV Parameters"));
  parameter Real Ki_tg = 30 "reset gain, pu/sec" annotation(Dialog(tab = "PIDGOV Parameters"));
  parameter Real Kd_tg = 0.01 "derivative gain, pu" annotation(Dialog(tab = "PIDGOV Parameters"));
  parameter Real Ta_tg = 0.04 "(sec) > 0 controller time constant" annotation(Dialog(tab = "PIDGOV Parameters"));
  parameter Real Tb_tg = 0.5 "(sec) > 0 gate servo time constant" annotation(Dialog(tab = "PIDGOV Parameters"));
  parameter Real Dturb_tg = 0.01 "turbine damping factor, pu" annotation(Dialog(tab = "PIDGOV Parameters"));
  parameter Real G0_tg = 0.3 "gate opening at speed no load, pu" annotation(Dialog(tab = "PIDGOV Parameters"));
  parameter Real G1_tg = 0.5 "intermediate gate opening, pu" annotation(Dialog(tab = "PIDGOV Parameters"));
  parameter Real P1_tg = 0.6 "power at gate opening G1, pu" annotation(Dialog(tab = "PIDGOV Parameters"));
  parameter Real G2_tg = 0.7 "intermediate gate opening, pu" annotation(Dialog(tab = "PIDGOV Parameters"));
  parameter Real P2_tg = 0.8 "power at gate opening G2, pu" annotation(Dialog(tab = "PIDGOV Parameters"));
  parameter Real P3_tg = 1 "power at full opened gate, pu" annotation(Dialog(tab = "PIDGOV Parameters"));
  parameter Real Gmax_tg = 0.95 "maximum gate opening, pu" annotation(Dialog(tab = "PIDGOV Parameters"));
  parameter Real Gmin_tg = 0 "minimum gate opening, pu" annotation(Dialog(tab = "PIDGOV Parameters"));
  parameter Real Atw_tg = 1.1 "> 0 factor multiplying Tw, pu" annotation(Dialog(tab = "PIDGOV Parameters"));
  parameter Real Tw_tg = 0.4 "(sec) > 0 water inertia time constant" annotation(Dialog(tab = "PIDGOV Parameters"));
  parameter Real Velmax_tg = 0.2 "minimum gate opening velocity, pu/sec" annotation(Dialog(tab = "PIDGOV Parameters"));
  parameter Real Velmin_tg = -0.2 "< 0 minimum gate closing velocity, pu/sec" annotation(Dialog(tab = "PIDGOV Parameters"));
  parameter Real M_tg = 0 "Feedback signal flag. 0: Electrical power feedback, 1: Gate position" annotation(Dialog(tab = "PIDGOV Parameters"));

end GENROU_EXST2_PIDGOV;
