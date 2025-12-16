within OpalRT.Electrical.Control.Stabilizer;
model IEEEST
  extends OpalRT.Electrical.PartialModel.Stabilizer;
  constant Real pi = Modelica.Constants.pi;
  parameter Integer IBUS = 100 "Located Bus No.";
  parameter String ID = "M1" "Machine Identifier";
  parameter Real A1 = 1;
  parameter Real A2 = 1;
  parameter Real A3 = 1;
  parameter Real A4 = 1;
  parameter Real A5 = 1;
  parameter Real A6 = 1;
  parameter Real T1 = 1 "(sec)";
  parameter Real T2 = 1 "(sec)";
  parameter Real T3 = 1 "(sec)";
  parameter Real T4 = 1 "(sec)";
  parameter Real T5 = 7.5 "(sec)";
  parameter Real T6 = 7.5 "(>0)(sec)";
  parameter Real KS = 15.38;
  parameter Real LSMAX = 0.1;
  parameter Real LSMIN = -0.1;
  parameter Real VCU = 0 "(pu) (if equal zero, ignored)";
  parameter Real VCL = 0 "(pu) (if equal zero, ignored)";
  parameter Real M0 = 1 annotation(Dialog(tab = "ICONs"));
  parameter Real M1 = 1 "currently disabled" annotation(Dialog(tab = "ICONs"));
  OpalRT.Electrical.Control.Stabilizer.Internal.Filter filter1(
    A1=if A1 > 0 then A1 else 0,
    A2=if A2 > 0 then A2 else 0,
    A3=if A3 > 0 then A3 else 0,
    A4=if A4 > 0 then A4 else 0,
    A5=A5,
    A6=A6,
    y_start=VSI0) annotation (Placement(visible=true, transformation(
        origin={-60,40},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Nonlinear.Limiter limiter1(uMax = LSMAX, uMin = LSMIN) annotation(Placement(visible = true, transformation(origin = {0, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.Electrical.Control.Stabilizer.Common.OutputLimiter output_limiter1(VCU = VCU, VCL = VCL) annotation(Placement(visible = true, transformation(origin = {40, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = KS) annotation(Placement(visible = true, transformation(origin = {-70, -20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.SignalRouting.Multiplexer multiplexer1(n = 6, s = M0) annotation(Placement(visible = true, transformation(origin = {-96, 41}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.LeadLag lead_lag1(TA = T1, TB = T2, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = VSI0) annotation(Placement(visible = true, transformation(origin = {-20, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.LeadLag lead_lag2(TA = T3, TB = T4, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = VSI0) annotation(Placement(visible = true, transformation(origin = {20, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  OpalRT.NonElectrical.Math.Continuous.TransferFunction.WashOutFilter2 washout_filter_21(TW1 = T5, TW2 = T6, y_start = if T5 <> 0 then 0 else KS * VSI0) annotation(Placement(visible = true, transformation(origin = {-40, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression Ecomp(y=ETERM)    annotation(Placement(visible = true, transformation(origin={0,-54},      extent = {{-10, -10}, {10, 10}}, rotation = 0)));
protected
  parameter Real T50(start = 1, fixed = false);
  parameter Real VSI0(fixed = false);
protected
  parameter Real T60(start = 1, fixed = false);
  Real PELEC1, ETERM1, freqDeviation1;
initial algorithm
  T50 := T5;
  T60 := T6;
initial equation
  VSI0 = multiplexer1.y;
equation
  //Input 1 (M0):
  freqDeviation1 = if M0 == 2 then PSS_AUX[1] / 2 / pi else 0;
  PELEC1 = if M0 == 3 then VI[1] * VI[3] + VI[2] * VI[4] else 0;
  ETERM1 = if M0 == 5 then sqrt(VI[1] * VI[1] + VI[2] * VI[2]) else 0;
  connect(washout_filter_21.y, limiter1.u) annotation(Line(points = {{-30, -20}, {-13.5318, -20}, {-13.5318, -20}, {-12, -20}}, color = {0, 0, 127}));
  connect(gain1.y, washout_filter_21.u) annotation(Line(points = {{-64.5, -20}, {-50.6089, -20}, {-50.6089, -20}, {-50, -20}}, color = {0, 0, 127}));
  connect(lead_lag2.y, gain1.u) annotation(Line(points = {{30, 40}, {41.1765, 40}, {41.1765, 18.5185}, {-85.8388, 18.5185}, {-85.8388, -19.8257}, {-76, -19.8257}, {-76, -20}}, color = {0, 0, 127}));
  connect(lead_lag1.y, lead_lag2.u) annotation(Line(points = {{-10, 40}, {10.0218, 40}, {10.0218, 40}, {10, 40}}, color = {0, 0, 127}));
  connect(filter1.y, lead_lag1.u) annotation(Line(points = {{-50, 40}, {-29.6296, 40}, {-29.6296, 40}, {-30, 40}}, color = {0, 0, 127}));
  connect(PSS_AUX[1], multiplexer1.u[1]) annotation(Line(points={{-100,-5},{
          -106,-5},{-106,40.1667}},                                                                                      color = {0, 0, 127}));
  multiplexer1.u[2] = freqDeviation1;
  multiplexer1.u[3] = PELEC1;
  connect(PSS_AUX[2], multiplexer1.u[4]) annotation(Line(points={{-100,5},{-106,
          5},{-106,41.1667}},                                                                                          color = {0, 0, 127}));
  multiplexer1.u[5] = ETERM1;
  multiplexer1.u[6] = 0;
  connect(multiplexer1.y, filter1.u) annotation(Line(points = {{-86, 41}, {-74, 41}, {-74, 40}, {-70, 40}, {-70, 40}}, color = {0, 0, 127}));
  connect(Ecomp.y, output_limiter1.VCT) annotation (Line(points={{11,-54},{20,-54}, {20,-26},{30,-26}}, color={0,0,127}));
  connect(output_limiter1.VS, VOTHSG) annotation(Line(points = {{50, -20}, {67.2657, -20}, {67.2657, 0.256739}, {100, 0.256739}, {100, 0}}, color = {0, 0, 127}));
  connect(limiter1.y, output_limiter1.VSS) annotation(Line(points = {{11, -20}, {18.4852, -20}, {18.4852, -13.8639}, {30, -13.8639}, {30, -14}}, color = {0, 0, 127}));
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1})), Documentation(info = "<html>

<p>
Multiplexer blocks are added to the IEEEST, and inputs are considered as vectors. based on the value of M0, proper input is selected by the Multiplexer.
<p>
1- Filter block should be always proper.
</p>
<p>
2- changing A5,A6 does not affect PSS/E simulation results, hence they are considered to be zero.
</p>
<p>
3- VCT is and input and it is connected to ECOMP.
</p>
<img src=\"modelica://OpalRT/resource/Stabilizer/IEEEST.png\"
alt=\"IEEEST.png\"><br>


</html>"));
end IEEEST;
