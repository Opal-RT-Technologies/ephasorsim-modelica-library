within OpalRT.ePHASORSIM.WrappedModels;
block CIMTR4
  extends Wrappers.FMUTemplateInjection(
    redeclare ModelSets.InductionMachine.CIMTR4 modelSet(
      P_gen = P_gen,
      Q_gen = Q_gen,
      Vt_abs = Vt_abs,
      Vt_ang = Vt_ang,
      SB = SB,
      fn = fn,
      ZSOURCE_RE = ZSOURCE_RE,
      Tp = Tp,
      Ts = Ts,
      H = H,
      X = X,
      Xp = Xp,
      Xs = Xs,
      Xl = Xl,
      E1 = E1,
      SE1 = SE1,
      E2 = E2,
      SE2 = SE2,
      D = D,
      Syn_TOR = Syn_TOR));

  parameter Real partType = 1;
  parameter Real P_gen = 100 "Bus Active Power, MW";
  parameter Real Q_gen = 10 "Bus Reactive Power, MVAR";
  parameter Real Vt_abs = 1.0 "Bus Voltage Magnitude, p.u.";
  parameter Real Vt_ang = 0 "Bus Voltage Angle, deg.";
  parameter Real SB = 100 "Machine Base Power, MVA";
  parameter Real fn = 60 "Nominal frequency";
  parameter Real ZSOURCE_RE = 0.1 "Machine source impedence";
  parameter Real Tp = 1.05 "(> 0)";
  parameter Real Ts = 0.1 "(>= 0; if equal to 0, see manual)";
  parameter Real H = 3 "Inertia";
  parameter Real X = 4;
  parameter Real Xp = 0.3;
  parameter Real Xs = 0.2 "(if equal to 0, see manual)";
  parameter Real Xl = 0.1;
  parameter Real E1 = 1 "(>= 0.)";
  parameter Real SE1 = 0.3157;
  parameter Real E2 = 1.2;
  parameter Real SE2 = 1.303;
  parameter Real D = 0;
  parameter Real Syn_TOR = 0 "(> 0), Mechanical power at synchronous speed";
end CIMTR4;
