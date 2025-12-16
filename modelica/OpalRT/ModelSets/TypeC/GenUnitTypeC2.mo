within OpalRT.ModelSets.TypeC;
partial model GenUnitTypeC2
  "GenUnit with SynchronousMachine and Turbine-Governor models with vTRIP input"
  extends GenUnitTypeC1;
  // === External connectors ===
  input NonElectrical.Connector.InputInterfacePin vTrig annotation(Placement(
      visible = true,
      transformation(
        origin={-107,-65},
        extent={{-5,-5}, {5,5}},
        rotation = 0),
      iconTransformation(
        origin={-100,-90},
        extent = {{-10, -10}, {10, 10}},
        rotation = 360)));
  // === Utility constants and add blocks
  Modelica.Blocks.Sources.Constant constant1(k=0) annotation(Placement(
      visible = true,
      transformation(
        origin={-100,-80},
        extent = {{-5, -5}, {5, 5}}, rotation=0)));
  Modelica.Blocks.Math.Add add2 annotation (Placement(
      visible = true,
      transformation(
        origin={-79,-77},
        extent={{5,5},{-5,-5}},
        rotation=180)));
equation
  // Other
  connect(add2.u2,constant1. y) annotation(Line(points={{-85,-80},{-94.5,-80}}, color = {0, 0, 127}));
  connect(add2.u1,vTrig) annotation(Line(points={{-85,-74},{-92,-74},{-92,-65},{-107,-65}}, color = {0, 0, 127}));
  annotation (Icon(
                graphics={
                  Text(
                    origin={-52.9236,-92.2523},
                    extent={{-33.0764,16.2523},{16.9236,-5.74769}},
                    textString="vTRIP",
                    lineColor={0,0,0})}));
end GenUnitTypeC2;
