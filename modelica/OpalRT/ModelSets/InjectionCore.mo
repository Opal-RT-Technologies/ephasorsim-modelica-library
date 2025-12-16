within OpalRT.ModelSets;
partial model InjectionCore "Core Injection model"
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
                    origin={75.0632,-73.7728},
                    extent = {{-11.7679, 11.8688}, {11.55, -6.64}},
                    textString = "PIN"),
                  Text(
                    origin={-54,20},
                    extent={{-33.8482,13.7194},{142.152,-52.2806}},
                    textString="%class",
                    lineColor={{0,0,0}})}),
      Diagram(coordinateSystem(extent = {{-160, -120}, {160, 120}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
end InjectionCore;
