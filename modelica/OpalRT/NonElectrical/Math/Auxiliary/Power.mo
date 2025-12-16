within OpalRT.NonElectrical.Math.Auxiliary;
block Power "power function"
  parameter Real k;
  Modelica.Blocks.Interfaces.RealInput u annotation(Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  y = u ^ k;
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Rectangle(origin = {-0.113895, -16.0592}, extent = {{-99.6583, 115.831}, {100.114, -83.713}}), Text(origin = {-19.4713, 29.7285}, extent = {{-46.5837, 2.16062}, {72.7796, -53.6413}}, textString = "y=u^k")}), Documentation(info = "<html>
<p>The equation relating input to output is as follow:</p>
<p>y = u<sup>k</sup>;</p>
<p>in which k is a real parameter.</p>
</html>"));
end Power;
