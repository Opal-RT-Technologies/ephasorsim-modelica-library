within OpalRT.NonElectrical.Math.Continuous.TransferFunctionWindup.TransferFunctionNonWindup;

block Lag_NonWindupLimit "Lag block with anti wind-up limits"
  Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput u annotation(Placement(visible = true, transformation(origin = {-122.5, -2.5}, extent = {{-22.5, -22.5}, {22.5, 22.5}}, rotation = 0), iconTransformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Real KI = 1;
  parameter Real TI = 1;
  parameter Real VRMAX = 1;
  parameter Real VRMIN = -1;
  parameter Real y_init = 0;
  TransferFunctionNonWindup.Integrator_NonWindupLimit non_windup_integrator1(VRMAX = VRMAX, VRMIN = VRMIN, y_init = y_init, KI = if TI <> 0 then 1 / TI else 1) annotation(Placement(visible = true, transformation(origin = {40, 0}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1(k2 = -1) annotation(Placement(visible = true, transformation(origin = {-30, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain2(k = KI) annotation(Placement(visible = true, transformation(origin = {-70, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = KI) annotation(Placement(visible = true, transformation(origin = {0, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiter1(uMax = VRMAX, uMin = VRMIN, limitsAtInit = true) annotation(Placement(visible = true, transformation(origin = {40, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  y = if TI == 0 then limiter1.y else non_windup_integrator1.y;
  connect(non_windup_integrator1.y, add1.u2) annotation(Line(points = {{47.5, 0}, {67.3575, 0}, {67.3575, -32.4698}, {-52.5043, -32.4698}, {-52.5043, -5.52677}, {-42, -5.52677}, {-42, -6}}, color = {0, 0, 127}));
  connect(gain1.y, limiter1.u) annotation(Line(points = {{11, -70}, {26.943, -70}, {26.943, -70}, {28, -70}}, color = {0, 0, 127}));
  connect(gain1.u, u) annotation(Line(points = {{-12, -70}, {-96.7185, -70}, {-96.7185, -2.07254}, {-122.5, -2.07254}, {-122.5, -2.5}}, color = {0, 0, 127}));
  connect(add1.y, non_windup_integrator1.u) annotation(Line(points = {{-19, 0}, {31.0769, 0}, {31.0769, 0}, {32.5, 0}}, color = {0, 0, 127}));
  connect(gain2.y, add1.u1) annotation(Line(points = {{-59, 0}, {-55.9692, 0}, {-55.9692, 6.41849}, {-42, 6.41849}, {-42, 6}}, color = {0, 0, 127}));
  connect(gain2.u, u) annotation(Line(points = {{-82, 0}, {-96.2773, 0}, {-96.2773, -2.31065}, {-122.5, -2.31065}, {-122.5, -2.5}}, color = {0, 0, 127}));
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1})), Documentation(info = "<html>
<p>The block diagram of this transfer function is shown below:</p>

<img src=\"modelica://OpalRT/resource/Math/Continuous/TransferFunctionNonWindup/Lag_Non_Windup_Limit.png\"
alt=\"Lag_Non_Windup_Limit.png\"><br>

</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1}), graphics = {Line(origin = {3.6427, 0}, points = {{-70, 1.11022e-16}, {62.1569, 1.11022e-16}}, color = {0, 0, 255}, thickness = 2), Text(origin = {11.4227, -26.55}, lineColor = {0, 0, 255}, extent = {{-77.55, 26.55}, {57.11, -7.44}}, textString = "1 + TI s"), Text(origin = {62.3727, 1.44}, lineColor = {0, 0, 255}, extent = {{-83.26, 32.26}, {-42.67, -2.11}}, textString = "KI"), Rectangle(origin = {1.82, -0.56}, fillColor = {255, 255, 255}, extent = {{-101.884, 50.7822}, {98.1078, -49.67}}), Line(origin = {52.7222, 55.2744}, points = {{27.9485, 4.72842}, {-22.7182, 4.72842}, {-27.6071, -4.82713}}, color = {0, 0, 255}, thickness = 2), Line(origin = {-52.6111, -55.3922}, rotation = 180, points = {{27.9485, 4.72842}, {-22.7182, 4.72842}, {-27.6071, -4.82713}}, color = {0, 0, 255}, thickness = 2), Text(origin = {104.66, 62.32}, lineColor = {0, 0, 255}, extent = {{-77.55, 26.55}, {-20.67, -4.77}}, textString = "VRMAX"), Text(origin = {-4.33, -84.41}, lineColor = {0, 0, 255}, extent = {{-77.55, 26.55}, {-20.67, -4.77}}, textString = "VRMIN")}));
end Lag_NonWindupLimit;
