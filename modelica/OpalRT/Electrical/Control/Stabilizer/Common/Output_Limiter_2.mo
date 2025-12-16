within OpalRT.Electrical.Control.Stabilizer.Common;
block Output_Limiter_2
  parameter Real VCU;
  parameter Real VCL;
  Modelica.Blocks.Interfaces.RealInput VT annotation(Placement(visible = true, transformation(origin = {-100, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput VSS annotation(Placement(visible = true, transformation(origin = {-100, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput VTO annotation(Placement(visible = true, transformation(origin = {-100, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput VS annotation(Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  VS = if VCL == 0 and VCU == 0 then VSS elseif VCL == 0 and not VCU == 0 and VT < VCU + VTO then VSS
   elseif not VCL == 0 and VCU == 0 and VT > VCL + VTO then VSS
   elseif VT > VCL + VTO and VT < VCU + VTO then VSS else 0;
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Text(origin = {-23.9876, 29.0012}, extent = {{-23.71, -26.83}, {58.3982, 37.6727}}, textString = "OUTPUT", fontName = "Arial"), Text(origin = {-78.584, 86.4483}, extent = {{-9.76, 6.5}, {28.731, -21.4021}}, textString = "VSS", fontName = "Arial"), Text(origin = {-73.58, -37.5302}, extent = {{-12.87, 9.89}, {25.6071, -16.6651}}, textString = "VTO", fontName = "Arial"), Text(origin = {-82.376, -75.2072}, extent = {{-10.3, 6.37}, {23.8501, -16.1261}}, textString = "VT", fontName = "Arial"), Text(origin = {77.501, -37.3932}, extent = {{15.99, 10.3}, {-27.9141, -15.9911}}, textString = "VS", fontName = "Arial"), Rectangle(origin = {0, -0.14}, extent = {{-100, 99.59}, {100, -99.59}}), Text(origin = {-17.7465, 8.80602}, extent = {{74.3944, -34.0122}, {-32.66, 17.21}}, textString = "LIMITER_2")}));
end Output_Limiter_2;
