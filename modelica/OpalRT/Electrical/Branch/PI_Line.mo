within OpalRT.Electrical.Branch;
block PI_Line
  parameter Real R = 1 "Resistance p.u.";
  parameter Real X = 1 "Reactance p.u.";
  parameter Real B = 1 "Shunt half susceptance p.u.";
  constant Real pi = Modelica.Constants.pi;
  Real Vmag_from;
  Real Vmag_to;
  Real Vang_from;
  Real Vang_to;
  Real Imag_from;
  Real Imag_to;
  Real Iang_from;
  Real Iang_to;
  OpalRT.NonElectrical.Connector.PwPin p annotation(Placement(visible = true, transformation(origin = {-80, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.Connector.PwPin n annotation(Placement(visible = true, transformation(origin = {80, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
protected
  parameter Real B0(fixed = false);
initial algorithm
  B0 := B / 2;
equation
  p.vr - n.vr = (-(R * p.ir - X * p.ii)) + B0 * (R * p.vi + X * p.vr);
  p.vi - n.vi = (-(R * p.ii + X * p.ir)) + B0 * ((-R * p.vr) + X * p.vi);
  -(p.vr - n.vr) = (-(R * n.ir - X * n.ii)) + B0 * (R * n.vi + X * n.vr);
  -(p.vi - n.vi) = (-(R * n.ii + X * n.ir)) + B0 * ((-R * n.vr) + X * n.vi);
  Vmag_from = sqrt(p.vr ^ 2 + p.vi ^ 2);
  Vmag_to = sqrt(n.vr ^ 2 + n.vi ^ 2);
  Vang_from = atan2(p.vi, p.vr) * 180 / pi;
  Vang_to = atan2(n.vi, n.vr) * 180 / pi;
  Imag_from = sqrt(p.ir ^ 2 + p.ii ^ 2);
  Imag_to = sqrt(n.ir ^ 2 + n.ii ^ 2);
  Iang_from = atan2(p.ii, p.ir) * 180 / pi;
  Iang_to = atan2(n.ii, n.ir) * 180 / pi;
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Rectangle(origin = {-1.13895, 26.082}, extent = {{-94.533, 43.3941}, {95.4442, -91.6856}}), Text(origin = {0.113371, 6.49672}, extent = {{-48.41, 24.72}, {48.41, -24.72}}, textString = "PI Line")}));
end PI_Line;
