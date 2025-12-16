within OpalRT.Electrical.Control.Excitation.Common;
function currentNormalizationFunction
  input Real u1;
  input Real u2 " >= 0";
  output Real y;
algorithm
  if noEvent(abs(u2) > Modelica.Constants.eps) then
    y := u1 / u2;
  else
    if u1 >= 0 then
      y := 9988;
    else
      y := -9988;
    end if;
  end if;
  annotation(Documentation(info = "<html>

<p>
This output of this function should be always connected to the input of rectifierFunction. In fact any value for y > 1 leads to rectifierFunction.y = 0 and any value for y < 0 leads to rectifierFunction.y = 1. In this regard, 9988 is chosen as a value greater than 1 and -9988 is chosen as a value smaller than 0.
</p>

</html>"), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
end currentNormalizationFunction;
