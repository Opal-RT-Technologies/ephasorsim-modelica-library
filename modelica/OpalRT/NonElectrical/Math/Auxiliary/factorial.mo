within OpalRT.NonElectrical.Math.Auxiliary;
function factorial
  input Integer n;
  output Integer f;
algorithm
  if n == 0 then
    f := 1;
  else
    f := 1;
    for i in 1:n loop
      f := f * i;
    end for;
  end if;
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Documentation(info = "<html>
<p>This function calculates factorial of a non-negative integer number, n, which is defined mathematically as below:</p>
<pre>

n!= n * (n-1) * ... * 2 * 1

</pre>
<p>
<b>note</b>: 0!= 1;
</html>"));
end factorial;
