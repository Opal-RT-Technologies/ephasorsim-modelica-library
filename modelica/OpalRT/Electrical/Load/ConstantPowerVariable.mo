within OpalRT.Electrical.Load;
block ConstantPowerVariable
  parameter Integer IBUS = 100 "Located system bus";
  parameter String Device_id = "L1";
  parameter Real SB = 1000 "base power, MVA";
  OpalRT.NonElectrical.Connector.PwPin p annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 20}, extent = {{-8.75, -8.75}, {8.75, 8.75}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput P annotation(Placement(visible = true, transformation(origin = {-100, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Q annotation(Placement(visible = true, transformation(origin = {-100, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
protected
  Real P_pu = P / SB;
  Real Q_pu = Q / SB;
equation
  P_pu = -(p.vr * p.ir + p.vi * p.ii);
  Q_pu = -(p.vi * p.ir - p.vr * p.ii);
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Line(origin = {-32.7344, 20.1794}, points = {{-62.1138, 0.256739}, {56.8599, 0.282886}}, thickness = 5, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 20), Text(origin = {-58.6044, 57.9194}, extent = {{-38.33, 8.2}, {73.12, -30.27}}, textString = "P+jQ"), Text(origin = {-58.6244, 7.05937}, extent = {{-38.33, 8.2}, {60.03, -27.7}}, textString = "Const. PQ"), Rectangle(origin = {0.256739, -0.256739}, extent = {{-100.128, 99.8716}, {99.6149, -99.8716}}), Text(origin = {-137.193, -25.5469}, extent = {{50.7586, 5.37587}, {73.12, -30.27}}, textString = "P"), Text(origin = {-136.96, -64.34}, extent = {{50.76, 5.38}, {71.5796, -26.4189}}, textString = "Q")}));
end ConstantPowerVariable;
