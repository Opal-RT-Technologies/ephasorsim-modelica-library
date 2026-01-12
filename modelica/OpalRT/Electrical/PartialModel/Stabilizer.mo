within OpalRT.Electrical.PartialModel;
partial model Stabilizer
  parameter Real partType = 4;
  Real ETERM "Generator Terminal Voltage";
  Modelica.Blocks.Interfaces.RealOutput VOTHSG annotation(Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput PSS_AUX[2] annotation(Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput PSS_AUX2[2] annotation(Placement(visible = true, transformation(origin = {-100, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput VI[4] annotation(Placement(visible = true, transformation(origin = {-100, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput VI2[4] annotation(Placement(visible = true, transformation(origin = {-100, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  ETERM = sqrt(VI[1] * VI[1] + VI[2] * VI[2]);
  annotation(Icon(coordinateSystem(preserveAspectRatio = false), graphics={  Text(origin = {11.2577, 43.6011}, extent = {{-47.2577, -17.6011}, {35.4119, -58.5663}}, textString = "%name", lineColor = {28, 108, 200}), Text(origin = {79.152, -39.5315}, extent = {{-51.152, -12.4685}, {0.84797, -28.4685}}, textString = "VOTHSG", lineColor = {0, 0, 0}), Rectangle(origin = {-0.123457, -0.123457}, extent = {{-100.123, 99.8765}, {100.123, -99.8765}}), Text(origin = {-53.572, 31.3861}, extent = {{-34.428, -19.3861}, {15.572, -39.3861}}, lineColor = {0, 0, 0}, textString = "PSS_AUX"), Text(origin = {-49.572, -30.6139}, extent = {{-34.428, -19.3861}, {15.572, -39.3861}}, lineColor = {0, 0, 0}, textString = "PSS_AUX2"), Text(origin = {-88.328, 50.6141}, extent = {{3.10213, -19.39}, {15.57, -39.39}}, textString = "VI"), Text(origin = {-88.3829, -11.1324}, extent = {{3.1, -19.39}, {22.7679, -37.5905}}, textString = "VI2")}), Diagram(coordinateSystem(preserveAspectRatio = false)));
end Stabilizer;
