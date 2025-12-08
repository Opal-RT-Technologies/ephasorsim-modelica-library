within OpalRT.ModelSets.TypeF;
model GENROU_ESST4B_IEE2ST_IEEEG1
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
      THETAP = THETAP_ex), redeclare Electrical.Control.Stabilizer.IEE2ST stabilizer(
      K1 = K1_pss,
      K2 = K2_pss,
      T1 = T1_pss,
      T2 = T2_pss,
      T3 = T3_pss,
      T4 = T4_pss,
      T5 = T5_pss,
      T6 = T6_pss,
      T7 = T7_pss,
      T8 = T8_pss,
      T9 = T9_pss,
      T10 = T10_pss,
      LSMAX = LSMAX_pss,
      LSMIN = LSMIN_pss,
      VCU = VCU_pss,
      VCL = VCL_pss,
      M0 = M0_pss,
      M1 = M1_pss,
      M2 = M2_pss,
      M3 = M3_pss), redeclare Electrical.Control.TurbineGovernor.IEEEG1 turbineGovernor(
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
      K8 = K8_tg), constVOEL(k = noVOEL));

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
  // IEE2ST Parameters
  parameter Real K1_pss = 1 annotation(Dialog(tab = "IEE2ST Parameters"));
  parameter Real K2_pss = 1 annotation(Dialog(tab = "IEE2ST Parameters"));
  parameter Real T1_pss = 0.1 "(sec)" annotation(Dialog(tab = "IEE2ST Parameters"));
  parameter Real T2_pss = 0.1 "(sec)" annotation(Dialog(tab = "IEE2ST Parameters"));
  parameter Real T3_pss = 0.1 "(sec)" annotation(Dialog(tab = "IEE2ST Parameters"));
  parameter Real T4_pss = 0.1 "(>0) (sec)" annotation(Dialog(tab = "IEE2ST Parameters"));
  parameter Real T5_pss = 0.1 "(sec)" annotation(Dialog(tab = "IEE2ST Parameters"));
  parameter Real T6_pss = 0.1 "(sec)" annotation(Dialog(tab = "IEE2ST Parameters"));
  parameter Real T7_pss = 0.1 "(sec)" annotation(Dialog(tab = "IEE2ST Parameters"));
  parameter Real T8_pss = 0.1 "(sec)" annotation(Dialog(tab = "IEE2ST Parameters"));
  parameter Real T9_pss = 0.1 "(sec)" annotation(Dialog(tab = "IEE2ST Parameters"));
  parameter Real T10_pss = 0.1 "(sec)" annotation(Dialog(tab = "IEE2ST Parameters"));
  parameter Real LSMAX_pss = 1 annotation(Dialog(tab = "IEE2ST Parameters"));
  parameter Real LSMIN_pss = -1 annotation(Dialog(tab = "IEE2ST Parameters"));
  parameter Real VCU_pss = 1 "(pu)(if equal zero, ignored.)" annotation(Dialog(tab = "IEE2ST Parameters"));
  parameter Real VCL_pss = -1 "(pu)(if equal zero, ignored.)" annotation(Dialog(tab = "IEE2ST Parameters"));
  // ICONs
  parameter Real M0_pss = 1 "ICS1, first stabilizer input code" annotation(Dialog(tab = "IEE2ST Parameters", group = "ICONs"));
  parameter Real M1_pss = 2 "IB1, first remote bus number. CURRENLY DISABLED" annotation(Dialog(tab = "IEE2ST Parameters", group = "ICONs"));
  parameter Real M2_pss = 3 "ICS2, second stabilizer input code" annotation(Dialog(tab = "IEE2ST Parameters", group = "ICONs"));
  parameter Real M3_pss = 0 "B2, second remote bus number CURRENLY DISABLED" annotation(Dialog(tab = "IEE2ST Parameters", group = "ICONs"));
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
  // IEEEG1 Parameters
  parameter Real JBUS_tg = 0 "Bus Identifier (NOT USED)" annotation(Dialog(tab = "IEEEG1"));
  parameter Real M_tg = 0 "Machine Identifier (NOT USED)" annotation(Dialog(tab = "IEEEG1"));
  parameter Real K_tg = 15 annotation(Dialog(tab = "IEEEG1"));
  parameter Real T1_tg = 1.5 "(sec)" annotation(Dialog(tab = "IEEEG1"));
  parameter Real T2_tg = 0.3 "(sec)" annotation(Dialog(tab = "IEEEG1"));
  parameter Real T3_tg = 0.02 "(>0)(sec)" annotation(Dialog(tab = "IEEEG1"));
  parameter Real Uo_tg = 0.1 "(pu/sec)" annotation(Dialog(tab = "IEEEG1"));
  parameter Real Uc_tg = -0.5 "(<0)(pu/sec)" annotation(Dialog(tab = "IEEEG1"));
  parameter Real PMAX_tg = 0.5 "(pu on machine MVA rating)" annotation(Dialog(tab = "IEEEG1"));
  parameter Real PMIN_tg = 0 "(pu on machine MVA rating)" annotation(Dialog(tab = "IEEEG1"));
  parameter Real T4_tg = 0.1 "(sec)" annotation(Dialog(tab = "IEEEG1"));
  parameter Real K1_tg = 0.1 annotation(Dialog(tab = "IEEEG1"));
  parameter Real K2_tg = 0.1 annotation(Dialog(tab = "IEEEG1"));
  parameter Real T5_tg = 0.2 "(sec)" annotation(Dialog(tab = "IEEEG1"));
  parameter Real K3_tg = 0.5 annotation(Dialog(tab = "IEEEG1"));
  parameter Real K4_tg = 0.1 annotation(Dialog(tab = "IEEEG1"));
  parameter Real T6_tg = 0.1 "(sec)" annotation(Dialog(tab = "IEEEG1"));
  parameter Real K5_tg = 0.6 annotation(Dialog(tab = "IEEEG1"));
  parameter Real K6_tg = 0.2 annotation(Dialog(tab = "IEEEG1"));
  parameter Real T7_tg = 0.3 "(sec)" annotation(Dialog(tab = "IEEEG1"));
  parameter Real K7_tg = 0.2 annotation(Dialog(tab = "IEEEG1"));
  parameter Real K8_tg = 0.6 annotation(Dialog(tab = "IEEEG1"));
  parameter Real noVOEL(fixed = false, start = 1) "Constant output value";
initial equation
  noVOEL = Modelica.Constants.inf;

end GENROU_ESST4B_IEE2ST_IEEEG1;
