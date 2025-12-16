within OpalRT.ModelSets.TypeF;
model GENROU_ESST3A_IEEEST_IEEEG1
  extends GenUnitTypeF1(redeclare OpalRT.Electrical.Machine.SynchronousMachine.GENROU synchronousGenerator(
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
      S12 = S12), redeclare OpalRT.Electrical.Control.Excitation.ESST3A exciter(
      TR = TR_ex,
      VIMAX = VIMAX_ex,
      VIMIN = VIMIN_ex,
      KM = KM_ex,
      TC = TC_ex,
      TB = TB_ex,
      KA = KA_ex,
      TA = TA_ex,
      VRMAX = VRMAX_ex,
      VRMIN = VRMIN_ex,
      KG = KG_ex,
      KP = KP_ex,
      KI = KI_ex,
      VBMAX = VBMAX_ex,
      KC = KC_ex,
      XL = XL_ex,
      VGMAX = VGMAX_ex,
      THETAP = THETAP_ex,
      TM = TM_ex,
      VMMAX = VMMAX_ex,
      VMMIN = VMMIN_ex), redeclare OpalRT.Electrical.Control.Stabilizer.IEEEST stabilizer(
      ID = M_ID,
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
      M1 = M1_pss,
      M0 = M0_pss), redeclare OpalRT.Electrical.Control.TurbineGovernor.IEEEG1 turbineGovernor(
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
      ID = M_ID), constVUEL(k = noVUEL), constVOEL(k = noVOEL));

  // GENROU Parameters
  parameter Integer IBUS = 100 "Located system bus" annotation(Dialog(tab = "General"));
  parameter String M_ID = "M1" "Machine Identifier" annotation(Dialog(tab = "GENROU"));
  parameter Real P_gen = 1100 "Bus Active Power, MW" annotation(Dialog(tab = "General"));
  parameter Real Q_gen = 342.702 "Bus Reactive Power, MVAR" annotation(Dialog(tab = "General"));
  parameter Real Vt_abs = 1.03 "Bus Voltage Magnitude, p.u." annotation(Dialog(tab = "General"));
  parameter Real Vt_ang = -10.96 "Bus Voltage Angle, deg." annotation(Dialog(tab = "General"));
  parameter Real SB = 1000 "Machine Base Power, MVA" annotation(Dialog(tab = "General"));
  parameter Real fn = 50 "Nominal frequency" annotation(Dialog(tab = "General"));
  parameter Real ZSOURCE_RE = 0 "Machine source impedence" annotation(Dialog(tab = "GENROU"));
  //parameter Real ZSOURCE_IM = Xq_s "Machine source impedence" annotation(Dialog(tab = "GENROU"));
  parameter Real Tdo_p = 7 "d-axis transient time constant" annotation(Dialog(tab = "GENROU"));
  parameter Real Tdo_s = 0.03 "d-axis sub-transient time constant, s" annotation(Dialog(tab = "GENROU"));
  parameter Real Tqo_p = 0.7 "q-axis transient time constant, s" annotation(Dialog(tab = "GENROU"));
  parameter Real Tqo_s = 0.04 "d-axis sub-transient time constant, s" annotation(Dialog(tab = "GENROU"));
  parameter Real H = 50 "Inertia constant" annotation(Dialog(tab = "GENROU"));
  parameter Real D = 0 "Speed damping" annotation(Dialog(tab = "GENROU"));
  parameter Real Xd = 0.2 "d-axis reactance, p.u." annotation(Dialog(tab = "GENROU"));
  parameter Real Xq = 0.19 "q-axis reactance, p.u." annotation(Dialog(tab = "GENROU"));
  parameter Real Xd_p = 0.06 "d-axis transient reactance, p.u." annotation(Dialog(tab = "GENROU"));
  parameter Real Xq_p = 0.06 "q-axis transient reactance, p.u." annotation(Dialog(tab = "GENROU"));
  parameter Real Xd_s = 0.02 "d-axis sub-transient reactance, p.u." annotation(Dialog(tab = "GENROU"));
  //parameter Real Xq_s = Xd_s "q-axis sub-transient reactance, p.u." annotation(Dialog(tab = "GENROU"));
  parameter Real Xl = 0.03 "Reactance due to the leakage flux which does not cross the air gap, p.u." annotation(Dialog(tab = "GENROU"));
  parameter Real S1 = 0.4 "saturation function value for 1 p.u. input" annotation(Dialog(tab = "GENROU"));
  parameter Real S12 = 0.8 "saturation function value for 1.2 p.u. input" annotation(Dialog(tab = "GENROU"));
  // ESST3A parameters
  parameter Real TR_ex = 0.02 "(sec) regulator input filter time constant" annotation(Dialog(tab = "ESST3A"));
  parameter Real VIMAX_ex = 10 "(pu) Voltage regulator input maximum limit" annotation(Dialog(tab = "ESST3A"));
  parameter Real VIMIN_ex = -10 "(pu) Voltage regulator input minimum limit" annotation(Dialog(tab = "ESST3A"));
  parameter Real KM_ex = 0.02 "Forward gain constant of the inner loop field regulator" annotation(Dialog(tab = "ESST3A"));
  parameter Real TC_ex = 1 " lead time constant of voltage regulator (s)" annotation(Dialog(tab = "ESST3A"));
  parameter Real TB_ex = 0.1 " lag time constant of voltage regulator (s)" annotation(Dialog(tab = "ESST3A"));
  parameter Real KA_ex = 10 "(pu) voltage regulator gain" annotation(Dialog(tab = "ESST3A"));
  parameter Real TA_ex = 0.02 "(sec) regulator time constant" annotation(Dialog(tab = "ESST3A"));
  parameter Real VRMAX_ex = 10 "(pu) regulator output maximum limit" annotation(Dialog(tab = "ESST3A"));
  parameter Real VRMIN_ex = -10 "(pu) regulator output minimum limit" annotation(Dialog(tab = "ESST3A"));
  parameter Real KG_ex = 1 "Feedback gain constant of the inner loop field regulator" annotation(Dialog(tab = "ESST3A"));
  parameter Real KP_ex = 1 "Potential circuit gain coefficient" annotation(Dialog(tab = "ESST3A"));
  parameter Real KI_ex = 0.02 "Potential circuit gain coefficient" annotation(Dialog(tab = "ESST3A"));
  parameter Real VBMAX_ex = 10 "(pu) regulator output maximum limit" annotation(Dialog(tab = "ESST3A"));
  parameter Real KC_ex = 1 "Rectifier loading factor proportional to commutating reactance" annotation(Dialog(tab = "ESST3A"));
  parameter Real XL_ex = 0.02 "Reactance associated with potential source" annotation(Dialog(tab = "ESST3A"));
  parameter Real VGMAX_ex = 10 "(pu) regulator output maximum limit" annotation(Dialog(tab = "ESST3A"));
  parameter Real THETAP_ex = 0.52 "Potential circuit phase angle (degrees)" annotation(Dialog(tab = "ESST3A"));
  parameter Real TM_ex = 0.02 "Forward time constant of the inner loop field regulator" annotation(Dialog(tab = "ESST3A"));
  parameter Real VMMAX_ex = 10 "(pu) regulator output maximum limit" annotation(Dialog(tab = "ESST3A"));
  parameter Real VMMIN_ex = -10 "(pu) regulator output minimum limit" annotation(Dialog(tab = "ESST3A"));
  //IEEEST parameters
  parameter Real A1_pss = 0 annotation(Dialog(tab = "IEEEST"));
  parameter Real A2_pss = 0 annotation(Dialog(tab = "IEEEST"));
  parameter Real A3_pss = 0 annotation(Dialog(tab = "IEEEST"));
  parameter Real A4_pss = 0 annotation(Dialog(tab = "IEEEST"));
  parameter Real A5_pss = 0 annotation(Dialog(tab = "IEEEST"));
  parameter Real A6_pss = 0 annotation(Dialog(tab = "IEEEST"));
  parameter Real T1_pss = 0.03 "(sec)" annotation(Dialog(tab = "IEEEST"));
  parameter Real T2_pss = 0.01 "(sec)" annotation(Dialog(tab = "IEEEST"));
  parameter Real T3_pss = 0.02 "(sec)" annotation(Dialog(tab = "IEEEST"));
  parameter Real T4_pss = 0.01 "(sec)" annotation(Dialog(tab = "IEEEST"));
  parameter Real T5_pss = 0.2 "(sec)" annotation(Dialog(tab = "IEEEST"));
  parameter Real T6_pss = 0.1 "(>0)(sec)" annotation(Dialog(tab = "IEEEST"));
  parameter Real KS_pss = -5 annotation(Dialog(tab = "IEEEST"));
  parameter Real LSMAX_pss = 6 annotation(Dialog(tab = "IEEEST"));
  parameter Real LSMIN_pss = -6 annotation(Dialog(tab = "IEEEST"));
  parameter Real VCU_pss = 1 "(pu) (if equal zero, ignored)" annotation(Dialog(tab = "IEEEST"));
  parameter Real VCL_pss = 1 "(pu) (if equal zero, ignored)" annotation(Dialog(tab = "IEEEST"));
  // IEEEST ICONs
  parameter Real M0_pss = 1 "Stabilizer input code" annotation(Dialog(tab = "IEEEST", group = "ICONs"));
  parameter Real M1_pss = 1 "IB, remote bus number" annotation(Dialog(tab = "IEEEST", group = "ICONs"));
  // IEEEG1 parameters
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
  parameter Real noVOEL(fixed = false, start = 1);
  parameter Real noVUEL(fixed = false, start = 1) "Constant output value";
initial equation
  noVOEL = 0;
  noVUEL = -Modelica.Constants.inf;

end GENROU_ESST3A_IEEEST_IEEEG1;
