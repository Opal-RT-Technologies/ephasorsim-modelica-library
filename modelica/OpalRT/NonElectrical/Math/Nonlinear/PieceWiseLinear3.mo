within OpalRT.NonElectrical.Math.Nonlinear;
block PieceWiseLinear3 "piece-wise linear function with three break-points"
  Modelica.Blocks.Interfaces.RealInput u annotation(Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Real C1;
  parameter Real C2;
  parameter Real C3;
  parameter Real V1;
  parameter Real V2;
  parameter Real V3;
equation
  if u <= V1 then
    y = C1;
  elseif u <= V2 then
    y = C1 + (C2 - C1) * (u - V1) / (V2 - V1);
  elseif u <= V3 then
    y = C2 + (C3 - C2) * (u - V2) / (V3 - V2);
  else
    y = C3;
  end if;
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Rectangle(origin = {0.135318, -0.135318}, extent = {{-99.7294, 100}, {99.7294, -100}}), Line(origin = {10.0961, 9.74386}, points = {{-69.9066, 69.8231}, {-70.1773, -69.8251}, {70.2828, -69.8251}, {70.0122, -69.2838}}), Line(origin = {-0.276393, 10.2842}, points = {{-59.8048, -50.0676}, {-39.7777, -50.0676}, {-19.2094, 10.2842}, {20.0328, 50.0677}, {60.3576, 49.797}, {59.8163, 49.5264}}), Text(origin = {-27.0673, -52.3675}, extent = {{-16.24, 12.04}, {9.4741, 1.22116}}, textString = "(C1,V1)"), Text(origin = {2.13, 4.98}, extent = {{-16.24, 12.04}, {9.47, 1.22}}, textString = "(C2,V2)"), Text(origin = {36.74, 45.01}, extent = {{-16.24, 12.04}, {9.47, 1.22}}, textString = "(C3,V3)")}));
end PieceWiseLinear3;
