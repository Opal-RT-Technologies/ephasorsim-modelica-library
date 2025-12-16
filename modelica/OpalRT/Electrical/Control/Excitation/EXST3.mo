within OpalRT.Electrical.Control.Excitation;
model EXST3
  extends OpalRT.Electrical.PartialModel.Exciter;
  parameter Real TR = 0.1 "(sec)";
  parameter Real VIMAX = 1;
  parameter Real VIMIN = -1;
  parameter Real KJ = 100;
  parameter Real TC = 12 "(sec)";
  parameter Real TB = 12 "(sec)";
  parameter Real KA = 12;
  parameter Real TA = 0.3 "(sec)";
  parameter Real VRMAX = 5;
  parameter Real VRMIN = -5;
  parameter Real KG = 0.2;
  parameter Real KP = 3.2;
  parameter Real KI = 0.2;
  parameter Real EFDMAX = 5;
  parameter Real KC = 0.4;
  parameter Real XL = 0.3;
  parameter Real VGMAX = 4;
  parameter Real THETAP = 0.52 "radian";
  import OpalRT.Electrical.Control.Excitation.Common.compoundedTransformerFunction;
  import OpalRT.Electrical.Control.Excitation.Common.currentNormalizationFunction;
  import OpalRT.Electrical.Control.Excitation.Common.rectifierFunction;
  Modelica.Blocks.Math.Add add5 annotation(Placement(visible = true, transformation(origin = {-40, -20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1(k2 = +1, k1 = -1) annotation(Placement(visible = true, transformation(origin = {-59, 24}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiter2(uMax = VIMAX, uMin = VIMIN) annotation(Placement(visible = true, transformation(origin = {-20, -20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Product product1 annotation(Placement(visible = true, transformation(origin = {60, 0}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunctionNonWindup.Lag_NonWindupLimit lag_non_windup_limit1(KI = KA0, TI = TA0, VRMAX = VRMAX_1, VRMIN = VRMIN_1, y_init = VR0, gain1(y(start = VR0))) annotation(Placement(visible = true, transformation(origin = {60, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add2(k1 = -1) annotation(Placement(visible = true, transformation(origin = {40, -20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = KG) annotation(Placement(visible = true, transformation(origin = {60, 20}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiter3(uMax = VGMAX, uMin = -Modelica.Constants.inf) annotation(Placement(visible = true, transformation(origin = {40, 20}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add3 add31 annotation(Placement(visible = true, transformation(origin = {-66, -23}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag lag1(T = TR, y_start = ECOMP_0) annotation(Placement(visible = true, transformation(origin = {-78, 86}, extent = {{-6.25, -6.25}, {6.25, 6.25}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction transferfunction1(initType = Modelica.Blocks.Types.Init.InitialOutput, b = {TC0, 1}, a = {TB0, 1}, y_start = VA0) annotation(Placement(visible = true, transformation(origin = {20, -40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain2(k = KJ) annotation(Placement(visible = true, transformation(origin = {0, -40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiter1(uMax = EFDMAX, uMin = -Modelica.Constants.inf, u(start = EFD_0)) annotation(Placement(visible = true, transformation(origin = {80, 0}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = VREF_0) annotation(Placement(visible = true, transformation(origin = {-136, 44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.Electrical.Control.Excitation.Common.CompoundedTransformer compoundedtransformer1(XL = XL, KPmag = KP, KPang = THETAP, KI = KI) annotation(Placement(visible = true, transformation(origin = {46, 60}, extent = {{20, -10}, {-10, 10}}, rotation = 0)));
  OpalRT.Electrical.Control.Excitation.Common.CurrentNormalization currentnormalization1 annotation(Placement(visible = true, transformation(origin = {-15, 68}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain3(k = KC) annotation(Placement(visible = true, transformation(origin = {-37, 68}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  OpalRT.Electrical.Control.Excitation.Common.Rectifier rectifier1 annotation(Placement(visible = true, transformation(origin = {-20, 11}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Product product2 annotation(Placement(visible = true, transformation(origin = {10, 10}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const1(k = 0) annotation(Placement(visible = true, transformation(origin = {61, 87}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add3 annotation(Placement(visible = true, transformation(origin = {-100, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression Ecomp(y = ETERM) annotation(Placement(visible = true, transformation(origin = {-113, 86}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
protected
  parameter Real EFD_0(start = 1, fixed = false);
  parameter Real ECOMP_0(start = 1, fixed = false);
  parameter Real VREF_0(start = 1, fixed = false);
  parameter Real ITERM_0(start = 1, fixed = false);
  parameter Real ETERM_0(start = 1, fixed = false);
  parameter Real IFD_0(start = 1, fixed = false);
  parameter Real VB0(start = 1, fixed = false);
  parameter Real VR0(start = 1, fixed = false);
  parameter Real TETAV0(start = 1, fixed = false);
  parameter Real TETAI0(start = 1, fixed = false);
  parameter Real VA0(start = 1, fixed = false);
  parameter Real VI0(start = 1, fixed = false);
  parameter Real TC0(start = 1, fixed = false);
  parameter Real TB0(start = 1, fixed = false);
  parameter Real KA0(start = 1, fixed = false);
  parameter Real TA0(start = 1, fixed = false);
  parameter Real VRMAX_1(start = 1, fixed = false);
  parameter Real VRMIN_1(start = 1, fixed = false);
  parameter Real VE0(fixed = false);
  parameter Real IN0(fixed = false);
  parameter Real FEX0(fixed = false);
initial algorithm
  TC0 := TC;
  TB0 := TB;
  KA0 := KA;
  TA0 := TA;
  ETERM_0 := EX_AUX[1];
  TETAV0 := EX_AUX[2];
  ITERM_0 := EX_AUX[3];
  TETAI0 := EX_AUX[4];
  IFD_0 := XADIFD;
  EFD_0 := EFD0;
  ECOMP_0 := ETERM;
  VE0 := compoundedTransformerFunction(ETERM_0, TETAV0, ITERM_0, TETAI0, XL, KP, THETAP, KI);
  IN0 := KC * currentNormalizationFunction(IFD_0, VE0);
  FEX0 := rectifierFunction(IN0);
  VB0 := VE0 * FEX0;
  VR0 := EFD_0 / VB0;
  VRMAX_1 := VRMAX;
  VRMIN_1 := VRMIN;
initial equation
  VA0 = if EFD_0 * KG > VGMAX then VR0 / KA0 + VGMAX else VR0 / KA0 + EFD_0 * KG;
  VI0 = VA0 / KJ;
  VREF_0 = ECOMP_0 + VI0;
  VUEL0 = 0;
  VOEL0 = 0;
equation
  connect(rectifier1.IN, gain3.y) annotation(Line(points = {{-30, 7}, {-45, 7}, {-45, 68}, {-42.5, 68}}, color = {0, 0, 127}));
  connect(product2.u2, rectifier1.FEX) annotation(Line(points = {{4, 7}, {-10, 7}}, color = {0, 0, 127}));
  connect(product2.u1, currentnormalization1.VE) annotation(Line(points = {{4, 13}, {-1.5183, 13}, {-1.5183, 61}, {-5.4, 61}}, color = {0, 0, 127}));
  connect(product1.u1, product2.y) annotation(Line(points = {{54, 3}, {20.2977, 3}, {20.2977, 10.2842}, {15.5, 10.2842}, {15.5, 10}}, color = {0, 0, 127}));
  connect(gain3.u, currentnormalization1.IN) annotation(Line(points = {{-31, 68}, {-25, 68}}, color = {0, 0, 127}));
  connect(currentnormalization1.VE, compoundedtransformer1.VE) annotation(Line(points = {{-5.4, 61}, {33.8295, 61}, {33.8295, 60.3518}, {35.6, 60.3518}, {35.6, 60}}, color = {0, 0, 127}));
  connect(currentnormalization1.IFD, XADIFD) annotation(Line(points = {{-5.2, 74.8}, {-2, 74.8}, {-2, 75}, {1, 75}, {1, 97}, {-150, 97}, {-150, -64}, {-100, -64}}, color = {0, 0, 127}));
  connect(compoundedtransformer1.ITimg, VI[4]) annotation(Line(points={{65.9,52.3},
          {110.54,52.3},{110.54,-97.9434},{-60,-97.9434},{-60,-92.5}},                                                                                                  color = {0, 0, 127}));
  connect(compoundedtransformer1.ITre, VI[3]) annotation(Line(points={{65.9,57.5},
          {110.54,57.5},{110.54,-97.9434},{-60,-97.9434},{-60,-97.5}},                                                                                                 color = {0, 0, 127}));
  connect(compoundedtransformer1.VTimg, VI[2]) annotation(Line(points={{65.9,62.5},
          {110.54,62.5},{110.54,-97.9434},{-60,-97.9434},{-60,-102.5}},                                                                                               color = {0, 0, 127}));
  connect(compoundedtransformer1.VTre, VI[1]) annotation(Line(points={{65.7,67.3},
          {110.54,67.3},{110.54,-97.9434},{-60,-97.9434},{-60,-107.5}},                                                                                              color = {0, 0, 127}));
  connect(const.y, add3.u2) annotation(Line(points={{-125,44},{-117.224,44},{-117.224,
          36.7609},{-106,36.7609},{-106,37}},                                                                                                     color = {0, 0, 127}));
  connect(EFD, limiter1.y) annotation(Line(points = {{100, 0}, {85.521, 0}, {85.521, 0}, {85.5, 0}}, color = {0, 0, 127}));
  connect(limiter1.y, gain1.u) annotation(Line(points = {{85.5, 0}, {86.6035, 0}, {86.6035, 20.0271}, {66, 20.0271}, {66, 20}}, color = {0, 0, 127}));
  connect(product1.y, limiter1.u) annotation(Line(points = {{65.5, 0}, {74.1543, 0}, {74.1543, 0}, {74, 0}}, color = {0, 0, 127}));
  connect(gain2.u, limiter2.y) annotation(Line(points = {{-6, -40}, {-11.7, -40}, {-11.7, -19.9783}, {-14.5, -19.9783}, {-14.5, -20}}, color = {0, 0, 127}));
  connect(gain2.y, transferfunction1.u) annotation(Line(points = {{5.5, -40}, {14.0179, -40}, {14.0179, -40}, {14, -40}}, color = {0, 0, 127}));
  connect(transferfunction1.y, add2.u2) annotation(Line(points = {{25.5, -40}, {28.1026, -40}, {28.1026, -22.8814}, {34, -22.8814}, {34, -23}}, color = {0, 0, 127}));
  connect(Ecomp.y, lag1.u) annotation(Line(points = {{-102, 86}, {-84, 86}}, color = {0, 0, 127}));
  connect(add3.y, add1.u2) annotation(Line(points={{-94.5,40},{-74.2931,40},{-74.2931,
          21.0797},{-65,21.0797},{-65,21}},                                                                                                       color = {0, 0, 127}));
  connect(dVREF, add3.u1) annotation(Line(points={{-100,58},{-113.111,58},{-113.111,
          42.9306},{-106,42.9306},{-106,43}},                                                                                                 color = {0, 0, 127}));
  connect(lag1.y, add1.u1) annotation(Line(points = {{-71.75, 86}, {-69, 86}, {-69, 27}, {-65, 27}}, color = {0, 0, 127}));
  connect(add31.y, add5.u2) annotation(Line(points = {{-60.5, -23}, {-50.3383, -23}, {-50.3383, -23.2747}, {-46, -23.2747}, {-46, -23}}, color = {0, 0, 127}));
  connect(limiter3.y, add2.u1) annotation(Line(points = {{34.5, 20}, {24.8985, 20}, {24.8985, -17.3207}, {34, -17.3207}, {34, -17}}, color = {0, 0, 127}));
  connect(gain1.y, limiter3.u) annotation(Line(points = {{54.5, 20}, {46.0081, 20}, {46.0081, 20}, {46, 20}}, color = {0, 0, 127}));
  connect(add2.y, lag_non_windup_limit1.u) annotation(Line(points = {{45.5, -20}, {48.5269, -20}, {48.5269, -20}, {49, -20}}, color = {0, 0, 127}));
  connect(lag_non_windup_limit1.y, product1.u2) annotation(Line(points = {{71, -20}, {73.5582, -20}, {73.5582, -7.98544}, {48.0662, -7.98544}, {48.0662, -3.07132}, {54, -3.07132}, {54, -3}}, color = {0, 0, 127}));
  connect(add5.y, limiter2.u) annotation(Line(points = {{-34.5, -20}, {-26.5223, -20}, {-26.5223, -20}, {-26, -20}}, color = {0, 0, 127}));
  connect(add1.y, add5.u1) annotation(Line(points = {{-53.5, 24}, {-51.9621, 24}, {-51.9621, -17.3207}, {-46, -17.3207}, {-46, -17}}, color = {0, 0, 127}));
  connect(VOTHSG, add31.u3) annotation(Line(points = {{-100, -36}, {-86, -36}, {-86, -27}, {-72, -27}}, color = {0, 0, 127}));
  connect(VOEL, add31.u2) annotation(Line(points = {{-100, -8}, {-86, -8}, {-86, -23}, {-72, -23}}, color = {0, 0, 127}));
  connect(VUEL, add31.u1) annotation(Line(points = {{-100, 20}, {-80, 20}, {-80, -19}, {-72, -19}}, color = {0, 0, 127}));
  connect(VF, const1.y) annotation(Line(points = {{100, 80}, {95, 80}, {95, 87}, {72, 87}}, color = {0, 0, 127}));
  annotation(Documentation(info = "<html>

<p>
1- In this model, VS = VOTHSG+VUEL+VOEL
</p>
<img src=\"modelica://OpalRT/resource/Excitation/EXST3.png\"
alt=\"EXAC3.png\"><br>
<p>
</html>"), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1})));
end EXST3;
