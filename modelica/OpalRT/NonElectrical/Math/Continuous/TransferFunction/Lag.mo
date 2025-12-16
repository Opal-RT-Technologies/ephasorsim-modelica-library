within OpalRT.NonElectrical.Math.Continuous.TransferFunction;
block Lag "Lag transfer function"
  parameter Real K = 1;
  parameter Real T = 1;
  parameter Modelica.Blocks.Types.Init initType = Modelica.Blocks.Types.Init.InitialOutput "Type of initialization (1: no init, 2: steady state, 3/4: initial output)" annotation(Evaluate = true, Dialog(group = "Initialization"));
  parameter Real y_start = 0 "Initial or guess value of output (= state)" annotation(Dialog(group = "Initialization"));
  Modelica.Blocks.Interfaces.RealInput u annotation(Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder firstorder1(k = 1, T = if T <> 0 then T else 1, initType = initType, y_start = y_start) annotation(Placement(visible = true, transformation(origin = {40, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = K) annotation(Placement(visible = true, transformation(origin = {40, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain2(k = K) annotation(Placement(visible = true, transformation(origin = {0, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(gain2.y, firstorder1.u) annotation(Line(points = {{11, -20}, {27.3349, -20}, {27.3349, -20}, {28, -20}}, color = {0, 0, 127}));
  connect(gain2.u, u) annotation(Line(points = {{-12, -20}, {-23.0068, -20}, {-23.0068, 0.22779}, {-100, 0.22779}, {-100, 0}}, color = {0, 0, 127}));
  connect(gain1.u, u) annotation(Line(points = {{28, 40}, {-23.0068, 40}, {-23.0068, 0}, {-100, 0}, {-100, 0}}, color = {0, 0, 127}));
  y = if T <> 0 then firstorder1.y else gain1.y;
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Documentation(info = "<html>
<p>
The transfer function of the Lag block is as follows:
</p>
<pre>
    K
y = ----------- * u
T * s + 1
</pre>
<p>
if T is zero, the block reduces to a simple gain block as follows:
</p>
<pre>
y = K * u</pre>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Rectangle(origin = {0.22779, -0.113895}, extent = {{-99.5444, 99.4305}, {99.5444, -99.4305}}), Text(origin = {-6.15, 19.71}, lineColor = {85, 0, 255}, extent = {{-18.45, 16.74}, {18.45, -16.74}}, textString = "K"), Line(origin = {30.62, -5.55}, points = {{-85.5115, 5.55709}, {12.4383, 5.55709}}, color = {85, 0, 255}, thickness = 3), Text(origin = {-31.71, -19.74}, lineColor = {85, 0, 255}, extent = {{-18.45, 16.74}, {75.17, -15.37}}, textString = "1+T s")}));
end Lag;
