within OpalRT.NonElectrical.Math.Continuous.TransferFunctionWindup.TransferFunctionNonWindup;

block Integrator_NonWindupVariableLimit "Integrator block with anti wind-up variable limiter"
  parameter Real KI = 1;
  parameter Real y_init = 0;
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
  Boolean sync;
  Real sync_real;
  parameter Real ts = 0.001;
initial algorithm
  y := if y_init >= VU then VU elseif y_init <= VL then VL else y_init;
initial equation
  VU_p = VU;
  VL_p = VL;
equation
  sync = sample(0, ts);
  assert(VU > VL, "VRMAX must be greater than VRMIN");
  when true then
    VU_p = pre(VU);
    VL_p = pre(VL);
  end when;
  when not initial() and (y > VU_p or der(y) * ts + y > VU_p) and sync then
    reinit(y, VU);
  elsewhen not initial() and (y < VL_p or der(y) * ts + y < VL_p) and sync then
    reinit(y, VL);
  end when;
  sync_real = if sync == true then 1 else 0;
  der(y) = NonWindupLimiter(y, KI, u, VU_p, VL_p);
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1})), experiment(StartTime = 0, StopTime = 5, Tolerance = 1e-06, Interval = 0.01), Documentation(info = "<html>

<p>The operation of this block is described below:</p>

<pre>if (state < Vmax(t) and state > Vmin(t))
or (state >= Vmax(t) and gain * u < 0)
or (state <= Vmin(t) and gain * u > 0):
                          der(state) = gain * u
otherwise:
                          der(state) = 0
</pre>

<p> Limits of the block, i.e. Vmax and Vmin, are variable.
</p>
<p><b>Note:</b> Currently the block is not working properly with variable limits. please repalce with Non_Windup_Integrator block which uses constant limits.</p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1}), graphics = {Line(origin = {3.6427, 0}, points = {{-29.695, 1.11022e-16}, {25.5556, 1.11022e-16}}, color = {0, 0, 255}, thickness = 2), Text(origin = {11.42, -26.55}, lineColor = {0, 0, 255}, extent = {{-75.59, 25.9}, {57.11, -7.44}}, textString = "s"), Text(origin = {62.37, 1.44}, lineColor = {0, 0, 255}, extent = {{-83.26, 32.26}, {-42.67, -2.11}}, textString = "KI"), Rectangle(origin = {1.82, -0.56}, fillColor = {255, 255, 255}, extent = {{-41.9711, 50.5643}, {42.988, -49.4521}}), Line(origin = {52.7222, 55.2744}, points = {{27.9485, 4.72842}, {-22.7182, 4.72842}, {-27.6071, -4.82713}}, color = {0, 0, 255}, thickness = 2), Line(origin = {-52.6111, -55.3922}, rotation = 180, points = {{27.9485, 4.72842}, {-22.7182, 4.72842}, {-27.6071, -4.82713}}, color = {0, 0, 255}, thickness = 2), Text(origin = {104.66, 62.32}, lineColor = {0, 0, 255}, extent = {{-77.55, 26.55}, {-20.67, -4.77}}, textString = "VMAX"), Text(origin = {-3.42, -84.41}, lineColor = {0, 0, 255}, extent = {{-77.55, 26.55}, {-20.67, -4.77}}, textString = "VMIN"), Text(origin = {-8.93281, 70.2627}, extent = {{-19.17, 10.78}, {19.17, -10.78}}, textString = "VU"), Text(origin = {8.47, -71.59}, extent = {{-19.17, 10.78}, {19.17, -10.78}}, textString = "VL")}));
end Integrator_NonWindupVariableLimit;
