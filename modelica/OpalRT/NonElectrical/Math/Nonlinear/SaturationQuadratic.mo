within OpalRT.NonElectrical.Math.Nonlinear;
block SaturationQuadratic "Saturation block"
  parameter Real E1;
  parameter Real E2;
  parameter Real SE_E1;
  parameter Real SE_E2;
  import sat_q = OpalRT.NonElectrical.Math.Nonlinear.computeSaturationQuadratic;
  Modelica.Blocks.Interfaces.RealInput u annotation(Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  y = sat_q(u, E1, E2, SE_E1, SE_E2);
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Rectangle(origin = {0.141643, 0}, extent = {{-99.8584, 99.7167}, {99.8584, -99.7167}}), Text(origin = {-3.96785, -0.279433}, extent = {{-48.16, 35.13}, {48.16, -35.13}}, textString = "SE")}));
end SaturationQuadratic;
