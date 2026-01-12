within OpalRT.Electrical.Load;
block ConstantPower
  parameter Integer IBUS = 100 "Located system bus";
  parameter String Device_id = "L1";
  parameter Real P = 1000 "Active Load, MW";
  parameter Real Q = 342.702 "Reactive Load, MVAR";
  parameter Real SB = 1000 "base power, MVA";
  OpalRT.NonElectrical.Connector.PwPin p annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-8.75, -8.75}, {8.75, 8.75}}, rotation = 0)));
protected
  parameter Real P_pu = P / SB;
  parameter Real Q_pu = Q / SB;
equation
  P_pu = -(p.vr * p.ir + p.vi * p.ii);
  Q_pu = -(p.vi * p.ir - p.vr * p.ii);
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Line(origin = {-29.14, -1.13}, points = {{-62.1138, 0.256739}, {56.8599, 0.282886}}, thickness = 5, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 20), Text(origin = {-55.01, 36.61}, extent = {{-38.33, 8.2}, {73.12, -30.27}}, textString = "P+jQ"), Text(origin = {-55.03, -14.25}, extent = {{-38.33, 8.2}, {60.03, -27.7}}, textString = "Const. PQ")}));
end ConstantPower;
