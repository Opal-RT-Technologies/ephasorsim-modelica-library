within OpalRT.ePHASORSIM.Wrappers;
partial block FMUTemplateTwoPowerPin
  extends FMUTemplateCommon;

  OpalRT.NonElectrical.SignalRouting.PIN2INOUT bus0_PIN2INOUT
    annotation (Placement(transformation(extent={{40,-10},{60,10}})));
  OpalRT.NonElectrical.Connector.InputInterfacePin bus0_vr
    annotation (Placement(transformation(extent={{-106,64},{-94,76}})));
  OpalRT.NonElectrical.Connector.InputInterfacePin bus0_vi
    annotation (Placement(transformation(extent={{-106,24},{-94,36}})));
  OpalRT.NonElectrical.Connector.OutputInterfacePin bus0_ir
    annotation (Placement(transformation(extent={{94,64},{106,76}})));
  OpalRT.NonElectrical.Connector.OutputInterfacePin bus0_ii
    annotation (Placement(transformation(extent={{94,24},{106,36}})));
  replaceable OpalRT.ModelSets.TwoPinCore modelSet
    annotation (Placement(transformation(extent={{-18,22},{18,58}})));
  NonElectrical.SignalRouting.PIN2INOUT bus0_PIN2INOUT1
    annotation (Placement(transformation(extent={{40,-50},{60,-30}})));
  NonElectrical.Connector.InputInterfacePin bus1_vr
    annotation (Placement(transformation(extent={{-106,-36},{-94,-24}})));
  NonElectrical.Connector.InputInterfacePin bus1_vi
    annotation (Placement(transformation(extent={{-106,-76},{-94,-64}})));
  NonElectrical.Connector.OutputInterfacePin bus1_ir
    annotation (Placement(transformation(extent={{94,-36},{106,-24}})));
  NonElectrical.Connector.OutputInterfacePin bus1_ii
    annotation (Placement(transformation(extent={{94,-76},{106,-64}})));
equation
  connect(bus0_PIN2INOUT.vr, bus0_vr) annotation (Line(points={{40,7.8},{-6,7.8},
          {-6,10},{-70,10},{-70,70},{-100,70}},   color={0,0,127}));
  connect(bus0_PIN2INOUT.vi, bus0_vi) annotation (Line(points={{39.8,0.2},{-6,0.2},
          {-6,0},{-80,0},{-80,30},{-100,30}},
                                        color={0,0,127}));
  connect(bus0_PIN2INOUT.ir, bus0_ir) annotation (Line(points={{60.2,4.4},{70,4.4},
          {70,70},{100,70}},        color={0,0,127}));
  connect(bus0_PIN2INOUT.ii, bus0_ii) annotation (Line(points={{60.2,-4},{80,-4},
          {80,30},{100,30}},   color={0,0,127}));
  connect(modelSet.bus0, bus0_PIN2INOUT.p) annotation (Line(points={{-17.64,
          27.4},{-30,27.4},{-30,-8},{40,-8}},
                                       color={0,0,0}));
  connect(modelSet.bus1, bus0_PIN2INOUT1.p) annotation (Line(points={{18.72,
          27.4},{30,27.4},{30,-48},{40,-48}},
                                        color={0,0,0}));
  connect(bus0_PIN2INOUT1.ir, bus1_ir) annotation (Line(points={{60.2,-35.6},{80,
          -35.6},{80,-30},{100,-30}}, color={0,0,127}));
  connect(bus0_PIN2INOUT1.ii, bus1_ii) annotation (Line(points={{60.2,-44},{80,-44},
          {80,-70},{100,-70}}, color={0,0,127}));
  connect(bus0_PIN2INOUT1.vr, bus1_vr) annotation (Line(points={{40,-32.2},{0,-32.2},
          {0,-30},{-100,-30}}, color={0,0,127}));
  connect(bus0_PIN2INOUT1.vi, bus1_vi) annotation (Line(points={{39.8,-39.8},{0,
          -39.8},{0,-70},{-100,-70}}, color={0,0,127}));
end FMUTemplateTwoPowerPin;
