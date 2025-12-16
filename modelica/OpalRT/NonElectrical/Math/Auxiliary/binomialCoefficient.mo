within OpalRT.NonElectrical.Math.Auxiliary;
function binomialCoefficient
  input Integer n;
  output Integer coef[n + 1];
algorithm
  for i in 0:n loop
    coef[i + 1] := combination(n, i);
  end for;
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Documentation(info = "<html>
<p>This function calculates binomial coefficients of expantion of(1+x)^n:</p>
</html>"));
end binomialCoefficient;
