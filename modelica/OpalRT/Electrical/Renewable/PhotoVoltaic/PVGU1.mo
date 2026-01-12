within OpalRT.Electrical.Renewable.PhotoVoltaic;
model PVGU1 "PV Converter"
  extends OpalRT.Electrical.Renewable.WindTurbineGenerator.WT4.WT4G1 annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
  annotation(Documentation(info = "<html>

<p>
The model is similar to WT4G1.
</p>

<img src=\"modelica://OpalRT/resource/Electrical/Wind_Turbine/WT4/WT4G1.png\"


</html>"));
end PVGU1;
