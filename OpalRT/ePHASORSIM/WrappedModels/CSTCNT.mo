within OpalRT.ePHASORSIM.WrappedModels;
block CSTCNT
  extends Wrappers.FMUTemplateInjectionVOTHSGVRef(
    redeclare ModelSets.FACTS.CSTCNT modelSet(
      partType = partType,
      IB = IB,
      Vt_abs = Vt_abs,
      Vt_ang = Vt_ang,
      P_gen = P_gen,
      Q_gen = Q_gen,
      SB = SB,
      fn = fn,
      T1 = T1,
      T2 = T2,
      T3 = T3,
      T4 = T4,
      K = K,
      Droop = Droop,
      Vmax = Vmax,
      Vmin = Vmin,
      ICMAX = ICMAX,
      ILMAX = ILMAX,
      Vcutout = Vcutout,
      Elimit = Elimit,
      Xt = Xt,
      Acc = Acc));

  parameter Real partType = 1;
  // GENROU Parameters
  constant Real pi = Modelica.Constants.pi;
  parameter Real Vt_abs = 1.03;
  parameter Real Vt_ang = -10.06;
  parameter Real P_gen = 0 "Bus Active Power, MW";
  parameter Real Q_gen = 100 "Bus Reactive Power, MVAR";
  parameter Real SB = 100 "Machine Base Power, MVA";
  parameter Real fn = 50 "Nominal frequency";
  parameter Real ZSOURCE_RE = 0 "Machine source impedence (NOT USED)" annotation(Dialog(tab = "CSVGN5 Parameters"));
  parameter Real ZSOURCE_IM = 999 "Machine source impedence (NOT USED)" annotation(Dialog(tab = "CSVGN5 Parameters"));
  parameter Real IB = 0 "ICONM : # for voltage control; 0 for local control" annotation(Dialog(tab = "ICONs"));
  parameter Real T1 = 0.1;
  parameter Real T2 = 0.2;
  parameter Real T3 = 0.3;
  parameter Real T4 = 0.4;
  parameter Real K = 40;
  parameter Real Droop = 0.025 "Droop";
  parameter Real Vmax = 999;
  parameter Real Vmin = -999;
  parameter Real ICMAX = 1.25 "MaX capacitive current";
  parameter Real ILMAX = 1.25 "MaX inductive current";
  parameter Real Vcutout = 0.2 "cut out voltage";
  parameter Real Elimit = 1.2;
  parameter Real Xt = 0.1 "transformer inductance";
  parameter Real Acc = 0;
end CSTCNT;
