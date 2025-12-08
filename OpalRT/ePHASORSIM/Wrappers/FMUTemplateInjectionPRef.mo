within OpalRT.ePHASORSIM.Wrappers;
partial block FMUTemplateInjectionPRef
  extends FMUTemplateCommon;

  OpalRT.NonElectrical.SignalRouting.PIN2INOUT bus0_PIN2INOUT
    annotation (Placement(transformation(extent={{52,-42},{72,-22}})));
  OpalRT.NonElectrical.Connector.InputInterfacePin bus0_vr
    annotation (Placement(transformation(extent={{-106,34},{-94,46}})));
  OpalRT.NonElectrical.Connector.InputInterfacePin bus0_vi
    annotation (Placement(transformation(extent={{-106,-46},{-94,-34}})));
  OpalRT.NonElectrical.Connector.OutputInterfacePin bus0_ir
    annotation (Placement(transformation(extent={{94,34},{106,46}})));
  OpalRT.NonElectrical.Connector.OutputInterfacePin bus0_ii
    annotation (Placement(transformation(extent={{94,-46},{106,-34}})));
  replaceable OpalRT.ModelSets.InjectionPRef modelSet
    annotation (Placement(transformation(extent={{-18,2},{18,38}})));
  NonElectrical.Connector.InputInterfacePin dPref
    annotation (Placement(transformation(extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={-60,100})));
equation
  connect(bus0_PIN2INOUT.vr, bus0_vr) annotation (Line(points={{52,-24.2},{-6,-24.2},
          {-6,-24},{-80,-24},{-80,40},{-100,40}}, color={0,0,127}));
  connect(bus0_PIN2INOUT.vi, bus0_vi) annotation (Line(points={{51.8,-31.8},{-40,
          -31.8},{-40,-40},{-100,-40}}, color={0,0,127}));
  connect(bus0_PIN2INOUT.ir, bus0_ir) annotation (Line(points={{72.2,-27.6},{80,
          -27.6},{80,40},{100,40}}, color={0,0,127}));
  connect(bus0_PIN2INOUT.ii, bus0_ii) annotation (Line(points={{72.2,-36},{80,-36},
          {80,-40},{100,-40}}, color={0,0,127}));
  connect(modelSet.bus0, bus0_PIN2INOUT.p) annotation (Line(points={{18.72,7.4},
          {40,7.4},{40,-40},{52,-40}}, color={0,0,0}));
  connect(modelSet.dPref, dPref) annotation (Line(points={{-18,20},{-60,20},{-60,100}}, color={0,0,0}));
end FMUTemplateInjectionPRef;
