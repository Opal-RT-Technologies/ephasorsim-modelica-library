within OpalRT.ModelSets.TypeF;
model GENSAE_ESST4B_PSS2A_WSHYGP
  extends GenUnitTypeF1(redeclare Electrical.Machine.SynchronousMachine.GENSAE synchronousGenerator(
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
      Tqo_s = Tqo_s,
      H = H,
      D = D,
      Xd = Xd,
      Xq = Xq,
      Xd_p = Xd_p,
      Xd_s = Xd_s,
      Xl = Xl,
      S1 = S1,
      S12 = S12), redeclare Electrical.Control.Excitation.ESST4B exciter(
      TR = TR_ex,
      KPR = KPR_ex,
      KIR = KIR_ex,
      VRMAX = VRMAX_ex,
      VRMIN = VRMIN_ex,
      TA = TA_ex,
      KPM = KPM_ex,
      KIM = KIM_ex,
      VMMAX = VMMAX_ex,
      VMMIN = VMMIN_ex,
      KG = KG_ex,
      KP = KP_ex,
      KI = KI_ex,
      VBMAX = VBMAX_ex,
      KC = KC_ex,
      XL = XL_ex,
      THETAP = THETAP_ex), redeclare Electrical.Control.Stabilizer.PSS2A stabilizer(
      M2 = M2_pss,
      TW1 = TW1_pss,
      TW2 = TW2_pss,
      T6 = T6_pss,
      TW3 = TW3_pss,
      TW4 = TW4_pss,
      T7 = T7_pss,
      KS2 = KS2_pss,
      KS3 = KS3_pss,
      T8 = T8_pss,
      T9 = T9_pss,
      KS1 = KS1_pss,
      T1 = T1_pss,
      T2 = T2_pss,
      T3 = T3_pss,
      T4 = T4_pss,
      VSTMAX = VSTMAX_pss,
      VSTMIN = VSTMIN_pss,
      M0 = M0_pss,
      M1 = M1_pss,
      M3 = M3_pss,
      M4 = M4_pss,
      M5 = M5_pss,
      initType = Modelica.Blocks.Types.Init.InitialOutput,
      ID = M_ID), redeclare Electrical.Control.TurbineGovernor.WSHYGP turbineGovernor(
      db1 = db1_tg,
      err = err_tg,
      Td = Td_tg,
      KI = KI_tg,
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
      ID = M_ID), constVOEL(k = noVOEL));

  parameter Real partType = 1;
  // GENSAE Parameters
  parameter Integer IBUS = 100 "Located system bus" annotation(Dialog(tab = "General"));
  parameter String M_ID = "M1" "Machine Identifier" annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real P_gen = 1100 "Bus Active Power, MW" annotation(Dialog(tab = "General"));
  parameter Real Q_gen = 342.702 "Bus Reactive Power, MVAR" annotation(Dialog(tab = "General"));
  parameter Real Vt_abs = 1.03 "Bus Voltage Magnitude, p.u." annotation(Dialog(tab = "General"));
  parameter Real Vt_ang = -10.96 "Bus Voltage Angle, deg." annotation(Dialog(tab = "General"));
  parameter Real SB = 1000 "Machine Base Power, MVA" annotation(Dialog(tab = "General"));
  parameter Real fn = 50 "Nominal frequency" annotation(Dialog(tab = "General"));
  parameter Real ZSOURCE_RE = 0 "Machine source impedence" annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real Tdo_p = 10 "d-axis transient time constant" annotation(Dialog(tab = "GENSAL Parameters"));
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
  // PSS2A Parameters
  parameter Real TW1_pss = 0.1 ">0" annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real TW2_pss = 1 "To bypass second washout, first signal: set Tw2 = 0" annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real T6_pss = 1 "To bypass first signal transducer: set T6 = 0" annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real TW3_pss = 1.5 ">0" annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real TW4_pss = 0.2 "To bypass second washout, second signal: set Tw4 = 0" annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real T7_pss = 0.2 "To bypass second signal transducer: set T7 = 0" annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real KS2_pss = 0.1 "T7/(2*H)" annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real KS3_pss = 0.1 annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real T8_pss = 0.05 annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real T9_pss = 0.01 ">0" annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real KS1_pss = 0.15 annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real T1_pss = 0.1 "To bypass first lead-lag: set T1 = T2 = 0" annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real T2_pss = 0.1 annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real T3_pss = 0.01 "To bypass first lead-lag: set T1 = T2 = 0" annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real T4_pss = 1 annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real VSTMAX_pss = 1 annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real VSTMIN_pss = -1 annotation(Dialog(tab = "PSS2A Parameters"));
  // PSS2A ICONs
  parameter Real M0_pss = 2 "ICS1, first stabilizer input code" annotation(Dialog(tab = "PSS2A Parameters", group = "ICONs"));
  parameter Real M1_pss = 2 "REMBUS1, first remote bus number" annotation(Dialog(tab = "PSS2A Parameters", group = "ICONs"));
  parameter Real M2_pss = 2 "ICS2, second stabilizer input code" annotation(Dialog(tab = "PSS2A Parameters", group = "ICONs"));
  parameter Real M3_pss = 2 "REMBUS2, second remote bus number" annotation(Dialog(tab = "PSS2A Parameters", group = "ICONs"));
  parameter Real M4_pss = 1 "M, ramp tracking filter" annotation(Dialog(tab = "PSS2A Parameters", group = "ICONs"));
  parameter Real M5_pss = 2 "N, ramp tracking filter" annotation(Dialog(tab = "PSS2A Parameters", group = "ICONs"));
  // WSHYGP Parameters
  parameter Real db1_tg = 0 annotation(Dialog(tab = "WSHYGP"));
  parameter Real err_tg = 0 annotation(Dialog(tab = "WSHYGP"));
  parameter Real Td_tg = 1 "(sec)" annotation(Dialog(tab = "WSHYGP"));
  parameter Real KI_tg = 0.8 annotation(Dialog(tab = "WSHYGP"));
  parameter Real Tf_tg = 0.1 "(sec)" annotation(Dialog(tab = "WSHYGP"));
  parameter Real KD_tg = 0.8 annotation(Dialog(tab = "WSHYGP"));
  parameter Real KP_tg = 0.25 annotation(Dialog(tab = "WSHYGP"));
  parameter Real R_tg = 0.04 annotation(Dialog(tab = "WSHYGP"));
  parameter Real Tt_tg = 0.4 annotation(Dialog(tab = "WSHYGP"));
  parameter Real KG_tg = 2.0 annotation(Dialog(tab = "WSHYGP"));
  parameter Real TP_tg = 0.2 "(sec)" annotation(Dialog(tab = "WSHYGP"));
  parameter Real VELopen_tg = 0.007 "(>0)" annotation(Dialog(tab = "WSHYGP"));
  parameter Real VELclose_tg = 0.002 "(>0)" annotation(Dialog(tab = "WSHYGP"));
  parameter Real PMAX_tg = 1.0 annotation(Dialog(tab = "WSHYGP"));
  parameter Real PMIN_tg = 0 annotation(Dialog(tab = "WSHYGP"));
  parameter Real db2_tg = 0 annotation(Dialog(tab = "WSHYGP"));
  parameter Real GV1_tg = 0 annotation(Dialog(tab = "WSHYGP"));
  parameter Real PGV1_tg = 0 annotation(Dialog(tab = "WSHYGP"));
  parameter Real GV2_tg = 0.6 annotation(Dialog(tab = "WSHYGP"));
  parameter Real PGV2_tg = 0.7 annotation(Dialog(tab = "WSHYGP"));
  parameter Real GV3_tg = 0.7 annotation(Dialog(tab = "WSHYGP"));
  parameter Real PGV3_tg = 0.82 annotation(Dialog(tab = "WSHYGP"));
  parameter Real GV4_tg = 0.80 annotation(Dialog(tab = "WSHYGP"));
  parameter Real PGV4_tg = 0.90 annotation(Dialog(tab = "WSHYGP"));
  parameter Real GV5_tg = 0.90 annotation(Dialog(tab = "WSHYGP"));
  parameter Real PGV5_tg = 0.95 annotation(Dialog(tab = "WSHYGP"));
  parameter Real Aturb_tg = -1 annotation(Dialog(tab = "WSHYGP"));
  parameter Real Bturb_tg = 0.5 "(>0)" annotation(Dialog(tab = "WSHYGP"));
  parameter Real Tturb_tg = 0.9 "(>0)(sec)" annotation(Dialog(tab = "WSHYGP"));
  parameter Real TRATE_tg = 900 annotation(Dialog(tab = "WSHYGP"));
  parameter Real noVOEL(fixed = false, start = 1) "Constant output value";
initial equation
  noVOEL = Modelica.Constants.inf;

end GENSAE_ESST4B_PSS2A_WSHYGP;
