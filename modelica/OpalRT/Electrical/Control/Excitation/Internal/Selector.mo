within OpalRT.Electrical.Control.Excitation.Internal;
block Selector
  Modelica.Blocks.Interfaces.RealInput V1 annotation(Placement(visible = true, transformation(origin = {-100, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput V3 annotation(Placement(visible = true, transformation(origin = {-100, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput V2 annotation(Placement(visible = true, transformation(origin = {-100, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput VOEL annotation(Placement(visible = true, transformation(origin = {-60, 100}, extent = {{-10, -10}, {10, 10}}, rotation = -90), iconTransformation(origin = {-60, 100}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealInput Verr annotation(Placement(visible = true, transformation(origin = {20, 100}, extent = {{-10, -10}, {10, 10}}, rotation = -90), iconTransformation(origin = {60, 100}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealInput VUEL annotation(Placement(visible = true, transformation(origin = {-20, 100}, extent = {{-10, -10}, {10, 10}}, rotation = -90), iconTransformation(origin = {0, 100}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(visible = true, transformation(origin = {100, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
algorithm
  if Verr >= VUEL then
    if Verr <= VOEL then
      y := V1;
    else
      y := V3;
    end if;
  else
    if VUEL <= VOEL then
      y := V2;
    else
      y := V3;
    end if;
  end if;
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Rectangle(origin = {0, 0.455581}, extent = {{-99.3166, 99.7722}, {99.3166, -99.7722}}), Text(origin = {-8.31861, 37.7723}, extent = {{-41.12, 11.85}, {56.8375, -38.9571}}, textString = "selector"), Text(origin = {-58.1699, 81.2446}, extent = {{-14.7, 6.27}, {14.7, -6.27}}, textString = "VOEL"), Text(origin = {1.45558, 81.179}, extent = {{-14.7, 6.27}, {14.7, -6.27}}, textString = "VUEL"), Text(origin = {61.1091, 80.1612}, extent = {{-16.0667, 8.32011}, {14.7, -6.27}}, textString = "Verr"), Text(origin = {-70.4708, -0.0384327}, extent = {{-14.7, 6.27}, {14.7, -6.27}}, textString = "V2"), Text(origin = {-73.9171, 56.0184}, extent = {{-14.7, 6.27}, {14.7, -6.27}}, textString = "V1"), Text(origin = {-71.2612, -61.0484}, extent = {{-14.7, 6.27}, {14.7, -6.27}}, textString = "V3"), Text(origin = {67.9678, -58.943}, extent = {{-15.05, 8.06}, {15.05, -8.06}}, textString = "out"), Text(origin = {-29.0944, 14.2615}, extent = {{-4.44574, -7.51219}, {56.84, -38.96}}, textString = "logic")}));
end Selector;
