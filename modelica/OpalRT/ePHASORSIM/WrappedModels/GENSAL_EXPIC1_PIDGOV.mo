within OpalRT.ePHASORSIM.WrappedModels;
block GENSAL_EXPIC1_PIDGOV
  extends Wrappers.FMUTemplateVRefGRef(redeclare ModelSets.TypeD.GENSAL_EXPIC1_PIDGOV modelSet(
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
      TA1_ex = TA1_ex,
      VR1_ex = VR1_ex,
      VR2_ex = VR2_ex,
      TA2_ex = TA2_ex,
      TA3_ex = TA3_ex,
      TA4_ex = TA4_ex,
      VRMAX_ex = VRMAX_ex,
      VRMIN_ex = VRMIN_ex,
      KF_ex = KF_ex,
      TF1_ex = TF1_ex,
      TF2_ex = TF2_ex,
      EFDMAX_ex = EFDMAX_ex,
      EFDMIN_ex = EFDMIN_ex,
      KE_ex = KE_ex,
      TE_ex = TE_ex,
      E1_ex = E1_ex,
      SE_E1_ex = SE_E1_ex,
      E2_ex = E2_ex,
      SE_E2_ex = SE_E2_ex,
      KP_ex = KP_ex,
      KI_ex = KI_ex,
      KC_ex = KC_ex,
      Rperm_tg = Rperm_tg,
      Treg_tg = Treg_tg,
      Kp_tg = Kp_tg,
      Ki_tg = Ki_tg,
      Kd_tg = Kd_tg,
      Ta_tg = Ta_tg,
      Tb_tg = Tb_tg,
      Dturb_tg = Dturb_tg,
      G0_tg = G0_tg,
      G1_tg = G1_tg,
      P1_tg = P1_tg,
      G2_tg = G2_tg,
      P2_tg = P2_tg,
      P3_tg = P3_tg,
      Gmax_tg = Gmax_tg,
      Gmin_tg = Gmin_tg,
      Atw_tg = Atw_tg,
      Tw_tg = Tw_tg,
      Velmax_tg = Velmax_tg,
      Velmin_tg = Velmin_tg,
      M_tg = M_tg));

// >>> AUTOGEN PARAMS (VERBATIM FROM MODELSETS) BEGIN
  parameter Real partType = 1;
  // GENSAL Parameters
  parameter Integer IBUS = 100 "Located system bus" annotation(Dialog(tab = "General"));
  parameter String M_ID = "M1" "Machine Identifier" annotation(Dialog(tab = "GENROU Parameters"));
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
  // EXPIC1 Parameters
  parameter Real TR_ex = 0.1 "(sec)" annotation(Dialog(tab = "EXPIC1 Parameters"));
  parameter Real KA_ex = 0.2 annotation(Dialog(tab = "EXPIC1 Parameters"));
  parameter Real TA1_ex = 12 "(sec)" annotation(Dialog(tab = "EXPIC1 Parameters"));
  parameter Real VR1_ex = 5 "or zero" annotation(Dialog(tab = "EXPIC1 Parameters"));
  parameter Real VR2_ex = -5 annotation(Dialog(tab = "EXPIC1 Parameters"));
  parameter Real TA2_ex = 10 "(sec)" annotation(Dialog(tab = "EXPIC1 Parameters"));
  parameter Real TA3_ex = 400 annotation(Dialog(tab = "EXPIC1 Parameters"));
  parameter Real TA4_ex = 5 "(sec)" annotation(Dialog(tab = "EXPIC1 Parameters"));
  parameter Real VRMAX_ex = 5 "or zero" annotation(Dialog(tab = "EXPIC1 Parameters"));
  parameter Real VRMIN_ex = -5 annotation(Dialog(tab = "EXPIC1 Parameters"));
  parameter Real KF_ex = 0.2 annotation(Dialog(tab = "EXPIC1 Parameters"));
  parameter Real TF1_ex = 1.2 "(>0) (sec)" annotation(Dialog(tab = "EXPIC1 Parameters"));
  parameter Real TF2_ex = 1.2 "(>0) (sec)" annotation(Dialog(tab = "EXPIC1 Parameters"));
  parameter Real EFDMAX_ex = 5 "or zero" annotation(Dialog(tab = "EXPIC1 Parameters"));
  parameter Real EFDMIN_ex = -5 annotation(Dialog(tab = "EXPIC1 Parameters"));
  parameter Real KE_ex = 0.2 annotation(Dialog(tab = "EXPIC1 Parameters"));
  parameter Real TE_ex = 0.08 "(sec)" annotation(Dialog(tab = "EXPIC1 Parameters"));
  parameter Real E1_ex = 4 annotation(Dialog(tab = "EXPIC1 Parameters"));
  parameter Real SE_E1_ex = 0.4 annotation(Dialog(tab = "EXPIC1 Parameters"));
  parameter Real E2_ex = 5 annotation(Dialog(tab = "EXPIC1 Parameters"));
  parameter Real SE_E2_ex = 0.5 annotation(Dialog(tab = "EXPIC1 Parameters"));
  parameter Real KP_ex = 0.4 annotation(Dialog(tab = "EXPIC1 Parameters"));
  parameter Real KI_ex = 0.5 "or zero" annotation(Dialog(tab = "EXPIC1 Parameters"));
  parameter Real KC_ex = 0.4 annotation(Dialog(tab = "EXPIC1 Parameters"));
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
// <<< AUTOGEN PARAMS (VERBATIM FROM MODELSETS) END

end GENSAL_EXPIC1_PIDGOV;
