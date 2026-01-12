within OpalRT.Electrical.Control.TurbineGovernor.Common;
model FastValving
  parameter Real TA = 0.5;
  parameter Real TB = 1.0;
  parameter Real TC = 2.0;
  Modelica.Blocks.Interfaces.RealInput TI annotation(Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
protected
  Real V1;
  Real V3;
  Real t;
initial equation
  y = 1;
  t = 0;
equation
  der(t) = if integer(TI) > 0.5 or (t > 0 and t <= TC) then 1 else 0;
  when integer(TI) > 0.5 then
    reinit(t,0);
  end when;
  V1 = -1/TA;
  V3 = 1/(TC - TB);
  der(y) = if t <= 0 then 0 elseif t < TB then V1 elseif t < TC then V3 else 0;
  when y < 0 then
      reinit(y,0);
  elsewhen t > TC then
      reinit(y,1);
  end when;
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Rectangle(origin = {16.1247, 17.2087}, extent = {{-115.854, 83.3333}, {84.1463, -117.209}}), Text(origin = {-38.7522, -34.4144}, extent = {{-47.1564, -26.8333}, {122.766, 101.359}}, textString = "V"), Line(origin = {-0.95, 0.07}, points = {{-27.2333, 38.1462}, {0.409001, -38.8186}, {27.5093, 38.4172}}, thickness = 0.75)}));
end FastValving;
