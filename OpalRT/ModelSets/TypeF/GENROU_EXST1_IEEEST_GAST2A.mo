within OpalRT.ModelSets.TypeF;
model GENROU_EXST1_IEEEST_GAST2A
  extends GenUnitTypeF1(redeclare Electrical.Machine.SynchronousMachine.GENROU synchronousGenerator(
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
      S12 = S12), redeclare Electrical.Control.Excitation.EXST1 exciter(
      TR = TR_ex,
      VIMIN = VIMIN_ex,
      VIMAX = VIMAX_ex,
      TC = TC_ex,
      TB = TB_ex,
      KA = KA_ex,
      TA = TA_ex,
      VRMAX = VRMAX_ex,
      VRMIN = VRMIN_ex,
      KC = KC_ex,
      KF = KF_ex,
      TF = TF_ex), redeclare Electrical.Control.Stabilizer.IEEEST stabilizer(
      A1 = A1_pss,
      A2 = A2_pss,
      A3 = A3_pss,
      A4 = A4_pss,
      A5 = A5_pss,
      A6 = A6_pss,
      T1 = T1_pss,
      T2 = T2_pss,
      T3 = T3_pss,
      T4 = T4_pss,
      T5 = T5_pss,
      T6 = T6_pss,
      KS = KS_pss,
      LSMAX = LSMAX_pss,
      LSMIN = LSMIN_pss,
      VCU = VCU_pss,
      VCL = VCL_pss,
      M0 = M0_pss,
      M1 = M1_pss), redeclare Electrical.Control.TurbineGovernor.GAST2A turbineGovernor(
      W = W_tg,
      X = X_tg,
      Y = Y_tg,
      Z = Z_tg,
      ETD = ETD_tg,
      TCD = TCD_tg,
      TRATE = TRATE_tg,
      T = T_tg,
      MAX = MAX_tg,
      MIN = MIN_tg,
      ECR = ECR_tg,
      K3 = K3_tg,
      a = a_tg,
      b = b_tg,
      c = c_tg,
      Tf = Tf_tg,
      Kf = Kf_tg,
      K5 = K5_tg,
      K4 = K4_tg,
      T3 = T3_tg,
      T4 = T4_tg,
      Tt = Tt_tg,
      T5 = T5_tg,
      af1 = af1_tg,
      bf1 = bf1_tg,
      af2 = af2_tg,
      bf2 = bf2_tg,
      cf2 = cf2_tg,
      TR = TR_T_tg,
      K6 = K6_tg,
      TC = TC_T_tg));

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
  // EXST1 Parameters
  parameter Real TR_ex = 0.02 annotation(Dialog(tab = "EXST1 Parameters"));
  parameter Real VIMAX_ex = 1 annotation(Dialog(tab = "EXST1 Parameters"));
  parameter Real VIMIN_ex = -1 annotation(Dialog(tab = "EXST1 Parameters"));
  parameter Real TC_ex = 1 annotation(Dialog(tab = "EXST1 Parameters"));
  parameter Real TB_ex = 1 annotation(Dialog(tab = "EXST1 Parameters"));
  parameter Real KA_ex = 100 annotation(Dialog(tab = "EXST1 Parameters"));
  parameter Real TA_ex = 0.2 annotation(Dialog(tab = "EXST1 Parameters"));
  parameter Real VRMAX_ex = 9 annotation(Dialog(tab = "EXST1 Parameters"));
  parameter Real VRMIN_ex = -9 annotation(Dialog(tab = "EXST1 Parameters"));
  parameter Real KC_ex = 0.01 annotation(Dialog(tab = "EXST1 Parameters"));
  parameter Real KF_ex = 0.3 annotation(Dialog(tab = "EXST1 Parameters"));
  parameter Real TF_ex = 0.1 annotation(Dialog(tab = "EXST1 Parameters"));
  // GAST2A Parameters
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
  // IEEEST Parameters
  parameter Real A1_pss = 2 annotation(Dialog(tab = "IEEEST Parameters"));
  parameter Real A2_pss = 1 annotation(Dialog(tab = "IEEEST Parameters"));
  parameter Real A3_pss = 2 annotation(Dialog(tab = "IEEEST Parameters"));
  parameter Real A4_pss = 1 annotation(Dialog(tab = "IEEEST Parameters"));
  parameter Real A5_pss = 2 annotation(Dialog(tab = "IEEEST Parameters"));
  parameter Real A6_pss = 1 annotation(Dialog(tab = "IEEEST Parameters"));
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

end GENROU_EXST1_IEEEST_GAST2A;
