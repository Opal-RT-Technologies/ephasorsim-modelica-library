within OpalRT.NonElectrical.Math.Auxiliary;
block VIcart2pol "Converts Rectangular V & I to Polar"
  Modelica.Blocks.Interfaces.RealInput VI[4] "Voltage and Current rectangular representation" annotation(Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput V_abs "Length of polar representation" annotation(Placement(visible = true, transformation(origin = {100, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput V_ang "Angle of polar representation" annotation(Placement(visible = true, transformation(origin = {100, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput I_ang "Angle of polar representation" annotation(Placement(visible = true, transformation(origin = {100, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput I_abs "Length of polar representation" annotation(Placement(visible = true, transformation(origin = {100, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  V_abs = sqrt(VI[1] * VI[1] + VI[2] * VI[2]);
  V_ang = Modelica.Math.atan2(VI[2], VI[1]);
  I_abs = sqrt(VI[3] * VI[3] + VI[4] * VI[4]);
  I_ang = Modelica.Math.atan2(VI[4], VI[3]);
  annotation(Documentation(info = "<html>
<p>
The input values of this block are the rectangular components of voltage and current phasor:
<code>VI = {V_re, V_im, I_re, I_im}</code>.
This block calculates the magnitudes (<code>V_abs</code>, <code>I_abs</code>) and
the angles (<code>V_ang</code>, <code>I_ang</code>) of the polar representation of this phasor.
</p>

<pre>
V_abs = abs(V_re + j*V_im) = sqrt( V_re<sup>2</sup> + V_im<sup>2</sup> )
V_ang = arg(V_re + j*V_im) = atan2(V_im, V_re)
I_abs = abs(I_re + j*I_im) = sqrt( I_re<sup>2</sup> + I_im<sup>2</sup> )
I_ang = arg(I_re + j*I_im) = atan2(I_im, I_re)
</pre>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Text(origin = {2.82776, 3.85604}, extent = {{20, 80}, {90, 40}}, textString = "Vabs"), Text(origin = {3.59897, 84.3188}, extent = {{20, -40}, {90, -80}}, textString = "Vang"), Text(origin = {4.32362, -96.1488}, extent = {{20, 80}, {90, 40}}, textString = "Iabs"), Text(origin = {4.57121, -16.1941}, extent = {{20, -40}, {90, -80}}, textString = "Iang"), Rectangle(origin = {-0.128535, -0.205656}, extent = {{-99.8715, 100}, {99.8715, -100}})}));
end VIcart2pol;
