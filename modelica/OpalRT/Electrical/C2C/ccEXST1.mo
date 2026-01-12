within OpalRT.Electrical.C2C;
model ccEXST1
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
  Modelica.Blocks.Math.Add add4(k2 = +1, k1 = +1) annotation(Placement(visible = true, transformation(origin = {70, -60}, extent = {{-4.375, -4.375}, {4.375, 4.375}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain4(k = 1 / KA) annotation(Placement(visible = true, transformation(origin = {40, -70}, extent = {{-5, -5}, {5, 5}}, rotation = 90)));
  output Modelica.Blocks.Interfaces.RealOutput VREF0 annotation(Placement(visible = true, transformation(origin = {100, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  output Modelica.Blocks.Interfaces.RealOutput EFD annotation(Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  input Modelica.Blocks.Interfaces.RealInput VREF annotation(Placement(visible = true, transformation(origin = {-100, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-110, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  input Modelica.Blocks.Interfaces.RealInput ECOMP annotation(Placement(visible = true, transformation(origin = {-100, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-110, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  input Modelica.Blocks.Interfaces.RealInput ETERM_mag annotation(Placement(visible = true, transformation(origin = {-100, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-110, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  input Modelica.Blocks.Interfaces.RealInput XadIfd annotation(Placement(visible = true, transformation(origin = {-100, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput VOTHSG annotation(Placement(visible = true, transformation(origin = {-100, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-110, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput VUEL annotation(Placement(visible = true, transformation(origin = {-100, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-110, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput VOEL annotation(Placement(visible = true, transformation(origin = {-100, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-110, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  input Modelica.Blocks.Interfaces.RealInput EFD0 annotation(Placement(visible = true, transformation(origin = {40, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 90), iconTransformation(origin = {-20, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  input Modelica.Blocks.Interfaces.RealInput ETERM_mag0 annotation(Placement(visible = true, transformation(origin = {60, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 90), iconTransformation(origin = {30, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag BLK1(T = TR, initType = Modelica.Blocks.Types.Init.SteadyState) annotation(Placement(visible = true, transformation(origin = {-70, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag lag1(T = TA, initType = Modelica.Blocks.Types.Init.SteadyState, K = KA) annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.LeadLag lead_lag1(TA = TC, TB = TB, initType = Modelica.Blocks.Types.Init.SteadyState) annotation(Placement(visible = true, transformation(origin = {30, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain5(k = KF) annotation(Placement(visible = true, transformation(origin = {70, 30}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction transferfunction1(b = {1, 0}, a = {TF0, 1}, initType = Modelica.Blocks.Types.Init.SteadyState) annotation(Placement(visible = true, transformation(origin = {70, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
protected
  parameter Real TF0(start = 1, fixed = false);
initial algorithm
  TF0 := TF;
equation
  connect(transferfunction1.y, add32.u1) annotation(Line(points={{59,80},{26.3617,
          80},{26.3617,98.2571},{-20.0436,98.2571},{-20.0436,93.4641},{-16,93.4641},
          {-16,94}},                                                                                                                                                                                 color = {0, 0, 127}));
  connect(gain5.u, lag1.y) annotation(Line(points={{64,30},{13.7255,30},{13.7255,
          0},{10,0},{10,0}},                                                                                             color = {0, 0, 127}));
  connect(gain5.y, transferfunction1.u) annotation(Line(points={{75.5,30},{90.1961,
          30},{90.1961,79.3028},{82,79.3028},{82,80}},                                                                                                  color = {0, 0, 127}));
  connect(lead_lag1.y, lag1.u) annotation(Line(points={{40,50},{47.9303,50},{47.9303,
          33.5512},{4.79303,33.5512},{4.79303,14.1612},{-21.3508,14.1612},{-21.3508,
          0},{-10,0},{-10,0}},                                                                                                                                                                                   color = {0, 0, 127}));
  connect(limiter1.y, lead_lag1.u) annotation(Line(points={{11,50},{20.0436,50},
          {20.0436,50},{20,50}},                                                                                               color = {0, 0, 127}));
  connect(lag1.y, variablelimiter1.u) annotation(Line(points={{10,0},{28.1046,0},
          {28.1046,0},{28,0}},                                                                                      color = {0, 0, 127}));
  connect(BLK1.y, add1.u1) annotation(Line(points={{-60,90},{-46.841,90},{-46.841,
          92.5926},{-35.25,92.5926},{-35.25,92.625}},                                                                                         color = {0, 0, 127}));
  connect(ECOMP, BLK1.u) annotation(Line(points={{-100,90},{-80.8279,90},{-80.8279,
          90},{-80,90}},                                                                                                  color = {0, 0, 127}));
  connect(add4.y, VREF0) annotation(Line(points={{74.8125,-60},{94.5824,-60},{94.5824,
          -60},{100,-60}},                                                                                                    color = {0, 0, 127}));
  connect(ETERM_mag0, add4.u2) annotation(Line(points={{60,-100},{60,-61.3995},{
          64.7856,-61.3995},{64.7856,-62.625},{64.75,-62.625}},                                                                                      color = {0, 0, 127}));
  connect(gain4.y, add4.u1) annotation(Line(points={{40,-64.5},{40,-57.3363},{64.75,
          -57.3363},{64.75,-57.375}},                                                                                         color = {0, 0, 127}));
  connect(EFD0, gain4.u) annotation(Line(points={{40,-100},{40,-75.8465},{40,-75.8465},
          {40,-76}},                                                                                                      color = {0, 0, 127}));
  connect(variablelimiter1.y, EFD) annotation(Line(points={{51,0},{92.7765,0},{92.7765,
          0},{100,0}},                                                                                                           color = {0, 0, 127}));
  connect(add3.y, variablelimiter1.limit2) annotation(Line(points={{-35.1875,-90},
          {22.5734,-90},{22.5734,-8.12641},{28,-8.12641},{28,-8}},                                                                                                    color = {0, 0, 127}));
  connect(add2.y, variablelimiter1.limit1) annotation(Line(points={{-35.1875,-70},
          {17.6072,-70},{17.6072,8.12641},{28,8.12641},{28,8}},                                                                                                    color = {0, 0, 127}));
  connect(add3.u2, gain3.y) annotation(Line(points={{-45.25,-92.625},{-60.4966,-92.625},
          {-60.4966,-89.842},{-64.5,-89.842},{-64.5,-90}},                                                                                                    color = {0, 0, 127}));
  connect(add2.u2, gain2.y) annotation(Line(points={{-45.25,-72.625},{-59.8194,-72.625},
          {-59.8194,-69.9774},{-64.5,-69.9774},{-64.5,-70}},                                                                                                     color = {0, 0, 127}));
  connect(add3.u1, gain1.y) annotation(Line(points={{-45.25,-87.375},{-55.079,-87.375},
          {-55.079,-50.1129},{-64.5,-50.1129},{-64.5,-50}},                                                                                                    color = {0, 0, 127}));
  connect(gain1.y, add2.u1) annotation(Line(points={{-64.5,-50},{-55.079,-50},{-55.079,
          -67.0429},{-45.25,-67.0429},{-45.25,-67.375}},                                                                                              color = {0, 0, 127}));
  connect(gain3.u, ETERM_mag) annotation(Line(points={{-76,-90},{-88.0361,-90},{
          -88.0361,-79.9097},{-100,-79.9097},{-100,-80}},                                                                                               color = {0, 0, 127}));
  connect(ETERM_mag, gain2.u) annotation(Line(points={{-100,-80},{-88.0361,-80},
          {-88.0361,-69.7517},{-76,-69.7517},{-76,-70}},                                                                                                 color = {0, 0, 127}));
  connect(XadIfd, gain1.u) annotation(Line(points={{-100,-50},{-75.8465,-50},{-75.8465,
          -50},{-76,-50}},                                                                                                      color = {0, 0, 127}));
  connect(add32.y, limiter1.u) annotation(Line(points={{-4.5,90},{5.41761,90},{5.41761,
          69.9774},{-20.0903,69.9774},{-20.0903,50.1129},{-12,50.1129},{-12,50}},                                                                                                          color = {0, 0, 127}));
  connect(add32.u3, add31.y) annotation(Line(points={{-16,86},{-22.1219,86},{-22.1219,
          62.0767},{-49.8871,62.0767},{-49.8871,39.9549},{-54.5,39.9549},{-54.5,
          40}},                                                                                                                                                                             color = {0, 0, 127}));
  connect(add32.u2, add1.y) annotation(Line(points={{-16,90},{-25.0564,90},{-25.0564,
          90},{-25.1875,90}},                                                                                               color = {0, 0, 127}));
  connect(VOEL, add31.u3) annotation(Line(points={{-100,-20},{-76.5237,-20},{-76.5237,
          36.3431},{-66,36.3431},{-66,36}},                                                                                                   color = {0, 0, 127}));
  connect(add31.u2, VUEL) annotation(Line(points={{-66,40},{-79.2325,40},{-79.2325,
          9.70655},{-100,9.70655},{-100,10}},                                                                                                color = {0, 0, 127}));
  connect(VOTHSG, add31.u1) annotation(Line(points={{-100,40},{-81.2641,40},{-81.2641,
          44.0181},{-66,44.0181},{-66,44}},                                                                                                       color = {0, 0, 127}));
  connect(VREF, add1.u2) annotation(Line(points={{-100,70},{-43.3409,70},{-43.3409,
          86.6817},{-35.25,86.6817},{-35.25,87.375}},                                                                                          color = {0, 0, 127}));
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1}), graphics={  Text(origin = {76.7104, -78.4439}, extent = {{-5.76, 3.75}, {18.0759, -12.0499}}, textString = "initialization")}), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1}), graphics={  Rectangle(origin = {0.267738, 0.485615}, extent = {{-100.134, 99.1968}, {100.05, -100.41}}), Text(origin = {-4.82068, 1.95853}, extent = {{-42.44, 18.21}, {42.44, -18.21}}, textString = "EXST1"), Text(origin = {-91.7654, 95.0364}, extent = {{-9.37, 2.48}, {39.844, -13.9924}}, textString = "VREF"), Text(origin = {56.16, 68.24}, extent = {{-9.37, 2.48}, {39.84, -13.99}}, textString = "VREF0"), Text(origin = {65.0312, -35.7545}, extent = {{-9.37, 2.48}, {39.84, -13.99}}, textString = "EFD"), Text(origin = {-36.2583, -82.4136}, extent = {{-9.37, 2.48}, {39.84, -13.99}}, textString = "EFD0"), Text(origin = {18.8884, -77.3802}, extent = {{-9.37, 2.48}, {35.7774, -24.1443}}, textString = "ETERM0"), Text(origin = {-90.7974, 65.9843}, extent = {{-9.37, 2.48}, {39.84, -13.99}}, textString = "ECOMP"), Text(origin = {-90.0474, 35.3543}, extent = {{-9.37, 2.48}, {39.84, -13.99}}, textString = "ETERM"), Text(origin = {-97.4292, 6.07}, extent = {{-9.37, 2.48}, {39.84, -13.99}}, textString = "IFD"), Text(origin = {-85.8526, -25.4615}, extent = {{-9.37, 2.48}, {39.84, -13.99}}, textString = "VOTHSG"), Text(origin = {-92.5574, -54.5157}, extent = {{-9.37, 2.48}, {39.84, -13.99}}, textString = "VUEL"), Text(origin = {-92.9374, -83.3357}, extent = {{-9.37, 2.48}, {39.84, -13.99}}, textString = "VOEL")}), Documentation(info = "<html>

<p>
1- In this model, VS = VOTHSG+VUEL+VOEL
</p>
<img src=\"modelica://OpalRT/resource/Excitation/EXST1.png\"
alt=\"EXST1.png2\"><br>

</html>"));
end ccEXST1;
