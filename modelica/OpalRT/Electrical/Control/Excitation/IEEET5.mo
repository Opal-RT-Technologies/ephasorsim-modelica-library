within OpalRT.Electrical.Control.Excitation;
model IEEET5 "Modified 1968 IEEE type 4 excitation system model"
  extends OpalRT.Electrical.PartialModel.Exciter;
  parameter Integer IBUS = 100 "Located Bus No.";
  parameter String ID = "M1" "Machine Identifier";
  parameter Real TRH = 0.025 "(sec)";
  parameter Real KV = 98;
  parameter Real VRMAX = 9 "or zero";
  parameter Real VRMIN = -5;
  parameter Real KE = 0.5 "or zero";
  parameter Real TE = 0.35 "(>0) (sec)";
  parameter Real E1 = 4;
  parameter Real SE_E1 = 0.4;
  parameter Real E2 = 5;
  parameter Real SE_E2 = 0.5;
  import sat_q = OpalRT.NonElectrical.Math.Nonlinear.computeSaturationQuadratic;
  Modelica.Blocks.Math.Add add1(k2 = +1, k1 = -1) annotation(Placement(visible = true, transformation(origin = {-66, 72}, extent = {{-9, -9}, {9, 9}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunctionNonWindup.Integrator_NonWindupLimit integrator_nonwinduplimit1(KI = 1 / TRH, VRMAX = VRMAX_1, VRMIN = VRMIN_1, y_init = VR0) annotation(Placement(visible = true, transformation(origin = {-34, 72}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
  Modelica.Blocks.Math.Product product1 annotation(Placement(visible = true, transformation(origin = {42, -24}, extent = {{7, -7}, {-7, 7}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Nonlinear.SaturationQuadratic saturationquadratic1(E1 = E1, E2 = E2, SE_E1 = SE_E1, SE_E2 = SE_E2) annotation(Placement(visible = true, transformation(origin = {70, -28}, extent = {{7, -7}, {-7, 7}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 0) annotation(Placement(visible = true, transformation(origin = {60, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant1(k = VREF_0) annotation(Placement(visible = true, transformation(origin = {-140, 40}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Blocks.Math.Add add2(k2 = -1) annotation(Placement(visible = true, transformation(origin = {20, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Nonlinear.DeadZoneLimiter deadzonelimiter1(uMax = KV, uMin = -KV, MAX = VRMAX_1, MIN = VRMIN_1) annotation(Placement(visible = true, transformation(origin = {-30, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag lag1(K = 1 / KE_1, T = TE / KE_1, y_start = EFD_0) annotation(Placement(visible = true, transformation(origin = {60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add3(k2 = +1, k1 = +1) annotation(Placement(visible = true, transformation(origin = {-100, 40}, extent = {{-9, -9}, {9, 9}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression Ecomp(y = ETERM) annotation(Placement(visible = true, transformation(origin = {-103, 78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
protected
  parameter Real EFD_0(fixed = false);
  parameter Real VR0(fixed = false);
  parameter Real VREF_0(fixed = false);
  parameter Real SE0(fixed = false);
  parameter Real KE_1(start = 1, fixed = false);
  parameter Real VRMAX_1(fixed = false);
  parameter Real VRMIN_1(fixed = false);
initial equation
  EFD_0 = EFD0;
  SE0 = sat_q(EFD_0, E1, E2, SE_E1, SE_E2);
  VRMAX_1 = if VRMAX <> 0 then VRMAX elseif KE <= 0 then SE_E2 * E2 else (SE_E2 + KE) * E2;
  VRMIN_1 = if VRMAX <> 0 then VRMIN else -VRMAX_1;
  KE_1 = if KE <> 0 then KE else VRMAX_1 / (10 * EFD_0) - SE0;
  VR0 = (SE0 + KE_1) * EFD_0;
  VREF_0 = ETERM0;
  VUEL0 = 0;
  VOEL0 = 0;
equation
  connect(lag1.y, EFD) annotation(Line(points = {{70, 0}, {79.3427, 0}, {79.3427, -0.469484}, {100, -0.469484}, {100, 0}}, color = {0, 0, 127}));
  connect(add2.y, lag1.u) annotation(Line(points = {{31, 0}, {46.0094, 0}, {50, 0}, {50, 0}}, color = {0, 0, 127}));
  connect(product1.y, add2.u2) annotation(Line(points={{34.3,-24},{-2.03046,-24},
          {-2.03046,-5.58376},{8,-5.58376},{8,-6}},                                                                                                     color = {0, 0, 127}));
  connect(deadzonelimiter1.u, add1.y) annotation(Line(points={{-40,40},{-48.8496,
          40},{-48.8496,71.8584},{-56.1,71.8584},{-56.1,72}},                                                                                              color = {0, 0, 127}));
  add2.u1 = smooth(0, if abs(add1.y) < KV - ModelicaServices.Machine.eps then integrator_nonwinduplimit1.y else deadzonelimiter1.y);
  connect(constant1.y, add3.u2) annotation(Line(points={{-131.2,40},{-124.1,40},
          {-124.1,34.8964},{-110.8,34.8964},{-110.8,34.6}},                                                                                         color = {0, 0, 127}));
  connect(const.y, VF) annotation(Line(points={{71,80},{92.9577,80},{92.9577,80},
          {100,80}},                                                                                               color = {0, 0, 127}));
  connect(product1.u1, EFD) annotation(Line(points={{50.4,-19.8},{84.507,-19.8},
          {84.507,-0.469484},{100,-0.469484},{100,0}},                                                                                                  color = {0, 0, 127}));
  connect(saturationquadratic1.u, EFD) annotation(Line(points={{77,-28},{84.507,
          -28},{84.507,-0.469484},{100,-0.469484},{100,0}},                                                                                                  color = {0, 0, 127}));
  connect(product1.u2, saturationquadratic1.y) annotation(Line(points={{50.4,-28.2},
          {62.4413,-28.2},{62.4413,-28},{63,-28}},                                                                                                   color = {0, 0, 127}));
  connect(add1.y, integrator_nonwinduplimit1.u) annotation(Line(points={{-56.1,72},
          {-41.3146,72},{-41.3146,72},{-41.5,72}},                                                                                              color = {0, 0, 127}));
  connect(Ecomp.y, add1.u1) annotation(Line(points = {{-92, 78}, {-76, 78}}, color = {0, 0, 127}));
  connect(dVREF, add3.u1) annotation(Line(points={{-100,58},{-117.993,58},{-117.993,
          57.361},{-110.8,57.361},{-110.8,45.4}},                                                                                                color = {0, 0, 127}));
  connect(add3.y, add1.u2) annotation(Line(points={{-90.1,40},{-82.2246,40},{-82.2246,
          66.3032},{-76.8,66.3032},{-76.8,66.6}},                                                                                                 color = {0, 0, 127}));
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), experiment(StartTime = 0, StopTime = 30, Tolerance = 1e-6, Interval = 0.004),
             Documentation(info = "<html>
<p>
1. The block diagram of IEEET5 model is shown below. </p>
<p>
</p>
2. When change in the voltage reference (dVREF) is equal to Kv (deadband) PSSE and FMU results are diffrent at the trigger of the disturbance because of the difference in the switching function.
<img src=\"modelica://OpalRT/resource/Excitation/IEEET5.png\"
alt=\"IEEET5.png\"><br>

</html>"));
end IEEET5;
