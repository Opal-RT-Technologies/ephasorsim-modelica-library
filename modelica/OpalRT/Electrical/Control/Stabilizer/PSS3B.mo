within OpalRT.Electrical.Control.Stabilizer;
model PSS3B "IEEE Std. 421.5 2005 PSS3B IEEE Dual-Input Stabilizer Model"
  extends OpalRT.Electrical.PartialModel.Stabilizer;
  constant Real pi = Modelica.Constants.pi;
  parameter Real KS1 = 1 "(pu) (?0), input channel #1 gain";
  parameter Real T1 = 1 "input channel #1 transducer time constant (sec)";
  parameter Real TW1 = 1 "input channel #1 washout time constant (sec)";
  parameter Real KS2 = 1 "(pu) (?0), input channel #2 gain";
  parameter Real T2 = 1 "input channel #2 transducer time constant (sec)";
  parameter Real TW2 = 1 "input channel #2 washout time constant (sec)";
  parameter Real TW3 = 1 "(>0), main washout time constant (sec)";
  parameter Real A1 = 1;
  parameter Real A2 = 1;
  parameter Real A3 = 1;
  parameter Real A4 = 1;
  parameter Real A5 = 1;
  parameter Real A6 = 1;
  parameter Real A7 = 1;
  parameter Real A8 = 1;
  parameter Real VSTMAX = 10 "(pu), stabilizer output maximum limit";
  parameter Real VSTMIN = -10 "(pu), stabilizer output minimum limit";
  parameter Real M0 = 1 "code for first channel stabilizer input variable" annotation(Dialog(tab = "ICONs"));
  parameter Real M1 = 1 "currently disabled" annotation(Dialog(tab = "ICONs"));
  parameter Real M2 = 1 "code for first channel stabilizer input variable" annotation(Dialog(tab = "ICONs"));
  parameter Real M3 = 1 "currently disabled" annotation(Dialog(tab = "ICONs"));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag lag1(K = KS1, T = T1, y_start = y0_1) annotation(Placement(visible = true, transformation(origin = {-80, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.WashOutFilter washout_filter1(initType = Modelica.Blocks.Types.Init.InitialOutput, TW = TW1) annotation(Placement(visible = true, transformation(origin = {-60, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag lag2(T = T2, K = KS2, y_start = y0_2) annotation(Placement(visible = true, transformation(origin = {-80, 20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.WashOutFilter washout_filter2(TW = TW2, initType = Modelica.Blocks.Types.Init.InitialOutput) annotation(Placement(visible = true, transformation(origin = {-60, 20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.TransferFunction2 transfer_function21(b = {A2, A1, 1}, a = {A4, A3, 1}, y_start = 0) annotation(Placement(visible = true, transformation(origin = {0, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.TransferFunction2 transfer_function22(b = {A6, A5, 1}, a = {A8, A7, 1}, y_start = 0) annotation(Placement(visible = true, transformation(origin = {20, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiter1(uMax = VSTMAX, uMin = VSTMIN) annotation(Placement(visible = true, transformation(origin = {40, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1 annotation(Placement(visible = true, transformation(origin = {-40, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.SignalRouting.Multiplexer multiplexer1(s = M0, n = 6) annotation(Placement(visible = true, transformation(origin = {-80, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.SignalRouting.Multiplexer multiplexer2(s = M2, n = 6) annotation(Placement(visible = true, transformation(origin = {-80, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction tf_TW3(b = {TW30, 0}, a = {TW30, 1}, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = 0) annotation(Placement(visible = true, transformation(origin = {-20, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
protected
  parameter Real y0_1(fixed = false);
  parameter Real y0_2(fixed = false);
  parameter Real TW30(fixed = false, start = 1);
  Real PELEC1, ETERM1, freqDeviation1;
  Real PELEC2, ETERM2, freqDeviation2;
initial algorithm
  TW30 := TW3;
  assert(TW30 <> 0, "parameter TW3 can not be zero.");
  y0_1 := multiplexer1.y * KS1;
  y0_2 := multiplexer2.y * KS2;
equation
  //Input 1 (M0):
  freqDeviation1 = if M0 == 2 then PSS_AUX[1] / 2 / pi else 0;
  PELEC1 = if M0 == 3 then VI[1] * VI[3] + VI[2] * VI[4] else 0;
  ETERM1 = if M0 == 5 then sqrt(VI[1] * VI[1] + VI[2] * VI[2]) else 0;
  //Input 2 (M2):
  freqDeviation2 = if M2 == 2 then PSS_AUX2[1] / 2 / pi else 0;
  PELEC2 = if M2 == 3 then VI2[1] * VI2[3] + VI2[2] * VI2[4] else 0;
  ETERM2 = if M2 == 5 then sqrt(VI2[1] * VI2[1] + VI2[2] * VI2[2]) else 0;
  connect(tf_TW3.y, transfer_function21.u) annotation(Line(points = {{-14.5, 40}, {-5.14208, 40}, {-5.14208, 40}, {-5, 40}}, color = {0, 0, 127}));
  connect(add1.y, tf_TW3.u) annotation(Line(points = {{-34.5, 40}, {-25.9811, 40}, {-25.9811, 40}, {-26, 40}}, color = {0, 0, 127}));
  connect(multiplexer2.y, lag2.u) annotation(Line(points = {{-70, -20}, {-61.2756, -20}, {-61.2756, 6.15034}, {-92.4829, 6.15034}, {-92.4829, 19.8178}, {-85, 19.8178}, {-85, 20}}, color = {0, 0, 127}));
  connect(multiplexer1.y, lag1.u) annotation(Line(points = {{-70, 80}, {-59.4533, 80}, {-59.4533, 54.8975}, {-89.5216, 54.8975}, {-89.5216, 39.8633}, {-85, 39.8633}, {-85, 40}}, color = {0, 0, 127}));
  connect(limiter1.y, VOTHSG) annotation(Line(points = {{45.5, 40}, {95.8998, 40}, {95.8998, 0}, {100, 0}}, color = {0, 0, 127}));
  connect(transfer_function22.y, limiter1.u) annotation(Line(points = {{25, 40}, {34.1686, 40}, {34.1686, 40}, {34, 40}}, color = {0, 0, 127}));
  connect(transfer_function21.y, transfer_function22.u) annotation(Line(points = {{5, 40}, {14.8064, 40}, {14.8064, 40}, {15, 40}}, color = {0, 0, 127}));
  connect(washout_filter1.y, add1.u1) annotation(Line(points = {{-55, 40}, {-51.2528, 40}, {-51.2528, 43.2802}, {-46, 43.2802}, {-46, 43}}, color = {0, 0, 127}));
  connect(washout_filter2.y, add1.u2) annotation(Line(points = {{-55, 20}, {-49.6583, 20}, {-49.6583, 36.6743}, {-46, 36.6743}, {-46, 37}}, color = {0, 0, 127}));
  connect(lag2.y, washout_filter2.u) annotation(Line(points = {{-75, 20}, {-62.1868, 20}, {-62.1868, 19.3622}, {-65, 19.3622}, {-65, 20}}, color = {0, 0, 127}));
  connect(lag1.y, washout_filter1.u) annotation(Line(points = {{-75, 40}, {-65.1481, 40}, {-65.1481, 40}, {-65, 40}}, color = {0, 0, 127}));
  connect(PSS_AUX[1], multiplexer1.u[1]) annotation(Line(points={{-100,-5},{-96,
          -5},{-96,79.1667},{-90,79.1667}},                                                                    color = {0, 0, 127}));
  multiplexer1.u[2] = freqDeviation1;
  multiplexer1.u[3] = PELEC1;
  connect(PSS_AUX[2], multiplexer1.u[4]) annotation(Line(points={{-100,5},{-96,
          5},{-96,80.1667},{-90,80.1667}},                                                                     color = {0, 0, 127}));
  multiplexer1.u[5] = ETERM1;
  multiplexer1.u[6] = 0;
  connect(PSS_AUX2[1], multiplexer2.u[1]) annotation(Line(points={{-100,-65},{
          -96,-65},{-96,-20.8333},{-90,-20.8333}},                                                                    color = {0, 0, 127}));
  multiplexer2.u[2] = freqDeviation2;
  multiplexer2.u[3] = PELEC2;
  connect(PSS_AUX2[2], multiplexer2.u[4]) annotation(Line(points={{-100,-55},{
          -96,-55},{-96,-19.8333},{-90,-19.8333}},                                                                    color = {0, 0, 127}));
  multiplexer2.u[5] = ETERM2;
  multiplexer2.u[6] = 0;
  annotation(Documentation(info = "<html>

<p>
The block diagram of the model is shown below:
</p>
<img src=\"modelica://OpalRT/resource/Stabilizer/PSS3B.png\"
<p>
The following differences exist between this model and the equivalent one in PSS/e:
<ol>
<li>In PSS/e, when TW3 is 0, a fatal error occurs, however simulation runs but the output of the PSS model is always zero. However, in this model, simulation does not run and it issues an error.</li>
<li>In PSS/e, when TW1 or TW2 are zero, then the output of the washout filter blocks are zero (unlike PSS2B). However in this model giving zero values will bypass these blocks.</li>
</ol>

</html>"), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
end PSS3B;
