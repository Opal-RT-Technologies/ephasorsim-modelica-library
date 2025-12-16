within OpalRT.NonElectrical.Math.Continuous.TransferFunction;
block WashOutFilter2 "Wash-Out filter, type 2"
  parameter Real TW1 = 0 "If TW1 equals 0, sTW1 will equal 1.0.";
  parameter Real TW2 = 0 ">0";
  parameter Modelica.Blocks.Types.Init initType = Modelica.Blocks.Types.Init.InitialOutput "Type of initialization (1: no init, 2: steady state, 3/4: initial output)" annotation(Evaluate = true, Dialog(group = "Initialization"));
  parameter Real y_start = 0 "Initial or guess value of output (= state)" annotation(Dialog(group = "Initialization"));
  Modelica.Blocks.Interfaces.RealInput u annotation(Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction transferfunction1(b = if TW10 <> 0 then {TW10, 0} else {1, 0}, a = if TW20 <> 0 then {TW20, 1} else {1, 1}, initType = initType, y_start = y_start) annotation(Placement(visible = true, transformation(origin = {-20, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction transferfunction2(b = {1}, a = if TW20 <> 0 then {TW20, 1} else {1, 1}, initType = initType, y_start = y_start) annotation(Placement(visible = true, transformation(origin = {-20, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
protected
  parameter Real TW10(start = 1, fixed = false);
  parameter Real TW20(start = 1, fixed = false);
initial algorithm
  TW10 := TW1;
  TW20 := TW2;
equation
  connect(transferfunction2.u, transferfunction1.u) annotation(Line(points = {{-32, -40}, {-33.7349, -40}, {-33.7349, 0}, {-32, 0}}, color = {0, 0, 127}));
  connect(transferfunction1.u, u) annotation(Line(points = {{-32, 0}, {-92.0273, 0}, {-92.0273, 0}, {-100, 0}}, color = {0, 0, 127}));
  y = if TW1 == 0 then transferfunction2.y else transferfunction1.y;
  annotation(Documentation(info = "<html>
<p>
The transfer function of the Lag block is as follows:
</p>
<pre>
  TW1 * s
y = ------------- * u
TW2 * s + 1
</pre>
<p>
if TW1 is zero, the block will reduce to a Lag tranfer function as follows:
</p>
<pre>
     1
y = ------------- * u
TW2 * s + 1
</pre>
<b>Note</b>: This block can not be used for approximate derivation of a wrapped angle. please use Derivative_Wrapped_Angle block for this purpose.
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Rectangle(origin = {0.345423, -0.518135}, extent = {{-99.8273, 100}, {99.8273, -100}}), Text(origin = {-10.68, 22.28}, lineColor = {85, 0, 255}, extent = {{-66.67, 17.79}, {66.67, -17.79}}, textString = "sTW1"), Text(origin = {-10.36, -25.76}, lineColor = {85, 0, 255}, extent = {{-66.67, 17.79}, {66.67, -17.79}}, textString = "1+TW2 s"), Line(origin = {-11.37, -2.07}, points = {{-58.0311, 0.345423}, {64.2487, 0.345423}}, color = {85, 0, 255}, thickness = 3)}));
end WashOutFilter2;
