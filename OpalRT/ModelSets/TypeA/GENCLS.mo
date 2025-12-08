within OpalRT.ModelSets.TypeA;
model GENCLS
  extends GenUnitTypeA1(redeclare Electrical.Machine.SynchronousMachine.GENCLS synchronousGenerator(
      fn = fn,
      P_gen = P_gen,
      Q_gen = Q_gen,
      Vt_abs = Vt_abs,
      Vt_ang = Vt_ang,
      SB = SB,
      H = H,
      D = D,
      ZSOURCE_IM = ZSOURCE_IM,
      ZSOURCE_RE = ZSOURCE_RE,
      IBUS = IBUS,
      ID = M_ID));

  parameter Real partType = 1;
  parameter Integer IBUS = 100 "Located system bus";
  parameter String M_ID = "M1" "Machine Identifier";
  parameter Real P_gen = 900;
  parameter Real Vt_abs = 0.5;
  parameter Real Q_gen = 200;
  parameter Real Vt_ang = -1;
  parameter Real SB = 1000;
  parameter Real fn = 50;
  parameter Real H = 10;
  parameter Real D = 0;
  parameter Real ZSOURCE_RE = 0.1;
  parameter Real ZSOURCE_IM = 0.1;

  annotation(experiment(StartTime = 0, StopTime = 20, Tolerance = 1e-06, Interval = 0.01));
end GENCLS;
