within OpalRT.Electrical.Control.Stabilizer;
model PSS2B "Multiplexer blocks are added to the PSS2B, and inputs are considered as vectors. based on the value of M0 and M2, proper input is selected by the Multiplexer"
  extends OpalRT.Electrical.PartialModel.Stabilizer;
  constant Real pi = Modelica.Constants.pi;
  parameter Integer IBUS = 100 "Located Bus No.";
  parameter String ID = "M1" "Machine Identifier";
  parameter Real TW1 = 10 ">0";
  parameter Real TW2 = 10 "To bypass second washout, first signal: set Tw2 = 0";
  parameter Real T6 = 0 "To bypass first signal transducer: set T6 = 0";
  parameter Real TW3 = 10 ">0";
  parameter Real TW4 = 0 "To bypass second washout, second signal: set Tw4 = 0";
  parameter Real T7 = 10 "To bypass second signal transducer: set T7 = 0";
  parameter Real KS2 = 1.13;
  parameter Real KS3 = 1;
  parameter Real T10 = 0.3;
  parameter Real T11 = 0.15 ">0";
  parameter Real T8 = 0.3;
  parameter Real T9 = 0.15 ">0";
  parameter Real KS1 = 20;
  parameter Real T1 = 0.16 "To bypass first lead-lag: set T1 = T2 = 0";
  parameter Real T2 = 0.02;
  parameter Real T3 = 0.16 "To bypass first lead-lag: set T1 = T2 = 0";
  parameter Real T4 = 0.02;
  parameter Real VS1MAX = 0.2;
  parameter Real VS1MIN = -0.066;
  parameter Real VS2MAX = 0.2;
  parameter Real VS2MIN = -0.066;
  parameter Real VSTMAX = 0.2;
  parameter Real VSTMIN = -0.066;
  parameter Real M0 = 1 annotation(Dialog(tab = "ICONs"));
  parameter Real M1 = 1 "currently disabled" annotation(Dialog(tab = "ICONs"));
  parameter Real M2 = 1 annotation(Dialog(tab = "ICONs"));
  parameter Real M3 = 1 "currently disabled" annotation(Dialog(tab = "ICONs"));
  parameter Real M4 = 5 ">= 0, To bypass Ramp Tracking Filter: set M = N = 0" annotation(Dialog(tab = "ICONs"));
  parameter Real M5 = 1 ">= 0, M * N <= 8" annotation(Dialog(tab = "ICONs"));
  parameter Modelica.Blocks.Types.Init initType = Modelica.Blocks.Types.Init.InitialOutput "Type of initialization (1: no init, 2: steady state, 3,4: initial output)";
  parameter Real y_start = 0 "Initial or guess value of output (= state)";
  Modelica.Blocks.Continuous.TransferFunction tf_TW1(b = {TW10, 0}, a = {TW10, 1}, initType = initType, y_start = y_start) annotation(Placement(visible = true, transformation(origin = {-18, 66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction tf_TW3(b = {TW30, 0}, a = {TW30, 1}, initType = initType, y_start = y_start) annotation(Placement(visible = true, transformation(origin = {-120, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = KS3) annotation(Placement(visible = true, transformation(origin = {35, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 90)));
  Modelica.Blocks.Math.Add add1 annotation(Placement(visible = true, transformation(origin = {62, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiter1(uMax = VSTMAX, uMin = VSTMIN) annotation(Placement(visible = true, transformation(origin = {100, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add2(k2 = -1) annotation(Placement(visible = true, transformation(origin = {0, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.Electrical.Control.Stabilizer.Common.RampTrackFilter ramptrackfilter1(M = integer(M4), N = if M4 == 0 then 0 else integer(M5), T8 = T8, T9 = T9, initType = initType, y_start = y_start) annotation(Placement(visible = true, transformation(origin = {100, 60}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain2(k = KS1) annotation(Placement(visible = true, transformation(origin = {30, -20}, extent = {{-6.5625, -6.5625}, {6.5625, 6.5625}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.WashOutFilter tf_TW2(TW = TW2, initType = initType, y_start = y_start) annotation(Placement(visible = true, transformation(origin = {7, 66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.WashOutFilter tf_TW4(TW = TW4, initType = initType, y_start = y_start) annotation(Placement(visible = true, transformation(origin = {-80, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag tf_T6(T = T6, initType = initType) annotation(Placement(visible = true, transformation(origin = {31, 66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag tf_T7(T = T7, initType = initType, K = KS2) annotation(Placement(visible = true, transformation(origin = {-40, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.LeadLag tf_T1T2(TA = T1, TB = T2, initType = initType, y_start = y_start) annotation(Placement(visible = true, transformation(origin = {60, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.SignalRouting.Multiplexer multiplexer1(n = 6, s = M0) annotation(Placement(visible = true, transformation(origin = {-72, 66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiter2(uMax = VS1MAX, uMin = VS1MIN) annotation(Placement(visible = true, transformation(origin = {-45, 66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.SignalRouting.Multiplexer multiplexer2(n = 6, s = M2) annotation(Placement(visible = true, transformation(origin = {-206, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiter3(uMax = VS2MAX, uMin = VS2MIN) annotation(Placement(visible = true, transformation(origin = {-160, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.LeadLag tf_T3T4(TA = T3, TB = T4, initType = initType, y_start = y_start) annotation(Placement(visible = true, transformation(origin = {90, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.LeadLag tf_T10T11(TA = T10, TB = T11, initType = initType, y_start = y_start) annotation(Placement(visible = true, transformation(origin = {120, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
protected
  parameter Real TW10(start = 1, fixed = false);
  parameter Real TW30(start = 1, fixed = false);
  Real PELEC1, ETERM1, freqDeviation1;
  Real PELEC2, ETERM2, freqDeviation2;
initial algorithm
  TW10 := TW1;
  TW30 := TW3;
equation
  //Input 1 (M0):
  freqDeviation1 = if M0 == 2 then PSS_AUX[1] / 2 / pi else 0;
  PELEC1 = if M0 == 3 then VI[1] * VI[3] + VI[2] * VI[4] else 0;
  ETERM1 = if M0 == 5 then sqrt(VI[1] * VI[1] + VI[2] * VI[2]) else 0;
  //Input 2 (M2):
  freqDeviation2 = if M2 == 2 then PSS_AUX2[1] / 2 / pi else 0;
  PELEC2 = if M2 == 3 then VI2[1] * VI2[3] + VI2[2] * VI2[4] else 0;
  ETERM2 = if M2 == 5 then sqrt(VI2[1] * VI2[1] + VI2[2] * VI2[2]) else 0;
  connect(tf_T10T11.y, limiter1.u) annotation(Line(points = {{130, -20}, {141.907, -20}, {141.907, -47.0814}, {72.6115, -47.0814}, {72.6115, -80.569}, {88, -80.569}, {88, -80}}, color = {0, 0, 127}));
  connect(tf_T3T4.y, tf_T10T11.u) annotation(Line(points = {{100, -20}, {109.746, -20}, {109.746, -20}, {110, -20}}, color = {0, 0, 127}));
  connect(tf_T1T2.y, tf_T3T4.u) annotation(Line(points = {{70, -20}, {88.498, -20}, {88.498, -20.0271}, {89.8512, -20}, {80, -20}}, color = {0, 0, 127}));
  connect(multiplexer1.y, limiter2.u) annotation(Line(points = {{-62, 66}, {-57, 66}}, color = {0, 0, 127}));
  connect(multiplexer2.y, limiter3.u) annotation(Line(points = {{-196, 20}, {-172.818, 20}, {-172.818, 20}, {-172, 20}}, color = {0, 0, 127}));
  connect(limiter3.y, tf_TW3.u) annotation(Line(points = {{-149, 20}, {-132.292, 20}, {-132.292, 20}, {-132, 20}}, color = {0, 0, 127}));
  connect(limiter2.y, tf_TW1.u) annotation(Line(points = {{-34, 66}, {-30, 66}}, color = {0, 0, 127}));
  connect(gain2.y, tf_T1T2.u) annotation(Line(points={{37.2188,-20},{48.9851,
          -20},{48.9851,-20},{50,-20}},                                                                             color = {0, 0, 127}));
  connect(add2.u2, tf_T7.y) annotation(Line(points = {{-12, -26}, {-23.5453, -26}, {-23.5453, 20.0271}, {-30, 20.0271}, {-30, 20}}, color = {0, 0, 127}));
  connect(tf_T7.y, gain1.u) annotation(Line(points = {{-30, 20}, {35, 20}, {35, 34}}, color = {0, 0, 127}));
  connect(tf_TW4.y, tf_T7.u) annotation(Line(points = {{-70, 20}, {-50.3383, 20}, {-50.3383, 20}, {-50, 20}}, color = {0, 0, 127}));
  connect(tf_T6.y, add1.u1) annotation(Line(points = {{41, 66}, {50, 66}}, color = {0, 0, 127}));
  connect(tf_TW2.y, tf_T6.u) annotation(Line(points = {{17, 66}, {21, 66}}, color = {0, 0, 127}));
  connect(tf_TW3.y, tf_TW4.u) annotation(Line(points = {{-109, 20}, {-89.3099, 20}, {-89.3099, 20}, {-90, 20}}, color = {0, 0, 127}));
  connect(tf_TW1.y, tf_TW2.u) annotation(Line(points = {{-7, 66}, {-3, 66}}, color = {0, 0, 127}));
  connect(gain2.u, add2.y) annotation(Line(points = {{22.125, -20}, {10.7095, -20}, {10.7095, -20}, {11, -20}}, color = {0, 0, 127}));
  connect(limiter1.y, VOTHSG) annotation(Line(points = {{111, -80}, {151.539, -80}, {151.539, 0}, {100, 0}}, color = {0, 0, 127}));
  connect(ramptrackfilter1.y, add2.u1) annotation(Line(points = {{115, 60}, {123.159, 60}, {123.159, 7.49665}, {-19.0094, 7.49665}, {-19.0094, -13.6546}, {-12, -13.6546}, {-12, -14}}, color = {0, 0, 127}));
  connect(add1.y, ramptrackfilter1.u) annotation(Line(points = {{73, 60}, {85, 60}}, color = {0, 0, 127}));
  connect(add1.u2, gain1.y) annotation(Line(points = {{50, 54}, {35, 54}, {35, 45.5}}, color = {0, 0, 127}));
  connect(multiplexer1.u[1], PSS_AUX[1]) annotation(Line(points={{-82,65.1667},
          {-85,65.1667},{-85,61},{-100,61},{-100,-5}},                                                                      color = {0, 0, 127}));
  multiplexer1.u[2] = freqDeviation1;
  multiplexer1.u[3] = PELEC1;
  connect(multiplexer1.u[4], PSS_AUX[2]) annotation(Line(points={{-82,66.1667},
          {-85,66.1667},{-85,61},{-100,61},{-100,5}},                                                                       color = {0, 0, 127}));
  multiplexer1.u[5] = ETERM1;
  multiplexer1.u[6] = 0;
  connect(multiplexer2.u[1], PSS_AUX2[1]) annotation(Line(points={{-216,19.1667},
          {-228,19.1667},{-228,-65},{-100,-65}},                                                                       color = {0, 0, 127}));
  multiplexer2.u[2] = freqDeviation2;
  multiplexer2.u[3] = PELEC2;
  connect(multiplexer2.u[4], PSS_AUX2[2]) annotation(Line(points={{-216,20.1667},
          {-228,20.1667},{-228,-55},{-100,-55}},                                                                       color = {0, 0, 127}));
  multiplexer2.u[5] = ETERM2;
  multiplexer2.u[6] = 0;
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1})), Documentation(info = "<html>

<p>

</p>

<img src=\"modelica://OpalRT/resource/Stabilizer/PSS2B.png\"
alt=\"PSS2B
.png\"><br>

</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1})));
end PSS2B;
