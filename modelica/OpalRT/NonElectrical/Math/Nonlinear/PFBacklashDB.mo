within OpalRT.NonElectrical.Math.Nonlinear;
block PFBacklashDB "Unintentional Backlash Hysteresis Governor Dead band based on powerfactory"
  parameter Real db;
  Modelica.Blocks.Interfaces.RealInput u annotation(Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-105, 5}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {95, 5}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
protected
  Real x "state variable";
  Real d "internal variable";
  parameter Real dbw(fixed = false) "avoids hardcoding";
initial equation
  x = u;
  dbw = db;
equation
  der(x) = d / 0.01;
  if dbw <= 0 then
    d = 0;
    y = u;
  elseif u - x >= dbw then
    d = u - x - dbw;
    y = x;
  elseif u - x <= (-dbw) then
    d = u - x + dbw;
    y = x;
  else
    d = 0;
    y = x;
  end if;
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Rectangle(origin = {-0.542005, 0.677507}, extent = {{-93.4959, 90.6504}, {93.4959, -90.6504}}), Line(origin = {-2.17, 4.88}, points = {{0, -76.9648}, {0, 76.9648}}, color = {102, 102, 102}, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 14), Line(origin = {-0.0561789, 4.8258}, rotation = -90, points = {{0, -76.9648}, {0, 76.9648}}, color = {102, 102, 102}, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 14), Text(origin = {15.1779, -16.8009}, extent = {{-15.72, 13.82}, {15.72, -13.82}}, textString = "db"), Line(origin = {12.2888, 6.34325}, rotation = -45, points = {{0, -70.8672}, {0, 70.8672}}), Line(origin = {-12.5234, 6.31488}, rotation = -45, points = {{0, -70.8672}, {0, 70.8672}}), Line(origin = {49.9871, 56.4912}, points = {{-12.4661, 0}, {12.4661, 0}}), Line(origin = {-50.1897, -43.7115}, points = {{-12.4661, 0}, {12.4661, 0}})}), Documentation(info = "<html>
<p>
The Backlash Hysteresis deadband block represents an unintentional deadband that describes the mechanical backlash with hysteresis form.
</p>
<p>
If the input is within the deadband region the output remains constant i.e. der(y) = 0. Outside of this zone, the output is a linear
function of the input with a slope of 1 and x-intercept of db, and thus, der(y) = der(u). The dead band region moves accordingly with the input/output.
</p>
</html>"));
end PFBacklashDB;
