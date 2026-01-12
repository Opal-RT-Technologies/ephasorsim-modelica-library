within OpalRT.NonElectrical.Math.Continuous.TransferFunction;
block TransferFunction1 "General purpose first order transfer function"
  parameter Real b[:] = {1, 1} "Numerator coefficients of transfer function (e.g., 2*s+3 is specified as {2,3})";
  parameter Real a[:] = {1, 1} "Denominator coefficients of transfer function (e.g., 5*s+6 is specified as {5,6})";
  parameter Real y_start = 0 "Initial Output";
  Modelica.Blocks.Interfaces.RealInput u annotation(Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
protected
  parameter Integer na = size(a, 1) "Size of Denominator of transfer function.";
  parameter Integer nb = size(b, 1) "Size of Numerator of transfer function.";
  parameter Integer nx = size(a, 1) - 1;
  Real x[nx];
  parameter Integer idx_a = Auxiliary.findFirstNonZeroValue(a, na, true);
  parameter Integer idx_b = Auxiliary.findFirstNonZeroValue(b, nb, false);
  parameter Real dc_gain = b[nb] / a[na];
  parameter Integer idxa(fixed = false);
initial equation
  if nx > 0 then
    x[1] = if b[nb] <> 0 then y_start / b[nb] elseif a[na] <> 0 then u / a[na] else 0;
  end if;
  x[2:nx] = zeros(nx - 1);
  idxa = idx_a;
equation
  assert(not (b[nb] == 0 and a[na] == 0), "The transfer function could not be initialzied for steady state becuse there is at least one zero and one pole at zero.");
  assert(not (b[nb] == 0 and y_start <> 0), "Initial suspect. state derivatives are not zero at the initialization", level = AssertionLevel.error);
  assert(na - idx_a >= nb - idx_b, "Transfer function is non-proper (na<nb).", level = AssertionLevel.error);
  if idxa == 1 then
    der(x[1:nx - 1]) = x[2:nx];
    der(x[nx]) = 1 / a[1] * (u - a[2:na] * x[nx:(-1):1]);
  else
    der(x) = zeros(nx);
  end if;
  y = if idx_a == na then dc_gain * u else b[nb] * x[1] + b[nb - 1:(-1):1] * der(x[1:nb - 1]);
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics = {Rectangle(origin = {0.668896, -0.167224}, extent = {{-99.6656, 99.8328}, {99.6656, -99.8328}}), Text(origin = {-1.00552, 6.8598}, extent = {{-68.23, 17.56}, {68.23, -17.56}}, textString = "TransferFunction"), Text(origin = {-8.76565, -14.2732}, extent = {{-46.1564, 5.51987}, {68.23, -17.56}}, textString = "1st Order")}), Documentation(info = "<html>
<p>
Transfer function of the block is as follows:
</p>
<pre>
b1 * s + b2
y = ------------- * u
a1 * s + a2

</pre>
<p>
The application of this block is more general than the Lead_Lag block. For example the following first order examples could not be created using Lead_Lag:
</p>
<pre>
  s                    1
y = ------- * u   or   y = ---
s + 1                  s

</pre>
<p>
while it can be created easily by using proper parameters for numerator and denominator vectors, b and a.
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Rectangle(origin = {0.270636, -0.541272}, extent = {{-99.594, 99.8647}, {99.594, -99.8647}}), Text(origin = {-33.365, 7.46045}, extent = {{-61.16, 31.94}, {130.532, 3.6091}}, textString = "Transfer-Function"), Text(origin = {-3.29494, -31.3566}, extent = {{-61.16, 31.94}, {61.16, -31.94}}, textString = "1st Order")}));
end TransferFunction1;
