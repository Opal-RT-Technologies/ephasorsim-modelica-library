within OpalRT.Electrical.Auxiliary;
block BaseConversion "Converts power and voltage bases"
  parameter Real Sb_n = 100;
  parameter Real Sb_p = 100;
  parameter Real Vb_n = 1;
  parameter Real Vb_p = 1;
  OpalRT.NonElectrical.Connector.PwPin p annotation(Placement(visible = true, transformation(origin = {-100, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.Connector.PwPin n annotation(Placement(visible = true, transformation(origin = {100, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  p.vr * Vb_p = n.vr * Vb_n;
  p.vi * Vb_p = n.vi * Vb_n;
  p.ir * Sb_p / Vb_p = -n.ir * Sb_n / Vb_n;
  p.ii * Sb_p / Vb_p = -n.ii * Sb_n / Vb_n;
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Text(origin = {-82.1193, -51.1319}, extent = {{-11.23, 7.98}, {15.0044, -18.8905}}, textString = "p"), Text(origin = {52.6924, -60.238}, extent = {{12.4602, 17.0916}, {35.05, -10.69}}, textString = "n"), Rectangle(origin = {0, 0.135318}, extent = {{-99.8647, 100}, {99.8647, -100}}), Text(origin = {-41.3042, 48.0102}, extent = {{-29.3626, -20.4368}, {105.415, -58.8632}}, textString = "BaseChange")}));
end BaseConversion;
