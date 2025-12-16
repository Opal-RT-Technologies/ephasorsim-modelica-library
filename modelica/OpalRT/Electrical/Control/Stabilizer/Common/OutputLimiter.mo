within OpalRT.Electrical.Control.Stabilizer.Common;
block OutputLimiter
  parameter Real VCU;
  parameter Real VCL;
  Modelica.Blocks.Interfaces.RealOutput VS annotation(Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput VCT annotation(Placement(visible = true, transformation(origin = {-100, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput VSS annotation(Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  VS = if VCL == 0 and VCU == 0 then VSS elseif VCL == 0 and not VCU == 0 and VCT < VCU then VSS
   elseif not VCL == 0 and VCU == 0 and VCT > VCL then VSS
   elseif VCT > VCL and VCT < VCU then VSS else 0;
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Text(origin = {2.7219, 50.0003}, extent = {{-60.6737, -7.51686}, {39.11, -44.99}}, textString = "OUTPUT"), Text(origin = {-16.7125, 25.118}, extent = {{-37.58, -15.36}, {58.5, -57.844}}, textString = "LIMITER"), Text(origin = {-67.3222, 61.7609}, extent = {{-18.74, 13.4}, {18.74, -13.4}}, textString = "VSS"), Text(origin = {-67.15, -56.8}, extent = {{-18.74, 13.4}, {18.74, -13.4}}, textString = "VCT"), Text(origin = {72.0629, -0.156645}, extent = {{-18.74, 13.4}, {18.74, -13.4}}, textString = "VS"), Rectangle(origin = {-0.108932, -0.108932}, extent = {{-99.8911, 100.109}, {99.8911, -100.109}})}));
end OutputLimiter;
