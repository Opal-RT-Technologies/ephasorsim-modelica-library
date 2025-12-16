within OpalRT.NonElectrical.Math.Continuous.TransferFunctionNonWindup;
block Lag_NonWindupVariableLimit "Lag block with anti wind-up variable limit"
  Modelica.Blocks.Interfaces.RealInput u annotation(Placement(visible = true, transformation(origin = {-122.5, -2.5}, extent = {{-22.5, -22.5}, {22.5, 22.5}}, rotation = 0), iconTransformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Real KI = 1;
  parameter Real TI = 1;
  parameter Real y_init = 0;
  Modelica.Blocks.Math.Add add1(k2 = -1) annotation(Placement(visible = true, transformation(origin = {-30, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain2(k = KI) annotation(Placement(visible = true, transformation(origin = {-70, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = KI) annotation(Placement(visible = true, transformation(origin = {0, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunctionNonWindup.Integrator_NonWindupVariableLimit non_windup_integrator_var1(y_init = y_init, KI = if TI <> 0 then 1 / TI else 1) annotation(Placement(visible = true, transformation(origin = {40, 0}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput VU annotation(Placement(visible = true, transformation(origin = {-110, 60}, extent = {{-22.5, -22.5}, {22.5, 22.5}}, rotation = 0), iconTransformation(origin = {-40, 90}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealInput VL annotation(Placement(visible = true, transformation(origin = {110, -50}, extent = {{22.5, -22.5}, {-22.5, 22.5}}, rotation = 0), iconTransformation(origin = {10, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  OpalRT.NonElectrical.Math.Nonlinear.VariableLimiter var_limit1 annotation(Placement(visible = true, transformation(origin = {55, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.SignalRouting.Multiplexer multiplexer1(n = 2, s = if TI == 0 then 2 else 1) annotation(Placement(visible = true, transformation(origin = {80, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(visible = true, transformation(origin = {105, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(var_limit1.uMax, VU) annotation(Line(points = {{43, -62}, {-138.724, -62}, {-138.724, 59.4533}, {-110, 59.4533}, {-110, 60}}, color = {0, 0, 127}));
  connect(non_windup_integrator_var1.y, multiplexer1.u[1]) annotation(Line(points = {{47.5, 0}, {66.8845, 0}, {66.8845, 19.6078}, {70, 19.6078}, {70, 19.5}}, color = {0, 0, 127}));
  connect(var_limit1.y, multiplexer1.u[2]) annotation(Line(points = {{66, -70}, {70.1525, -70}, {70.1525, 20.5}, {70, 20.5}}, color = {0, 0, 127}));
  connect(multiplexer1.y, y) annotation(Line(points = {{90, 20}, {97.8214, 20}, {97.8214, 20}, {105, 20}}, color = {0, 0, 127}));
  connect(var_limit1.uMin, VL) annotation(Line(points = {{43, -78}, {34.6241, -78}, {34.6241, -88.6105}, {99.7722, -88.6105}, {99.7722, -50}, {110, -50}}, color = {0, 0, 127}));
  connect(gain1.y, var_limit1.u) annotation(Line(points = {{11, -70}, {42.369, -70}, {42.369, -70}, {43, -70}}, color = {0, 0, 127}));
  connect(VL, non_windup_integrator_var1.VL) annotation(Line(points = {{110, -50}, {40.9586, -50}, {40.9586, -13.5}, {41.5, -13.5}}, color = {0, 0, 127}));
  connect(VU, non_windup_integrator_var1.VU) annotation(Line(points = {{-110, 60}, {38.5621, 60}, {38.5621, 13.5}, {38.5, 13.5}}, color = {0, 0, 127}));
  connect(non_windup_integrator_var1.y, add1.u2) annotation(Line(points = {{47.5, 0}, {66.8845, 0}, {66.8845, -23.7473}, {-54.4662, -23.7473}, {-54.4662, -6.10022}, {-42, -6.10022}, {-42, -6}}, color = {0, 0, 127}));
  connect(add1.y, non_windup_integrator_var1.u) annotation(Line(points = {{-19, 0}, {32.4619, 0}, {32.4619, 0}, {32.5, 0}}, color = {0, 0, 127}));
  connect(gain1.u, u) annotation(Line(points = {{-12, -70}, {-96.7185, -70}, {-96.7185, -2.07254}, {-122.5, -2.07254}, {-122.5, -2.5}}, color = {0, 0, 127}));
  connect(gain2.y, add1.u1) annotation(Line(points = {{-59, 0}, {-55.9692, 0}, {-55.9692, 6.41849}, {-42, 6.41849}, {-42, 6}}, color = {0, 0, 127}));
  connect(gain2.u, u) annotation(Line(points = {{-82, 0}, {-96.2773, 0}, {-96.2773, -2.31065}, {-122.5, -2.31065}, {-122.5, -2.5}}, color = {0, 0, 127}));
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1})), Documentation(info = "<html>
<p>The block diagram of this transfer function is shown below:</p>

<img src=\"modelica://OpalRT/resource/Math/Continuous/TransferFunctionNonWindup/Lag_Non_Windup_Var_Limit.png\"
alt=\"Lag_Non_Windup_Var_Limit.png\"><br>
<p><b>Note:</b> Currently the block is not working properly with variable limits. Please repalce with Lag_Non_Windup_Limit block which uses constant limits.
</p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1}), graphics={  Line(origin = {3.6427, 0}, points = {{-70, 1.11022e-16}, {62.1569, 1.11022e-16}}, color = {0, 0, 255}, thickness = 2), Text(origin = {11.4227, -26.55}, lineColor = {0, 0, 255}, extent = {{-77.55, 26.55}, {57.11, -7.44}}, textString = "1 + TI s"), Text(origin = {62.3727, 1.44}, lineColor = {0, 0, 255}, extent = {{-83.26, 32.26}, {-42.67, -2.11}}, textString = "KI"), Rectangle(origin = {1.82, -0.56}, fillColor = {255, 255, 255}, extent = {{-101.884, 50.7822}, {98.1078, -49.67}}), Line(origin = {52.7222, 55.2744}, points = {{27.9485, 4.72842}, {-22.7182, 4.72842}, {-27.6071, -4.82713}}, color = {0, 0, 255}, thickness = 2), Line(origin = {-52.6111, -55.3922}, rotation = 180, points = {{27.9485, 4.72842}, {-22.7182, 4.72842}, {-27.6071, -4.82713}}, color = {0, 0, 255}, thickness = 2), Text(origin = {104.66, 62.32}, lineColor = {0, 0, 255}, extent = {{-77.55, 26.55}, {-20.67, -4.77}}, textString = "VMAX"), Text(origin = {-4.33, -84.41}, lineColor = {0, 0, 255}, extent = {{-77.55, 26.55}, {-20.67, -4.77}}, textString = "VMIN"), Text(origin = {-43.9045, 72.6612}, extent = {{-9.91, 9.04}, {19.0603, -6.20776}}, textString = "VU"), Text(origin = {3.35, -76.6}, extent = {{-9.91, 9.04}, {19.06, -6.21}}, textString = "VL")}));
end Lag_NonWindupVariableLimit;
