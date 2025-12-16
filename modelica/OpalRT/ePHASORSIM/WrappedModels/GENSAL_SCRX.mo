within OpalRT.ePHASORSIM.WrappedModels;
block GENSAL_SCRX
  extends Wrappers.FMUTemplateVRef(redeclare ModelSets.TypeB.GENSAL_SCRX modelSet(
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
      Tqo_s = Tqo_s,
      H = H,
      D = D,
      Xd = Xd,
      Xq = Xq,
      Xd_p = Xd_p,
      Xd_s = Xd_s,
      Xl = Xl,
      S1 = S1,
      S12 = S12,
      TA_TB_ex = TA_TB_ex,
      TB_ex = TB_ex,
      K_ex = K_ex,
      TE_ex = TE_ex,
      EMIN_ex = EMIN_ex,
      EMAX_ex = EMAX_ex,
      CSWITCH_ex = CSWITCH_ex,
      rc_rfd_ex = rc_rfd_ex));

// >>> AUTOGEN PARAMS (VERBATIM FROM MODELSETS) BEGIN
  parameter Real partType = 1;
  // GENSAL Parameters
  parameter Integer IBUS = 100 "Located system bus" annotation(Dialog(tab = "General"));
  parameter String ID = "M1" "Machine Identifier" annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real P_gen = 1100 "Bus Active Power, MW" annotation(Dialog(tab = "General"));
  parameter Real Q_gen = 342.702 "Bus Reactive Power, MVAR" annotation(Dialog(tab = "General"));
  parameter Real Vt_abs = 1.03 "Bus Voltage Magnitude, p.u." annotation(Dialog(tab = "General"));
  parameter Real Vt_ang = -10.96 "Bus Voltage Angle, deg." annotation(Dialog(tab = "General"));
  parameter Real SB = 1000 "Machine Base Power, MVA" annotation(Dialog(tab = "General"));
  parameter Real fn = 50 "Nominal frequency" annotation(Dialog(tab = "General"));
  parameter Real ZSOURCE_RE = 0 "Machine source impedence" annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real Tdo_p = 7 "d-axis transient time constant" annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real Tdo_s = 0.03 "d-axis sub-transient time constant, s" annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real Tqo_s = 0.04 "d-axis sub-transient time constant, s" annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real H = 50 "Inertia constant" annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real D = 0 "Speed damping" annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real Xd = 0.2 "d-axis reactance, p.u." annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real Xq = 0.19 "q-axis reactance, p.u." annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real Xd_p = 0.06 "d-axis transient reactance, p.u." annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real Xd_s = 0.02 "d-axis sub-transient reactance, p.u." annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real Xl = 0.03 "Reactance due to the leakage flux which does not cross the air gap, p.u." annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real S1 = 0.4 "saturation function value for 1 p.u. input" annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real S12 = 0.8 "saturation function value for 1.2 p.u. input" annotation(Dialog(tab = "GENSAL Parameters"));
  // SCRX Parameters
  parameter Real TA_TB_ex = 4 "TA/TB" annotation(Dialog(tab = "SCRX Parameters"));
  parameter Real TB_ex = 1 "(>0) (sec)" annotation(Dialog(tab = "SCRX Parameters"));
  parameter Real K_ex = 100 annotation(Dialog(tab = "SCRX Parameters"));
  parameter Real TE_ex = 0.5 "(sec)" annotation(Dialog(tab = "SCRX Parameters"));
  parameter Real EMIN_ex = -1.2 "(pu on EFD base)" annotation(Dialog(tab = "SCRX Parameters"));
  parameter Real EMAX_ex = 2 "(pu on EFD base)" annotation(Dialog(tab = "SCRX Parameters"));
  parameter Real CSWITCH_ex = 1 "0 for bus fed, 1 for solid fed" annotation(Dialog(tab = "SCRX Parameters"));
  parameter Real rc_rfd_ex = 3 "rc/rfd, 0 with negative field current capability (EX=EFD)" annotation(Dialog(tab = "SCRX Parameters"));
// <<< AUTOGEN PARAMS (VERBATIM FROM MODELSETS) END


end GENSAL_SCRX;
