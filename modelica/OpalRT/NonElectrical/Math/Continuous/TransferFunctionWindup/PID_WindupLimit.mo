within OpalRT.NonElectrical.Math.Continuous.TransferFunctionWindup;
block PID_WindupLimit "PID controller with wind-up limiter"
  parameter Real KP "Proportional gain";
  parameter Real KI "Integral gain";
  parameter Real KD "Derivative gain";
  parameter Real TD ">0, time constant of approximate derivative function";
  parameter Real MIN "minimum output limit";
  parameter Real MAX "Maximum output limit";
  parameter Real y_start "Initial output";
  Modelica.Blocks.Interfaces.RealInput u annotation(Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(visible = true, transformation(origin = {120, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiter2(uMax = MAX, uMin = MIN) annotation(Placement(visible = true, transformation(origin = {80, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add3 add31 annotation(Placement(visible = true, transformation(origin = {40, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator integrator1(k = KI, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = if KI <> 0 then y_start else 0) annotation(Placement(visible = true, transformation(origin = {-20, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain3(k = KP) annotation(Placement(visible = true, transformation(origin = {-20, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain2(k = KD) annotation(Placement(visible = true, transformation(origin = {-60, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction transferfunction1(b = {1, 0}, a = if TD0 <> 0 then {TD0, 1} else {1, 1}, initType = Modelica.Blocks.Types.Init.InitialOutput) annotation(Placement(visible = true, transformation(origin = {-20, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
protected
  parameter Real TD0(fixed = false);
initial algorithm
  TD0 := TD;
equation
  connect(transferfunction1.y, add31.u3) annotation(Line(points = {{-9, -40}, {16.2528, -40}, {16.2528, -27.7652}, {28, -27.7652}, {28, -28}}, color = {0, 0, 127}));
  connect(gain2.y, transferfunction1.u) annotation(Line(points = {{-49, -40}, {-32.5056, -40}, {-32, -40}}, color = {0, 0, 127}));
  connect(gain2.u, u) annotation(Line(points = {{-72, -40}, {-82.4134, -40}, {-82.4134, 0.256739}, {-100, 0.256739}, {-100, 0}}, color = {0, 0, 127}));
  connect(gain3.u, u) annotation(Line(points = {{-32, 40}, {-82.4134, 40}, {-82.4134, 0.513479}, {-100, 0.513479}, {-100, 0}}, color = {0, 0, 127}));
  connect(integrator1.u, u) annotation(Line(points = {{-32, 80}, {-82.4134, 80}, {-82.4134, 0.513479}, {-100, 0.513479}, {-100, 0}}, color = {0, 0, 127}));
  connect(gain3.y, add31.u2) annotation(Line(points = {{-9, 40}, {14.8909, 40}, {14.8909, -20.5392}, {28, -20.5392}, {28, -20}}, color = {0, 0, 127}));
  connect(integrator1.y, add31.u1) annotation(Line(points = {{-9, 80}, {19.5122, 80}, {19.5122, -11.0398}, {28, -11.0398}, {28, -12}}, color = {0, 0, 127}));
  connect(limiter2.u, add31.y) annotation(Line(points = {{68, -20}, {50.8344, -20}, {50.8344, -20}, {51, -20}}, color = {0, 0, 127}));
  connect(limiter2.y, y) annotation(Line(points = {{91, -20}, {112.465, -20}, {112.465, -20}, {120, -20}}, color = {0, 0, 127}));
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Documentation(info = "<html>
<p>The block diagram of this transfer function is shown below:</p>

<img src=\"modelica://OpalRT/resource/Math/Continuous/TransferFunctionWindup/PID_Windup_Limit.png\"
alt=\"PID_Windup_Limit.png\"><br>

</html>"), experiment(StartTime = 0, StopTime = 5, Tolerance = 1e-06, Interval = 0.001), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Rectangle(origin = {0.461538, 24.7692}, extent = {{-100.462, 18.9231}, {99.2308, -76.4615}}), Text(origin = {-52.04, 1.7}, lineColor = {85, 0, 255}, extent = {{-32.73, 33.9}, {131.33, -30.27}}, textString = "KP+ KI + KDs"), Line(origin = {53.51, 54.58}, points = {{31.7216, 10.0293}, {-19.9707, 10.0293}, {-31.3553, -9.97073}}, color = {85, 0, 255}, thickness = 4), Line(origin = {-54.8, -62.34}, rotation = 180, points = {{31.7216, 10.0293}, {-19.9707, 10.0293}, {-31.3553, -9.97073}}, color = {85, 0, 255}, thickness = 4), Text(origin = {55.69, 70.31}, lineColor = {85, 0, 255}, extent = {{-25.54, 30.31}, {29.85, -7.23}}, textString = "MAX"), Text(origin = {-62.39, -96.95}, lineColor = {85, 0, 255}, extent = {{-25.54, 30.31}, {29.85, -7.23}}, textString = "MIN"), Line(origin = {-21.19, -2.28}, rotation = 180, points = {{10.669, 10.0293}, {-19.9707, 10.0293}}, color = {85, 0, 255}, thickness = 4), Line(origin = {37.58, -2.82}, rotation = 180, points = {{11.9527, 9.77256}, {-47.6986, 9.77256}}, color = {85, 0, 255}, thickness = 4), Text(origin = {-11.76, -36.83}, lineColor = {85, 0, 255}, extent = {{-16.04, 31.33}, {8.35, -2.54}}, textString = "s"), Text(origin = {36.8987, -19.4608}, lineColor = {85, 0, 255}, extent = {{-16.55, 12.07}, {52, -25.13}}, textString = "1+TDs")}));
end PID_WindupLimit;
