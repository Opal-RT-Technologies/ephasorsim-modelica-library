within OpalRT.NonElectrical.Math.Continuous.TransferFunction;
block TransferFunction4 "4th order transfer function, Minimal implementation"
  parameter Real b[:] = {1, 1, 1, 1} "Numerator coefficients of transfer function (e.g., 2*s+3 is specified as {2,3})";
  parameter Real a[:] = {1, 1, 1, 1, 1} "Denominator coefficients of transfer function (e.g., 5*s+6 is specified as {5,6})";
  parameter Real y_start = 0 "Initial Output";
  parameter Integer na = size(a, 1) "Size of Denominator of transfer function.";
  parameter Integer nb = size(b, 1) "Size of Numerator of transfer function.";
  parameter Integer nx = size(a, 1) - 1;
  Modelica.Blocks.Interfaces.RealInput u annotation(Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
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
  assert(na - idx_a >= nb - idx_b, "Transfer function is non-proper (na<nb).", level = AssertionLevel.error);
  assert(not (b[nb] == 0 and y_start <> 0), "Initial suspect. state derivatives are not zero at the initialization", level = AssertionLevel.error);
  if idxa == 1 then
    der(x[1:nx - 1]) = x[2:nx];
    der(x[nx]) = 1 / a[1] * (u - a[2:na] * x[nx:(-1):1]);
  elseif idxa == 2 then
    der(x[nx - 2 + 2:nx]) = zeros(2 - 1);
    der(x[nx - 2 + 1]) = 1 / a[2] * (u - a[2:na] * x[na - 1:(-1):1]);
    der(x[1:nx - 2]) = x[2:nx - 2 + 1];
  elseif idxa == 3 then
    der(x[nx - 3 + 2:nx]) = zeros(3 - 1);
    der(x[nx - 3 + 1]) = 1 / a[3] * (u - a[2:na] * x[na - 1:(-1):1]);
    der(x[1:nx - 3]) = x[2:nx - 3 + 1];
  elseif idxa == 4 then
    der(x[nx - 4 + 2:nx]) = zeros(4 - 1);
    der(x[nx - 4 + 1]) = 1 / a[4] * (u - a[2:na] * x[na - 1:(-1):1]);
    der(x[1:nx - 4]) = x[2:nx - 4 + 1];
  else
    der(x) = zeros(nx);
  end if;
  y = if idx_a == na then dc_gain * u else b[nb] * x[1] + b[nb - 1:(-1):1] * der(x[1:nb - 1]);
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics = {Rectangle(origin = {0.668896, -0.167224}, extent = {{-99.6656, 99.8328}, {99.6656, -99.8328}}), Text(origin = {-1.00552, 6.8598}, extent = {{-68.23, 17.56}, {68.23, -17.56}}, textString = "TransferFunction"), Text(origin = {-8.76565, -14.2732}, extent = {{-46.1564, 5.51987}, {68.23, -17.56}}, textString = "4th Order")}), Documentation(info = "<html>
<p>
This block is a general purpose 4th order transfer function.

Transfer function of the block is as follows:
<pre>
b1 * s^4 + b2 * s^3 + b3 * s^2 + b4 * s^1 + b5
y = ------------------------------------------------ * u
a1 * s^4 + a2 * s^3 + a3 * s^2 + a4 * s^1 + a5
</pre>
<p>
<b>Note</b>: Unlike Modelica.Blocks.Continuous.TrasferFunction, this block can be used as an FMU for 4th, 3rd, 2nd and 1st order transfer functions depending of the denuminator coefficients. If for a certain set of parameters, it leads to a non-proper transfer function, the simulation will stop with an error.

</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Rectangle(origin = {0.270636, -0.541272}, extent = {{-99.594, 99.8647}, {99.594, -99.8647}}), Text(origin = {-36.1577, 12.5671}, extent = {{-61.16, 31.94}, {133.282, -5.28639}}, textString = "Transfer-Function"), Text(origin = {-0.974419, -26.0754}, extent = {{-61.16, 31.94}, {61.16, -31.94}}, textString = "4th Order")}));
end TransferFunction4;
