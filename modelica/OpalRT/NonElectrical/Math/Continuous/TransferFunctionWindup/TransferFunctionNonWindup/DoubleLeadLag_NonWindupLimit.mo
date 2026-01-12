within OpalRT.NonElectrical.Math.Continuous.TransferFunctionWindup.TransferFunctionNonWindup;

block DoubleLeadLag_NonWindupLimit "Double Lead-lag block with anti wind-up limiter"
  parameter Real T1 = 0.1;
  parameter Real T2 = 0.2;
  parameter Real T3 = 0.3;
  parameter Real T4 = 0.4;
  parameter Real VMAX = 999;
  parameter Real VMIN = -999;
  parameter Real ginitial = 0;
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.TransferFunction2 transfer_function22(b = {b1, b2}, a = {1, a2, a3}, y_start = ginitial) annotation(Placement(visible = true, transformation(origin = {-20, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = 1 / a) annotation(Placement(visible = true, transformation(origin = {20, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain2(k = a) annotation(Placement(visible = true, transformation(origin = {0, 60}, extent = {{10, -10}, {-10, 10}}, rotation = 180)));
  Modelica.Blocks.Math.Add add1 annotation(Placement(visible = true, transformation(origin = {-60, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiter1(uMax = VMAX, uMin = VMIN) annotation(Placement(visible = true, transformation(origin = {40, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput u annotation(Placement(visible = true, transformation(origin = {-100, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-17.5, 17.5}, {17.5, -17.5}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(visible = true, transformation(origin = {100, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-12.5, -12.5}, {12.5, 12.5}}, rotation = 0)));
protected
  parameter Real a(fixed = false, start = 1);
  parameter Real b2(fixed = false, start = 1);
  parameter Real b1(fixed = false, start = 1);
  parameter Real a2(fixed = false, start = 1);
  parameter Real a3(fixed = false, start = 1);
initial equation
  a = T1 * T2 / (T3 * T4);
  b2 = 1 / (T1 * T2) - 1 / (T3 * T4);
  b1 = 1 / T1 + 1 / T2 - 1 / T3 - 1 / T4;
  a2 = 1 / T1 + 1 / T2;
  a3 = 1 / (T1 * T2);
equation
  connect(transfer_function22.y, add1.u2) annotation(Line(points = {{-30, 0}, {-83.1836, 0}, {-83.1836, 34.1463}, {-72, 34.1463}, {-72, 34}}, color = {0, 0, 127}));
  connect(gain1.y, transfer_function22.u) annotation(Line(points = {{9, 0}, {-9.49936, 0}, {-9.49936, 0}, {-10, 0}}, color = {0, 0, 127}));
  connect(y, limiter1.y) annotation(Line(points = {{100, 60}, {51.2528, 60}, {51.2528, 60}, {51, 60}}, color = {0, 0, 127}));
  connect(u, add1.u1) annotation(Line(points = {{-100, 60}, {-77.6765, 60}, {-77.6765, 46.4692}, {-73.8041, 46.4692}, {-73.8041, 46}, {-72, 46}}, color = {0, 0, 127}));
  connect(limiter1.y, gain1.u) annotation(Line(points = {{51, 60}, {71.6776, 60}, {71.6776, -0.217865}, {33.1155, -0.217865}, {33.1155, 0}, {32, 0}}, color = {0, 0, 127}));
  connect(gain2.y, limiter1.u) annotation(Line(points = {{11, 60}, {26.3617, 60}, {26.3617, 60}, {28, 60}}, color = {0, 0, 127}));
  connect(add1.y, gain2.u) annotation(Line(points = {{-49, 40}, {-30.2832, 40}, {-30.2832, 60.1307}, {-11.5468, 60.1307}, {-11.5468, 60}, {-12, 60}}, color = {0, 0, 127}));
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Documentation(info = "<html>
<p>The block diagram of this transfer function is shown below:</p>

<img src=\"modelica://OpalRT/resource/Math/Continuous/TransferFunctionNonWindup/Leadlag_Non_Windup_2nd_Order.png\"
alt=\"Leadlag_Non_Windup_2nd_Order.png\"><br>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics = {Text(origin = {25.2157, 26.3443}, lineColor = {85, 0, 255}, fillColor = {85, 0, 255}, extent = {{-80.5, 39.22}, {40.91, -63.58}}, textString = "(1+ST1)(1+ST2)"), Line(origin = {-6.82, 2.02}, points = {{-52, 0}, {72.2671, 0}}, color = {85, 0, 255}, thickness = 2), Text(origin = {26.4614, -12.9715}, lineColor = {85, 0, 255}, fillColor = {85, 0, 255}, extent = {{-80.82, 38.73}, {40.23, -25.07}}, textString = "(1+ST3)(1+ST4)"), Rectangle(origin = {-34.6879, 13.2104}, extent = {{-65.2821, 32.1668}, {134.645, -53.4641}}), Line(origin = {22.9972, 52.9544}, points = {{-12.9533, -7.86026}, {-3.1494, 7.60815}, {11.8833, 7.60815}}, color = {85, 0, 255}, thickness = 2), Line(origin = {-13.5401, -48.3474}, rotation = 180, points = {{-12.9533, -7.86026}, {-3.1494, 7.60815}, {11.8833, 7.60815}}, color = {85, 0, 255}, thickness = 2), Text(origin = {10.7187, 67.1498}, lineColor = {85, 0, 255}, fillColor = {85, 0, 255}, extent = {{-2.27, -1.13}, {43.2906, 19.1272}}, textString = "VMAX"), Text(origin = {-42.3102, -90.7739}, lineColor = {85, 0, 255}, fillColor = {85, 0, 255}, extent = {{-2.27, -1.13}, {43.29, 19.13}}, textString = "VMIN")}));
end DoubleLeadLag_NonWindupLimit;
