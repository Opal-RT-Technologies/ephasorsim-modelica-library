within OpalRT.ModelSets.TypeC;
model GENCLS_GAST
  extends ModelSets.GenUnitGov(
    redeclare Electrical.Machine.SynchronousMachine.GENCLS synchronousGenerator(
      fn=fn,
      P_gen=P_gen,
      Q_gen=Q_gen,
      Vt_abs=Vt_abs,
      Vt_ang=Vt_ang,
      SB=SB,
      H=H,
      D=D,
      ZSOURCE_IM=ZSOURCE_IM,
      ZSOURCE_RE=ZSOURCE_RE,
      IBUS=IBUS,
      ID=M_ID),
    redeclare Electrical.Control.TurbineGovernor.GAST turbineGovernor(
      R=R_tg,
      T1=T1_tg,
      T2=T2_tg,
      T3=T3_tg,
      AT=AT_tg,
      KT=KT_tg,
      VMAX=VMAX_tg,
      VMIN=VMIN_tg,
      DTURB=DTURB_tg));

  parameter Real partType = 1;
  // GENCLS Parameters
  parameter Integer IBUS = 100 "Located system bus";
  parameter String M_ID = "M1" "Machine Identifier";
  parameter Real P_gen = 900;
  parameter Real Q_gen = 200;
  parameter Real Vt_abs = 1.03;
  parameter Real Vt_ang = -10.96;
  parameter Real SB = 1000;
  parameter Real fn = 50;
  parameter Real H = 5;
  parameter Real D = 2;
  parameter Real ZSOURCE_RE = 0;
  parameter Real ZSOURCE_IM = 0;
  // GAST Parameters
  parameter Real R_tg = 0.01 "Speed droop" annotation(Dialog(tab = "GAST Parameters"));
  parameter Real T1_tg = 0.01 "(>0) (sec)" annotation(Dialog(tab = "GAST Parameters"));
  parameter Real T2_tg = 0.01 "(>0) (sec)" annotation(Dialog(tab = "GAST Parameters"));
  parameter Real T3_tg = 0.3 "(>0) (sec)" annotation(Dialog(tab = "GAST Parameters"));
  parameter Real AT_tg = 0.12 "Ambient temperature load limit" annotation(Dialog(tab = "GAST Parameters"));
  parameter Real KT_tg = 0.2 annotation(Dialog(tab = "GAST Parameters"));
  parameter Real VMAX_tg = 0.12 annotation(Dialog(tab = "GAST Parameters"));
  parameter Real VMIN_tg = 0.01 annotation(Dialog(tab = "GAST Parameters"));
  parameter Real DTURB_tg = 0.01 annotation(Dialog(tab = "GAST Parameters"));

end GENCLS_GAST;
