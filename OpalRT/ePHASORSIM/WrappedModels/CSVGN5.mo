within OpalRT.ePHASORSIM.WrappedModels;
block CSVGN5
  extends Wrappers.FMUTemplateInjectionVOTHSG(
    redeclare ModelSets.FACTS.CSVGN5 modelSet(
      partType = 1,
      Vt_abs = Vt_abs,
      Vt_ang = Vt_ang,
      P_gen = P_gen,
      Q_gen = Q_gen,
      SB = SB,
      fn = fn,
      ZSOURCE_RE = ZSOURCE_RE,
      ZSOURCE_IM = ZSOURCE_IM,
      TS1 = TS1, VEMAX = VEMAX,
      TS2 = TS2,
      TS3 = TS3,
      TS4 = TS4,
      TS5 = TS5,
      KSVS = KSVS,
      KSD = KSD,
      BMAX = BMAX,
      BpMAX = BpMAX,
      BpMIN = BpMIN,
      BMIN = BMIN,
      TS6 = TS6,
      DV = DV));

  parameter Real partType = 1;
  // GENROU Parameters
  parameter Integer IBUS = 100 "Located system bus" annotation(Dialog(tab = "General"));
  parameter String M_ID = "M1" "Machine Identifier" annotation(Dialog(tab = "General"));
  parameter Real Vt_abs = 1.03 annotation(Dialog(tab = "General"));
  parameter Real Vt_ang = -10.06 annotation(Dialog(tab = "General"));
  parameter Real P_gen = 0 annotation(Dialog(tab = "General"));
  parameter Real Q_gen = 100 annotation(Dialog(tab = "General"));
  parameter Real SB = 1000 annotation(Dialog(tab = "General"));
  parameter Real fn = 50 "Nominal frequency" annotation(Dialog(tab = "General"));
  parameter Real ZSOURCE_RE = 0 "Machine source impedence (NOT USED)" annotation(Dialog(tab = "CSVGN5 Parameters"));
  parameter Real ZSOURCE_IM = 999 "Machine source impedence (NOT USED)" annotation(Dialog(tab = "CSVGN5 Parameters"));
  parameter Real TS1 = 0.01 annotation(Dialog(tab = "CSVGN5 Parameters"));
  parameter Real VEMAX = 0.15 annotation(Dialog(tab = "CSVGN5 Parameters"));
  parameter Real TS2 = 0.1 annotation(Dialog(tab = "CSVGN5 Parameters"));
  parameter Real TS3 = 5 ">0" annotation(Dialog(tab = "CSVGN5 Parameters"));
  parameter Real TS4 = 0.01 annotation(Dialog(tab = "CSVGN5 Parameters"));
  parameter Real TS5 = 0.01 annotation(Dialog(tab = "CSVGN5 Parameters"));
  parameter Real KSVS = 400 annotation(Dialog(tab = "CSVGN5 Parameters"));
  parameter Real KSD = 1 annotation(Dialog(tab = "CSVGN5 Parameters"));
  parameter Real BMAX = 1 annotation(Dialog(tab = "CSVGN5 Parameters"));
  parameter Real BpMAX = 1 annotation(Dialog(tab = "CSVGN5 Parameters"));
  parameter Real BpMIN = -0.5 annotation(Dialog(tab = "CSVGN5 Parameters"));
  parameter Real BMIN = -0.5 annotation(Dialog(tab = "CSVGN5 Parameters"));
  parameter Real TS6 = 0.05 ">0" annotation(Dialog(tab = "CSVGN5 Parameters"));
  parameter Real DV = 0.15 annotation(Dialog(tab = "CSVGN5 Parameters"));
  parameter Real ICONM = 0 "Remote bus Number (NOT USED)" annotation(Dialog(tab = "ICONS"));
end CSVGN5;
