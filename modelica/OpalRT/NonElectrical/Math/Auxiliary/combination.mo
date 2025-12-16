within OpalRT.NonElectrical.Math.Auxiliary;
function combination
  input Integer n, k;
  output Integer c;
algorithm
  c := div(Auxiliary.factorial(n), Auxiliary.factorial(k) * Auxiliary.factorial(n - k));
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Documentation(info = "<html>
<p>This function calculates combination of k from n. its functionality is described mathematically as below:</p>
<pre>
             n!
comb(n,k) = ---------
         (n-k)! k!
</pre>
<p>
<b>note</b>: k<= n.
</html>"));
end combination;
