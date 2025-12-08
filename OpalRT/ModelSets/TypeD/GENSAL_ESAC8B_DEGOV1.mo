within OpalRT.ModelSets.TypeD;
model GENSAL_ESAC8B_DEGOV1
  extends GenUnitTypeD1(redeclare Electrical.Machine.SynchronousMachine.GENSAL synchronousGenerator(
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
      S12 = S12), redeclare Electrical.Control.Excitation.ESAC8B exciter(
      ID = ID,
      TR = TR_ex,
      KP = KP_ex,
      KI = KI_ex,
      KD = KD_ex,
      TD = TD_ex,
      KA = KA_ex,
      TA = TA_ex,
      VRMAX = VRMAX_ex,
      VRMIN = VRMIN_ex,
      TE = TE_ex,
      KE = KE_ex,
      E1 = E1_ex,
      SE_E1 = SE_E1_ex,
      E2 = E2_ex,
      SE_E2 = SE_E2_ex), redeclare Electrical.Control.TurbineGovernor.DEGOV1 turbineGovernor(
      M = M_tg,
      T1 = T1_tg,
      T2 = T2_tg,
      T3 = T3_tg,
      K = K_tg,
      T4 = T4_tg,
      T5 = T5_tg,
      T6 = T6_tg,
      TD = TD_tg,
      TMAX = TMAX_tg,
      TMIN = TMIN_tg,
      DROOP = DROOP_tg,
      TE = TE_tg));

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
  parameter Real Tdo_s = 0.05 "d-axis sub-transient time constant, s" annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real Tqo_s = 0.01 "d-axis sub-transient time constant, s" annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real H = 50 "Inertia constant" annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real D = 0 "Speed damping" annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real Xd = 0.2 "d-axis reactance, p.u." annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real Xq = 0.19 "q-axis reactance, p.u." annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real Xd_p = 0.06 "d-axis transient reactance, p.u." annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real Xd_s = 0.02 "d-axis sub-transient reactance, p.u." annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real Xl = 0.03 "Reactance due to the leakage flux which does not cross the air gap, p.u." annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real S1 = 0.4 "saturation function value for 1 p.u. input" annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real S12 = 0.8 "saturation function value for 1.2 p.u. input" annotation(Dialog(tab = "GENSAL Parameters"));
  // ESAC8B parameters
  parameter Real TR_ex = 0.02 "(sec)" annotation(Dialog(tab = "ESAC8B"));
  parameter Real KP_ex = 100 annotation(Dialog(tab = "ESAC8B"));
  parameter Real KI_ex = 0.8 annotation(Dialog(tab = "ESAC8B"));
  parameter Real KD_ex = 0.8 annotation(Dialog(tab = "ESAC8B"));
  parameter Real TD_ex = 1 "(sec)" annotation(Dialog(tab = "ESAC8B"));
  parameter Real KA_ex = 100 annotation(Dialog(tab = "ESAC8B"));
  parameter Real TA_ex = 0.5 "(sec)" annotation(Dialog(tab = "ESAC8B"));
  parameter Real VRMAX_ex = 9 "or zero" annotation(Dialog(tab = "ESAC8B"));
  parameter Real VRMIN_ex = -5 annotation(Dialog(tab = "ESAC8B"));
  parameter Real TE_ex = 0.08 "(>0)(sec)" annotation(Dialog(tab = "ESAC8B"));
  parameter Real KE_ex = 0.5 "or zero" annotation(Dialog(tab = "ESAC8B"));
  parameter Real E1_ex = 4 annotation(Dialog(tab = "ESAC8B"));
  parameter Real SE_E1_ex = 0.4 annotation(Dialog(tab = "ESAC8B"));
  parameter Real E2_ex = 5 annotation(Dialog(tab = "ESAC8B"));
  parameter Real SE_E2_ex = 0.5 annotation(Dialog(tab = "ESAC8B"));
  // DEGOV1 Parameters
  parameter Real M_tg = 1 "Feedback signal flag. 0: Throttle feedback, 1: Electrical power feedback" annotation(Dialog(tab = "DEGOV1"));
  parameter Real T1_tg = 0 "(sec)" annotation(Dialog(tab = "DEGOV1"));
  parameter Real T2_tg = 0 "(sec)" annotation(Dialog(tab = "DEGOV1"));
  parameter Real T3_tg = 1 "(sec)" annotation(Dialog(tab = "DEGOV1"));
  parameter Real K_tg = 0.8 annotation(Dialog(tab = "DEGOV1"));
  parameter Real T4_tg = 0.1 "(sec)" annotation(Dialog(tab = "DEGOV1"));
  parameter Real T5_tg = 0.8 "(sec)" annotation(Dialog(tab = "DEGOV1"));
  parameter Real T6_tg = 0.25 "(sec)" annotation(Dialog(tab = "DEGOV1"));
  parameter Real TD_tg = 0.04 "(0<= TD <= 12*DELT)(sec)" annotation(Dialog(tab = "DEGOV1"));
  parameter Real TMAX_tg = 2.0 annotation(Dialog(tab = "DEGOV1"));
  parameter Real TMIN_tg = 0.5 annotation(Dialog(tab = "DEGOV1"));
  parameter Real DROOP_tg = 0.2 annotation(Dialog(tab = "DEGOV1"));
  parameter Real TE_tg = 0.007 annotation(Dialog(tab = "DEGOV1"));

end GENSAL_ESAC8B_DEGOV1;
