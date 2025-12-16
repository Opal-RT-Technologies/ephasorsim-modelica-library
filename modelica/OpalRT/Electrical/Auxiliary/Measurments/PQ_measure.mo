within OpalRT.Electrical.Auxiliary.Measurments;
block PQ_measure
  OpalRT.NonElectrical.Connector.PwPin p1 annotation(Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.Connector.PwPin p2 annotation(Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput PELEC annotation(Placement(visible = true, transformation(origin = {100, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput QELEC annotation(Placement(visible = true, transformation(origin = {100, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  PELEC = p2.vr * p2.ir + p2.vi * p2.ii;
  QELEC = p2.vi * p2.ir - p2.vr * p2.ii;
  connect(p1, p2) annotation(Line(points = {{-100, 0}, {96.3883, 0}, {96.3883, 0}, {96.3883, 0}}));
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Rectangle(origin = {0, -0.3386}, extent = {{-99.7743, 99.6614}, {99.7743, -99.6614}}), Text(origin = {41.0881, 84.3075}, extent = {{-23.48, 14.79}, {40.41, -22.4649}}, textString = "PELEC"), Text(origin = {41.2244, 24.8514}, extent = {{-23.48, 14.79}, {40.41, -22.46}}, textString = "QELEC"), Text(origin = {-9.88332, -15.4213}, extent = {{-76.5274, 58.3566}, {92.7802, -61.9634}}, textString = "PQ Measurment"), Text(origin = {-128.713, -38.083}, extent = {{46.4944, -19.9714}, {92.78, -61.96}}, textString = "IN PIN"), Text(origin = {-12.1028, -39.3057}, extent = {{34.0747, -15.9068}, {92.78, -61.96}}, textString = "OUT PIN")}));
end PQ_measure;
