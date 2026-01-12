within OpalRT.NonElectrical.Math.Continuous.TransferFunction;
block WrappedAngleDerivative "Approximated derivative block for wrapped angle input"
  import Modelica.Blocks.Types.Init;
  constant Real pi = Modelica.Constants.pi;
  parameter Real k(unit = "1") = 1 "Gains";
  parameter Modelica.Units.SI.Time T(min = Modelica.Constants.small) = 0.01 "Time constants (T>0 required; T=0 is ideal derivative block)";
  parameter Modelica.Blocks.Types.Init initType = Modelica.Blocks.Types.Init.NoInit "Type of initialization (1: no init, 2: steady state, 3: initial state, 4: initial output)" annotation(Evaluate = true, Dialog(group = "Initialization"));
  parameter Real x_start = 0 "Initial or guess value of state" annotation(Dialog(group = "Initialization"));
  parameter Real y_start = 0 "Initial value of output (= state)" annotation(Dialog(enable = initType == Init.InitialOutput, group = "Initialization"));
  parameter Real Th = 0.1 "Threshold for unwraping input signal";
  output Real x(start = x_start) "State of block";
  Boolean cond1, cond2;
  Real tmp1 = u - x;
  Real ref1 = 2 * pi - Th;
  Real ref2 = (-2 * pi) + Th;
  Modelica.Blocks.Interfaces.RealInput u annotation(Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
protected
  parameter Boolean zeroGain = abs(k) < Modelica.Constants.eps;
initial equation
  if initType == Init.SteadyState then
    der(x) = 0;
  elseif initType == Init.InitialState then
    x = x_start;
  elseif initType == Init.InitialOutput then
    if zeroGain then
      x = u;
    else
      y = y_start;
    end if;
  end if;
equation
  cond1 = u - x >= 2 * pi - Th;
  cond2 = u - x <= (-2 * pi) + Th;
  when cond1 then
    reinit(x, pre(x) + 2 * pi);
  elsewhen cond2 then
    reinit(x, pre(x) - 2 * pi);
  end when;
  der(x) = if zeroGain then 0 else (u - x) / T;
  y = if zeroGain then 0 else k / T * (u - x);
  annotation(Documentation(info = "<html>
<p>This block calculates approximate derivative of a wrapped angle between [-pi,pi].</p>
<p>The block uses the following transfer function for derivation:</p>
<pre>
   k * s
y = ------------ * u
  T * s + 1
</pre>
<p>
The discontinuities of the angle caused by wrapping of the signal, i.e. sudden change from pi to -pi or vice versa, are skipped for derivation. In this way, the derivative will be a smooth continuous signal at the time where the angle is wrapped.
</p>
<p>
<b>Note</b>: This block is only applicable to wrapped angles between -pi and pi. It could not be used as a replacement for WashOut_Filter_2.
</html>"), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Text(extent = {{-54, 52}, {50, 10}}, lineColor = {0, 0, 0}, textString = "k s"), Text(extent = {{-54, -6}, {52, -52}}, lineColor = {0, 0, 0}, textString = "T s + 1"), Line(points = {{-50, 0}, {50, 0}}, color = {0, 0, 0}), Rectangle(extent = {{-60, 60}, {60, -60}}, lineColor = {0, 0, 255}), Line(points = {{-100, 0}, {-60, 0}}, color = {0, 0, 255}), Line(points = {{60, 0}, {100, 0}}, color = {0, 0, 255})}), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Line(points = {{-80, 78}, {-80, -90}}, color = {192, 192, 192}), Polygon(lineColor = {192, 192, 192}, fillColor = {192, 192, 192},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid, points = {{-80, 90}, {-88, 68}, {-72, 68}, {-80, 90}}), Line(points = {{-90, -80}, {82, -80}}, color = {192, 192, 192}), Polygon(lineColor = {192, 192, 192}, fillColor = {192, 192, 192},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid, points = {{90, -80}, {68, -72}, {68, -88}, {90, -80}}), Line(origin = {-24.667, -27.333}, points = {{-55.333, 87.333}, {-19.333, -40.667}, {86.667, -52.667}}, color = {0, 0, 127}, smooth = Smooth.Bezier), Text(lineColor = {192, 192, 192}, extent = {{-30, 14}, {86, 60}}, textString = "DT1")}));
end WrappedAngleDerivative;
