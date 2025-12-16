within OpalRT.NonElectrical.Math.Continuous.TransferFunctionWindup;
block PD_WindupLimit "PD controller with windup limiter"
  parameter Real KP "Proportional gain";
  parameter Real KD "Derivative gain";
  parameter Real MIN "minimum output limit";
  parameter Real MAX "Maximum output limit";
  Modelica.Blocks.Math.Gain gain2(k = KP) annotation(Placement(visible = true, transformation(origin = {-40, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput u annotation(Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(visible = true, transformation(origin = {120, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = KD) annotation(Placement(visible = true, transformation(origin = {-40, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Der der1 annotation(Placement(visible = true, transformation(origin = {0, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1 annotation(Placement(visible = true, transformation(origin = {40, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiter2(uMax = MAX, uMin = MIN) annotation(Placement(visible = true, transformation(origin = {80, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(limiter2.y, y) annotation(Line(points = {{91, -20}, {112.465, -20}, {112.465, -20}, {120, -20}}, color = {0, 0, 127}));
  connect(add1.y, limiter2.u) annotation(Line(points = {{51, -20}, {65.7224, -20}, {65.7224, -20}, {68, -20}}, color = {0, 0, 127}));
  connect(der1.y, add1.u1) annotation(Line(points = {{11, 20}, {19.5467, 20}, {19.5467, -13.5977}, {28, -13.5977}, {28, -14}}, color = {0, 0, 127}));
  connect(der1.u, gain1.y) annotation(Line(points = {{-12, 20}, {-28.8952, 20}, {-29, 20}}, color = {0, 0, 127}));
  connect(add1.u2, gain2.y) annotation(Line(points = {{28, -26}, {-8.61538, -26}, {-8.61538, -19.3846}, {-29, -19.3846}, {-29, -20}}, color = {0, 0, 127}));
  connect(gain1.u, u) annotation(Line(points = {{-52, 20}, {-74.7875, 20}, {-74.7875, 0.283286}, {-100, 0.283286}, {-100, 0}}, color = {0, 0, 127}));
  connect(gain2.u, u) annotation(Line(points = {{-52, -20}, {-74.4615, -20}, {-74.4615, 0}, {-100, 0}, {-100, 0}}, color = {0, 0, 127}));
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Documentation(info = "<html>
<p>The block diagram of this transfer function is shown below:</p>

<img src=\"modelica://OpalRT/resource/Math/Continuous/TransferFunctionWindup/PD_Windup_Limit.png\"
alt=\"PD_Windup_Limit.png\"><br>

</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Rectangle(origin = {0.461538, 24.7692}, extent = {{-100.462, 18.9231}, {99.2308, -76.4615}}), Text(origin = {-56.93, -2.92}, lineColor = {85, 0, 255}, extent = {{-25.54, 30.31}, {13.23, -23.85}}, textString = "KP"), Text(origin = {-18.16, -2.92}, lineColor = {85, 0, 255}, extent = {{-25.54, 30.31}, {13.23, -23.85}}, textString = "+"), Text(origin = {22.16, -1.7}, lineColor = {85, 0, 255}, extent = {{-25.85, 29.39}, {16.61, -27.54}}, textString = "KD"), Text(origin = {75.07, 2.93}, lineColor = {85, 0, 255}, extent = {{-20.92, 26.31}, {14.46, -25.7}}, textString = "s"), Line(origin = {53.51, 54.58}, points = {{31.7216, 10.0293}, {-19.9707, 10.0293}, {-31.3553, -9.97073}}, color = {85, 0, 255}, thickness = 4), Line(origin = {-54.8, -62.34}, rotation = 180, points = {{31.7216, 10.0293}, {-19.9707, 10.0293}, {-31.3553, -9.97073}}, color = {85, 0, 255}, thickness = 4), Text(origin = {55.69, 70.31}, lineColor = {85, 0, 255}, extent = {{-25.54, 30.31}, {29.85, -7.23}}, textString = "MAX"), Text(origin = {-63.39, -97.69}, lineColor = {85, 0, 255}, extent = {{-25.54, 30.31}, {29.85, -7.23}}, textString = "MIN"), Text(origin = {47.38, -2.3}, lineColor = {85, 0, 255}, extent = {{-8.92, 14}, {13.23, -23.85}}, textString = "*")}));
end PD_WindupLimit;
