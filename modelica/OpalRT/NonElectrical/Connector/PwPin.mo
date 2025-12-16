within OpalRT.NonElectrical.Connector;
connector PwPin
  Real vr "real part of the voltage";
  Real vi "imaginary part of the voltage";
  flow Real ir "real part of the current";
  flow Real ii "imaginary part of the current";
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Polygon(origin = {-0.39, 0.11}, fillColor = {255, 0, 0},
            fillPattern =                                                                                                                                                                                                  FillPattern.Solid, points = {{-99.613, 100.115}, {100.161, -1.01398}, {-99.613, -100.111}, {-99.613, 100.115}})}), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
end PwPin;
