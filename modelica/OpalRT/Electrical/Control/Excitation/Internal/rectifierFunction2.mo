within OpalRT.Electrical.Control.Excitation.Internal;
function rectifierFunction2
  input Real u;
  output Real y;
algorithm
  if u >= 1 then
    y := 0;
  else
    y := sqrt(1 - u);
  end if annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
end rectifierFunction2;
