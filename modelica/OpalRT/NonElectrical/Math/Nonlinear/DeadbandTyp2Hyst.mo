within OpalRT.NonElectrical.Math.Nonlinear;
block DeadbandTyp2Hyst "Type 2 Deadband (db) and bowtie hysteresis (err)"
  parameter Real db = 0.00006;
  parameter Real err = 0.0;
  Modelica.Blocks.Interfaces.RealInput u annotation(Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 8.88178e-16}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 8.88178e-16}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
protected
  parameter Real dbw(fixed = false) "avoids hardcoding";
  parameter Real vend(start = 1, fixed = false) "variable end point of hysteresis behaviour";
  Boolean inline_p "+ plane flag";
  Boolean Notinline_n "- plane flag";
initial equation
  dbw = db;
  pre(inline_p) = false;
  pre(Notinline_n) = false;
  //To set the end point (vend) of hysteresis behavior in x-axis.
  vend = if err > 0 and err < dbw then err elseif err < 0 or err == dbw then 0 else dbw;
equation
  if dbw <= 0 then
    y = u;
  elseif u >= 0 and u < dbw then
    y = if not inline_p then 0 elseif err >= 0 then u - vend else u - err;
  elseif u < 0 and u > (-dbw) then
    y = if Notinline_n then 0 elseif err >= 0 then u + vend else u + err;
  elseif u > dbw then
    y = if err >= 0 and err <= dbw then u - vend else u - err;
  else
    y = if err >= 0 and err <= dbw then u + vend else u + err;
  end if;
  //Flags for bowtie hysteresis.
  inline_p = u > dbw or pre(inline_p) and u >= vend;
  Notinline_n = u > (-vend) or pre(Notinline_n) and u >= (-dbw);
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Line(origin = {-4.74, -2.17}, points = {{87.1274, 0}, {-78.7263, 0}}, color = {162, 162, 162}, arrow = {Arrow.Filled, Arrow.None}, arrowSize = 20), Line(origin = {-24.0354, 27.3151}, points = {{20.7317, 56.9106}, {20.7317, -109.214}}, color = {162, 162, 162}, arrow = {Arrow.Filled, Arrow.None}, arrowSize = 20), Line(origin = {28.4553, 15.8537}, points = {{0, 13.4146}, {0, -17.7507}}), Text(origin = {29.128, -14.902}, extent = {{12.87, 9.49}, {-12.87, -9.49}}, textString = "db"), Text(origin = {48.59, 23.8}, extent = {{12.87, 9.49}, {-12.87, -9.49}}, textString = "err"), Rectangle(origin = {0.345423, -0.518135}, extent = {{-99.8273, 100}, {99.8273, -100}}), Polygon(origin = {-18.7025, -17.6171}, rotation = -45, points = {{3.55271e-15, 113.366}, {0, -72.3577}, {3.55271e-15, 113.366}}), Line(origin = {-33.9295, -15.3659}, points = {{0, 13.4146}, {0, -17.7507}})}), Documentation(info = "<html>
<p>
The Deadband Type 2 with Hysteresis block represents an intentional deadband that defines a dead band region 'db' where the output has a bowtie hysteresis behavior 'err'.
</p>
<p>
If the input is within -db.. db, the output follows the bowtie hysteresis or is zero depending on the value of err. Outside of this zone, the output is a linear
function of the input, y = x-b, where b is <p> 'err' (if err <> 0 or err <> db) or </p> <p> 'db' (if err == 0) or </p> zero (if err == db).
</p>
<img src=\"modelica://OpalRT/resource/Math/Nonlinear/DBType2Bowtie.png\"
alt=\"DBType2Bowtie.png\"><br>
</html>"));
end DeadbandTyp2Hyst;
