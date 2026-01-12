within OpalRT.NonElectrical.Math.Nonlinear;
block PieceWiseLinear4 "piece-wise linear function with four break-points"
  Modelica.Blocks.Interfaces.RealInput u annotation(Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Real y1;
  parameter Real y2;
  parameter Real y3;
  parameter Real y4;
  parameter Real u1;
  parameter Real u2;
  parameter Real u3;
  parameter Real u4;
  //avoids hardcoding issues:
protected
  parameter Real ut1(fixed = false);
  parameter Real ut2(fixed = false);
  parameter Real ut3(fixed = false);
  parameter Real ut4(fixed = false);
initial equation
  ut1 = u1;
  ut2 = u2;
  ut3 = u3;
  ut4 = u4;
equation
  if u <= ut1 then
    y = y1;
  elseif u <= ut2 then
    y = y1 + (y2 - y1) * (u - ut1) / (ut2 - ut1);
  elseif u <= ut3 then
    y = y2 + (y3 - y2) * (u - ut2) / (ut3 - ut2);
  elseif u <= ut4 then
    y = y3 + (y4 - y3) * (u - ut3) / (ut4 - ut3);
  else
    y = y4;
  end if;
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Rectangle(origin = {0.135318, -0.135318}, extent = {{-99.7294, 100}, {99.7294, -100}}), Line(origin = {10.0961, 9.74386}, points = {{-69.9066, 69.8231}, {-70.1773, -69.8251}, {70.2828, -69.8251}, {70.0122, -69.2838}}), Line(origin = {-0.276393, 10.2842}, points = {{-59.8048, -50.0676}, {-39.7777, -50.0676}, {-26.2801, -12.5441}, {7.10351, 23.8051}, {51.2667, 38.4839}, {76.988, 38.4153}}), Text(origin = {-27.07, -52.37}, extent = {{-16.24, 12.04}, {9.47, 1.22}}, textString = "(u1,y1)"), Text(origin = {-7.07, -14.74}, extent = {{-16.24, 12.04}, {9.47, 1.22}}, textString = "(u2,y2)"), Text(origin = {23.98, 19.83}, extent = {{-16.24, 12.04}, {9.47, 1.22}}, textString = "(u3,y3)"), Text(origin = {64.66, 33.25}, extent = {{-16.24, 12.04}, {9.47, 1.22}}, textString = "(u4,y4)"), Text(origin = {77.7754, -50.2333}, extent = {{-16.24, 12.04}, {2.88951, -9.59081}}, textString = "u"), Text(origin = {-43.4752, 72.7056}, extent = {{-16.24, 12.04}, {2.65063, -8.64576}}, textString = "y")}));
end PieceWiseLinear4;
