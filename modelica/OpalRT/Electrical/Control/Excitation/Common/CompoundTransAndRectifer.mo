within OpalRT.Electrical.Control.Excitation.Common;
block CompoundTransAndRectifer
  parameter Real KC = 1;
  parameter Real KI = 1;
  parameter Real KPmag = 1;
  parameter Real KPang = 1;
  parameter Real XL = 1;
  import OpalRT.Electrical.Control.Excitation.Common.rectifierFunction;
  import OpalRT.Electrical.Control.Excitation.Common.currentNormalizationFunction;
  import OpalRT.Electrical.Control.Excitation.Common.compoundedTransformerFunction;
  Modelica.Blocks.Interfaces.RealOutput VB annotation(Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {105, -5}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput IFD annotation(Placement(visible = true, transformation(origin = {-100, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Vre annotation(Placement(visible = true, transformation(origin = {-100, 82}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Vimg annotation(Placement(visible = true, transformation(origin = {-100, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Ire annotation(Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Iimg annotation(Placement(visible = true, transformation(origin = {-100, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
protected
  Real VE;
  Real IN;
  Real FEX;
algorithm
  VE := compoundedTransformerFunctionXY(Vre, Vimg, Ire, Iimg, XL, KPmag, KPang, KI);
  IN := KC * currentNormalizationFunction(IFD, VE);
  FEX := rectifierFunction(IN);
  VB := VE * FEX;
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Text(origin = {-39.377, 23.8166}, extent = {{-38.84, 10.01}, {121.113, -9.73936}}, textString = "CompoundedTranformer"), Text(origin = {-43.4601, 0.245304}, extent = {{-38.84, 10.01}, {114.617, -18.6716}}, textString = "& Current Normalization"), Text(origin = {-9.93438, -39.0203}, extent = {{-38.84, 10.01}, {52.371, -8.92866}}, textString = "& Rectifier"), Rectangle(origin = {-0.978256, 24.95}, extent = {{-98.849, 74.9406}, {100.74, -124.822}})}));
end CompoundTransAndRectifer;
