within OpalRT.ModelSets;
partial model TwoPinControlPorts
  // === External connectors ===
  NonElectrical.Connector.PwPin bus0 annotation (Placement(
      visible=true,
      transformation(
        origin={106,-30},
        extent={{-5,-5},{5,5}},
        rotation=0),
      iconTransformation(
        origin={104,-70},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  NonElectrical.Connector.PwPin bus1 annotation (Placement(
      visible=true,
      transformation(
        origin={-106,-28},
        extent={{-5,-5},{5,5}},
        rotation=0),
      iconTransformation(
        origin={-98,-70},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  input NonElectrical.Connector.InputInterfacePin dSETVL annotation(Placement(
      visible = true,
      transformation(
        origin={-35,27},
        extent={{-5,-5},{5,5}},
        rotation=0),
      iconTransformation(origin={-100,60},
      extent = {{-10, -10}, {10, 10}},
      rotation = 0)));
  input NonElectrical.Connector.InputInterfacePin dVSCHED annotation (Placement(
      visible=true,
      transformation(
        origin={-47,5},
        extent={{-5,-5},{5,5}},
        rotation=0),
      iconTransformation(
        origin={-100,-40},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  annotation (Icon(
                coordinateSystem(
                  extent = {{-100, -100}, {100, 100}},
                  preserveAspectRatio = true, initialScale = 0.1),
                graphics={
                  Rectangle(
                    extent={{-100,100},{100,-100}},
                    lineColor={0,0,0},
                    lineThickness=0.5),
                  Text(
                    origin={-54,20},
                    extent={{-33.8482,13.7194},{142.152,-52.2806}},
                    textString="%class",
                    lineColor={{0,0,0}}),
                  Text(
                    origin={-45.52,52.9023},
                    extent = {{-39.43, 24.94}, {20.1741, -8.82}},
                    textString="dSETVL",
                    lineColor={0,0,0}),
                  Text(
                    origin={-45.52,-49.0977},
                    extent = {{-39.43, 24.94}, {20.1741, -8.82}},
                    textString="dVSCHED",
                    lineColor={0,0,0})}),
      Diagram(coordinateSystem(extent = {{-160, -120}, {160, 120}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
end TwoPinControlPorts;
