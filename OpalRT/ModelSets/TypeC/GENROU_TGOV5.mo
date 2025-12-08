within OpalRT.ModelSets.TypeC;
model GENROU_TGOV5
  extends GenUnitTypeC1(redeclare Electrical.Machine.SynchronousMachine.GENROU synchronousGenerator(
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
      S12 = S12), redeclare Electrical.Control.TurbineGovernor.TGOV5 turbineGovernor(
      K = K_tg,
      T1 = T1_tg,
      T2 = T2_tg,
      T3 = T3_tg,
      Uo = Uo_tg,
      Uc = Uc_tg,
      VMAX = VMAX_tg,
      VMIN = VMIN_tg,
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
      K9 = K9_tg,
      K10 = K10_tg,
      K11 = K11_tg,
      K12 = K12_tg,
      K13 = K13_tg,
      K14 = K14_tg,
      RMAX = RMAX_tg,
      RMIN = RMIN_tg,
      LMAX = LMAX_tg,
      LMIN = LMIN_tg,
      C1 = C1_tg,
      C2 = C2_tg,
      C3 = C3_tg,
      B = B_tg,
      CB = CB_tg,
      KI = KI_tg,
      TI = TI_tg,
      TR = TR_tg,
      TR1 = TR1_tg,
      CMAX = CMAX_tg,
      CMIN = CMIN_tg,
      TD = TD_tg,
      TF = TF_tg,
      TW = TW_tg,
      PSP = PSP_tg,
      TMW = TMW_tg,
      KL = KL_tg,
      KMW = KMW_tg,
      DPE = DPE_tg,
      JBUS = JBUS_tg,
      M = M_tg));

  parameter Real partType = 1;
  // GENROU Parameters
  parameter Integer IBUS = 100 "Located system bus" annotation(Dialog(tab = "General"));
  parameter String M_ID = "M1" "Machine Identifier" annotation(Dialog(tab = "GENROU Parameters"));
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
  // TGOV5 Parameters
  parameter Real JBUS_tg = 0 "located system bus" annotation(Dialog(tab = "TGOV5-General"));
  parameter Real M_tg = 0 "Second machine identifier" annotation(Dialog(tab = "TGOV5-General"));
  parameter Real K_tg = 20 annotation(Dialog(tab = "TGOV5-GOV"));
  parameter Real T1_tg = 0.5 "(sec)" annotation(Dialog(tab = "TGOV5-GOV"));
  parameter Real T2_tg = 1 "(sec)" annotation(Dialog(tab = "TGOV5-GOV"));
  parameter Real T3_tg = 1 "(>0)(sec)" annotation(Dialog(tab = "TGOV5-GOV"));
  parameter Real Uo_tg = 0.1 "(pu/sec)" annotation(Dialog(tab = "TGOV5-GOV"));
  parameter Real Uc_tg = -0.2 "(<0)(pu/sec)" annotation(Dialog(tab = "TGOV5-GOV"));
  parameter Real VMAX_tg = 1 "(pu on machine MVA rating)" annotation(Dialog(tab = "TGOV5-GOV"));
  parameter Real VMIN_tg = 0 "(pu on machine MVA rating)" annotation(Dialog(tab = "TGOV5-GOV"));
  parameter Real T4_tg = 0.4 "(sec)" annotation(Dialog(tab = "TGOV5-GOV"));
  parameter Real K1_tg = 0.2 annotation(Dialog(tab = "TGOV5-GOV"));
  parameter Real K2_tg = 0 annotation(Dialog(tab = "TGOV5-GOV"));
  parameter Real T5_tg = 7 "(sec)" annotation(Dialog(tab = "TGOV5-GOV"));
  parameter Real K3_tg = 0.1 annotation(Dialog(tab = "TGOV5-GOV"));
  parameter Real K4_tg = 0 annotation(Dialog(tab = "TGOV5-GOV"));
  parameter Real T6_tg = 0.6 "(sec)" annotation(Dialog(tab = "TGOV5-GOV"));
  parameter Real K5_tg = 0.2 annotation(Dialog(tab = "TGOV5-GOV"));
  parameter Real K6_tg = 0 annotation(Dialog(tab = "TGOV5-GOV"));
  parameter Real T7_tg = 0.3 "(sec)" annotation(Dialog(tab = "TGOV5-GOV"));
  parameter Real K7_tg = 0.1 annotation(Dialog(tab = "TGOV5-GOV"));
  parameter Real K8_tg = 0 annotation(Dialog(tab = "TGOV5-GOV"));
  parameter Real K9_tg = 0.01 annotation(Dialog(tab = "TGOV5-BOILER"));
  parameter Real K10_tg = 0.01 annotation(Dialog(tab = "TGOV5-BOILER"));
  parameter Real K11_tg = 0.01 annotation(Dialog(tab = "TGOV5-BOILER"));
  parameter Real K12_tg = 0.01 annotation(Dialog(tab = "TGOV5-LoadReferenceControl"));
  parameter Real K13_tg = 0.01 annotation(Dialog(tab = "TGOV5-LoadReferenceControl"));
  parameter Real K14_tg = 0.01 annotation(Dialog(tab = "TGOV5-LoadReferenceControl"));
  parameter Real RMAX_tg = 0.01 annotation(Dialog(tab = "TGOV5-LoadReferenceControl"));
  parameter Real RMIN_tg = 0.01 annotation(Dialog(tab = "TGOV5-LoadReferenceControl"));
  parameter Real LMAX_tg = 0.01 annotation(Dialog(tab = "TGOV5-LoadReferenceControl"));
  parameter Real LMIN_tg = 0.01 annotation(Dialog(tab = "TGOV5-LoadReferenceControl"));
  parameter Real C1_tg = 0.01 annotation(Dialog(tab = "TGOV5-BOILER"));
  parameter Real C2_tg = 0.01 annotation(Dialog(tab = "TGOV5-LoadReferenceControl"));
  parameter Real C3_tg = 0.01 annotation(Dialog(tab = "TGOV5-LoadReferenceControl"));
  parameter Real B_tg = 0.01 annotation(Dialog(tab = "TGOV5-LoadReferenceControl"));
  parameter Real CB_tg = 0.01 "(>0)(sec)" annotation(Dialog(tab = "TGOV5-BOILER"));
  parameter Real KI_tg = 0.01 annotation(Dialog(tab = "TGOV5-BOILER"));
  parameter Real TI_tg = 0.01 "(sec)" annotation(Dialog(tab = "TGOV5-BOILER"));
  parameter Real TR_tg = 0.01 "(sec)" annotation(Dialog(tab = "TGOV5-BOILER"));
  parameter Real TR1_tg = 0.01 "(sec)" annotation(Dialog(tab = "TGOV5-BOILER"));
  parameter Real CMAX_tg = 0.01 annotation(Dialog(tab = "TGOV5-BOILER"));
  parameter Real CMIN_tg = 0.01 annotation(Dialog(tab = "TGOV5-BOILER"));
  parameter Real TD_tg = 0.01 "(sec)" annotation(Dialog(tab = "TGOV5-BOILER"));
  parameter Real TF_tg = 0.01 "(sec)" annotation(Dialog(tab = "TGOV5-BOILER"));
  parameter Real TW_tg = 0.01 "(sec)" annotation(Dialog(tab = "TGOV5-BOILER"));
  parameter Real PSP_tg = 0.01 "initial(>0)" annotation(Dialog(tab = "TGOV5-BOILER"));
  parameter Real TMW_tg = 0.01 "(sec)" annotation(Dialog(tab = "TGOV5-LoadReferenceControl"));
  parameter Real KL_tg = 0.01 "0.0 or 1.0" annotation(Dialog(tab = "TGOV5-LoadReferenceControl"));
  parameter Real KMW_tg = 0.01 "0.0 or 1.0" annotation(Dialog(tab = "TGOV5-LoadReferenceControl"));
  parameter Real DPE_tg = 0.01 "pu pressure" annotation(Dialog(tab = "TGOV5-LoadReferenceControl"));

end GENROU_TGOV5;
