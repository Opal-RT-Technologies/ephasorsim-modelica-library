within OpalRT.ModelSets.TypeD;
model GENSAL_ESAC6A_WSHYDD
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
      S12 = S12), redeclare Electrical.Control.Excitation.ESAC6A exciter(
      TR = TR_ex,
      KA = KA_ex,
      TA = TA_ex,
      TK = TK_ex,
      TB = TB_ex,
      TC = TC_ex,
      VAMAX = VAMAX_ex,
      VAMIN = VAMIN_ex,
      VRMAX = VRMAX_ex,
      VRMIN = VRMIN_ex,
      TE = TE_ex,
      VFELIM = VFELIM_ex,
      KH = KH_ex,
      VHMAX = VHMAX_ex,
      TH = TH_ex,
      TJ = TJ_ex,
      KC = KC_ex,
      KD = KD_ex,
      KE = KE_ex,
      E1 = E1_ex,
      SE_E1 = SE_E1_ex,
      E2 = E2_ex,
      SE_E2 = SE_E2_ex,
      IBUS = IBUS,
      ID = ID), redeclare Electrical.Control.TurbineGovernor.WSHYDD turbineGovernor(
      db1 = db1_tg,
      err = err_tg,
      Td = Td_tg,
      K1 = K1_tg,
      Tf = Tf_tg,
      KD = KD_tg,
      KP = KP_tg,
      R = R_tg,
      Tt = Tt_tg,
      KG = KG_tg,
      TP = TP_tg,
      VELopen = VELopen_tg,
      VELclose = VELclose_tg,
      PMAX = PMAX_tg,
      PMIN = PMIN_tg,
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
      Aturb = Aturb_tg,
      Bturb = Bturb_tg,
      Tturb = Tturb_tg,
      TRATE = TRATE_tg,
      IBUS = IBUS,
      ID = ID));

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
  // ESAC6A Parameters
  parameter Real TR_ex = 0.1 "(sec)" annotation(Dialog(tab = "ESAC6A Parameters"));
  parameter Real KA_ex = 400 annotation(Dialog(tab = "ESAC6A Parameters"));
  parameter Real TA_ex = 5 "(sec)" annotation(Dialog(tab = "ESAC6A Parameters"));
  parameter Real TK_ex = 1 "(sec)" annotation(Dialog(tab = "ESAC6A Parameters"));
  parameter Real TB_ex = 12 "(sec)" annotation(Dialog(tab = "ESAC6A Parameters"));
  parameter Real TC_ex = 10 "(sec)" annotation(Dialog(tab = "ESAC6A Parameters"));
  parameter Real VAMAX_ex = 5 "or zero" annotation(Dialog(tab = "ESAC6A Parameters"));
  parameter Real VAMIN_ex = -5 annotation(Dialog(tab = "ESAC6A Parameters"));
  parameter Real VRMAX_ex = 5 "or zero" annotation(Dialog(tab = "ESAC6A Parameters"));
  parameter Real VRMIN_ex = -5 annotation(Dialog(tab = "ESAC6A Parameters"));
  parameter Real TE_ex = 0.08 "(sec)" annotation(Dialog(tab = "ESAC6A Parameters"));
  parameter Real VFELIM_ex = 5 annotation(Dialog(tab = "ESAC6A Parameters"));
  parameter Real KH_ex = 0.4 annotation(Dialog(tab = "ESAC6A Parameters"));
  parameter Real VHMAX_ex = 5 annotation(Dialog(tab = "ESAC6A Parameters"));
  parameter Real TH_ex = 0.2 "(sec)" annotation(Dialog(tab = "ESAC6A Parameters"));
  parameter Real TJ_ex = 1.2 "(sec)" annotation(Dialog(tab = "ESAC6A Parameters"));
  parameter Real KC_ex = 0.4 annotation(Dialog(tab = "ESAC6A Parameters"));
  parameter Real KD_ex = 0.4 annotation(Dialog(tab = "ESAC6A Parameters"));
  parameter Real KE_ex = 0.5 annotation(Dialog(tab = "ESAC6A Parameters"));
  parameter Real E1_ex = 4 annotation(Dialog(tab = "ESAC6A Parameters"));
  parameter Real SE_E1_ex = 0.4 annotation(Dialog(tab = "ESAC6A Parameters"));
  parameter Real E2_ex = 5 annotation(Dialog(tab = "ESAC6A Parameters"));
  parameter Real SE_E2_ex = 0.5 annotation(Dialog(tab = "ESAC6A Parameters"));
  // WSHYDD Parameters
  parameter Real db1_tg = 0 annotation(Dialog(tab = "WSHYDD"));
  parameter Real err_tg = 0 annotation(Dialog(tab = "WSHYDD"));
  parameter Real Td_tg = 1 "(sec)" annotation(Dialog(tab = "WSHYDD"));
  parameter Real K1_tg = 0.8 annotation(Dialog(tab = "WSHYDD"));
  parameter Real Tf_tg = 0.1 "(sec)" annotation(Dialog(tab = "WSHYDD"));
  parameter Real KD_tg = 0.8 annotation(Dialog(tab = "WSHYDD"));
  parameter Real KP_tg = 0.25 annotation(Dialog(tab = "WSHYDD"));
  parameter Real R_tg = 0.04 annotation(Dialog(tab = "WSHYDD"));
  parameter Real Tt_tg = 0.4 annotation(Dialog(tab = "WSHYDD"));
  parameter Real KG_tg = 2.0 annotation(Dialog(tab = "WSHYDD"));
  parameter Real TP_tg = 0.2 "(sec)" annotation(Dialog(tab = "WSHYDD"));
  parameter Real VELopen_tg = 0.007 "(>0)" annotation(Dialog(tab = "WSHYDD"));
  parameter Real VELclose_tg = 0.002 "(>0)" annotation(Dialog(tab = "WSHYDD"));
  parameter Real PMAX_tg = 1.0 annotation(Dialog(tab = "WSHYDD"));
  parameter Real PMIN_tg = 0 annotation(Dialog(tab = "WSHYDD"));
  parameter Real db2_tg = 0 annotation(Dialog(tab = "WSHYDD"));
  parameter Real GV1_tg = 0 annotation(Dialog(tab = "WSHYDD"));
  parameter Real PGV1_tg = 0 annotation(Dialog(tab = "WSHYDD"));
  parameter Real GV2_tg = 0.6 annotation(Dialog(tab = "WSHYDD"));
  parameter Real PGV2_tg = 0.7 annotation(Dialog(tab = "WSHYDD"));
  parameter Real GV3_tg = 0.7 annotation(Dialog(tab = "WSHYDD"));
  parameter Real PGV3_tg = 0.82 annotation(Dialog(tab = "WSHYDD"));
  parameter Real GV4_tg = 0.80 annotation(Dialog(tab = "WSHYDD"));
  parameter Real PGV4_tg = 0.90 annotation(Dialog(tab = "WSHYDD"));
  parameter Real GV5_tg = 0.90 annotation(Dialog(tab = "WSHYDD"));
  parameter Real PGV5_tg = 0.95 annotation(Dialog(tab = "WSHYDD"));
  parameter Real Aturb_tg = -1 annotation(Dialog(tab = "WSHYDD"));
  parameter Real Bturb_tg = 0.5 "(>0)" annotation(Dialog(tab = "WSHYDD"));
  parameter Real Tturb_tg = 0.9 "(>0)(sec)" annotation(Dialog(tab = "WSHYDD"));
  parameter Real TRATE_tg = 900 annotation(Dialog(tab = "WSHYDD"));

end GENSAL_ESAC6A_WSHYDD;
