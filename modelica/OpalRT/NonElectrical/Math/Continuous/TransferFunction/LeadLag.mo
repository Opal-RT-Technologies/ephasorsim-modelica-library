within OpalRT.NonElectrical.Math.Continuous.TransferFunction;
block LeadLag "Lead-Lag tranfer function"
  parameter Real TA = 1;
  parameter Real TB = 2;
  parameter Real K = 1;
  parameter Modelica.Blocks.Types.Init initType = Modelica.Blocks.Types.Init.InitialOutput "Type of initialization (1: no init, 2: steady state, 3/4: initial output)" annotation(Evaluate = true, Dialog(group = "Initialization"));
  parameter Real y_start = 0 "Initial or guess value of output (= state)" annotation(Dialog(group = "Initialization"));
  Modelica.Blocks.Interfaces.RealInput u annotation(Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain3(k = K) annotation(Placement(visible = true, transformation(origin = {-40, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = K) annotation(Placement(visible = true, transformation(origin = {40, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction transferfunction1(b = {TA0, 1}, a = if TA == TB or TB == 0 then {1, 10.123456789} else {TB, 1}, initType = initType, y_start = y_start) annotation(Placement(visible = true, transformation(origin = {40, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
protected
  parameter Real TA0(start = 2, fixed = false);
initial algorithm
  TA0 := TA;
equation
  y = if TA == TB then gain1.y else transferfunction1.y;
  connect(gain3.y, transferfunction1.u) annotation(Line(points = {{-29, -60}, {-12.9841, -60}, {28, -60.1367}, {28, -60}}, color = {0, 0, 127}));
  connect(u, gain1.u) annotation(Line(points = {{-100, 0}, {-60.82, 0}, {-60.82, 60.5923}, {-33.713, 60}, {28, 60}}, color = {0, 0, 127}));
  connect(gain3.u, u) annotation(Line(points = {{-52, -60}, {-61.0478, -60}, {-61.0478, 0.22779}, {-100, 0.22779}, {-100, 0}}, color = {0, 0, 127}));
  annotation(Documentation(info = "<html>
<p>
The transfer function of the Lead-Lag block is as follows:
</p>
<pre>
    TA * s + 1
y = K * ------------ * u
    TB * s + 1
</pre>
<p>
if TA is zero, the block reduces to a Lag block as follows:
</p>
<pre>
     K
y = ------------ * u
TB * s + 1
</pre>
<p>
if TB and TA are both zero, the block reduces to a gain block as follows:
</p>
<pre>
y = K * u
</pre>
<p>
Please refer to transfer_function1 for information on the differences between this block and transfer_function1.
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Rectangle(origin = {0.345423, -0.518135}, extent = {{-99.8273, 100}, {99.8273, -100}}), Text(origin = {9.32, 22.28}, lineColor = {85, 0, 255}, extent = {{-66.67, 17.79}, {66.67, -17.79}}, textString = "1+TA s"), Text(origin = {9.64, -25.76}, lineColor = {85, 0, 255}, extent = {{-66.67, 17.79}, {66.67, -17.79}}, textString = "1+TB s"), Line(origin = {8.63, -2.07}, points = {{-58.0311, 0.345423}, {64.2487, 0.345423}}, color = {85, 0, 255}, thickness = 3), Text(origin = {-20.44, -1.27}, lineColor = {85, 0, 255}, extent = {{-66.67, 17.79}, {-26.94, -17.1}}, textString = "K")}));
end LeadLag;
