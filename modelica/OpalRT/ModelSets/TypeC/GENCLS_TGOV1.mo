within OpalRT.ModelSets.TypeC;
model GENCLS_TGOV1
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
    redeclare Electrical.Control.TurbineGovernor.TGOV1 turbineGovernor(
      R=R_tg,
      T1=T1_tg,
      VMAX=VMAX_tg,
      VMIN=VMIN_tg,
      T2=T2_tg,
      T3=T3_tg,
      Dt=Dt_tg));

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
  parameter Real R_tg = 0.01 annotation(Dialog(tab = "TGOV1 Parameters"));
  parameter Real T1_tg = 0.01 "(>0) (sec)" annotation(Dialog(tab = "TGOV1 Parameters"));
  parameter Real VMAX_tg = 1 annotation(Dialog(tab = "TGOV1 Parameters"));
  parameter Real VMIN_tg = -1 annotation(Dialog(tab = "TGOV1 Parameters"));
  parameter Real T2_tg = 0.01;
  parameter Real T3_tg = 0.01 "(>0) (sec)" annotation(Dialog(tab = "TGOV1 Parameters"));
  parameter Real Dt_tg = 1 annotation(Dialog(tab = "TGOV1 Parameters"));

end GENCLS_TGOV1;
