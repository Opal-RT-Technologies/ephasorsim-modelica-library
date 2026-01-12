within OpalRT.Electrical.Control.Excitation.Common;
function rectifierFunction
  input Real u;
  output Real y;
algorithm
  if u <= 0 then
    y := 1;
  else
    if u > 0 and u <= 0.433 then
      y := 1 - 0.577 * u;
    else
      if u > 0.433 and u < 0.75 then
        y := sqrt(0.75 - u ^ 2);
      else
        if u >= 0.75 and u <= 1 then
          y := 1.732 * (1 - u);
        else
          y := 0;
        end if;
      end if;
    end if;
  end if;
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
end rectifierFunction;
