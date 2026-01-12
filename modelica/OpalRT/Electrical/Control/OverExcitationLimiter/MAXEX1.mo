within OpalRT.Electrical.Control.OverExcitationLimiter;
model MAXEX1 "Maximum Excitation Limiter Type 1"
  extends OpalRT.Electrical.PartialModel.OverExcitationLimiter;
  parameter Real EFDRATED;
  parameter Real EFD1;
  parameter Real TIME1;
  parameter Real EFD2;
  parameter Real TIME2;
  parameter Real EFD3;
  parameter Real TIME3;
  parameter Real EFDDES;
  parameter Real KMX;
  parameter Real VLOW;
  Modelica.Blocks.Math.Add add1(k2 = -1) annotation(Placement(visible = true, transformation(origin = {-40, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = EFDDES * EFDRATED) annotation(Placement(visible = true, transformation(origin = {-80, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.Electrical.Control.OverExcitationLimiter.Common.TimeCurrentGraph time_efd_diag1(EFD1 = EFD1, TIME1 = TIME1, EFD2 = EFD2, TIME2 = TIME2, EFD3 = EFD3, TIME3 = TIME3, EFDRATED = EFDRATED) annotation(Placement(visible = true, transformation(origin = {-40, 0}, extent = {{-11.25, -11.25}, {11.25, 11.25}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant1(k = 0) annotation(Placement(visible = true, transformation(origin = {40, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.Switch switch1 annotation(Placement(visible = true, transformation(origin = {70, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = KMX) annotation(Placement(visible = true, transformation(origin = {-10, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiter1(uMax = 0, uMin = VLOW) annotation(Placement(visible = true, transformation(origin = {20, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.Electrical.Control.OverExcitationLimiter.Common.Integartor integartor1 annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(switch1.u3, constant1.y) annotation(Line(points = {{58, 32}, {53.0447, 32}, {53.0447, 73.613}, {59.2693, 73.613}, {59.2693, 79.8376}, {51, 79.8376}, {51, 80}}, color = {0, 0, 127}));
  connect(limiter1.y, switch1.u1) annotation(Line(points = {{31, 40}, {39.5129, 40}, {39.5129, 47.0907}, {58, 47.0907}, {58, 48}}, color = {0, 0, 127}));
  connect(switch1.y, VOEL) annotation(Line(points = {{81, 40}, {91.5718, 40}, {91.5718, 0}, {100, 0}}, color = {0, 0, 127}));
  connect(add1.y, gain1.u) annotation(Line(points = {{-29, 40}, {-23.0068, 40}, {-23.0068, 40}, {-22, 40}}, color = {0, 0, 127}));
  connect(gain1.y, limiter1.u) annotation(Line(points = {{1, 40}, {6.15034, 40}, {6.15034, 40}, {8, 40}}, color = {0, 0, 127}));
  connect(integartor1.enabley, switch1.u2) annotation(Line(points = {{10, 0}, {45.3303, 0}, {45.3303, 39.6355}, {58, 39.6355}, {58, 40}}, color = {255, 0, 255}));
  connect(time_efd_diag1.enable, integartor1.enable) annotation(Line(points = {{-28.75, -9}, {-20.2733, -9}, {-20.2733, 0}, {-10, 0}, {-10, 0}}, color = {255, 0, 255}));
  connect(time_efd_diag1.TOP, integartor1.t) annotation(Line(points = {{-28.75, 4.5}, {-10.2506, 4.5}, {-10.2506, 5.5}, {-9.7, 5.5}}, color = {0, 0, 127}));
  connect(time_efd_diag1.EFD, EFD) annotation(Line(points = {{-51.25, -9}, {-74.4875, -9}, {-74.4875, 39.18}, {-100, 39.18}, {-100, 64}}, color = {0, 0, 127}));
  connect(EFD, add1.u2) annotation(Line(points = {{-100, 64}, {-64.9203, 64}, {-64.9203, 33.713}, {-52, 33.713}, {-52, 34}}, color = {0, 0, 127}));
  connect(const.y, add1.u1) annotation(Line(points = {{-69, 80}, {-62.8702, 80}, {-62.8702, 46.2415}, {-52, 46.2415}, {-52, 46}}, color = {0, 0, 127}));
  annotation(experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.01), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1})), Documentation(info = "<html>

<p>
1- Below EFD1, the device is inactive.
</p>
<p>
2- Above EFD3, the time to operate is constant and equal to TIME3.
</p>
<p>
3- If EFD goes below EFD1 at any time before the device has timed-out, the timer resets.
</p>
<p>
4- After timeout, the model does not reset (i.e., it is assumed that the operator must reset the device.)
</p>
<img src=\"modelica://OpalRT/resource/Over_Excitation_Limiter/MAXEX1.png\"


</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1})));
end MAXEX1;
