within OpalRT.Electrical.Control.OverExcitationLimiter.Common;
block Integartor "Normalized Generated Heat"
  Modelica.Blocks.Interfaces.BooleanInput enable(start = false) annotation(Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Real X;
  Real y;
  Real control(start = 0);
  Modelica.Blocks.Interfaces.BooleanOutput enabley annotation(Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput t annotation(Placement(transformation(extent = {{-124, 28}, {-84, 68}}), iconTransformation(extent = {{-110, 42}, {-84, 68}})));
initial equation
  y = 0;
equation
  X = t;
  if enable and y <= 1 then
    if t > 0 then
      der(y) = 1 / X;
    else
      der(y) = 0;
    end if;
  else
    der(y) = 0;
  end if;
  when y > 0 and enable == false and 1 > y then
    reinit(y, 0);
  end when;
  if y >= 1 then
    enabley = true;
    control = 1;
  else
    enabley = false;
    control = 0;
  end if;
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Rectangle(origin = {0, -0.67659}, extent = {{-99.594, 99.7294}, {99.594, -99.7294}}), Text(origin = {-64.59, 56.54}, extent = {{-17.73, 8.66}, {17.73, -8.66}}, textString = "time"), Text(origin = {-61.84, -2.84}, extent = {{-23.41, 9.34}, {23.41, -9.34}}, textString = "enable"), Text(origin = {71.72, 19.62}, extent = {{-13.53, 8.8}, {13.53, -8.8}}, textString = "enabley")}), Documentation(info = "<html>

<p>
By enabling the block, the function calculates the amount of instantanious normalized heat generated in the exciter windings.
</p>


</html>"));
end Integartor;
