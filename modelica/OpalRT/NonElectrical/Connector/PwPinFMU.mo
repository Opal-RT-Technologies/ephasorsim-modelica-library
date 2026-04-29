within OpalRT.NonElectrical.Connector;
connector PwPinFMU "Bus interface for FMU export (no flow — avoids Kirchhoff zeroing)"
  input Real vr "real part of the voltage (input: set by solver)";
  input Real vi "imaginary part of the voltage (input: set by solver)";
  Real ir "real part of the current (computed by machine)";
  Real ii "imaginary part of the current (computed by machine)";
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Polygon(origin = {-0.39, 0.11}, fillColor = {255, 0, 0},
            fillPattern =                                                                                                                                                                                                  FillPattern.Solid, points = {{-99.613, 100.115}, {100.161, -1.01398}, {-99.613, -100.111}, {-99.613, 100.115}})}), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
end PwPinFMU;
