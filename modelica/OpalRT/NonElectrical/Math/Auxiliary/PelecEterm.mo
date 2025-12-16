within OpalRT.NonElectrical.Math.Auxiliary;
block PelecEterm
  parameter Real enablePELEC = 1 "1/0: enable/disable PELEC Calculation";
  parameter Real enableETERM = 1 "1/0: enable/disable ETERM Calculation";
  Modelica.Blocks.Interfaces.RealOutput PELEC "Electrical Power" annotation(Placement(visible = true, transformation(origin = {100, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput ETERM "Voltage Magnitude" annotation(Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput VI[4] "Voltage and Current rectangular representation" annotation(Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  PELEC = if enablePELEC > 0 then VI[1] * VI[3] + VI[2] * VI[4] else 0;
  ETERM = if enableETERM > 0 then sqrt(VI[1] * VI[1] + VI[2] * VI[2]) else 0;
  annotation(Documentation(info = "<html>
<p>
The input values of this block are the rectangular components of voltage and current phasor:
<code>VI = {V_re, V_im, I_re, I_im}</code>.
This block calculates the Electrical Power <code>PELEC</code> and Voltage magnitude <code>ETERM</code> as output.
</p>

<pre>
PELEC = V_re * I_re + V_im * I_im
ETERM = abs(V_re + j*V_im) = sqrt( V_re<sup>2</sup> + V_im<sup>2</sup> )
</pre>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Rectangle(origin = {0.128535, 0}, extent = {{-100.129, 100}, {100.129, -100}}), Text(origin = {102.005, -18.3049}, extent = {{-90, 80}, {-20, 40}}, textString = "PELEC"), Text(origin = {101.7, -98.82}, extent = {{-90, 80}, {-20, 40}}, textString = "ETERM"), Text(origin = {1.38689, -64.6843}, extent = {{-90, 80}, {-62.1594, 49.2545}}, textString = "VI")}));
end PelecEterm;
