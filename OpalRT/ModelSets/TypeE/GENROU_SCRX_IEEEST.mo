within OpalRT.ModelSets.TypeE;
model GENROU_SCRX_IEEEST
  extends GenUnitTypeE1(redeclare Electrical.Machine.SynchronousMachine.GENROU synchronousGenerator(
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
      S12 = S12), redeclare Electrical.Control.Excitation.SCRX exciter(
      IBUS = IBUS,
      ID = M_ID,
      TA_TB = TA_TB_ex,
      TB = TB_ex,
      K = K_ex,
      TE = TE_ex,
      EMIN = EMIN_ex,
      EMAX = EMAX_ex,
      CSWITCH = CSWITCH_ex,
      rc_rfd = rc_rfd_ex), redeclare Electrical.Control.Stabilizer.IEEEST stabilizer(
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
      M1 = M1_pss));

  parameter Real partType = 1;
  /////////
  parameter Integer IBUS = 100 "Located system bus" annotation(Dialog(tab = "General"));
  parameter String M_ID = "M1" "Machine Identifier" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real P_gen = 572.93 "Bus Active Power, MW" annotation(Dialog(tab = "General"));
  parameter Real Q_gen = 796.24 "Bus Reactive Power, MVAR" annotation(Dialog(tab = "General"));
  parameter Real Vt_abs = 1.03 "Bus Voltage Magnitude, p.u." annotation(Dialog(tab = "General"));
  parameter Real Vt_ang = -10.96 "Bus Voltage Angle, deg." annotation(Dialog(tab = "General"));
  parameter Real SB = 1000 "Machine Base Power, MVA" annotation(Dialog(tab = "General"));
  parameter Real fn = 50 "Nominal frequency" annotation(Dialog(tab = "General"));
  parameter Real ZSOURCE_RE = 0 "Machine source impedence" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Tdo_p = 6.56 "d-axis transient time constant" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Tdo_s = 0.03 "d-axis sub-transient time constant, s" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Tqo_p = 1.5 "q-axis transient time constant, s" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Tqo_s = 0.04 "d-axis sub-transient time constant, s" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real H = 3.03 "Inertia constant" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real D = 0 "Speed damping" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xd = 2.95 "d-axis reactance, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xq = 2.82 "q-axis reactance, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xd_p = 0.697 "d-axis transient reactance, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xq_p = 0.697 "q-axis transient reactance, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xd_s = 0.2 "d-axis sub-transient reactance, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xl = 0.35 "Reactance due to the leakage flux which does not cross the air gap, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real S1 = 0 "saturation function value for 1 p.u. input" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real S12 = 0 "saturation function value for 1.2 p.u. input" annotation(Dialog(tab = "GENROU Parameters"));
  ///////DATA BUS 31
  parameter Real TA_TB_ex = 1 "TA/TB" annotation(Dialog(tab = "SCRX Parameters"));
  parameter Real TB_ex = 1 "(>0) (sec)" annotation(Dialog(tab = "SCRX Parameters"));
  parameter Real K_ex = 1 annotation(Dialog(tab = "SCRX Parameters"));
  parameter Real TE_ex = 5 "(sec)" annotation(Dialog(tab = "SCRX Parameters"));
  parameter Real EMIN_ex = 0 "(pu on EFD base)" annotation(Dialog(tab = "SCRX Parameters"));
  parameter Real EMAX_ex = 1 "(pu on EFD base)" annotation(Dialog(tab = "SCRX Parameters"));
  parameter Real CSWITCH_ex = 1 "0 for bus fed, 1 for solid fed" annotation(Dialog(tab = "SCRX Parameters"));
  parameter Real rc_rfd_ex = 1 "rc/rfd, 0 with negative field current capability (EX=EFD)" annotation(Dialog(tab = "SCRX Parameters"));
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

end GENROU_SCRX_IEEEST;
