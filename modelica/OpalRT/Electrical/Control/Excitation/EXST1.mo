within OpalRT.Electrical.Control.Excitation;
model EXST1
  extends OpalRT.Electrical.PartialModel.Exciter;
  Modelica.Blocks.Math.Add add1(k2 = +1, k1 = -1) annotation(Placement(visible = true, transformation(origin = {-30, 90}, extent = {{-4.375, -4.375}, {4.375, 4.375}}, rotation = 0)));
  Modelica.Blocks.Math.Add3 add31 annotation(Placement(visible = true, transformation(origin = {-60, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add3 add32(k1 = -1) annotation(Placement(visible = true, transformation(origin = {-10, 90}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiter1(uMax = VIMAX, uMin = VIMIN) annotation(Placement(visible = true, transformation(origin = {0, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.VariableLimiter variablelimiter1 annotation(Placement(visible = true, transformation(origin = {40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = KC) annotation(Placement(visible = true, transformation(origin = {-70, -50}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain2(k = VRMAX) annotation(Placement(visible = true, transformation(origin = {-70, -70}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain3(k = VRMIN) annotation(Placement(visible = true, transformation(origin = {-70, -90}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add2(k2 = +1, k1 = -1) annotation(Placement(visible = true, transformation(origin = {-40, -70}, extent = {{-4.375, -4.375}, {4.375, 4.375}}, rotation = 0)));
  Modelica.Blocks.Math.Add add3(k2 = +1, k1 = -1) annotation(Placement(visible = true, transformation(origin = {-40, -90}, extent = {{-4.375, -4.375}, {4.375, 4.375}}, rotation = 0)));
  parameter Integer IBUS = 100 "Located Bus No.";
  parameter String ID = "M1" "Machine Identifier";
  parameter Real TR = 0.02;
  parameter Real VIMAX = 0.2;
  parameter Real VIMIN = 0;
  parameter Real TC = 1;
  parameter Real TB = 1;
  parameter Real KA = 80;
  parameter Real TA = 0.05;
  parameter Real VRMAX = 8;
  parameter Real VRMIN = -3;
  parameter Real KC = 0.2;
  parameter Real KF = 0.1;
  parameter Real TF = 1;
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag BLK1(T = TR, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = ETERM_0) annotation(Placement(visible = true, transformation(origin = {-70, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag lag1(T = TA, initType = Modelica.Blocks.Types.Init.InitialOutput, K = KA, y_start = EFD_0) annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.LeadLag lead_lag1(TA = TC, TB = TB, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = EFD_0 / KA) annotation(Placement(visible = true, transformation(origin = {30, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain5(k = KF) annotation(Placement(visible = true, transformation(origin = {70, 30}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction transferfunction1(b = {1, 0}, a = {TF0, 1}, initType = Modelica.Blocks.Types.Init.InitialOutput) annotation(Placement(visible = true, transformation(origin = {70, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  parameter Real EFD_0(fixed = false);
  parameter Real ETERM_0(fixed = false);
  parameter Real VREF_0(fixed = false);
  Modelica.Blocks.Sources.Constant const(k = VREF_0) annotation(Placement(transformation(extent = {{-135, 34}, {-115, 54}})));
  Modelica.Blocks.Math.Add add4(k2 = +1, k1 = +1) annotation(Placement(visible = true, transformation(origin = {-80, 60}, extent = {{-4.375, -4.375}, {4.375, 4.375}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression Ecomp(y = ETERM) annotation(Placement(visible = true, transformation(origin = {-101, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
protected
  parameter Real TF0(start = 1, fixed = false);
initial algorithm
  TF0 := TF;
initial equation
  EFD_0 = EFD0;
  ETERM_0 = ETERM;
  VREF_0 = ETERM_0 + EFD_0 / KA;
  VUEL0 = 0;
  VOEL0 = 0;
equation
  connect(transferfunction1.y, VF) annotation(Line(points = {{59, 80}, {44.9476, 80}, {44.9476, 96}, {100, 96}, {100, 80}}, color = {0, 0, 127}));
  connect(transferfunction1.y, add32.u1) annotation(Line(points = {{59, 80}, {26.3617, 80}, {26.3617, 98.2571}, {-20.0436, 98.2571}, {-20.0436, 93.4641}, {-16, 93.4641}, {-16, 94}}, color = {0, 0, 127}));
  connect(gain5.u, lag1.y) annotation(Line(points = {{64, 30}, {13.7255, 30}, {13.7255, 0}, {10, 0}, {10, 0}}, color = {0, 0, 127}));
  connect(gain5.y, transferfunction1.u) annotation(Line(points = {{75.5, 30}, {86.1961, 30}, {86.1961, 80.3028}, {82, 80.3028}, {82, 80}}, color = {0, 0, 127}));
  connect(lead_lag1.y, lag1.u) annotation(Line(points = {{40, 50}, {47.9303, 50}, {47.9303, 33.5512}, {4.79303, 33.5512}, {4.79303, 14.1612}, {-21.3508, 14.1612}, {-21.3508, 0}, {-10, 0}, {-10, 0}}, color = {0, 0, 127}));
  connect(limiter1.y, lead_lag1.u) annotation(Line(points = {{11, 50}, {20.0436, 50}, {20.0436, 50}, {20, 50}}, color = {0, 0, 127}));
  connect(lag1.y, variablelimiter1.u) annotation(Line(points = {{10, 0}, {28.1046, 0}, {28.1046, 0}, {28, 0}}, color = {0, 0, 127}));
  connect(BLK1.y, add1.u1) annotation(Line(points = {{-60, 90}, {-46.841, 90}, {-46.841, 92.5926}, {-35.25, 92.5926}, {-35.25, 92.625}}, color = {0, 0, 127}));
  connect(Ecomp.y, BLK1.u) annotation(Line(points = {{-90, 90}, {-80, 90}}, color = {0, 0, 127}));
  connect(variablelimiter1.y, EFD) annotation(Line(points = {{51, 0}, {92.7765, 0}, {92.7765, 0}, {100, 0}}, color = {0, 0, 127}));
  connect(add3.y, variablelimiter1.limit2) annotation(Line(points = {{-35.1875, -90}, {22.5734, -90}, {22.5734, -8.12641}, {28, -8.12641}, {28, -8}}, color = {0, 0, 127}));
  connect(add2.y, variablelimiter1.limit1) annotation(Line(points = {{-35.1875, -70}, {17.6072, -70}, {17.6072, 8.12641}, {28, 8.12641}, {28, 8}}, color = {0, 0, 127}));
  connect(add3.u2, gain3.y) annotation(Line(points = {{-45.25, -92.625}, {-60.4966, -92.625}, {-60.4966, -89.842}, {-64.5, -89.842}, {-64.5, -90}}, color = {0, 0, 127}));
  connect(add2.u2, gain2.y) annotation(Line(points = {{-45.25, -72.625}, {-59.8194, -72.625}, {-59.8194, -69.9774}, {-64.5, -69.9774}, {-64.5, -70}}, color = {0, 0, 127}));
  connect(add3.u1, gain1.y) annotation(Line(points = {{-45.25, -87.375}, {-55.079, -87.375}, {-55.079, -50.1129}, {-64.5, -50.1129}, {-64.5, -50}}, color = {0, 0, 127}));
  connect(gain1.y, add2.u1) annotation(Line(points = {{-64.5, -50}, {-55.079, -50}, {-55.079, -67.0429}, {-45.25, -67.0429}, {-45.25, -67.375}}, color = {0, 0, 127}));
  connect(XADIFD, gain1.u) annotation(Line(points = {{-100, -64}, {-84.8465, -64}, {-84.8465, -50}, {-76, -50}}, color = {0, 0, 127}));
  connect(add32.y, limiter1.u) annotation(Line(points = {{-4.5, 90}, {5.41761, 90}, {5.41761, 69.9774}, {-20.0903, 69.9774}, {-20.0903, 50.1129}, {-12, 50.1129}, {-12, 50}}, color = {0, 0, 127}));
  connect(add32.u3, add31.y) annotation(Line(points = {{-16, 86}, {-22.1219, 86}, {-22.1219, 62.0767}, {-49.8871, 62.0767}, {-49.8871, 39.9549}, {-54.5, 39.9549}, {-54.5, 40}}, color = {0, 0, 127}));
  connect(add32.u2, add1.y) annotation(Line(points = {{-16, 90}, {-25.0564, 90}, {-25.0564, 90}, {-25.1875, 90}}, color = {0, 0, 127}));
  connect(VOEL, add31.u3) annotation(Line(points = {{-100, -8}, {-76.5237, -8}, {-76.5237, 36.3431}, {-66, 36.3431}, {-66, 36}}, color = {0, 0, 127}));
  connect(add31.u2, VUEL) annotation(Line(points = {{-66, 40}, {-79.2325, 40}, {-79.2325, 19.7066}, {-100, 19.7066}, {-100, 20}}, color = {0, 0, 127}));
  connect(VOTHSG, add31.u1) annotation(Line(points = {{-100, -36}, {-81.2641, -36}, {-81.2641, 44.0181}, {-66, 44.0181}, {-66, 44}}, color = {0, 0, 127}));
  connect(dVREF, add4.u1) annotation(Line(points={{-100,58},{-95.9651,58},{-95.9651,
          62.625},{-85.25,62.625}},                                                                                                  color = {0, 0, 127}));
  connect(add4.y, add1.u2) annotation(Line(points={{-75.1875,60},{-54.3075,60},{
          -54.3075,87.241},{-35.25,87.241},{-35.25,87.375}},                                                                                      color = {0, 0, 127}));
  gain3.u = ETERM;
  gain2.u = ETERM;
  connect(const.y, add4.u2) annotation(Line(points={{-114,44},{-88.3315,44},{-88.3315,
          43.6205},{-85.25,43.6205},{-85.25,57.375}},                                                                                                       color = {0, 0, 127}));
  annotation(Documentation(info = "<html>

<p>
1- In this model, VS = VOTHSG+VUEL+VOEL
</p>
<img src=\"modelica://OpalRT/resource/Excitation/EXST1.png\"
alt=\"EXST1.png\"><br>

</html>"), experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.001), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1})));
end EXST1;
