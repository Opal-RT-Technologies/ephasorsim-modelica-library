within OpalRT.ModelSets.TypeD;
model GENROU_IEEET5_IEESGO
  extends GenUnitTypeD1(redeclare Electrical.Machine.SynchronousMachine.GENROU synchronousGenerator(
      IBUS = IBUS,
      ID = ID,
      P_gen = P_gen,
      Q_gen = Q_gen,
      Vt_abs = Vt_abs,
      Vt_ang = Vt_ang,
      SB = SB,
      fn = fn,
      ZSOURCE_RE = 0,
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
      S12 = S12), redeclare Electrical.Control.Excitation.IEEET5 exciter(
      ID = ID,
      TRH = TRH_ex,
      VRMAX = VRMAX_ex,
      VRMIN = VRMIN_ex,
      KE = KE_ex,
      TE = TE_ex,
      E1 = E1_ex,
      SE_E1 = SE_E1_ex,
      E2 = E2_ex,
      SE_E2 = SE_E2_ex,
      KV = KV_ex), redeclare Electrical.Control.TurbineGovernor.IEESGO turbineGovernor(
      T1 = T1_tg,
      T2 = T2_tg,
      T3 = T3_tg,
      T4 = T4_tg,
      T5 = T5_tg,
      T6 = T6_tg,
      K1 = K1_tg,
      K2 = K2_tg,
      K3 = K3_tg,
      PMAX = PMAX_tg,
      PMIN = PMIN_tg));

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
  //IEEET5 Parameters
  parameter Real TRH_ex = 0.025 "(sec)" annotation(Dialog(tab = "IEEET5"));
  parameter Real KV_ex = 98 annotation(Dialog(tab = "IEEET5"));
  parameter Real VRMAX_ex = 9 "or zero" annotation(Dialog(tab = "IEEET5"));
  parameter Real VRMIN_ex = -5 annotation(Dialog(tab = "IEEET5"));
  parameter Real KE_ex = 0.5 "or zero" annotation(Dialog(tab = "IEEET5"));
  parameter Real TE_ex = 0.35 "(>0) (sec)" annotation(Dialog(tab = "IEEET5"));
  parameter Real E1_ex = 4 annotation(Dialog(tab = "IEEET5"));
  parameter Real SE_E1_ex = 0.4 annotation(Dialog(tab = "IEEET5"));
  parameter Real E2_ex = 5 annotation(Dialog(tab = "IEEET5"));
  parameter Real SE_E2_ex = 0.5 annotation(Dialog(tab = "IEEET5"));
  // IEESGO parameters
  parameter Real T1_tg = 1 "Controller Lag" annotation(Dialog(tab = "IEESGO"));
  parameter Real T2_tg = 1 "Controller Lead Compensation" annotation(Dialog(tab = "IEESGO"));
  parameter Real T3_tg = 1 "Governor Lag (> 0)" annotation(Dialog(tab = "IEESGO"));
  parameter Real T4_tg = 1 "Delay Due To Steam Inlet Volumes" annotation(Dialog(tab = "IEESGO"));
  parameter Real T5_tg = 1 "Reheater Delay" annotation(Dialog(tab = "IEESGO"));
  parameter Real T6_tg = 1 "Turbine pipe hood Delay" annotation(Dialog(tab = "IEESGO"));
  parameter Real K1_tg = 0.5 "1/Per Unit Regulation" annotation(Dialog(tab = "IEESGO"));
  parameter Real K2_tg = 0.5 "Fraction" annotation(Dialog(tab = "IEESGO"));
  parameter Real K3_tg = 0.5 "fraction" annotation(Dialog(tab = "IEESGO"));
  parameter Real PMAX_tg = 1 "Upper Power Limit" annotation(Dialog(tab = "IEESGO"));
  parameter Real PMIN_tg = -1 "Lower Power Limit" annotation(Dialog(tab = "IEESGO"));

end GENROU_IEEET5_IEESGO;
