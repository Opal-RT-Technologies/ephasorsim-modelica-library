within OpalRT.ePHASORSIM.WrappedModels;
block GENCLS_TGOV1
  extends Wrappers.FMUTemplateGRef(redeclare ModelSets.TypeC.GENCLS_TGOV1 modelSet(
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
      ZSOURCE_IM = ZSOURCE_IM,
      R_tg = R_tg,
      T1_tg = T1_tg,
      VMAX_tg = VMAX_tg,
      VMIN_tg = VMIN_tg,
      T2_tg = T2_tg,
      T3_tg = T3_tg,
      Dt_tg = Dt_tg));

// >>> AUTOGEN PARAMS (VERBATIM FROM MODELSETS) BEGIN
  parameter Real partType = 1;
  // GENCLS Parameters
  parameter Integer IBUS = 100 "Located system bus";
  parameter String M_ID = "M1" "Machine Identifier";
  parameter Real P_gen = 900;
  parameter Real Vt_abs = 1.03;
  parameter Real Q_gen = 200;
  parameter Real Vt_ang = -10.96;
  parameter Real SB = 1000;
  parameter Real fn = 50;
  parameter Real H = 5;
  parameter Real D = 2;
  parameter Real ZSOURCE_RE = 0;
  parameter Real ZSOURCE_IM = 0;
  // TGOV1 Parameters
  parameter Real R_tg = 0.01 annotation(Dialog(tab = "TGOV1 Parameters"));
  parameter Real T1_tg = 0.01 "(>0) (sec)" annotation(Dialog(tab = "TGOV1 Parameters"));
  parameter Real VMAX_tg = 1 annotation(Dialog(tab = "TGOV1 Parameters"));
  parameter Real VMIN_tg = -1 annotation(Dialog(tab = "TGOV1 Parameters"));
  parameter Real T2_tg = 0.01 annotation(Dialog(tab = "TGOV1 Parameters"));
  parameter Real T3_tg = 0.01 "(>0) (sec)" annotation(Dialog(tab = "TGOV1 Parameters"));
  parameter Real Dt_tg = 1 annotation(Dialog(tab = "TGOV1 Parameters"));
// <<< AUTOGEN PARAMS (VERBATIM FROM MODELSETS) END


end GENCLS_TGOV1;
