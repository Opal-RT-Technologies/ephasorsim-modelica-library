within OpalRT.Electrical.Control.Excitation.Common;
block CompoundedTransformer
  Modelica.Blocks.Interfaces.RealInput VTre annotation(Placement(transformation(extent = {{-128, 44}, {-88, 84}}), iconTransformation(extent = {{-210, 60}, {-184, 86}})));
  Modelica.Blocks.Interfaces.RealInput VTimg annotation(Placement(transformation(extent = {{-128, 2}, {-88, 42}}), iconTransformation(extent = {{-212, 12}, {-186, 38}})));
  Modelica.Blocks.Interfaces.RealInput ITre annotation(Placement(transformation(extent = {{-128, -38}, {-88, 2}}), iconTransformation(extent = {{-212, -38}, {-186, -12}})));
  Modelica.Blocks.Interfaces.RealInput ITimg annotation(Placement(transformation(extent = {{-128, -76}, {-88, -36}}), iconTransformation(extent = {{-212, -90}, {-186, -64}})));
  Modelica.Blocks.Interfaces.RealOutput VE annotation(Placement(transformation(extent = {{94, -10}, {114, 10}})));
  parameter Real XL;
  parameter Real KPmag;
  parameter Real KPang;
  parameter Real KI;
equation
  VE = compoundedTransformerFunctionXY(VTre, VTimg, ITre, ITimg, XL, KPmag, KPang, KI);
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-200, -100}, {100, 100}})), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-200, -100}, {100, 100}}), graphics={  Rectangle(extent = {{-200, 98}, {100, -100}}, lineColor = {28, 108, 200}), Text(extent = {{-124, 36}, {46, -26}}, lineColor = {28, 108, 200}, textString = "Compounded
Transformer"), Text(extent = {{-180, 84}, {-134, 56}}, lineColor = {28, 108, 200}, textString = "VTre"), Text(extent = {{-178, 36}, {-136, 12}}, lineColor = {28, 108, 200}, textString = "VTimg"), Text(extent = {{-178, -14}, {-134, -36}}, lineColor = {28, 108, 200}, textString = "ITre"), Text(extent = {{-178, -68}, {-140, -88}}, lineColor = {28, 108, 200}, textString = "ITimg"), Text(extent = {{54, 6}, {96, -18}}, lineColor = {28, 108, 200}, textString = "VE")}));
end CompoundedTransformer;
