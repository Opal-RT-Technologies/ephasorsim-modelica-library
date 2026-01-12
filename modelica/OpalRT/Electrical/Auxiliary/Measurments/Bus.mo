within OpalRT.Electrical.Auxiliary.Measurments;
block Bus
  Real Vmag;
  Real Vang;
  OpalRT.NonElectrical.Connector.PwPin p annotation(Placement(visible = true, transformation(origin = {-20, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-20, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  Vmag = sqrt(p.vr ^ 2 + p.vi ^ 2);
  Vang = atan(p.vi / p.vr) / Modelica.Constants.pi * 180;
  p.ir = 0;
  p.ii = 0;
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Rectangle(origin = {-23.88, 11.81},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid, extent = {{13.86, 64.96}, {-6.16, -92.43}})}));
end Bus;
