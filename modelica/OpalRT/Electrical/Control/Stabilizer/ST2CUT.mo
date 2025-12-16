within OpalRT.Electrical.Control.Stabilizer;
model ST2CUT
  extends OpalRT.Electrical.PartialModel.Stabilizer;
  constant Real pi = Modelica.Constants.pi;
  parameter Integer IBUS = 100 "Located Bus No.";
  parameter String ID = "M1" "Machine Identifier";
  parameter Real K1 = 1;
  parameter Real K2 = 1;
  parameter Real T1 = 0.1 "sec";
  parameter Real T2 = 0.1 "sec";
  parameter Real T3 = 0.1 "T3>0 sec";
  parameter Real T4 = 0.1 "T4>0 sec";
  parameter Real T5 = 0.1 "sec";
  parameter Real T6 = 0.1 "sec";
  parameter Real T7 = 0.1 "sec";
  parameter Real T8 = 0.1 "sec";
  parameter Real T9 = 0.1 "sec";
  parameter Real T10 = 0.1 "sec";
  parameter Real LSMAX = 0.3;
  parameter Real LSMIN = -0.3;
  parameter Real VCU = 1.2 "VCU (pu) (if equal zero, ignored)";
  parameter Real VCL = -0.1 "VCL (pu) (if equal zero, ignored)";
  // ICONS
  parameter Real M0 = 1 "ICS1, first stabilizer input code";
  parameter Real M1 = 2 "IB1, first remote bus number. CURRENLY DISABLED";
  parameter Real M2 = 3 "ICS2, second stabilizer input code";
  parameter Real M3 = 0 "B2, second remote bus number CURRENLY DISABLED";
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.LeadLag lead_lag3(TA = T9, TB = T10, y_start = if T3 <> 0 then 0 else y10 + y20) annotation(Placement(visible = true, transformation(origin = {80, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.LeadLag lead_lag2(TA = T7, TB = T8, y_start = if T3 <> 0 then 0 else y10 + y20) annotation(Placement(visible = true, transformation(origin = {54, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.WashOutFilter2 washout_filter(TW1 = T3, TW2 = T4, y_start = if T3 <> 0 then 0 else y10 + y20) annotation(Placement(visible = true, transformation(origin = {0, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1 annotation(Placement(visible = true, transformation(origin = {-20, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag lag1(K = K1, T = T1, y_start = y10) annotation(Placement(visible = true, transformation(origin = {-45, 56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag lag2(K = K2, T = T2, y_start = y20) annotation(Placement(visible = true, transformation(origin = {-44, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.SignalRouting.Multiplexer multiplexer2(n = 6, s = M2) annotation(Placement(visible = true, transformation(origin = {-68, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.SignalRouting.Multiplexer multiplexer1(n = 6, s = M0) annotation(Placement(visible = true, transformation(origin = {-69, 56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.LeadLag lead_lag1(TA = T5, TB = T6, y_start = if T3 <> 0 then 0 else y10 + y20) annotation(Placement(visible = true, transformation(origin = {26, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.Electrical.Control.Stabilizer.Common.Output_Limiter_2 output_limiter_2(VCU = VCU, VCL = VCL) annotation(Placement(visible = true, transformation(origin = {26, -52}, extent = {{-25, -25}, {25, 25}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiter1(uMax = LSMAX, uMin = LSMIN) annotation(Placement(visible = true, transformation(origin = {-40, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = VT0_0) annotation(Placement(visible = true, transformation(origin = {-44, -62}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression Ecomp(y=ETERM)    annotation(Placement(visible = true, transformation(origin={-30,-84},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
protected
  parameter Real T50(start = 1, fixed = false);
  parameter Real T60(start = 1, fixed = false);
  parameter Real y10(fixed = false);
  parameter Real y20(fixed = false);
  parameter Real VT0_0(fixed = false);
  Real PELEC1, ETERM1, freqDeviation1;
  Real PELEC2, ETERM2, freqDeviation2;
initial algorithm
  T50 := T5;
  T60 := T6;
initial equation
  y10 = multiplexer1.y * K1;
  y20 = multiplexer2.y * K2;
  VT0_0 = ETERM;
equation
  //Input 1 (M0):
  freqDeviation1 = if M0 == 2 then PSS_AUX[1] / 2 / pi else 0;
  PELEC1 = if M0 == 3 then VI[1] * VI[3] + VI[2] * VI[4] else 0;
  ETERM1 = if M0 == 5 then sqrt(VI[1] * VI[1] + VI[2] * VI[2]) else 0;
  //Input 2 (M2):
  freqDeviation2 = if M2 == 2 then PSS_AUX2[1] / 2 / pi else 0;
  PELEC2 = if M2 == 3 then VI2[1] * VI2[3] + VI2[2] * VI2[4] else 0;
  ETERM2 = if M2 == 5 then sqrt(VI2[1] * VI2[1] + VI2[2] * VI2[2]) else 0;
  connect(const.y, output_limiter_2.VTO) annotation(Line(points={{-35.2,-62},{
          -9.7561,-62},{-9.7561,-61.5176},{1,-61.5176},{1,-62}},                                                                                                   color = {0, 0, 127}));
  connect(lead_lag3.y, limiter1.u) annotation(Line(points = {{90, 40}, {91.8699, 40}, {91.8699, 9.7561}, {-62.3306, 9.7561}, {-62.3306, -34.9593}, {-53.1165, -32}, {-52, -32}}, color = {0, 0, 127}));
  connect(limiter1.y, output_limiter_2.VSS) annotation(Line(points={{-29,-32},{
          -8.67209,-32},{-8.67209,-31.7073},{1,-31.7073},{1,-32}},                                                                                                      color = {0, 0, 127}));
  connect(multiplexer1.y, lag1.u) annotation(Line(points={{-59,56},{-55.2846,56},
          {-55.2846,56},{-55,56}},                                                                                                color = {0, 0, 127}));
  connect(multiplexer2.y, lag2.u) annotation(Line(points={{-58,24},{-54.7425,24},
          {-54.7425,24},{-54,24}},                                                                                                color = {0, 0, 127}));
  connect(Ecomp.y, output_limiter_2.VT) annotation (Line(points={{-19,-84},{-10,-84},{-10,-72},{1,-72}}, color={0,0,127}));
  connect(output_limiter_2.VS, VOTHSG) annotation(Line(points={{51,-62},{
          75.3388,-62},{75.3388,0.542005},{100,0.542005},{100,0}},                                                                                          color = {0, 0, 127}));
  connect(lead_lag2.y, lead_lag3.u) annotation(Line(points={{64,40},{69.6477,40},
          {69.6477,40},{70,40}},                                                                                                color = {0, 0, 127}));
  connect(lead_lag1.y, lead_lag2.u) annotation(Line(points={{36,40},{43.3604,40},
          {43.3604,40},{44,40}},                                                                                                color = {0, 0, 127}));
  connect(washout_filter.y, lead_lag1.u) annotation(Line(points={{10,40},{
          15.9892,40},{15.9892,40},{16,40}},                                                                                         color = {0, 0, 127}));
  connect(add1.y, washout_filter.u) annotation(Line(points={{-14.5,40},{
          -9.48509,40},{-9.48509,40},{-10,40}},                                                                                       color = {0, 0, 127}));
  connect(lag1.y, add1.u1) annotation(Line(points={{-35,56},{-30.8943,56},{
          -30.8943,42.5474},{-26,42.5474},{-26,43}},                                                                                            color = {0, 0, 127}));
  connect(lag2.y, add1.u2) annotation(Line(points={{-34,24},{-30.3523,24},{
          -30.3523,36.8564},{-26.2873,36.8564},{-26.2873,37},{-26,37}},                                                                                              color = {0, 0, 127}));
  connect(PSS_AUX2[1], multiplexer2.u[1]) annotation(Line(points={{-100,-65},{
          -84.0108,-65},{-84.0108,23.5772},{-78,23.5772},{-78,23.1667}},                                                                                          color = {0, 0, 127}));
  multiplexer2.u[2] = freqDeviation2;
  multiplexer2.u[3] = PELEC2;
  connect(PSS_AUX2[2], multiplexer2.u[4]) annotation(Line(points={{-100,-55},{
          -84.0108,-55},{-84.0108,23.5772},{-78,23.5772},{-78,24.1667}},                                                                                          color = {0, 0, 127}));
  multiplexer2.u[5] = ETERM2;
  multiplexer2.u[6] = 0;
  connect(PSS_AUX[1], multiplexer1.u[1]) annotation(Line(points={{-100,-5},{
          -86.1789,-5},{-86.1789,55.2846},{-79,55.2846},{-79,55.1667}},                                                                                      color = {0, 0, 127}));
  multiplexer1.u[2] = freqDeviation1;
  multiplexer1.u[3] = PELEC1;
  connect(PSS_AUX[2], multiplexer1.u[4]) annotation(Line(points={{-100,5},{
          -86.1789,5},{-86.1789,55.2846},{-79,55.2846},{-79,56.1667}},                                                                                       color = {0, 0, 127}));
  multiplexer1.u[5] = ETERM1;
  multiplexer1.u[6] = 0;
  annotation(Documentation(info = "<html>

<p>
1- Filter blocks should be always proper.
</p>
<p>
2- VT is an input and it is connected to ECOMP.
</p>
<p>
3- VTO is initial value of VT and captured during initialization
</p>
<p>
4- M1 and M3 are currently disabled.

<img src=\"modelica://OpalRT/resource/Stabilizer/ST2CUT.png\"

</html>"), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1})));
end ST2CUT;
