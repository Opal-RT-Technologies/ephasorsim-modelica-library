within OpalRT.Electrical.Control.Excitation.Common;
block CurrentNormalization
  Modelica.Blocks.Interfaces.RealOutput IN annotation(Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput IFD annotation(Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-98, 68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput VE annotation(Placement(visible = true, transformation(origin = {-100, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-96, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  import OpalRT.Electrical.Control.Excitation.Common.currentNormalizationFunction;
equation
  IN = currentNormalizationFunction(IFD, VE);
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Documentation(info = "<html>
<p>
This block calculates normalized current, IN from IFD and VE of the rectifier based exciters and it should be explicitly used with the Rectifier block.
</p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = false, initialScale = 0.1, grid = {2, 2}), graphics={  Text(origin = {-73.193, 68.1295}, extent = {{-8.93, 7.98}, {8.93, -7.98}}, textString = "IFD", lineColor = {0, 0, 0}), Text(origin = {-74.3776, -70.1019}, extent = {{-9.47, 8.25}, {9.47, -8.25}}, textString = "VE", lineColor = {0, 0, 0}), Text(origin = {77.91, -2.33}, extent = {{-8.93, 7.98}, {8.93, -7.98}}, textString = "IN", lineColor = {0, 0, 0}), Rectangle(origin = {0.541272, -0.270636}, extent = {{-100.135, 99.8647}, {100.135, -99.8647}}), Text(origin = {-45.9238, -1.9259}, extent = {{-35.9238, 28.0741}, {35.9238, -28.0741}}, lineColor = {0, 0, 0}, textString = "IN = "), Text(origin = {22.9385, 18.0547}, extent = {{-27.0615, 24.0547}, {27.0615, -24.0547}}, textString = "IFD", lineColor = {0, 0, 0}), Text(origin = {21.0762, -28.926}, extent = {{-30.9238, 21.0741}, {30.9238, -21.0741}}, textString = "VE", lineColor = {0, 0, 0}), Rectangle(extent = {{-10, 0}, {52, -4}}, lineColor = {0, 0, 0},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid, fillColor = {0, 0, 0})}));
end CurrentNormalization;
