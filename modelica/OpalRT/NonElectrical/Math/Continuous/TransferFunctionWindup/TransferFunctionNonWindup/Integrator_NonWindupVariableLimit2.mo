within OpalRT.NonElectrical.Math.Continuous.TransferFunctionWindup.TransferFunctionNonWindup;

block Integrator_NonWindupVariableLimit2 "Non Windup Integrator with Variable Limits"
  parameter Real KI = 1;
  parameter Real y_init = 0;
  parameter Real ts = 0.002;
  Boolean clk;
  Real mm;
  constant Real eps = ModelicaServices.Machine.eps;
  Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput u annotation(Placement(visible = true, transformation(origin = {-110, 0}, extent = {{-22.5, -22.5}, {22.5, 22.5}}, rotation = 0), iconTransformation(origin = {-50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput VL annotation(Placement(visible = true, transformation(origin = {-110, -70}, extent = {{-22.5, -22.5}, {22.5, 22.5}}, rotation = 0), iconTransformation(origin = {10, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Interfaces.RealInput VU annotation(Placement(visible = true, transformation(origin = {-110, 60}, extent = {{-22.5, -22.5}, {22.5, 22.5}}, rotation = 0), iconTransformation(origin = {-10, 90}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));

  function NonWindupLimiter
    input Real state;
    input Real gain;
    input Real u;
    input Real ULim;
    input Real LLim;
    output Real deriv;
  algorithm
    deriv := 0;
    if state < ULim and state > LLim or state >= ULim and gain * u < 0 or state <= LLim and gain * u > 0 then
      deriv := gain * u;
    end if;
  end NonWindupLimiter;

  discrete Real VU_p;
  discrete Real VL_p;
  Boolean p;
  Modelica.Blocks.Discrete.Sampler sampler1(samplePeriod = ts, startTime = 0) annotation(Placement(visible = true, transformation(origin = {-10, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Discrete.Sampler sampler2(samplePeriod = ts) annotation(Placement(visible = true, transformation(origin = {-10, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
initial algorithm
  y := y_init;
initial equation
  VU_p = VU;
  VL_p = VL;
equation
  clk = sample(0, 0.002);
  connect(sampler2.u, VL) annotation(Line(points = {{-22, -10}, {-54.8571, -10}, {-54.8571, -70.4762}, {-110, -70.4762}, {-110, -70}}, color = {0, 0, 127}));
  connect(sampler1.u, VU) annotation(Line(points = {{-22, 30}, {-47.619, 30}, {-47.619, 61.3333}, {-110, 61.3333}, {-110, 60}}, color = {0, 0, 127}));
  assert(VU > VL, "VRMAX must be greater than VRMIN");
  VU_p = pre(sampler1.y);
  VL_p = pre(sampler2.y);
  when not initial() and y >= VU_p and clk then
    reinit(y, VU_p);
  elsewhen not initial() and y <= VL_p and clk then
    reinit(y, VL_p);
  end when;
  p = initial() and y > VU_p;
  mm = y - VU_p;
  der(y) = NonWindupLimiter(y, KI, u, VU_p, VL_p);
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1})), experiment(StartTime = 0, StopTime = 5, Tolerance = 1e-06, Interval = 0.001), Documentation(info = "<html>


<p>
This is a modified version of Non_Windup_Integrator_Var in which the effect of hte limits works properly in Open Modelica environment.

The operation of this block is described below:</p>

<pre>if (state < Vmax(t) and state > Vmin(t))
or (state >= Vmax(t) and gain * u < 0)
or (state <= Vmin(t) and gain * u > 0):
der(state) = gain * u
otherwise:
der(state) = 0
</pre>

<p> Limits of the block, i.e. Vmax and Vmin, are variable.
</p>
<p><b>Note:</b> The limiting functionality of the block works in Open Modelica environement however it is not working properly as an FMU in ePHASORsim. The reason is that current FMI version for ePHASORsim FMU interface does not set time for the FMUs and any function inside FMU which works based on time (exp. sampling block) fails.
</p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1}), graphics = {Line(origin = {3.6427, 0}, points = {{-29.695, 1.11022e-16}, {25.5556, 1.11022e-16}}, color = {0, 0, 255}, thickness = 2), Text(origin = {11.42, -26.55}, lineColor = {0, 0, 255}, extent = {{-75.59, 25.9}, {57.11, -7.44}}, textString = "s"), Text(origin = {62.37, 1.44}, lineColor = {0, 0, 255}, extent = {{-83.26, 32.26}, {-42.67, -2.11}}, textString = "KI"), Rectangle(origin = {1.82, -0.56}, fillColor = {255, 255, 255}, extent = {{-41.9711, 50.5643}, {42.988, -49.4521}}), Line(origin = {52.7222, 55.2744}, points = {{27.9485, 4.72842}, {-22.7182, 4.72842}, {-27.6071, -4.82713}}, color = {0, 0, 255}, thickness = 2), Line(origin = {-52.6111, -55.3922}, rotation = 180, points = {{27.9485, 4.72842}, {-22.7182, 4.72842}, {-27.6071, -4.82713}}, color = {0, 0, 255}, thickness = 2), Text(origin = {104.66, 62.32}, lineColor = {0, 0, 255}, extent = {{-77.55, 26.55}, {-20.67, -4.77}}, textString = "VMAX"), Text(origin = {-8.93281, 70.2627}, extent = {{-19.17, 10.78}, {19.17, -10.78}}, textString = "VU"), Text(origin = {8.47, -71.59}, extent = {{-19.17, 10.78}, {19.17, -10.78}}, textString = "VL"), Text(origin = {-4.35, -83.29}, lineColor = {0, 0, 255}, extent = {{-77.55, 26.55}, {-20.67, -4.77}}, textString = "VMIN")}));
end Integrator_NonWindupVariableLimit2;
