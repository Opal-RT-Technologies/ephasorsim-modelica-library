within OpalRT.Electrical.Control.Excitation;
model URST5T "IEEE Proposed Type ST5B Excitation System"
  extends OpalRT.Electrical.PartialModel.Exciter;
  parameter Real Tr = 0.01;
  parameter Real TC1 = 0.01;
  parameter Real TB1 = 0.01;
  parameter Real TC2 = 0.01;
  parameter Real TB2 = 0.01;
  parameter Real KR = 0.01;
  parameter Real T1 = 0.01;
  parameter Real KC = 0.01;
  parameter Real VRMAX = 0.01;
  parameter Real VRMIN = 0.01;
  Modelica.Blocks.Math.Add add2(k1 = +1) annotation(Placement(visible = true, transformation(origin = {14, 56}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag lag1(T = Tr, y_start = ECOMP_0) annotation(Placement(visible = true, transformation(origin = {-70, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Max max1 annotation(Placement(visible = true, transformation(origin = {-28, 32}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Min min1 annotation(Placement(visible = true, transformation(origin = {-10, 50}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunctionNonWindup.LeadLag_NonWindupLimit leadlag_non_windup_limit1(T1 = TC1, T2 = TB1, MIN = VRMIN / KR, MAX = VRMAX / KR, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = y10 / KR) annotation(Placement(visible = true, transformation(origin = {42, 56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunctionNonWindup.LeadLag_NonWindupLimit leadlag_non_windup_limit2(T1 = TC2, T2 = TB2, MIN = VRMIN / KR, MAX = VRMAX / KR, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = y10 / KR) annotation(Placement(visible = true, transformation(origin = {74, 56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1(k1 = -1) annotation(Placement(visible = true, transformation(origin = {-50, 14}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add3(k1 = +1, k2 = -1) annotation(Placement(visible = true, transformation(origin = {-12, -12}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = KC) annotation(Placement(visible = true, transformation(origin = {40, -40}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain2(k = KR) annotation(Placement(visible = true, transformation(origin = {80, 6}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiter1(uMax = VRMAX, uMin = VRMIN) annotation(Placement(visible = true, transformation(origin = {58, 6}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain4(k = VRMAX) annotation(Placement(visible = true, transformation(origin = {28, 36}, extent = {{-5, -5}, {5, 5}}, rotation = -90)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunctionNonWindup.Lag_NonWindupVariableLimit lag_non_windup_var_limit1(TI = T1, y_init = y10) annotation(Placement(visible = true, transformation(origin = {24, 14}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain3(k = VRMIN) annotation(Placement(visible = true, transformation(origin = {22, -6}, extent = {{5, -5}, {-5, 5}}, rotation = -90)));
  parameter Real IFD_0(fixed = false);
  parameter Real VREF_0(fixed = false);
  parameter Real ECOMP_0(fixed = false);
  parameter Real EFD_0(fixed = false);
  parameter Real y10(fixed = false);
  Modelica.Blocks.Sources.Constant const(k = VREF_0) annotation(Placement(transformation(extent = {{-153, 34}, {-133, 54}})));
  Modelica.Blocks.Sources.Constant const1(k = 0) annotation(Placement(transformation(extent = {{61, 70}, {81, 90}})));
  Modelica.Blocks.Math.Add add4(k1 = +1) annotation(Placement(visible = true, transformation(origin = {-100, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression Ecomp(y = ETERM) annotation(Placement(visible = true, transformation(origin = {-105, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
initial equation
  IFD_0 = XADIFD;
  ECOMP_0 = ETERM0;
  EFD_0 = EFD0;
  y10 = EFD_0 + KC * IFD_0;
  VREF_0 = ECOMP_0 + y10 / KR;
  VUEL0 = -Modelica.Constants.inf;
  VOEL0 = Modelica.Constants.inf;
equation
  connect(add2.u2, min1.u2) annotation(Line(points = {{8, 53}, {1.60214, 53}, {1.60214, 42.4566}, {-16.8224, 42.4566}, {-16.8224, 47}, {-16, 47}}, color = {0, 0, 127}));
  connect(min1.u2, max1.u2) annotation(Line(points = {{-16, 47}, {-19.4927, 47}, {-19.4927, 24.032}, {-34.713, 24.032}, {-34.713, 29}, {-34, 29}}, color = {0, 0, 127}));
  connect(Ecomp.y, gain4.u) annotation(Line(points = {{-94, 80}, {28, 80}, {28, 42}}, color = {0, 0, 127}));
  connect(Ecomp.y, gain3.u) annotation(Line(points = {{-94, 80}, {28, 80}, {28, 46}, {10, 46}, {10, -20}, {22, -20}, {22, -12}}, color = {0, 0, 127}));
  connect(XADIFD, gain1.u) annotation(Line(points = {{-100, -64}, {46.6776, -64}, {46.6776, -40}, {46, -40}}, color = {0, 0, 127}));
  connect(leadlag_non_windup_limit2.y, gain2.u) annotation(Line(points = {{85, 56}, {90.6606, 56}, {90.6606, 6.15034}, {86, 6.15034}, {86, 6}}, color = {0, 0, 127}));
  connect(gain2.y, limiter1.u) annotation(Line(points = {{74.5, 6}, {64.2369, 6}, {64.2369, 6}, {64, 6}}, color = {0, 0, 127}));
  connect(gain3.y, lag_non_windup_var_limit1.VL) annotation(Line(points = {{22, -0.5}, {22, 4.55581}, {23, 4.55581}, {23, 5}}, color = {0, 0, 127}));
  connect(lag_non_windup_var_limit1.y, add3.u1) annotation(Line(points = {{13, 14}, {2.05011, 14}, {2.05011, -9.11162}, {-6, -9.11162}, {-6, -9}}, color = {0, 0, 127}));
  connect(limiter1.y, lag_non_windup_var_limit1.u) annotation(Line(points = {{52.5, 6}, {42.8246, 6}, {42.8246, 14.123}, {35.5353, 14}, {35, 14}}, color = {0, 0, 127}));
  connect(gain4.y, lag_non_windup_var_limit1.VU) annotation(Line(points = {{28, 30.5}, {28, 23.6902}, {28, 23.6902}, {28, 23}}, color = {0, 0, 127}));
  connect(gain1.y, add3.u2) annotation(Line(points = {{34.5, -40}, {2.05011, -40}, {2.05011, -15.0342}, {-6, -15.0342}, {-6, -15}}, color = {0, 0, 127}));
  connect(add3.y, EFD) annotation(Line(points = {{-17.5, -12}, {-30.8884, -12}, {-30.8884, 0}, {100, 0}}, color = {0, 0, 127}));
  connect(lag1.y, add1.u1) annotation(Line(points = {{-60, 40}, {-56.0364, 40}, {-56.0364, 17}, {-56, 17}}, color = {0, 0, 127}));
  connect(dVREF, add4.u1) annotation(Line(points={{-100,58},{-115.167,58},{
          -115.167,57.5835},{-106,57.5835},{-106,43}},                                                                                          color = {0, 0, 127}));
  connect(add4.y, add1.u2) annotation(Line(points={{-94.5,40},{-85.8612,40},{
          -85.8612,11.054},{-56,11.054},{-56,11}},                                                                                             color = {0, 0, 127}));
  connect(add1.y, max1.u2) annotation(Line(points = {{-44.5, 14}, {-41.2301, 14}, {-41.2301, 28.7016}, {-34, 28.7016}, {-34, 29}}, color = {0, 0, 127}));
  connect(leadlag_non_windup_limit1.y, leadlag_non_windup_limit2.u) annotation(Line(points = {{53, 56}, {63.0979, 56}, {63.0979, 56}, {63, 56}}, color = {0, 0, 127}));
  connect(add2.y, leadlag_non_windup_limit1.u) annotation(Line(points = {{19.5, 56}, {30.5239, 56}, {30.5239, 56}, {31, 56}}, color = {0, 0, 127}));
  connect(VOTHSG, add2.u1) annotation(Line(points = {{-100, -36}, {-100, 58.5421}, {8, 58.5421}, {8, 59}}, color = {0, 0, 127}));
  connect(VOEL, min1.u1) annotation(Line(points = {{-100, -8}, {-100, 53.0752}, {-16, 53.0752}, {-16, 53}}, color = {0, 0, 127}));
  connect(VUEL, max1.u1) annotation(Line(points = {{-100, 20}, {-100, 34.3964}, {-34, 34.3964}, {-34, 35}}, color = {0, 0, 127}));
  connect(Ecomp.y, lag1.u) annotation(Line(points = {{-94, 80}, {-84, 80}, {-84, 40}, {-80, 40}}, color = {0, 0, 127}));
  connect(const.y, add4.u2) annotation(Line(points={{-132,44},{-119.537,44},{
          -119.537,37.018},{-106,37.018},{-106,37}},                                                                                           color = {0, 0, 127}));
  connect(const1.y, VF) annotation(Line(points = {{82, 80}, {100, 80}}, color = {0, 0, 127}));
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Text(origin = {3.03, 73.95}, extent = {{-14.58, 11.74}, {11.62, -9.23}}, textString = "IFD")}), Documentation(info = "<html>
<p>
LV ang HV gates are currently disablied.
</p>

<img src=\"modelica://OpalRT/resource/Excitation/URST5T.png\"
alt=\"URST5T.png\"><br>


</html>"));
end URST5T;
