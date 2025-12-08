within OpalRT.ePHASORSIM.WrappedModels;
block GENROU_IEEET5
  extends Wrappers.FMUTemplateVRef(redeclare ModelSets.TypeB.GENROU_IEEET5 modelSet(
      partType = partType,
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
      TRH_ex = TRH_ex,
      KV_ex = KV_ex,
      VRMAX_ex = VRMAX_ex,
      VRMIN_ex = VRMIN_ex,
      KE_ex = KE_ex,
      TE_ex = TE_ex,
      E1_ex = E1_ex,
      SE_E1_ex = SE_E1_ex,
      E2_ex = E2_ex,
      SE_E2_ex = SE_E2_ex));

// >>> AUTOGEN PARAMS (VERBATIM FROM MODELSETS) BEGIN
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
// <<< AUTOGEN PARAMS (VERBATIM FROM MODELSETS) END


end GENROU_IEEET5;
