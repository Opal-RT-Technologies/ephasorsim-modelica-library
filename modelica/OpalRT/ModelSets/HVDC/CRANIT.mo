within OpalRT.ModelSets.HVDC;
model CRANIT
  extends ModelSets.TwoPinCore;

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
  OpalRT.Electrical.Branch.HVDC.CRANIT cranit1(R = R, X_init = X_init, B = B, T1 = T1, T2 = T2, T3 = T3, TW = TW, K = K, Xmax = Xmax, Xmin = Xmin, INmax = INmax, INmin = INmin, Vmag0_from = Vmag0_from, Vang0_from = Vang0_from, Vmag0_to = Vmag0_to, Vang0_to = Vang0_to) annotation(Placement(visible = true, transformation(origin={0,-28},   extent={{-36,-36},
            {36,36}},                                                                                                                                                                                                        rotation = 0)));
equation
  connect(bus1, cranit1.n) annotation(Line(points={{106,-30},{102.16,-30},{102.16,
          -28},{36,-28}}));
  connect(bus0, cranit1.p) annotation(Line(points={{-106,-28},{-36,-28}}));
  annotation (Icon(
                graphics={
                  Text(
                    origin={71.1586,-75.65},
                    extent={{-17.1586,25.65},{16.8414,-14.35}},
                    textString="BUS1",
                    lineColor={0,0,0}),
                  Text(
                    origin={-65.8321,-75.65},
                    extent={{-18.1679,25.65},{17.8321,-14.35}},
                    lineColor={0,0,0},
                    textString="BUS0")}));
end CRANIT;
