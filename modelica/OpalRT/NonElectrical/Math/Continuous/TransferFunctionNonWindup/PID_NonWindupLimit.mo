within OpalRT.NonElectrical.Math.Continuous.TransferFunctionNonWindup;
block PID_NonWindupLimit "PID controller with Non Windup limiter"
  parameter Real KP "Proportional gain";
  parameter Real KI "Integral gain";
  parameter Real KD "Derivative gain";
  parameter Real TD "Derivative time constant";
  parameter Real MAX "Maximum limit of the output";
  parameter Real MIN "minimum limit of the output";
  parameter Real x_start = 0 "Initial or guess value of the state";
  Modelica.Blocks.Interfaces.RealInput u annotation(Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Real x;
  Real yh;

  Modelica.Blocks.Continuous.TransferFunction transferfunction1(b = {1, 0}, a = if TD0 <> 0 then {TD0, 1} else {1, 1}, initType = Modelica.Blocks.Types.Init.InitialOutput) annotation(Placement(visible = true, transformation(origin = {-20, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain2(k = if TD0 <> 0 then KD else 0) annotation(Placement(visible = true, transformation(origin = {-60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiter1(uMax = MAX, uMin = MIN) annotation(Placement(visible = true, transformation(origin = {60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
protected
  parameter Real TD0(fixed = false, start = 1);
initial equation
  x = x_start;
  TD0 = TD;
equation
  connect(limiter1.y, y) annotation(Line(points={{71,0},{93.3694,0},{93.3694,0},
          {100,0}},                                                                                                color = {0, 0, 127}));
  connect(gain2.y, transferfunction1.u) annotation(Line(points={{-49,0},{-33.4852,
          0},{-33.4852,0},{-32,0}},                                                                                                   color = {0, 0, 127}));
  connect(gain2.u, u) annotation(Line(points={{-72,0},{-94.9886,0},{-94.9886,0},
          {-100,0}},                                                                                                  color = {0, 0, 127}));
  der(x) = Internal.derivative(u, x, MAX, MIN, KP, KI);
  yh = KP * u + x + transferfunction1.y;
  limiter1.u = yh;
  // end if;
  annotation(Documentation(info = "<html>
<p>The block diagram of this transfer function is shown below:</p>

<img src=\"modelica://OpalRT/resource/Math/Continuous/TransferFunctionNonWindup/PID_NonWindUpLimit.png\"
alt=\"PID_Windup_Limit.png\"><br>

</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Text(origin = {-22.77, -36.21}, extent = {{-51.63, 19.24}, {97.17, -43}}, textString = "PID_NonWindUp"), Text(origin = {-35.0189, 0.197355}, extent = {{-51.63, 19.24}, {-32.6744, -13.5799}}, textString = "u"), Text(origin = {114.83, -0.74}, extent = {{-51.63, 19.24}, {-32.67, -13.58}}, textString = "y"), Rectangle(origin = {0.424328, -25.6011}, extent = {{-100.566, 124.894}, {99.7171, -74.5403}})}));
end PID_NonWindupLimit;
