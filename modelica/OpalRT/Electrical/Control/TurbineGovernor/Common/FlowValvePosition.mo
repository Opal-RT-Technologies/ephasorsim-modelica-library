within OpalRT.Electrical.Control.TurbineGovernor.Common;
model FlowValvePosition "Nonlinear Flow vs Intercept Valve Position Relation."
  Modelica.Blocks.Interfaces.RealInput u annotation(Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput v annotation(Placement(visible = true, transformation(origin = {-100, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
protected
  parameter Real g = -5.28107;
  Real Flow;
equation
  Flow = 1 - exp(g * v) + exp(g);
  y = Flow * u;
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Rectangle(origin = {0.135318, -0.135318}, extent = {{-99.7294, 100}, {99.7294, -100}}), Line(origin = {10.0961, 9.74386}, points = {{-69.9066, 69.8231}, {-70.1773, -69.8251}, {70.2828, -69.8251}, {70.0122, -69.2838}}), Line(origin = {-0.51, 10.22}, points = {{-59.3264, -69.8938}, {-56.0419, -36.8744}, {-48.404, -7.03814}, {-31.2714, 25.2226}, {-4.97392, 48.367}, {21.4595, 58.4695}, {76.3805, 58.9429}}, thickness = 1), Text(origin = {77.7754, -50.2333}, extent = {{-16.24, 12.04}, {2.88951, -9.59081}}, textString = "u"), Text(origin = {-43.4752, 72.7056}, extent = {{-16.24, 12.04}, {2.65063, -8.64576}}, textString = "y"), Line(origin = {-34.55, -3.26}, points = {{22.3578, -56.3673}, {22.3578, 55.8278}, {-25.0677, 55.8278}}, color = {136, 136, 136}, thickness = 1), Text(origin = {-77.0802, 50.7471}, extent = {{-16.24, 12.04}, {21.5843, -7.41813}}, textString = "0.8"), Text(origin = {-15.888, -69.628}, extent = {{-16.24, 12.04}, {23.214, -7.42103}}, textString = "0.3"), Text(origin = {-65.8067, -71.0372}, extent = {{-16.24, 12.04}, {22.672, -6.06602}}, textString = "0")}));
end FlowValvePosition;
