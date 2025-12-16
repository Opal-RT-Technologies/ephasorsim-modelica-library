within OpalRT.Electrical.Control.Excitation.Internal;
block ExciterStabilizingBlock
  parameter Real TF1 = 1;
  parameter Real TF2 = 0;
  parameter Real TF3 = 0;
  parameter Real KF = 1;
  Modelica.Blocks.Interfaces.RealInput u annotation(Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction transferfunction2(a = if TF20 <> 0 then {TF10 * TF20, TF10 + TF20, 1} else {1, 2, 1}, initType = Modelica.Blocks.Types.Init.InitialOutput, b = {TF30, 1, 0}, y_start = 0) annotation(Placement(visible = true, transformation(origin = {0, 40}, extent = {{-12.5, -12.5}, {12.5, 12.5}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction transferfunction1(a = if TF20 == 0 then {TF10, 1} else {1, 1}, initType = Modelica.Blocks.Types.Init.InitialOutput, b = {1, 0}, y_start = 0) annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{-12.5, -12.5}, {12.5, 12.5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = KF) annotation(Placement(visible = true, transformation(origin = {-60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.SignalRouting.Multiplexer multiplexer1(n = 2, s = if TF20 <> 0 then 1 else 2) annotation(Placement(visible = true, transformation(origin = {60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
protected
  parameter Real TF30(start = 1, fixed = false);
  parameter Real TF10(start = 1, fixed = false);
  parameter Real TF20(fixed = false);
initial algorithm
  TF10 := TF1;
  TF20 := TF2;
  TF30 := TF3;
equation
  connect(multiplexer1.y, y) annotation(Line(points = {{70, 0}, {92.2551, 0}, {92.2551, 0}, {100, 0}}, color = {0, 0, 127}));
  connect(transferfunction1.y, multiplexer1.u[2]) annotation(Line(points = {{13.75, 0}, {49.8861, 0}, {49.8861, 0.5}, {50, 0.5}}, color = {0, 0, 127}));
  connect(transferfunction2.y, multiplexer1.u[1]) annotation(Line(points = {{13.75, 40}, {50.1139, 40}, {50.1139, -0.5}, {50, -0.5}}, color = {0, 0, 127}));
  connect(transferfunction2.u, gain1.y) annotation(Line(points = {{-15, 40}, {-32.3492, 40}, {-32.3492, 0}, {-49, 0}, {-49, 0}}, color = {0, 0, 127}));
  connect(gain1.y, transferfunction1.u) annotation(Line(points = {{-49, 0}, {-16.1746, 0}, {-16.1746, 0}, {-15, 0}}, color = {0, 0, 127}));
  connect(u, gain1.u) annotation(Line(points = {{-100, 0}, {-73.4275, 0}, {-73.4275, 0}, {-72, 0}}, color = {0, 0, 127}));
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Rectangle(origin = {0, -0.12837}, extent = {{-99.8716, 99.7433}, {99.8716, -99.7433}}), Line(origin = {20.078, -5.82348}, points = {{-104.801, 5.57099}, {65.931, 5.57099}}), Text(origin = {-34.7894, 24.3935}, extent = {{-45.06, 5.39}, {115.663, -20.2809}}, textString = "sKF(1+sTF3)"), Text(origin = {-33.02, -6.7}, extent = {{-45.06, 5.39}, {115.66, -20.28}}, textString = "(1+sTF1)(1+sTF2)")}));
end ExciterStabilizingBlock;
