within OpalRT.NonElectrical.Math.Nonlinear;
block BacklashDeadband "Backlash Hysteresis Dead band"
  parameter Real db;
  Modelica.Blocks.Interfaces.RealInput u annotation(Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-105, 5}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {95, 5}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
protected
  Boolean contact "is in contact?-flag";
  Real du "derivative value of u";
initial equation
  y = u;
equation
  du = der(u);
  contact = if db <= 0 then true elseif abs(u - y) < db then false
   elseif u > y then du > 0 else du < 0;
  //Backlash Deadband differential equations:
  if contact then
    der(y) = der(u);
  else
    der(y) = 0;
  end if;
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Documentation(info = "<html>
<p>
The Backlash Hysteresis deadband block represents the mechanical backlash with hysteresis.
</p>
<p>
If the input is within the deadband region the output remains constant i.e. der(y) = 0. Outside of this zone, if u > db then y = u - db and if u < -db then y = u + db, i.e. der(y) = der(u). The dead band region moves accordingly with the input/output.
</p>
<p>
This deadband is used in a governor to represent the unintentional deadband due to mechanical backlash.
</p>
<img src=\"modelica://OpalRT/resource/Math/Nonlinear/BacklashDeadband.png\"
alt=\"BacklashDeadband.png\"><br>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Rectangle(origin = {-0.542005, 0.677507}, extent = {{-93.4959, 90.6504}, {93.4959, -90.6504}}), Line(origin = {-2.17, 4.88}, points = {{0, -76.9648}, {0, 76.9648}}, color = {102, 102, 102}, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 14), Line(origin = {-0.0561789, 4.8258}, rotation = -90, points = {{0, -76.9648}, {0, 76.9648}}, color = {102, 102, 102}, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 14), Text(origin = {15.1779, -16.8009}, extent = {{-15.72, 13.82}, {15.72, -13.82}}, textString = "db"), Line(origin = {12.2888, 6.34325}, rotation = -45, points = {{0, -70.8672}, {0, 70.8672}}), Line(origin = {-12.5234, 6.31488}, rotation = -45, points = {{0, -70.8672}, {0, 70.8672}}), Line(origin = {49.9871, 56.4912}, points = {{-12.4661, 0}, {12.4661, 0}}), Line(origin = {-50.3826, -43.9044}, points = {{-12.4661, 0}, {12.4661, 0}})}));
end BacklashDeadband;
