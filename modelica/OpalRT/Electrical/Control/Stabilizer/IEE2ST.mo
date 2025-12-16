within OpalRT.Electrical.Control.Stabilizer;
model IEE2ST "IEEE Stabilizing Model With Dual-Input Signals"
  extends OpalRT.Electrical.PartialModel.Stabilizer;
  constant Real pi = Modelica.Constants.pi;
  parameter Integer IBUS = 100 "Located Bus No.";
  parameter String ID = "M1" "Machine Identifier";
  parameter Real K1 = 1;
  parameter Real K2 = 1;
  parameter Real T1 = 0.1 "(sec)";
  parameter Real T2 = 0.1 "(sec)";
  parameter Real T3 = 0.1 "(sec)";
  parameter Real T4 = 0.1 "(>0) (sec)";
  parameter Real T5 = 0.1 "(sec)";
  parameter Real T6 = 0.1 "(sec)";
  parameter Real T7 = 0.1 "(sec)";
  parameter Real T8 = 0.1 "(sec)";
  parameter Real T9 = 0.1 "(sec)";
  parameter Real T10 = 0.1 "(sec)";
  parameter Real LSMAX = 1;
  parameter Real LSMIN = -1;
  parameter Real VCU = 1 "(pu)(if equal zero, ignored.)";
  parameter Real VCL = -1 "(pu)(if equal zero, ignored.)";
  parameter Real M0 = 1 "ICS1, first stabilizer input code";
  parameter Real M1 = 2 "IB1, first remote bus number. CURRENLY DISABLED";
  parameter Real M2 = 3 "ICS2, second stabilizer input code";
  parameter Real M3 = 0 "B2, second remote bus number CURRENLY DISABLED";
  Modelica.Blocks.Nonlinear.Limiter limiter1(uMax = LSMAX, uMin = LSMIN) annotation(Placement(visible = true, transformation(origin = {0, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Common.OutputLimiter output_limiter1(VCU = VCU, VCL = VCL) annotation(Placement(visible = true, transformation(origin = {40, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.SignalRouting.Multiplexer multiplexer2(n = 6, s = M2) annotation(Placement(visible = true, transformation(origin = {-90, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.SignalRouting.Multiplexer multiplexer1(n = 6, s = M0) annotation(Placement(visible = true, transformation(origin = {-74, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag lag2(K = K2, T = T2, y_start = y20) annotation(Placement(visible = true, transformation(origin = {-60, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag lag1(K = K1, T = T1, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = y10) annotation(Placement(visible = true, transformation(origin = {-49, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1 annotation(Placement(visible = true, transformation(origin = {-25, 55}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.LeadLag lead_lag2(TA = T7, TB = T8, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = if T3 <> 0 then 0 else y10 + y20) annotation(Placement(visible = true, transformation(origin = {60, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.LeadLag lead_lag1(TA = T5, TB = T6, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = if T3 <> 0 then 0 else y10 + y20) annotation(Placement(visible = true, transformation(origin = {30, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.WashOutFilter2 washout_filter_21(TW1 = T3, TW2 = T4, y_start = if T3 <> 0 then 0 else y10 + y20) annotation(Placement(visible = true, transformation(origin = {0, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.LeadLag lead_lag3(TA = T9, TB = T10, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = if T3 <> 0 then 0 else y10 + y20) annotation(Placement(visible = true, transformation(origin = {-40, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression Ecomp(y=ETERM)    annotation(Placement(visible = true, transformation(origin={0,-49},      extent = {{-10, -10}, {10, 10}}, rotation = 0)));
protected
  parameter Real T50(start = 1, fixed = false);
  parameter Real T60(start = 1, fixed = false);
  parameter Real y10(fixed = false);
  parameter Real y20(fixed = false);
  Real PELEC1, ETERM1, freqDeviation1;
  Real PELEC2, ETERM2, freqDeviation2;
initial algorithm
  T50 := T5;
  T60 := T6;
initial equation
  y10 = multiplexer1.y * K1;
  y20 = multiplexer2.y * K2;
equation
  //Input 1 (M0):
  freqDeviation1 = if M0 == 2 then PSS_AUX[1] / 2 / pi else 0;
  PELEC1 = if M0 == 3 then VI[1] * VI[3] + VI[2] * VI[4] else 0;
  ETERM1 = if M0 == 5 then sqrt(VI[1] * VI[1] + VI[2] * VI[2]) else 0;
  //Input 2 (M2):
  freqDeviation2 = if M2 == 2 then PSS_AUX2[1] / 2 / pi else 0;
  PELEC2 = if M2 == 3 then VI2[1] * VI2[3] + VI2[2] * VI2[4] else 0;
  ETERM2 = if M2 == 5 then sqrt(VI2[1] * VI2[1] + VI2[2] * VI2[2]) else 0;
  connect(lead_lag3.y, limiter1.u) annotation(Line(points = {{-30, -20}, {-13.6546, -20}, {-13.6546, -20}, {-12, -20}}, color = {0, 0, 127}));
  connect(lead_lag2.y, lead_lag3.u) annotation(Line(points = {{70, 50}, {79.7858, 50}, {79.7858, 5.08701}, {-63.7216, 5.08701}, {-63.7216, -20.3481}, {-50, -20.3481}, {-50, -20}}, color = {0, 0, 127}));
  connect(washout_filter_21.y, lead_lag1.u) annotation(Line(points = {{10, 50}, {19.5448, 50}, {19.5448, 50}, {20, 50}}, color = {0, 0, 127}));
  connect(add1.y, washout_filter_21.u) annotation(Line(points = {{-19.5, 55}, {-16.332, 55}, {-16.332, 49.5315}, {-10, 49.5315}, {-10, 50}}, color = {0, 0, 127}));
  connect(lead_lag1.y, lead_lag2.u) annotation(Line(points = {{40, 50}, {50.0218, 50}, {50.0218, 50}, {50, 50}}, color = {0, 0, 127}));
  connect(add1.u2, lag2.y) annotation(Line(points = {{-31, 52}, {-42.5703, 52}, {-42.5703, 39.8929}, {-50, 39.8929}, {-50, 40}}, color = {0, 0, 127}));
  connect(lag1.y, add1.u1) annotation(Line(points = {{-39, 70}, {-35, 70}, {-35, 58}, {-31, 58}}, color = {0, 0, 127}));
  connect(multiplexer1.y, lag1.u) annotation(Line(points = {{-64, 70}, {-59, 70}}, color = {0, 0, 127}));
  connect(multiplexer2.y, lag2.u) annotation(Line(points = {{-80, 40}, {-61.0442, 40}, {-70, 40}, {-70, 40}}, color = {0, 0, 127}));
  connect(PSS_AUX[1], multiplexer1.u[1]) annotation(Line(points={{-100,-5},{
          -100.402,-5},{-100.402,69.1667},{-84,69.1667}},                                                                                        color = {0, 0, 127}));
  multiplexer1.u[2] = freqDeviation1;
  multiplexer1.u[3] = PELEC1;
  connect(PSS_AUX[2], multiplexer1.u[4]) annotation(Line(points={{-100,5},{
          -100.402,5},{-100.402,70.1667},{-84,70.1667}},                                                                                       color = {0, 0, 127}));
  multiplexer1.u[5] = ETERM1;
  multiplexer1.u[6] = 0;
  connect(PSS_AUX2[1], multiplexer2.u[1]) annotation(Line(points={{-100,-65},{
          -100.669,-65},{-100.669,39.1667},{-100,39.1667}},                                                                                        color = {0, 0, 127}));
  multiplexer2.u[2] = freqDeviation2;
  multiplexer2.u[3] = PELEC2;
  connect(PSS_AUX2[2], multiplexer2.u[4]) annotation(Line(points={{-100,-55},{
          -100.669,-55},{-100.669,40.1667},{-100,40.1667}},                                                                                        color = {0, 0, 127}));
  multiplexer2.u[5] = ETERM2;
  multiplexer2.u[6] = 0;
  connect(Ecomp.y, output_limiter1.VCT) annotation (Line(points={{11,-49},{22,-49}, {22,-26},{30,-26}}, color={0,0,127}));
  connect(output_limiter1.VS, VOTHSG) annotation(Line(points = {{50, -20}, {67.2657, -20}, {67.2657, 0.256739}, {100, 0.256739}, {100, 0}}, color = {0, 0, 127}));
  connect(limiter1.y, output_limiter1.VSS) annotation(Line(points = {{11, -20}, {18.4852, -20}, {18.4852, -13.8639}, {30, -13.8639}, {30, -14}}, color = {0, 0, 127}));
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1})), Documentation(info = "<html>

<p>
1- Filter block should be always proper.
</p>
<p>
2- VCT is an input and it is connected to ECOMP.
</p>
<p>
3- M1 and M3 are currently disabled.
<img src=\"modelica://OpalRT/resource/Stabilizer/IEE2ST.png\"
alt=\"IEE2ST.png\"><br>


</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1})));
end IEE2ST;
