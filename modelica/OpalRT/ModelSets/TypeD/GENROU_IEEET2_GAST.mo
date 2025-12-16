within OpalRT.ModelSets.TypeD;
model GENROU_IEEET2_GAST
  extends GenUnitTypeD1(redeclare Electrical.Machine.SynchronousMachine.GENROU synchronousGenerator(
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
      S12 = S12), redeclare Electrical.Control.Excitation.IEEET2 exciter(
      TR = TR_ex,
      KA = KA_ex,
      TA = TA_ex,
      VRMAX = VRMAX_ex,
      VRMIN = VRMIN_ex,
      KE = KE_ex,
      TE = TE_ex,
      KF = KF_ex,
      TF1 = TF1_ex,
      TF2 = TF2_ex,
      E1 = E1_ex,
      SE_E1 = SE_E1_ex,
      E2 = E2_ex,
      SE_E2 = SE_E2_ex), redeclare Electrical.Control.TurbineGovernor.GAST turbineGovernor(
      R = R_tg,
      T1 = T1_tg,
      T2 = T2_tg,
      T3 = T3_tg,
      AT = AT_tg,
      KT = KT_tg,
      VMAX = VMAX_tg,
      VMIN = VMIN_tg,
      DTURB = DTURB_tg));

  parameter Real partType = 1;
  // GENROU Parameters
  parameter Integer IBUS = 100 "Located system bus";
  parameter String ID = "M1" "Machine Identifier" annotation(Dialog(tab = "GENROU"));
  parameter Real P_gen = 1100 "Bus Active Power, MW";
  parameter Real Q_gen = 342.702 "Bus Reactive Power, MVAR";
  parameter Real Vt_abs = 1.03 "Bus Voltage Magnitude, p.u.";
  parameter Real Vt_ang = -10.96 "Bus Voltage Angle, deg.";
  parameter Real SB = 1000 "Machine Base Power, MVA";
  parameter Real fn = 50 "Nominal frequency";
  parameter Real ZSOURCE_RE = 0 "Machine source impedence" annotation(Dialog(tab = "GENROU"));
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
  parameter Real Xl = 0.03 "Reactance due to the leakage flux which does not cross the air gap, p.u." annotation(Dialog(tab = "GENROU"));
  parameter Real S1 = 0.4 "saturation function value for 1 p.u. input" annotation(Dialog(tab = "GENROU"));
  parameter Real S12 = 0.8 "saturation function value for 1.2 p.u. input" annotation(Dialog(tab = "GENROU"));
  // IEEET2 Parameters
  parameter Real TR_ex = 0.025 "(sec)" annotation(Dialog(tab = "IEEET2"));
  parameter Real KA_ex = 98 annotation(Dialog(tab = "IEEET2"));
  parameter Real TA_ex = 0.2 "(sec)" annotation(Dialog(tab = "IEEET2"));
  parameter Real VRMAX_ex = 9 "or zero" annotation(Dialog(tab = "IEEET2"));
  parameter Real VRMIN_ex = -5 annotation(Dialog(tab = "IEEET2"));
  parameter Real KE_ex = 0.5 "or zero" annotation(Dialog(tab = "IEEET2"));
  parameter Real TE_ex = 0.35 "(>0) (sec)" annotation(Dialog(tab = "IEEET2"));
  parameter Real KF_ex = 0.03 annotation(Dialog(tab = "IEEET2"));
  parameter Real TF1_ex = 0.4 "(>0) (sec)" annotation(Dialog(tab = "IEEET2"));
  parameter Real TF2_ex = 0.4 "(>0) (sec)" annotation(Dialog(tab = "IEEET2"));
  parameter Real E1_ex = 4 annotation(Dialog(tab = "IEEET2"));
  parameter Real SE_E1_ex = 0.4 annotation(Dialog(tab = "IEEET2"));
  parameter Real E2_ex = 5 annotation(Dialog(tab = "IEEET2"));
  parameter Real SE_E2_ex = 0.5 annotation(Dialog(tab = "IEEET2"));
  // GAST Parameters
  parameter Real R_tg = 0.047 "Speed droop" annotation(Dialog(tab = "GAST"));
  parameter Real T1_tg = 0.4 "(>0) (sec)" annotation(Dialog(tab = "GAST"));
  parameter Real T2_tg = 0.1 "(>0) (sec)" annotation(Dialog(tab = "GAST"));
  parameter Real T3_tg = 3 "(>0) (sec)" annotation(Dialog(tab = "GAST"));
  parameter Real AT_tg = 1.5 "Ambient temperature load limit" annotation(Dialog(tab = "GAST"));
  parameter Real KT_tg = 2 annotation(Dialog(tab = "GAST"));
  parameter Real VMAX_tg = 1.5 annotation(Dialog(tab = "GAST"));
  parameter Real VMIN_tg = 0 annotation(Dialog(tab = "GAST"));
  parameter Real DTURB_tg = 0 annotation(Dialog(tab = "GAST"));

end GENROU_IEEET2_GAST;
