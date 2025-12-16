within OpalRT.Electrical.Auxiliary;
block V_SOURCE
  parameter Real Vmag;
  parameter Real Vang;
  OpalRT.NonElectrical.Connector.PwPin p annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
protected
  parameter Real vr0(fixed = false);
  parameter Real vi0(fixed = false);
  constant Real pi = Modelica.Constants.pi;
initial equation
  vr0 = Vmag * cos(Vang * pi / 180);
  vi0 = Vmag * sin(Vang * pi / 180);
equation
  p.vr = vr0;
  p.vi = vi0;
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), experiment(StartTime = 0, StopTime = 10, Tolerance = 0.01, Interval = 0.01), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Ellipse(origin = {0.383643, -3.57656}, extent = {{-76.4344, 85.6573}, {94.105, -80.5703}}, endAngle = 360), Text(origin = {10.0163, -5.26261}, extent = {{-61.1009, 47.8846}, {58.2768, -41.2094}}, textString = "V_SRC")}));
end V_SOURCE;
