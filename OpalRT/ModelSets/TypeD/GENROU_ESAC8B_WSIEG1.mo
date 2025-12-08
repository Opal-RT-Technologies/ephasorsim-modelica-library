within OpalRT.ModelSets.TypeD;
model GENROU_ESAC8B_WSIEG1
  extends GenUnitTypeD1(redeclare Electrical.Machine.SynchronousMachine.GENROU synchronousGenerator(
      IBUS = IBUS,
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
      S12 = S12), redeclare Electrical.Control.Excitation.ESAC8B exciter(
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
      SE_E2 = SE_E2_ex), redeclare Electrical.Control.TurbineGovernor.WSIEG1 turbineGovernor(
      IBUS = IBUS,
      ID = M_ID,
      K = K_tg,
      T1 = T1_tg,
      T2 = T2_tg,
      T3 = T3_tg,
      Uo = Uo_tg,
      Uc = Uc_tg,
      PMAX = PMAX_tg,
      PMIN = PMIN_tg,
      T4 = T4_tg,
      K1 = K1_tg,
      K2 = K2_tg,
      T5 = T5_tg,
      K3 = K3_tg,
      K4 = K4_tg,
      T6 = T6_tg,
      K5 = K5_tg,
      K6 = K6_tg,
      T7 = T7_tg,
      K7 = K7_tg,
      K8 = K8_tg,
      db1 = db1_tg,
      err = err_tg,
      db2 = db2_tg,
      GV1 = GV1_tg,
      PGV1 = PGV1_tg,
      GV2 = GV2_tg,
      PGV2 = PGV2_tg,
      GV3 = GV3_tg,
      PGV3 = PGV3_tg,
      GV4 = GV4_tg,
      PGV4 = PGV4_tg,
      GV5 = GV5_tg,
      PGV5 = PGV5_tg,
      IBLOCK = IBLOCK_tg,
      JBUS = 0,
      M = 0));

  parameter Real partType = 1;
  // GENROU Parameters
  parameter Integer IBUS = 100 "Located system bus" annotation(Dialog(tab = "General"));
  parameter String M_ID = "M1" "Machine Identifier" annotation(Dialog(tab = "General"));
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
  // ESAC8B Parameters
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
  // WSIEG1 Parameters
  parameter Real JBUS_tg = 0 "Bus Identifier (NOT USED)" annotation(Dialog(tab = "WSIEG1"));
  parameter Real M_tg = 0 "Machine Identifier (NOT USED)" annotation(Dialog(tab = "WSIEG1"));
  parameter Real K_tg = 15 annotation(Dialog(tab = "WSIEG1"));
  parameter Real T1_tg = 1.5 "(sec)" annotation(Dialog(tab = "WSIEG1"));
  parameter Real T2_tg = 0.3 "(sec)" annotation(Dialog(tab = "WSIEG1"));
  parameter Real T3_tg = 0.02 "(>0)(sec)" annotation(Dialog(tab = "WSIEG1"));
  parameter Real Uo_tg = 0.1 "(pu/sec)" annotation(Dialog(tab = "WSIEG1"));
  parameter Real Uc_tg = -0.5 "(<0)(pu/sec)" annotation(Dialog(tab = "WSIEG1"));
  parameter Real PMAX_tg = 0.5 "(pu on machine MVA rating)" annotation(Dialog(tab = "WSIEG1"));
  parameter Real PMIN_tg = 0 "(pu on machine MVA rating)" annotation(Dialog(tab = "WSIEG1"));
  parameter Real T4_tg = 0.1 "(sec)" annotation(Dialog(tab = "WSIEG1"));
  parameter Real K1_tg = 0.1 annotation(Dialog(tab = "WSIEG1"));
  parameter Real K2_tg = 0.1 annotation(Dialog(tab = "WSIEG1"));
  parameter Real T5_tg = 0.2 "(sec)" annotation(Dialog(tab = "WSIEG1"));
  parameter Real K3_tg = 0.5 annotation(Dialog(tab = "WSIEG1"));
  parameter Real K4_tg = 0.1 annotation(Dialog(tab = "WSIEG1"));
  parameter Real T6_tg = 0.1 "(sec)" annotation(Dialog(tab = "WSIEG1"));
  parameter Real K5_tg = 0.6 annotation(Dialog(tab = "WSIEG1"));
  parameter Real K6_tg = 0.2 annotation(Dialog(tab = "WSIEG1"));
  parameter Real T7_tg = 0.3 "(sec)" annotation(Dialog(tab = "WSIEG1"));
  parameter Real K7_tg = 0.2 annotation(Dialog(tab = "WSIEG1"));
  parameter Real K8_tg = 0.6 annotation(Dialog(tab = "WSIEG1"));
  parameter Real db1_tg = 0 annotation(Dialog(tab = "WSIEG1"));
  parameter Real err_tg = 0 annotation(Dialog(tab = "WSIEG1"));
  parameter Real db2_tg = 0 annotation(Dialog(tab = "WSIEG1"));
  parameter Real GV1_tg = 0 annotation(Dialog(tab = "WSIEG1"));
  parameter Real PGV1_tg = 0 annotation(Dialog(tab = "WSIEG1"));
  parameter Real GV2_tg = 99 annotation(Dialog(tab = "WSIEG1"));
  parameter Real PGV2_tg = 99 annotation(Dialog(tab = "WSIEG1"));
  parameter Real GV3_tg = 0 annotation(Dialog(tab = "WSIEG1"));
  parameter Real PGV3_tg = 0 annotation(Dialog(tab = "WSIEG1"));
  parameter Real GV4_tg = 0 annotation(Dialog(tab = "WSIEG1"));
  parameter Real PGV4_tg = 0 annotation(Dialog(tab = "WSIEG1"));
  parameter Real GV5_tg = 0 annotation(Dialog(tab = "WSIEG1"));
  parameter Real PGV5_tg = 0 annotation(Dialog(tab = "WSIEG1"));
  parameter Real IBLOCK_tg = 0 annotation(Dialog(tab = "WSIEG1"));

end GENROU_ESAC8B_WSIEG1;
