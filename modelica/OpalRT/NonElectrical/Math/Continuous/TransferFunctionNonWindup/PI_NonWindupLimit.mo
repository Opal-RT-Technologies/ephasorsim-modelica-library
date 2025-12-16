within OpalRT.NonElectrical.Math.Continuous.TransferFunctionNonWindup;
block PI_NonWindupLimit "PI controller with Non Windup limiter"
  parameter Real KP "Proportional gain";
  parameter Real KI "Integral gain";
  parameter Real MAX "Maximum limit of the output";
  parameter Real MIN "minimum limit of the output";
  parameter Real y_start = 0 "Initial or guess value of output (= state)";
  Modelica.Blocks.Interfaces.RealInput u annotation(Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Real x;
  Real yh;

initial equation
  x = y_start;
equation
  der(x) = Internal.derivative(
    u,
    x,
    MAX,
    MIN,
    KP,
    KI);
  yh = KP * u + x;
  if KI == 0 then
    y = if MIN < yh and yh < MAX then yh elseif MAX <= yh then MAX else MIN;
  else
    y = yh;
  end if;
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Text(origin = {-22.7747, -36.2122}, extent = {{-51.63, 19.24}, {97.1746, -43.0024}}, textString = "PI_NonWindUp"), Text(origin = {-35.0189, 0.197355}, extent = {{-51.63, 19.24}, {-32.6744, -13.5799}}, textString = "u"), Text(origin = {114.83, -0.74}, extent = {{-51.63, 19.24}, {-32.67, -13.58}}, textString = "y"), Rectangle(origin = {0.424328, -25.6011}, extent = {{-100.566, 124.894}, {99.7171, -74.5403}})}), Documentation(info = "<html>
<p>The block diagram of this transfer function is shown below:</p>

<img src=\"modelica://OpalRT/resource/Math/Continuous/TransferFunctionNonWindup/PI_NonWindUpLimit.png\"
alt=\"PI_Windup_Limit.png\"><br>

</html>"));
end PI_NonWindupLimit;
