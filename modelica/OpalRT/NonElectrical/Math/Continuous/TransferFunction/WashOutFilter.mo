within OpalRT.NonElectrical.Math.Continuous.TransferFunction;
block WashOutFilter "Wash-Out filter block"
  parameter Real TW = 0 "set TW == 0 to bypass filter";
  parameter Modelica.Blocks.Types.Init initType = Modelica.Blocks.Types.Init.SteadyState "Type of initialization (1: no init, 2: steady state, 3/4: initial output)" annotation(Evaluate = true, Dialog(group = "Initialization"));
  parameter Real y_start = 0 "Initial or guess value of output (= state)" annotation(Dialog(group = "Initialization"));
  Modelica.Blocks.Interfaces.RealInput u annotation(Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction transferfunction1(b = {1, 0}, a = if TW == 0 then {1, 1} else {TW0, 1}, initType = initType, y_start = y_start) annotation(Placement(visible = true, transformation(origin = {-20, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = TW) annotation(Placement(visible = true, transformation(origin = {-60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
protected
  parameter Real TW0(start = 1, fixed = false);
initial algorithm
  TW0 := TW;
equation
  connect(gain1.y, transferfunction1.u) annotation(Line(points = {{-49, 0}, {-33.2882, 0}, {-33.2882, 0}, {-32, 0}}, color = {0, 0, 127}));
  connect(u, gain1.u) annotation(Line(points = {{-100, 0}, {-73.613, 0}, {-73.613, 0}, {-72, 0}}, color = {0, 0, 127}));
  y = if TW == 0 then u else transferfunction1.y;
  annotation(Documentation(info = "<html>
<p>
The transfer function of the Lag block is as follows:
</p>
<pre>
  TW * s
y = ------------ * u
TW * s + 1
</pre>
<p>
if TW is zero, the block will be bypassed, i.e:
</p>
<pre>
y = u
</pre>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Rectangle(origin = {0.345423, -0.518135}, extent = {{-99.8273, 100}, {99.8273, -100}}), Text(origin = {-10.68, 22.28}, lineColor = {85, 0, 255}, extent = {{-66.67, 17.79}, {66.67, -17.79}}, textString = "sTW"), Text(origin = {-10.36, -25.53}, lineColor = {85, 0, 255}, extent = {{-66.67, 17.79}, {66.67, -17.79}}, textString = "1+TW s"), Line(origin = {-11.37, -2.07}, points = {{-58.0311, 0.345423}, {64.2487, 0.345423}}, color = {85, 0, 255}, thickness = 3)}));
end WashOutFilter;
