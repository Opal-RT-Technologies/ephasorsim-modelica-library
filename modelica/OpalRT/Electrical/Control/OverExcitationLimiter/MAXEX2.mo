within OpalRT.Electrical.Control.OverExcitationLimiter;
model MAXEX2 "Maximum Excitation Limiter Type 2"
  extends OpalRT.Electrical.PartialModel.OverExcitationLimiter;
  parameter Real EFDRATED "or IFDRATED";
  parameter Real EFD1 "or IFD1 (pu of rated)";
  parameter Real TIME1;
  parameter Real EFD2 "or IFD1 (pu of rated)";
  parameter Real TIME2;
  parameter Real EFD3 "or IFD1 (pu of rated)";
  parameter Real TIME3;
  parameter Real EFDDES "or IFDDES (pu of rated)";
  parameter Real KMX;
  parameter Real VLOW "(<0)";
  parameter Real ICONM "0 for EFD limiting, 1 for IFD limiting";
  Modelica.Blocks.Math.Add add1(k2 = -1) annotation(Placement(visible = true, transformation(origin = {-40, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = EFDDES * EFDRATED) annotation(Placement(visible = true, transformation(origin = {-80, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.Electrical.Control.OverExcitationLimiter.Common.TimeCurrentGraph time_efd_diag1(EFD1 = EFD1, TIME1 = TIME1, EFD2 = EFD2, TIME2 = TIME2, EFD3 = EFD3, TIME3 = TIME3, EFDRATED = EFDRATED) annotation(Placement(visible = true, transformation(origin = {-40, 0}, extent = {{-11.25, -11.25}, {11.25, 11.25}}, rotation = 0)));
  Real EFDPU;
  Real EFD_IFD;
  OpalRT.NonElectrical.Math.Continuous.TransferFunctionNonWindup.Integrator_NonWindupLimit non_windup_integrator1(VRMAX = 0, VRMIN = VLOW, KI = KMX) annotation(Placement(visible = true, transformation(origin = {60, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.Switch switch1 annotation(Placement(visible = true, transformation(origin = {20, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant1(k = 0) annotation(Placement(visible = true, transformation(origin = {-20, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.Electrical.Control.OverExcitationLimiter.Common.Integartor integartor1 annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(add1.y, switch1.u1) annotation(Line(points = {{-29, 40}, {-19.7564, 40}, {-19.7564, 46.82}, {8, 46.82}, {8, 48}}, color = {0, 0, 127}));
  connect(constant1.y, switch1.u3) annotation(Line(points = {{-9, 80}, {1.62382, 80}, {1.62382, 30.8525}, {8, 30.8525}, {8, 32}}, color = {0, 0, 127}));
  connect(integartor1.enabley, switch1.u2) annotation(Line(points = {{10, 0}, {19.4858, 0}, {19.4858, 23.2747}, {-5.68336, 23.2747}, {-5.68336, 39.7835}, {8, 39.7835}, {8, 40}}, color = {255, 0, 255}));
  connect(time_efd_diag1.enable, integartor1.enable) annotation(Line(points = {{-28.75, -9}, {-20.5683, -9}, {-20.5683, -0.811908}, {-10, -0.811908}, {-10, 0}}, color = {255, 0, 255}));
  connect(time_efd_diag1.TOP, integartor1.t) annotation(Line(points = {{-28.75, 4.5}, {-9.7429, 4.5}, {-9.7429, 5.5}, {-9.7, 5.5}}, color = {0, 0, 127}));
  connect(switch1.y, non_windup_integrator1.u) annotation(Line(points = {{31, 40}, {55.0898, 40}, {55.0898, 40}, {55, 40}}, color = {0, 0, 127}));
  connect(non_windup_integrator1.y, VOEL) annotation(Line(points = {{65, 40}, {92.6733, 40}, {92.6733, 0}, {100, 0}}, color = {0, 0, 127}));
  connect(time_efd_diag1.EFD, add1.u2) annotation(Line(points = {{-51.25, -9}, {-54.1916, -9}, {-54.1916, 34}, {-52, 34}}, color = {0, 0, 127}));
  EFDPU = EFD_IFD / EFDRATED;
  connect(const.y, add1.u1) annotation(Line(points = {{-69, 80}, {-52.9293, 80}, {-52.9293, 46}, {-52, 46}}, color = {0, 0, 127}));
  EFD_IFD = add1.u2;
  EFD_IFD = if integer(ICONM) == 0 then EFD else XADIFD;
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
<img src=\"modelica://OpalRT/resource/Over_Excitation_Limiter/MAXEX2.png\"


</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1})));
end MAXEX2;
