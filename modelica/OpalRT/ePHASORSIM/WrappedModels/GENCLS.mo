within OpalRT.ePHASORSIM.WrappedModels;
block GENCLS
  extends Wrappers.FMUTemplateInjectionTrip(redeclare ModelSets.TypeA.GENCLS modelSet(
      partType = partType,
      IBUS = IBUS,
      M_ID = M_ID,
      P_gen = P_gen,
      Vt_abs = Vt_abs,
      Q_gen = Q_gen,
      Vt_ang = Vt_ang,
      SB = SB,
      fn = fn,
      H = H,
      D = D,
      ZSOURCE_RE = ZSOURCE_RE,
      ZSOURCE_IM = ZSOURCE_IM));

// >>> AUTOGEN PARAMS (VERBATIM FROM MODELSETS) BEGIN
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
// <<< AUTOGEN PARAMS (VERBATIM FROM MODELSETS) END


end GENCLS;
