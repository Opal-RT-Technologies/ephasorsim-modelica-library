within OpalRT.ModelSets.TypeE;
model GENROU_SEXS_PSS3B
  extends GenUnitTypeE1(redeclare Electrical.Machine.SynchronousMachine.GENROU synchronousGenerator(
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
      P_gen = P_gen,
      Q_gen = Q_gen,
      IBUS = IBUS,
      Vt_abs = Vt_abs,
      Vt_ang = Vt_ang,
      SB = SB,
      fn = fn,
      ID = M_ID,
      ZSOURCE_RE = ZSOURCE_RE), redeclare Electrical.Control.Excitation.SEXS exciter(
      TA_TB = TA_TB_ex,
      TB = TB_ex,
      K = K_ex,
      TE = TE_ex,
      EMIN = EMIN_ex,
      EMAX = EMAX_ex,
      IBUS = IBUS,
      ID = M_ID), redeclare Electrical.Control.Stabilizer.PSS3B stabilizer(
      KS1 = KS1_pss,
      T1 = T1_pss,
      TW1 = TW1_pss,
      KS2 = KS2_pss,
      T2 = T2_pss,
      TW2 = TW2_pss,
      TW3 = TW3_pss,
      A1 = A1_pss,
      A2 = A2_pss,
      A3 = A3_pss,
      A4 = A4_pss,
      A5 = A5_pss,
      A6 = A6_pss,
      A7 = A7_pss,
      A8 = A8_pss,
      VSTMAX = VSTMAX_pss,
      VSTMIN = VSTMIN_pss,
      M0 = M0_pss,
      M1 = M1_pss,
      M2 = M2_pss,
      M3 = M3_pss));

  parameter Real partType = 1;
  // GENROU Parameters
  parameter Integer IBUS = 100 "Located system bus" annotation(Dialog(tab = "General"));
  parameter String M_ID = "M1" "Machine Identifier" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real P_gen = 1000 "Bus Active Power, MW" annotation(Dialog(tab = "General"));
  parameter Real Q_gen = 100 "Bus Reactive Power, MVAR" annotation(Dialog(tab = "General"));
  parameter Real Vt_abs = 0.95 "Bus Voltage Magnitude, p.u." annotation(Dialog(tab = "General"));
  parameter Real Vt_ang = -2 "Bus Voltage Angle, deg." annotation(Dialog(tab = "General"));
  parameter Real SB = 1200 "Machine Base Power, MVA" annotation(Dialog(tab = "General"));
  parameter Real fn = 60 "Nominal frequency" annotation(Dialog(tab = "General"));
  parameter Real ZSOURCE_RE = 0 "Machine source impedence" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Tdo_p = 10.2 "d-axis transient time constant" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Tdo_s = 0.5 "d-axis sub-transient time constant, s" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Tqo_p = 1.02 "q-axis transient time constant, s" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Tqo_s = 0.01 "d-axis sub-transient time constant, s" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real H = 8.2 "Inertia constant" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real D = 0 "Speed damping" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xd = 3 "d-axis reactance, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xq = 0.5 "q-axis reactance, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xd_p = 0.5231 "d-axis transient reactance, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xq_p = 0.361 "q-axis transient reactance, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xd_s = 0.41 "d-axis sub-transient reactance, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xl = 0.2 "Reactance due to the leakage flux which does not cross the air gap, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real S1 = 0.5 "saturation function value for 1 p.u. input" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real S12 = 0.6 "saturation function value for 1.2 p.u. input" annotation(Dialog(tab = "GENROU Parameters"));
  // SEXS Parameters
  parameter Real TA_TB_ex = 0 "TA/TB" annotation(Dialog(tab = "SEXS Parameters"));
  parameter Real TB_ex = 0 "(>0) (sec)" annotation(Dialog(tab = "SEXS Parameters"));
  parameter Real K_ex = 1 annotation(Dialog(tab = "SEXS Parameters"));
  parameter Real TE_ex = 0 "(sec)" annotation(Dialog(tab = "SEXS Parameters"));
  parameter Real EMIN_ex = -9999 "(pu on EFD base)" annotation(Dialog(tab = "SEXS Parameters"));
  parameter Real EMAX_ex = 9999 "(pu on EFD base)" annotation(Dialog(tab = "SEXS Parameters"));
  // PSS3B
  parameter Real KS1_pss = 1 "(pu) (?0), input channel #1 gain" annotation(Dialog(tab = "PSS3B Parameters"));
  parameter Real T1_pss = 1 "input channel #1 transducer time constant (sec)" annotation(Dialog(tab = "PSS3B Parameters"));
  parameter Real TW1_pss = 1 "input channel #1 washout time constant (sec)" annotation(Dialog(tab = "PSS3B Parameters"));
  parameter Real KS2_pss = 1 "(pu) (?0), input channel #2 gain" annotation(Dialog(tab = "PSS3B Parameters"));
  parameter Real T2_pss = 1 "input channel #2 transducer time constant (sec)" annotation(Dialog(tab = "PSS3B Parameters"));
  parameter Real TW2_pss = 1 "input channel #2 washout time constant (sec)" annotation(Dialog(tab = "PSS3B Parameters"));
  parameter Real TW3_pss = 1 "(0), main washout time constant (sec)" annotation(Dialog(tab = "PSS3B Parameters"));
  parameter Real A1_pss = 1 annotation(Dialog(tab = "PSS3B Parameters"));
  parameter Real A2_pss = 1 annotation(Dialog(tab = "PSS3B Parameters"));
  parameter Real A3_pss = 1 annotation(Dialog(tab = "PSS3B Parameters"));
  parameter Real A4_pss = 1 annotation(Dialog(tab = "PSS3B Parameters"));
  parameter Real A5_pss = 1 annotation(Dialog(tab = "PSS3B Parameters"));
  parameter Real A6_pss = 1 annotation(Dialog(tab = "PSS3B Parameters"));
  parameter Real A7_pss = 1 annotation(Dialog(tab = "PSS3B Parameters"));
  parameter Real A8_pss = 1 annotation(Dialog(tab = "PSS3B Parameters"));
  parameter Real VSTMAX_pss = 10 "(pu), stabilizer output maximum limit" annotation(Dialog(tab = "PSS3B Parameters"));
  parameter Real VSTMIN_pss = -10 "(pu), stabilizer output minimum limit" annotation(Dialog(tab = "PSS3B Parameters"));
  parameter Real M0_pss = 1 "code for first channel stabilizer input variable" annotation(Dialog(tab = "PSS3B Parameters"));
  parameter Real M1_pss = 1 "currently disabled" annotation(Dialog(tab = "PSS3B Parameters"));
  parameter Real M2_pss = 1 "code for first channel stabilizer input variable" annotation(Dialog(tab = "PSS3B Parameters"));
  parameter Real M3_pss = 1 "currently disabled" annotation(Dialog(tab = "PSS3B Parameters"));

end GENROU_SEXS_PSS3B;
