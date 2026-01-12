within OpalRT.Electrical.Control.Stabilizer.Internal;
block Filter
  parameter Real A1 = 1;
  parameter Real A2 = 1;
  parameter Real A3 = 1;
  parameter Real A4 = 1;
  parameter Real A5 = 1;
  parameter Real A6 = 1;
  parameter Real y_start = 0;
  Modelica.Blocks.Interfaces.RealInput u annotation(Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction transferfunction1(b = {A60, A50, 1}, a = if A2 * A4 <> 0 then {A20 * A40, A10 * A40 + A20 * A30, A20 + A40 + A10 * A30, A10 + A30, 1} else {1, 4, 6, 4, 1}, initType = Modelica.Blocks.Types.Init.SteadyState, y_start = y_start) annotation(Placement(visible = true, transformation(origin = {-40, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction transferfunction2(b = {A60, A50, 1}, a = if A1 * A4 + A2 * A3 <> 0 then {A10 * A40 + A20 * A30, A20 + A40 + A10 * A30, A10 + A30, 1} else {1, 3, 3, 1}, initType = Modelica.Blocks.Types.Init.SteadyState, y_start = y_start) annotation(Placement(visible = true, transformation(origin = {-40, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction transferfunction3(b = {A60, A50, 1}, a = if A2 + A4 + A1 * A3 <> 0 then {A20 + A40 + A10 * A30, A10 + A30, 1} else {1, 2, 1}, initType = Modelica.Blocks.Types.Init.SteadyState, y_start = y_start) annotation(Placement(visible = true, transformation(origin = {-40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction transferfunction4(b = if A60 == 0 then {A50, 1} else {1, 1}, a = if A1 + A3 <> 0 then {A10 + A30, 1} else {1, 1}, initType = Modelica.Blocks.Types.Init.SteadyState, y_start = y_start) annotation(Placement(visible = true, transformation(origin = {-40, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.SignalRouting.Multiplexer multiplexer1(n = 5, s = if A2 * A4 <> 0 then 1 elseif A1 * A4 + A2 * A3 <> 0 then 2
   elseif A2 + A4 + A1 * A3 <> 0 then 3
   elseif A1 + A3 <> 0 then 4 else 5) annotation(Placement(visible = true, transformation(origin = {20, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
protected
  parameter Real A10(fixed = false, start = 1);
  parameter Real A20(fixed = false, start = 1);
  parameter Real A30(fixed = false, start = 1);
  parameter Real A40(fixed = false, start = 1);
  parameter Real A50(fixed = false, start = 1);
  parameter Real A60(fixed = false, start = 1);
initial algorithm
  A10 := A1;
  A20 := A2;
  A30 := A3;
  A40 := A4;
  A50 := A5;
  A60 := A6;
equation
  connect(u, multiplexer1.u[5]) annotation(Line(points = {{-100, 0}, {-77.4019, 0}, {-77.4019, -60.8931}, {9.7429, -60.8931}, {9.7429, 20.8}, {10, 20.8}}, color = {0, 0, 127}));
  connect(transferfunction4.y, multiplexer1.u[4]) annotation(Line(points = {{-29, -40}, {9.47226, -40}, {9.47226, 19.2152}, {10, 19.2152}, {10, 20.4}}, color = {0, 0, 127}));
  connect(transferfunction3.y, multiplexer1.u[3]) annotation(Line(points = {{-29, 0}, {9.7429, 0}, {9.7429, 20}, {10, 20}}, color = {0, 0, 127}));
  connect(transferfunction2.y, multiplexer1.u[2]) annotation(Line(points = {{-29, 40}, {9.7429, 40}, {9.7429, 19.6}, {10, 19.6}}, color = {0, 0, 127}));
  connect(transferfunction1.y, multiplexer1.u[1]) annotation(Line(points = {{-29, 80}, {9.7429, 80}, {9.7429, 19.2}, {10, 19.2}}, color = {0, 0, 127}));
  connect(y, multiplexer1.y) annotation(Line(points = {{100, 0}, {48.1732, 0}, {48.1732, 20.5683}, {30, 20.5683}, {30, 20}}, color = {0, 0, 127}));
  connect(transferfunction4.u, transferfunction3.u) annotation(Line(points = {{-52, -40}, {-53.3153, -40}, {-53.3153, 0}, {-52, 0}}, color = {0, 0, 127}));
  connect(transferfunction3.u, transferfunction2.u) annotation(Line(points = {{-52, 0}, {-53.0447, 0}, {-53.0447, 40}, {-52, 40}}, color = {0, 0, 127}));
  connect(transferfunction2.u, transferfunction1.u) annotation(Line(points = {{-52, 40}, {-52.774, 40}, {-52.774, 80}, {-52, 80}}, color = {0, 0, 127}));
  connect(u, transferfunction1.u) annotation(Line(points = {{-100, 0}, {-77.4019, 0}, {-77.4019, 79.8376}, {-52, 79.8376}, {-52, 80}}, color = {0, 0, 127}));
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Rectangle(origin = {0.217865, -0.326797}, extent = {{-100.218, 100.109}, {99.5643, -99.8911}}), Text(origin = {-3.26078, 2.17786}, extent = {{-52.94, 21.57}, {52.94, -21.57}}, textString = "FILTER"), Text(origin = {-79.6273, 6.53427}, extent = {{-12.09, 13.07}, {16.883, -20.4774}}, textString = "u"), Text(origin = {76.97, 6.93}, extent = {{-12.09, 13.07}, {16.88, -20.48}}, textString = "y")}));
end Filter;
