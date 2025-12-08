within OpalRT.ePHASORSIM.WrappedModels;
block CRANIT
  extends Wrappers.FMUTemplateTwoPowerPin(
    redeclare ModelSets.HVDC.CRANIT modelSet(
    partType = partType,
    R = R,
    X_init = X_init,
    B = B,
    T1 = T1,
    T2 = T2,
    T3 = T3,
    TW = TW,
    K = K,
    Xmax = Xmax,
    Xmin = Xmin,
    INmax = INmax,
    INmin = INmin,
    Vmag0_from = Vmag0_from,
    Vang0_from = Vang0_from,
    Vmag0_to = Vmag0_to,
    Vang0_to = Vang0_to));

  parameter Real partType = 1;
  parameter Real R = 1 "Resistance p.u.";
  parameter Real X_init = 1 "Reactance p.u.";
  parameter Real B = 1 "Shunt half susceptance p.u.";
  constant Real pi = Modelica.Constants.pi;
  parameter Real T1 = 1 "(s)";
  parameter Real T2 = 3 "(s)";
  parameter Real T3 = 3 "(s) (> 0)";
  parameter Real TW = 2 "(s) (> 0)";
  parameter Real K = 0.1;
  parameter Real Xmax = 0.1 "(pu) max. limit on output";
  parameter Real Xmin = -0.1 "(pu) min. limit on output";
  parameter Real INmax = 10 "(pu) max. limit on input signal";
  parameter Real INmin = -10 "(pu) min. limit on input signal";
  parameter Real Vmag0_from = 1;
  parameter Real Vang0_from = 10;
  parameter Real Vmag0_to = 0.95;
  parameter Real Vang0_to = 0;
end CRANIT;
