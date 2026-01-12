within OpalRT.Electrical.Load;
block ConstantImpedance2
  parameter Integer IBUS = 100 "Located system bus";
  parameter String Device_id = "L1";
  parameter Real R;
  parameter Real X;
  OpalRT.NonElectrical.Connector.PwPin p annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-8.75, -8.75}, {8.75, 8.75}}, rotation = 0)));
equation
  p.vr = R * p.ir - X * p.ii;
  p.vi = X * p.ir + R * p.ii;
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Line(origin = {-29.14, -1.13}, points = {{-62.1138, 0.256739}, {56.8599, 0.282886}}, thickness = 5, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 20), Text(origin = {-55.0132, 36.6074}, extent = {{-38.33, 8.2}, {73.1249, -30.2651}}, textString = "R+jX")}));
end ConstantImpedance2;
