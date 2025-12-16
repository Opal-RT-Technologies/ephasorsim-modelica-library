within OpalRT.Electrical.Control.Excitation.Internal;
block Rectifier2
  Modelica.Blocks.Interfaces.RealInput IN annotation(Placement(visible = true, transformation(origin = {-105, 15}, extent = {{-25, -25}, {25, 25}}, rotation = 0), iconTransformation(origin = {-100, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput FEX annotation(Placement(visible = true, transformation(origin = {105, 15}, extent = {{-25, -25}, {25, 25}}, rotation = 0), iconTransformation(origin = {100, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  import OpalRT.Electrical.Control.Excitation.Internal.rectifierFunction2;
equation
  FEX = rectifierFunction2(IN);
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Text(origin = {-78.078, -39.0522}, extent = {{-16.91, 12.04}, {16.91, -12.04}}, textString = "IN"), Text(origin = {74.53, -39.89}, extent = {{-16.91, 12.04}, {16.91, -12.04}}, textString = "FEX"), Text(origin = {13.9961, -69.7925}, extent = {{-88.01, 95.07}, {56.72, 49.49}}, textString = "y:= sqrt(1-u)", fontSize = 70), Rectangle(origin = {-4.43802, 6.94708},
            lineThickness =                                                                                                                                                                                                        0.75, extent = {{-88.495, 78.0189}, {98.29, -98.52}}), Text(origin = {18.3167, -4.76869}, extent = {{-88.01, 95.07}, {56.72, 49.49}}, textString = "Rectifier2", fontSize = 60)}));
end Rectifier2;
