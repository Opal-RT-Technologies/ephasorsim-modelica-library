within OpalRT.NonElectrical.Math.Nonlinear;
function computeSaturationQuadratic "quadratic saturation function"
  input Real u;
  input Real E1;
  input Real E2;
  input Real S_E1;
  input Real S_E2;
  output Real y;
protected
  parameter Real a = if S_E2 > 0 then sqrt(S_E1 * E1 / (S_E2 * E2)) else 0;
  parameter Real A = (E1 - a * E2) / (1 - a);
  parameter Real B = E2 * S_E2 / (E2 - A) ^ 2;
algorithm
  if u == 0.0 or S_E1 <= 0.0 then
    y := 0;
  else
    if u <= abs(A) then
      y := 0;
    else
      y := B * (u - A) ^ 2 / u;
    end if;
  end if;
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Documentation(info = "<html>
<p>The math of the function is as follows:</p>
<pre>
      (u - A) ^ 2
y = B * ------------
          u
</pre>
<p>
A and B parameters are calculated at initialization time from E1, E2 as inputs and S_E1,S_E2 as corresponding outputs.
</html>"));
end computeSaturationQuadratic;
