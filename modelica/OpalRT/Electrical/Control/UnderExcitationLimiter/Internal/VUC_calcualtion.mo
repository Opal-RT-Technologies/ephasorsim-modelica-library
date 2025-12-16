within OpalRT.Electrical.Control.UnderExcitationLimiter.Internal;
block VUC_calcualtion
  parameter Real KUC = 1;
  Modelica.Blocks.Interfaces.RealOutput VUC annotation(Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Vmag annotation(Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-98, 68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  import VUC_calcualtion_al =
    OpalRT.Electrical.Control.UnderExcitationLimiter.Internal.calculateOperatingPoint;
  Modelica.Blocks.Interfaces.RealInput Vang annotation(Placement(visible = true, transformation(origin = {-100, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Iang annotation(Placement(visible = true, transformation(origin = {-100, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Imag annotation(Placement(visible = true, transformation(origin = {-100, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  VUC = VUC_calcualtion_al(Vmag, Vang, Imag, Iang, KUC);
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Rectangle(origin = {0.22779, -0.113895}, extent = {{-99.7722, 99.6583}, {99.7722, -99.6583}}), Text(origin = {1.48, 4.78}, extent = {{-75.97, 26.2}, {75.97, -26.2}}, textString = "VUC_calcualtion"), Text(origin = {-79.61, 47.84}, extent = {{-14.69, 5.92}, {14.69, -5.92}}, textString = "Vmag"), Text(origin = {-85.7546, 3.00633}, extent = {{-14.69, 5.92}, {14.69, -5.92}}, textString = "Vang"), Text(origin = {82.53, -20.31}, extent = {{-14.69, 5.92}, {14.69, -5.92}}, textString = "VUC_out"), Text(origin = {-80.57, -37.17}, extent = {{-14.69, 5.92}, {14.69, -5.92}}, textString = "Imag"), Text(origin = {-79.48, -75.03}, extent = {{-14.69, 5.92}, {14.69, -5.92}}, textString = "Iang")}));
end VUC_calcualtion;
