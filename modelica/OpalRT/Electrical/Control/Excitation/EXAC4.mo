within OpalRT.Electrical.Control.Excitation;
model EXAC4
  extends OpalRT.Electrical.PartialModel.Exciter;
  parameter Real TR = 0.01;
  parameter Real VIMAX = 0.01;
  parameter Real VIMIN = 0.01;
  parameter Real TC = 0.01;
  parameter Real TB = 0.01 "sec";
  parameter Real KA = 0.01;
  parameter Real TA = 0.01;
  parameter Real VRMAX = 0.01;
  parameter Real VRMIN = 0.01;
  parameter Real KC = 0.01;
  Modelica.Blocks.Math.Add3 add31 annotation(Placement(visible = true, transformation(origin = {-72, -60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag lag1(T = TR, y_start = ECOMP_0) annotation(Placement(visible = true, transformation(origin = {-70, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add2(k2 = -1, k1 = +1) annotation(Placement(visible = true, transformation(origin = {-42, -4}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1(k2 = +1, k1 = +1) annotation(Placement(visible = true, transformation(origin = {-26, -36}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiter1(uMax = VIMAX, uMin = VIMIN) annotation(Placement(visible = true, transformation(origin = {-6, -36}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag lag2(K = KA, T = TA, y_start = EFD_0) annotation(Placement(visible = true, transformation(origin = {54, -36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.VariableLimiter variablelimiter1 annotation(Placement(visible = true, transformation(origin = {64, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add3(k2 = -1, k1 = +1) annotation(Placement(visible = true, transformation(origin = {-30, 62}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add4(k2 = +1, k1 = -1) annotation(Placement(visible = true, transformation(origin = {-30, 42}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = KC) annotation(Placement(visible = true, transformation(origin = {-70, 50}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = VRMAX) annotation(Placement(visible = true, transformation(origin = {-54, 66}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant1(k = VRMIN) annotation(Placement(visible = true, transformation(origin = {-54, 36}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.LeadLag lead_lag1(TA = TC, TB = TB, y_start = EFD_0 / KA) annotation(Placement(visible = true, transformation(origin = {20, -36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const1(k = VREF_0) annotation(Placement(transformation(extent = {{-153, 34}, {-133, 54}})));
  Modelica.Blocks.Sources.Constant const2(k = 0) annotation(Placement(transformation(extent = {{55, 70}, {75, 90}})));
  Modelica.Blocks.Math.Add add5(k2 = +1, k1 = +1) annotation(Placement(visible = true, transformation(origin = {-100, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression Ecomp(y = ETERM) annotation(Placement(visible = true, transformation(origin = {-117, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
protected
  parameter Real ECOMP_0(fixed = false);
  parameter Real EFD_0(fixed = false);
  parameter Real VREF_0(fixed = false);
initial equation
  ECOMP_0 = ETERM0;
  EFD_0 = EFD0;
  VREF_0 = ECOMP_0 + EFD_0 / KA;
  VUEL0 = 0;
  VOEL0 = 0;
equation
  connect(add4.y, variablelimiter1.limit2) annotation(Line(points = {{-24.5, 42}, {0.683371, 42}, {0.683371, 10.0228}, {52, 10.0228}, {52, 10}}, color = {0, 0, 127}));
  connect(lag2.y, variablelimiter1.u) annotation(Line(points = {{64, -36}, {68.7927, -36}, {68.7927, -0.683371}, {46.697, -0.683371}, {46.697, 17.9954}, {52, 17.9954}, {52, 18}}, color = {0, 0, 127}));
  connect(add3.y, variablelimiter1.limit1) annotation(Line(points = {{-24.5, 62}, {31.6629, 62}, {31.6629, 25.7403}, {52, 25.7403}, {52, 26}}, color = {0, 0, 127}));
  connect(variablelimiter1.y, EFD) annotation(Line(points = {{75, 18}, {95.2164, 18}, {95.2164, 0}, {100, 0}}, color = {0, 0, 127}));
  connect(limiter1.y, lead_lag1.u) annotation(Line(points = {{-0.5, -36}, {10.2506, -36}, {10, -36.4465}, {10, -36}}, color = {0, 0, 127}));
  connect(lead_lag1.y, lag2.u) annotation(Line(points = {{30, -36}, {43.508, -36}, {43.508, -36}, {44, -36}}, color = {0, 0, 127}));
  connect(constant1.y, add4.u2) annotation(Line(points = {{-48.5, 36}, {-41.0023, 36}, {-41.0023, 38.2688}, {-36, 38.2688}, {-36, 39}}, color = {0, 0, 127}));
  connect(const.y, add3.u1) annotation(Line(points = {{-48.5, 66}, {-40.7745, 66}, {-40.7745, 65.1481}, {-36, 65.1481}, {-36, 65}}, color = {0, 0, 127}));
  connect(gain1.y, add4.u1) annotation(Line(points = {{-64.5, 50}, {-46.0137, 50}, {-46.0137, 45.1025}, {-36, 45.1025}, {-36, 45}}, color = {0, 0, 127}));
  connect(XADIFD, gain1.u) annotation(Line(points = {{-100, -64}, {-76.3098, -64}, {-76.3098, 50}, {-76, 50}}, color = {0, 0, 127}));
  connect(gain1.y, add3.u2) annotation(Line(points = {{-64.5, 50}, {-46.0137, 50}, {-46.0137, 58.9977}, {-36, 58.9977}, {-36, 59}}, color = {0, 0, 127}));
  connect(dVREF, add5.u1) annotation(Line(points={{-100,58},{-109.512,58},{
          -109.512,57.8406},{-106,57.8406},{-106,43}},                                                                                          color = {0, 0, 127}));
  connect(add5.y, add2.u1) annotation(Line(points={{-94.5,40},{-71.4653,40},{
          -71.4653,-1.02828},{-48,-1.02828},{-48,-1}},                                                                                             color = {0, 0, 127}));
  connect(add1.y, limiter1.u) annotation(Line(points = {{-20.5, -36}, {-12.9841, -36}, {-12.9841, -36}, {-12, -36}}, color = {0, 0, 127}));
  connect(add31.y, add1.u2) annotation(Line(points = {{-66.5, -60}, {-35.0797, -60}, {-35.0797, -39.18}, {-32, -39.18}, {-32, -39}}, color = {0, 0, 127}));
  connect(add2.y, add1.u1) annotation(Line(points = {{-36.5, -4}, {-34.3964, -4}, {-34.3964, -33.0296}, {-32, -33.0296}, {-32, -33}}, color = {0, 0, 127}));
  connect(lag1.y, add2.u2) annotation(Line(points = {{-60, -20}, {-55.1253, -20}, {-55.1253, -7.28929}, {-48, -7.28929}, {-48, -7}}, color = {0, 0, 127}));
  connect(Ecomp.y, lag1.u) annotation(Line(points = {{-106, -20}, {-80, -20}}, color = {0, 0, 127}));
  connect(VOTHSG, add31.u1) annotation(Line(points = {{-100, -36}, {-85.877, -36}, {-85.877, -56.0364}, {-78, -56.0364}, {-78, -56}}, color = {0, 0, 127}));
  connect(VUEL, add31.u3) annotation(Line(points = {{-100, 20}, {-86.3326, 20}, {-86.3326, -64.4647}, {-78, -64.4647}, {-78, -64}}, color = {0, 0, 127}));
  connect(VOEL, add31.u2) annotation(Line(points = {{-100, -8}, {-78.1321, -8}, {-78.1321, -60}, {-78, -60}}, color = {0, 0, 127}));
  connect(const1.y, add5.u2) annotation(Line(points={{-132,44},{-122.622,44},{
          -122.622,37.018},{-106,37.018},{-106,37}},                                                                                          color = {0, 0, 127}));
  connect(const2.y, VF) annotation(Line(points = {{76, 80}, {100, 80}}, color = {0, 0, 127}));
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Documentation(info = "<html>

<p>
1- In this model, VS = VOTHSG+VUEL+VOEL
</p>

<img src=\"modelica://OpalRT/resource/Excitation/EXAC4.png\"
alt=\"EXAC4.png\"><br>


</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
end EXAC4;
