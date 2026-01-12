within OpalRT.NonElectrical.Math.Nonlinear;
function computeSaturationExponential "exponential saturation function"
  input Real u;
  input Real E2;
  input Real S_E1;
  input Real S_E2;
  output Real y;
protected
  parameter Real X;
algorithm
  if u == 0 or S_E1 <= 0.0 then
    y := 0;
  else
    y := S_E1 * u ^ (log(S_E2 / S_E1) / log(E2));
  end if;
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Documentation(info = "<html>
<p>The math of the function is as follows:</p>
<p style=\"margin-left: 30px;\">if u = 0 or S_E1 &lt;= 0.0 then</p>
<p style=\"margin-left: 60px;\">y = 0</p>
<p style=\"margin-left: 30px;\">otherwise:</p>
<p style=\"margin-left: 60px;\">y = S_E1 * u ^ (log(S_E2 / S_E1) / log(E2))</p>
</html>"));
end computeSaturationExponential;
