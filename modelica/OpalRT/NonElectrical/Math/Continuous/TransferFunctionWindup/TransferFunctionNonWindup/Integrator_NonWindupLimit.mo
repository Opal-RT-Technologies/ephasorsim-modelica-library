within OpalRT.NonElectrical.Math.Continuous.TransferFunctionWindup.TransferFunctionNonWindup;

block Integrator_NonWindupLimit "Integrator with anti wind-up limits"
  parameter Real KI = 1;
  parameter Real VRMAX = 1;
  parameter Real VRMIN = -1;
  parameter Real y_init = 0;
  Modelica.Blocks.Interfaces.RealInput u annotation(Placement(visible = true, transformation(origin = {-122.5, -2.5}, extent = {{-22.5, -22.5}, {22.5, 22.5}}, rotation = 0), iconTransformation(origin = {-50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

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
initial algorithm
  y := if y_init >= VRMAX then VRMAX elseif y_init <= VRMIN then VRMIN else y_init;
equation
  when not initial() and y > VRMAX then
    reinit(y, VRMAX);
  elsewhen not initial() and y < VRMIN then
    reinit(y, VRMIN);
  end when;
  der(y) = NonWindupLimiter(y, KI, u, VRMAX, VRMIN);
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1})), Documentation(info = "<html>
<p>The operation of this block is described below:</p>

<pre>if (state < Vmax and state > Vmin)
or (state >= Vmax and gain * u < 0)
or (state <= Vmin and gain * u > 0):
  der(state) = gain * u
otherwise:
  der(state) = 0
</pre>
</html>"), experiment(StartTime = 0, StopTime = 5, Tolerance = 1e-06, Interval = 0.01), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1}), graphics = {Line(origin = {3.6427, 0}, points = {{-29.695, 1.11022e-16}, {25.5556, 1.11022e-16}}, color = {0, 0, 255}, thickness = 2), Text(origin = {11.42, -26.55}, lineColor = {0, 0, 255}, extent = {{-75.59, 25.9}, {57.11, -7.44}}, textString = "s"), Text(origin = {62.37, 1.44}, lineColor = {0, 0, 255}, extent = {{-83.26, 32.26}, {-42.67, -2.11}}, textString = "KI"), Rectangle(origin = {1.82, -0.56}, fillColor = {255, 255, 255}, extent = {{-41.9711, 50.5643}, {42.988, -49.4521}}), Line(origin = {52.7222, 55.2744}, points = {{27.9485, 4.72842}, {-22.7182, 4.72842}, {-27.6071, -4.82713}}, color = {0, 0, 255}, thickness = 2), Line(origin = {-52.6111, -55.3922}, rotation = 180, points = {{27.9485, 4.72842}, {-22.7182, 4.72842}, {-27.6071, -4.82713}}, color = {0, 0, 255}, thickness = 2), Text(origin = {104.66, 62.32}, lineColor = {0, 0, 255}, extent = {{-77.55, 26.55}, {-20.67, -4.77}}, textString = "VMAX"), Text(origin = {-4.33, -84.41}, lineColor = {0, 0, 255}, extent = {{-77.55, 26.55}, {-20.67, -4.77}}, textString = "VMIN")}));
end Integrator_NonWindupLimit;
