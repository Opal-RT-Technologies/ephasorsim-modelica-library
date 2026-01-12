within OpalRT.Electrical.Control.OverExcitationLimiter.Common;
block Timer
  parameter Real t0 = 0;
  Modelica.Blocks.Interfaces.RealInput restart annotation(Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput STOP annotation(Placement(visible = true, transformation(origin = {-100, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
protected
  Real t;
initial equation
  t = t0;
equation
  der(t) = if integer(STOP) == 0 then 1 else 0;
  when integer(restart) == 1 then
    reinit(t, 0);
  end when;
  y = t;
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Rectangle(origin = {0.39604, 0.19802}, extent = {{-99.4059, 99.2079}, {99.4059, -99.2079}}), Text(origin = {-65.55, 63.77}, extent = {{-21.19, 9.5}, {40.6, -18.21}}, textString = "STOP"), Text(origin = {-67.72, -55.25}, extent = {{-21.19, 9.5}, {40.6, -18.21}}, textString = "RESTART"), Text(origin = {-50.8863, 22.1795}, extent = {{-21.19, 9.5}, {123.372, -57.4179}}, textString = "TIMER"), Text(origin = {48.1164, -55.4421}, extent = {{-21.19, 9.5}, {40.6, -18.21}}, textString = "TIME")}));
end Timer;
