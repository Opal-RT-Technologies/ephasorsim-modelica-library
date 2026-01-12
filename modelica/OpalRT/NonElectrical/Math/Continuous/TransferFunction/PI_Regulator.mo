within OpalRT.NonElectrical.Math.Continuous.TransferFunction;
block PI_Regulator
  parameter Real KI "Integral gain", KP "Proportional gain";
  parameter Modelica.Blocks.Types.Init initType = Modelica.Blocks.Types.Init.SteadyState "Type of initialization (1: no init, 2: steady state, 3,4: initial output)";
  parameter Real y_start = 0 "Initial or guess value of output (= state)";
  Modelica.Blocks.Continuous.Integrator integrator1(k = KI, initType = initType, y_start = if KI <> 0 then y_start else 0) annotation(Placement(visible = true, transformation(origin = {-40, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = KP) annotation(Placement(visible = true, transformation(origin = {-40, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1 annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput u annotation(Placement(visible = true, transformation(origin = {-80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(visible = true, transformation(origin = {80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(add1.y, y) annotation(Line(points = {{11, 0}, {70.636, 0}, {70.636, -0.541272}, {70.636, -0.541272}}, color = {0, 0, 127}));
  connect(integrator1.u, u) annotation(Line(points = {{-52, 40}, {-59.1017, 40}, {-59.1017, 0.945626}, {-80, 0.945626}, {-80, 0}}, color = {0, 0, 127}));
  connect(gain1.u, u) annotation(Line(points = {{-52, -20}, {-59.1017, -20}, {-59.1017, 0.945626}, {-80, 0.945626}, {-80, 0}}, color = {0, 0, 127}));
  connect(add1.u2, gain1.y) annotation(Line(points = {{-12, -6}, {-17.4941, -6}, {-17.4941, -20.5674}, {-29, -20.5674}, {-29, -20}}, color = {0, 0, 127}));
  connect(add1.u1, integrator1.y) annotation(Line(points = {{-12, 6}, {-16.7849, 6}, {-16.7849, 40.1891}, {-29, 40.1891}, {-29, 40}}, color = {0, 0, 127}));
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.005), Documentation(info = "<html>
<p>The block diagram is shown below:</p>

<img src=\"modelica://OpalRT/resource/Math/Continuous/TransferFunction/PI.png\"
alt=\"PI.png\"><br>

</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Rectangle(origin = {0.118203, 0.118203}, extent = {{-100.355, 57.8014}, {99.6454, -50.2364}}), Text(origin = {-28.3692, -5.07894}, extent = {{-45.63, 26.12}, {9.45979, -10.7536}}, textString = "K"), Text(origin = {39.6213, 4.75558}, extent = {{-45.63, 26.12}, {9.45979, -10.7536}}, textString = "K"), Text(origin = {3.83085, -25.3588}, extent = {{-45.63, 26.12}, {-18.67, 4.38}}, textString = "P"), Text(origin = {68.7457, -9.14629}, extent = {{-45.63, 26.12}, {-18.67, 4.38}}, textString = "I"), Text(origin = {10.7797, -8.24678}, extent = {{-45.63, 26.12}, {9.46, -10.75}}, textString = "+"), Line(origin = {32.0316, -3.31402}, points = {{-18.0851, 0}, {8.86524, 0}}, thickness = 4), Text(origin = {51.4433, -24.0785}, extent = {{-45.63, 26.12}, {-2.83, -4.13}}, textString = "s")}));
end PI_Regulator;
