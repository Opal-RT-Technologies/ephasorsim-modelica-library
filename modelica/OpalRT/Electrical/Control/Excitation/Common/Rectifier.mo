within OpalRT.Electrical.Control.Excitation.Common;
block Rectifier
  Modelica.Blocks.Interfaces.RealInput IN annotation(Placement(visible = true, transformation(origin = {-105, 15}, extent = {{-25, -25}, {25, 25}}, rotation = 0), iconTransformation(origin = {-100, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput FEX annotation(Placement(visible = true, transformation(origin = {105, 15}, extent = {{-25, -25}, {25, 25}}, rotation = 0), iconTransformation(origin = {100, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  import OpalRT.Electrical.Control.Excitation.Common.rectifierFunction;
equation
  FEX = rectifierFunction(IN);
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Text(origin = {-78.078, -39.0522}, extent = {{-16.91, 12.04}, {16.91, -12.04}}, textString = "IN"), Text(origin = {74.53, -39.89}, extent = {{-16.91, 12.04}, {16.91, -12.04}}, textString = "FEX"), Text(origin = {17.381, -65.6605}, extent = {{-88.01, 95.07}, {56.7185, 49.4886}}, textString = "Rectifier", lineColor = {0, 0, 0}), Rectangle(origin = {-4.43802, 6.94708},
            lineThickness =                                                                                                                                                                                                        0.75, extent = {{-88.495, 78.0189}, {98.29, -98.52}})}));
end Rectifier;
