within OpalRT.NonElectrical.Math.Nonlinear;
block PieceWiseLinear5 "piece-wise linear function with five break-points"
  Modelica.Blocks.Interfaces.RealInput u annotation(Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Real y1;
  parameter Real y2;
  parameter Real y3;
  parameter Real y4;
  parameter Real y5;
  parameter Real u1;
  parameter Real u2;
  parameter Real u3;
  parameter Real u4;
  parameter Real u5;
  //avoids hardcoding issues:
protected
  parameter Real ut1(fixed = false);
  parameter Real ut2(fixed = false);
  parameter Real ut3(fixed = false);
  parameter Real ut4(fixed = false);
  parameter Real ut5(fixed = false);
initial equation
  ut1 = u1;
  ut2 = u2;
  ut3 = u3;
  ut4 = u4;
  ut5 = u5;
equation
  if u <= ut1 then
    y = y1;
  elseif u <= ut2 then
    y = y1 + (y2 - y1) * (u - ut1) / (ut2 - ut1);
  elseif u <= ut3 then
    y = y2 + (y3 - y2) * (u - ut2) / (ut3 - ut2);
  elseif u <= ut4 then
    y = y3 + (y4 - y3) * (u - ut3) / (ut4 - ut3);
  elseif u <= ut5 then
    y = y4 + (y5 - y4) * (u - ut4) / (ut5 - ut4);
  else
    y = y5;
  end if;
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Rectangle(origin = {0.135318, -0.135318}, extent = {{-99.7294, 100}, {99.7294, -100}}), Line(origin = {10.0961, 9.74386}, points = {{-69.9066, 69.8231}, {-70.1773, -69.8251}, {70.2828, -69.8251}, {70.0122, -69.2838}}), Line(origin = {-0.50805, 9.13975}, points = {{-59.5974, -49.8396}, {-54.1449, -49.6115}, {-44.068, -13.0002}, {-23.6833, 16.2795}, {6.95023, 41.8629}, {46.9338, 54.6755}, {88.8466, 54.6069}}), Text(origin = {-41.2091, -51.4578}, extent = {{-16.24, 12.04}, {9.47, 1.22}}, textString = "(u1,y1)"), Text(origin = {-25.314, -14.5119}, extent = {{-16.24, 12.04}, {9.47, 1.22}}, textString = "(u2,y2)"), Text(origin = {-1.56162, 14.5848}, extent = {{-16.24, 12.04}, {9.47, 1.22}}, textString = "(u3,y3)"), Text(origin = {23.3829, 38.9513}, extent = {{-16.24, 12.04}, {9.47, 1.22}}, textString = "(u4,y4)"), Text(origin = {77.7754, -50.2333}, extent = {{-16.24, 12.04}, {2.88951, -9.59081}}, textString = "u"), Text(origin = {-43.4752, 72.7056}, extent = {{-16.24, 12.04}, {2.65063, -8.64576}}, textString = "y"), Text(origin = {57.9819, 50.5149}, extent = {{-16.24, 12.04}, {9.47, 1.22}}, textString = "(u5,y5)")}));
end PieceWiseLinear5;
