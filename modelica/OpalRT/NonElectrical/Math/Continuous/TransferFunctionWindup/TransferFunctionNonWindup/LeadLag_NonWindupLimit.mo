within OpalRT.NonElectrical.Math.Continuous.TransferFunctionWindup.TransferFunctionNonWindup;

block LeadLag_NonWindupLimit "Lead-Lag block with anti wind-up limiter"
  Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput u annotation(Placement(visible = true, transformation(origin = {-122.5, -2.5}, extent = {{-22.5, -22.5}, {22.5, 22.5}}, rotation = 0), iconTransformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Real T1 = 1 "T1 can not take zero value";
  parameter Real T2 = 1 "T2 can not take zero value";
  parameter Real K = 1 "K can not take zero value";
  parameter Real MIN = -1;
  parameter Real MAX = 1;
  parameter Modelica.Blocks.Types.Init initType = Modelica.Blocks.Types.Init.SteadyState "Type of initialization (1: no init, 2: steady state, 3,4: initial output)";
  parameter Real y_start = 0 "Initial or guess value of output (= state)";
  TransferFunctionNonWindup.Lag_NonWindupLimit lag_non_windup_limit1(KI = K, TI = T2, VRMAX = MAX, VRMIN = MIN, y_init = y_start) annotation(Placement(visible = true, transformation(origin = {-10, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = T1 / T2) annotation(Placement(visible = true, transformation(origin = {-10, 60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1 annotation(Placement(visible = true, transformation(origin = {-40, 60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain2(k = K) annotation(Placement(visible = true, transformation(origin = {-70, 60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain3(k = if T1 <> 0 then T2 / T1 - 1 else 1) annotation(Placement(visible = true, transformation(origin = {-40, 30}, extent = {{-5, -5}, {5, 5}}, rotation = 180)));
  Modelica.Blocks.Math.Add add2(k2 = +1, k1 = -1) annotation(Placement(visible = true, transformation(origin = {10, 10}, extent = {{-5, -5}, {5, 5}}, rotation = 180)));
  Modelica.Blocks.Continuous.Integrator INT(k = if T1 <> 0 then 1 / T1 else 1, initType = initType, y_start = y_start) annotation(Placement(visible = true, transformation(origin = {-10, 10}, extent = {{-5, -5}, {5, 5}}, rotation = 180)));
  Modelica.Blocks.Nonlinear.Limiter LMT(uMax = MAX, uMin = MIN) annotation(Placement(visible = true, transformation(origin = {10, 60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
equation
  y = if T1 <> 0 then LMT.y else lag_non_windup_limit1.y;
  connect(gain2.u, u) annotation(Line(points = {{-76, 60}, {-88.4532, 60}, {-88.4532, -1.96078}, {-122.5, -1.96078}, {-122.5, -2.5}}, color = {0, 0, 127}));
  connect(lag_non_windup_limit1.u, u) annotation(Line(points = {{-21, -40}, {-57.5163, -40}, {-57.5163, -1.96078}, {-122.5, -1.96078}, {-122.5, -2.5}}, color = {0, 0, 127}));
  connect(INT.y, add2.u1) annotation(Line(points = {{-15.5, 10}, {-27.6688, 10}, {-27.6688, -2.39651}, {21.7865, -2.39651}, {21.7865, 6.75381}, {16, 6.75381}, {16, 7}}, color = {0, 0, 127}));
  connect(INT.y, gain3.u) annotation(Line(points = {{-15.5, 10}, {-27.6688, 10}, {-27.6688, 29.8475}, {-34, 29.8475}, {-34, 30}}, color = {0, 0, 127}));
  connect(add2.y, INT.u) annotation(Line(points = {{4.5, 10}, {-3.26797, 10}, {-3.26797, 10}, {-4, 10}}, color = {0, 0, 127}));
  connect(add1.u2, gain3.y) annotation(Line(points = {{-46, 57}, {-52.2876, 57}, {-52.2876, 29.8475}, {-45.5, 29.8475}, {-45.5, 30}}, color = {0, 0, 127}));
  connect(add1.u1, gain2.y) annotation(Line(points = {{-46, 63}, {-54.902, 63}, {-54.902, 59.695}, {-64.5, 59.695}, {-64.5, 60}}, color = {0, 0, 127}));
  connect(gain1.u, add1.y) annotation(Line(points = {{-16, 60}, {-34.4227, 60}, {-34.4227, 60}, {-34.5, 60}}, color = {0, 0, 127}));
  connect(gain1.y, LMT.u) annotation(Line(points = {{-4.5, 60}, {3.92157, 60}, {3.92157, 60}, {4, 60}}, color = {0, 0, 127}));
  connect(add2.u2, LMT.y) annotation(Line(points = {{16, 13}, {26.5795, 13}, {26.5795, 59.695}, {15.5, 59.695}, {15.5, 60}}, color = {0, 0, 127}));
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1}), graphics = {Line(origin = {8, 0}, points = {{-70, 1.11022e-16}, {70, 1.11022e-16}}, color = {0, 0, 255}, thickness = 2), Text(origin = {16, 7.66}, lineColor = {0, 0, 255}, extent = {{-77.55, 26.55}, {57.11, -7.44}}, textString = "1 + T1 s"), Text(origin = {15.78, -26.55}, lineColor = {0, 0, 255}, extent = {{-77.55, 26.55}, {57.11, -7.44}}, textString = "1 + T2 s"), Text(origin = {-11.2691, -13.5912}, lineColor = {0, 0, 255}, extent = {{-83.2561, 32.2561}, {-42.67, -2.11}}, textString = "K"), Rectangle(origin = {1.82, -0.56}, fillColor = {255, 255, 255}, extent = {{-101.884, 50.7822}, {98.1078, -49.67}}), Line(origin = {52.7222, 55.2744}, points = {{27.9485, 4.72842}, {-22.7182, 4.72842}, {-27.6071, -4.82713}}, color = {0, 0, 255}, thickness = 2), Line(origin = {-52.6111, -55.3922}, rotation = 180, points = {{27.9485, 4.72842}, {-22.7182, 4.72842}, {-27.6071, -4.82713}}, color = {0, 0, 255}, thickness = 2), Text(origin = {104.663, 62.3222}, lineColor = {0, 0, 255}, extent = {{-77.55, 26.55}, {-20.6678, -4.77333}}, textString = "MAX"), Text(origin = {-4.33074, -84.4104}, lineColor = {0, 0, 255}, extent = {{-77.55, 26.55}, {-20.67, -4.77}}, textString = "MIN")}), Documentation(info = "<html>
<p>The block diagram of this transfer function is shown below:</p>

<img src=\"modelica://OpalRT/resource/Math/Continuous/TransferFunctionNonWindup/LeadLag_Non_Windup_Limit.png\"
alt=\"LeadLag_Non_Windup_Limit.png\"><br>

</html>"));
end LeadLag_NonWindupLimit;
