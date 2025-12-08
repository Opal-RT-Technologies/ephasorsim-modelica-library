within OpalRT.NonElectrical.SignalRouting;
model PIN2INOUT "Convert PIN signal to: Voltages as Inputs and Current as Output. this block can be used as an interface with FMU, since FMU accepts voltage as its input and generates current as its output."
  OpalRT.NonElectrical.Connector.PwPin p annotation(Placement(visible = true, transformation(origin = {-60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput ii annotation(Placement(visible = true, transformation(origin = {-20, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {102, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput ir annotation(Placement(visible = true, transformation(origin = {-20, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {102, 44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput vr annotation(Placement(visible = true, transformation(origin = {80, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput vi annotation(Placement(visible = true, transformation(origin = {80, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-102, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  p.ir = -ir;
  p.ii = -ii;
  p.vr = vr;
  p.vi = vi;
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Rectangle(origin = {0, -0.513479}, extent = {{-99.8716, 99.6149}, {99.8716, -99.6149}}), Text(origin = {-4.94913, -16.9072}, extent = {{-69.7037, 67.9031}, {81.257, -45.8235}}, textString = "PIN2INOUT"), Text(origin = {-75.5144, 78.0295}, extent = {{-11.42, 7.57}, {4.74478, -8.59696}}, textString = "Vr"), Text(origin = {-85.8009, -11.1781}, extent = {{-11.42, 7.57}, {4.74, -8.6}}, textString = "Vi"), Text(origin = {-76.18, -77.71}, extent = {{-11.42, 7.57}, {4.74, -8.6}}, textString = "PIN"), Text(origin = {82.2036, 48.9879}, extent = {{-11.42, 7.57}, {8.33, -11.94}}, textString = "ir"), Text(origin = {81.5603, -35.9219}, extent = {{-11.42, 7.57}, {8.33, -11.94}}, textString = "ii")}));
end PIN2INOUT;
