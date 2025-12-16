within OpalRT.NonElectrical.Math.Nonlinear;
block DeadZoneLimiter
  parameter Real uMax(start = 1) "Upper limits of dead zones";
  parameter Real uMin = -uMax "Lower limits of dead zones";
  parameter Real MAX = 1;
  parameter Real MIN = -1;
  parameter Boolean deadZoneAtInit = true "= false, if dead zone is ignored during initialization (i.e., y=u)";
  Modelica.Blocks.Interfaces.RealInput u annotation(Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  assert(uMax >= uMin, "DeadZone: Limits must be consistent. However, uMax (=" + String(uMax) + ") < uMin (=" + String(uMin) + ")");
  if initial() and not deadZoneAtInit then
    y = u;
  else
    y = smooth(0, if u > uMax then MAX else if u < uMin then MIN else 0);
  end if;
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Rectangle(origin = {0.176991, -0.176991}, extent = {{-97.1681, 97.8761}, {97.1681, -97.8761}}), Line(origin = {-6.01796, 8.10796}, points = {{0, 86.4027}, {0, -87.4027}, {0, -93.0664}}, arrow = {Arrow.Filled, Arrow.None}, arrowSize = 10), Line(origin = {-2.48, 0}, points = {{-84.9558, 0}, {73.2743, 0}, {84.9558, 0}}, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 10), Line(origin = {29.2, 16.11}, points = {{-34.5133, -16.1062}, {-14.6903, -16.1062}, {-14.6903, 16.1062}, {34.5133, 16.1062}}, thickness = 1), Line(origin = {-40.184, -16.101}, rotation = 180, points = {{-34.5133, -16.1062}, {-14.6903, -16.1062}, {-14.6903, 16.1062}, {34.5133, 16.1062}}, thickness = 1), Text(origin = {12.2159, -2.3}, extent = {{-5.49, 7.26}, {13.28, -12.22}}, textString = "uMax"), Text(origin = {-6.01602, 4.78212}, extent = {{-1.41, -4.43}, {-39.65, 4.78}}, textString = "uMin"), Text(origin = {-18.0578, 31.506}, extent = {{-9.2, 6.73}, {9.2, -6.73}}, textString = "MAX"), Text(origin = {7.6069, -32.7466}, extent = {{-10.44, 7.26}, {7.60814, -4.07416}}, textString = "MIN"), Line(origin = {3.36, 32.21}, points = {{10.4425, -0.353982}, {-9.02655, -0.353982}, {-9.02655, -0.353982}}, pattern = LinePattern.Dot), Line(origin = {-16.04, -31.5}, points = {{-10.0885, 0}, {10.0885, 0}, {10.0885, 0}}, pattern = LinePattern.Dot)}), Documentation(info = "<html>
<p>
The Dead Zone Limiter block represents special type of dead zone which is used in some models (e.g. IEEET5 exciter). 
</p>
<p>
&nbsp; &nbsp; &nbsp; if uMin < u < uMax then y = 0;
<p>
&nbsp; &nbsp; &nbsp; if u <= uMin then y = MIN;
<p>
&nbsp; &nbsp; &nbsp; if u >= uMax then y = MAX;
</p>
<img src=\"modelica://OpalRT/resource/Math/Nonlinear/DeadZoneLimit.png\"
alt=\"DeadZoneLimit.png\"><br>
</html>"));
end DeadZoneLimiter;
