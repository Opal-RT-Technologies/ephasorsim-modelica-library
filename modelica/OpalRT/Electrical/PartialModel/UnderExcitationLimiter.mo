within OpalRT.Electrical.PartialModel;
partial model UnderExcitationLimiter
  parameter Real partType = 6;
  Real ETERM "Generator Terminal Voltage";
  Real PELEC;
  Real QELEC;
  Modelica.Blocks.Interfaces.RealInput VI[4] annotation(Placement(visible = true, transformation(origin = {-100, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-98, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput EX_AUX[4] annotation(Placement(visible = true, transformation(origin = {-98, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-98, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput VUEL annotation(Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {104, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput VF annotation(Placement(visible = true, transformation(origin = {-100, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-98, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  ETERM = sqrt(VI[1] * VI[1] + VI[2] * VI[2]);
  PELEC = VI[1] * VI[3] + VI[2] * VI[4];
  QELEC = VI[2] * VI[3] + VI[1] * VI[4];
  annotation(Icon(coordinateSystem(preserveAspectRatio = false), graphics={ Text(origin={-66.3262,75.2633}, extent={{-31.6738,-23.2633},{14.3262,-47.2633}}, lineColor={0,0,0}, textString="VI"), Text(origin={-48.9491,119.205}, extent = {{-33.0509, -25.2036}, {14.9491, -51.2053}}, lineColor = {0, 0, 0}, textString = "EX_AUX"), Text(origin = {79.4112, 37.2019}, extent = {{-23.4112, -25.2019}, {10.5888, -51.2019}}, lineColor = {0, 0, 0}, textString = "VUEL"), Text(origin = {11.2577, 43.6011}, extent = {{-47.2577, -17.6011}, {35.4119, -58.5663}}, textString = "%name", lineColor = {28, 108, 200}), Text(origin={-67.4743,31.3247}, extent = {{-16.5257, -21.3247}, {7.47445, -43.3247}}, lineColor = {0, 0, 0}, textString = "VF"), Rectangle(origin = {-0.123457, -0.123457}, extent = {{-100.123, 99.8765}, {100.123, -99.8765}})}), Diagram(coordinateSystem(preserveAspectRatio = false)));
end UnderExcitationLimiter;
