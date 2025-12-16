within OpalRT.Electrical.Control.Excitation;
model ESST3A "IEEE Type ST3A Excitation System"
  extends OpalRT.Electrical.PartialModel.Exciter;
  parameter Real TR = 0.02 "(sec) regulator input filter time constant";
  parameter Real VIMAX = 10 "(pu) Voltage regulator input maximum limit";
  parameter Real VIMIN = -10 "(pu) Voltage regulator input minimum limit";
  parameter Real KM = 0.02 "Forward gain constant of the inner loop field regulator";
  parameter Real TC = 1 " lead time constant of voltage regulator (s)";
  parameter Real TB = 0.1 " lag time constant of voltage regulator (s)";
  parameter Real KA = 10 "(pu) voltage regulator gain";
  parameter Real TA = 0.02 "(sec) regulator time constant";
  parameter Real VRMAX = 10 "(pu) regulator output maximum limit";
  parameter Real VRMIN = -10 "(pu) regulator output minimum limit";
  parameter Real KG = 1 "Feedback gain constant of the inner loop field regulator";
  parameter Real KP = 1 "Potential circuit gain coefficient";
  parameter Real KI = 0.02 "Potential circuit gain coefficient";
  parameter Real VBMAX = 10 "(pu) regulator output maximum limit";
  parameter Real KC = 1 "Rectifier loading factor proportional to commutating reactance";
  parameter Real XL = 0.02 "Reactance associated with potential source";
  parameter Real VGMAX = 10 "(pu) regulator output maximum limit";
  parameter Real THETAP = 0.52 "Potential circuit phase angle (degrees)";
  parameter Real TM = 0.02 "Forward time constant of the inner loop field regulator";
  parameter Real VMMAX = 10 "(pu) regulator output maximum limit";
  parameter Real VMMIN = -10 "(pu) regulator output minimum limit";
  constant Real pi = Modelica.Constants.pi;
  import OpalRT.Electrical.Control.Excitation.Common.compoundedTransformerFunction;
  import OpalRT.Electrical.Control.Excitation.Common.currentNormalizationFunction;
  import OpalRT.Electrical.Control.Excitation.Common.rectifierFunction;
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag lag1(T = TR, y_start = ECOMP_0) annotation(Placement(visible = true, transformation(origin = {-80, 82}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.Electrical.Control.Excitation.Common.CompoundTransAndRectifer trans_rectifier_normalization_function1(KC = KC, KI = KI, KPmag = KP, KPang = THETAP, XL = XL) annotation(Placement(visible = true, transformation(origin = {-59, -75}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiter1(uMax = VBMAX, uMin = -Modelica.Constants.inf) annotation(Placement(visible = true, transformation(origin = {-28, -76}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Product product1 annotation(Placement(visible = true, transformation(origin = {80, -50}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = KG) annotation(Placement(visible = true, transformation(origin = {80, -20}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.LeadLag lead_lag1(TA = TC, TB = TB, initType = Modelica.Blocks.Types.Init.InitialOutput, K = 1, y_start = VA0) annotation(Placement(visible = true, transformation(origin = {-20, -40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Max HV_Gate annotation(Placement(visible = true, transformation(origin = {-40, -20}, extent = {{-5, -5}, {5, 5}}, rotation = -90)));
  Modelica.Blocks.Nonlinear.Limiter limiter2(uMax = VIMAX, uMin = VIMIN) annotation(Placement(visible = true, transformation(origin = {-40, 20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add4(k2 = +1, k1 = -1) annotation(Placement(visible = true, transformation(origin = {-80, 60}, extent = {{-5, -5}, {5, 5}}, rotation = -90)));
  Modelica.Blocks.Sources.Constant constant1(k = VREF_0) annotation(Placement(visible = true, transformation(origin = {-120, 44}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiter3(uMax = VGMAX, uMin = -Modelica.Constants.inf) annotation(Placement(visible = true, transformation(origin = {60, -20}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunctionNonWindup.Lag_NonWindupLimit lag_non_windup_limit2(KI = KA, TI = TA, VRMAX = VRMAX, VRMIN = VRMIN, y_init = VR0) annotation(Placement(visible = true, transformation(origin = {0, -40}, extent = {{-7.5, -14}, {7.5, 14}}, rotation = 0)));
  Modelica.Blocks.Math.Add add2(k2 = +1, k1 = -1) annotation(Placement(visible = true, transformation(origin = {20, -40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunctionNonWindup.Lag_NonWindupLimit lag_non_windup_limit1(KI = KM, TI = TM, VRMAX = VMMAX, VRMIN = VMMIN, y_init = VM0) annotation(Placement(visible = true, transformation(origin = {51.25, -43.75}, extent = {{-11.25, -16.25}, {11.25, 16.25}}, rotation = 0)));
  Modelica.Blocks.Math.Add3 add1 annotation(Placement(visible = true, transformation(origin = {-60, 20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant2(k = 0) annotation(Placement(visible = true, transformation(origin = {74, 80}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add3(k2 = +1, k1 = +1) annotation(Placement(visible = true, transformation(origin = {-100, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 360)));
  Modelica.Blocks.Sources.RealExpression Ecomp(y = ETERM) annotation(Placement(visible = true, transformation(origin = {-111, 82}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
protected
  parameter Real EFD_0(fixed = false);
  parameter Real ECOMP_0(fixed = false);
  parameter Real VREF_0(fixed = false);
  parameter Real ITERM_0(fixed = false);
  parameter Real ETERM_0(fixed = false);
  parameter Real IFD_0(fixed = false);
  parameter Real VB0(fixed = false);
  parameter Real VM0(fixed = false);
  parameter Real TETAV0(fixed = false);
  parameter Real TETAI0(fixed = false);
  parameter Real VR0(fixed = false);
  parameter Real VA0(fixed = false);
  parameter Real VE0(fixed = false);
  parameter Real IN0(fixed = false);
  parameter Real FEX0(fixed = false);
initial algorithm
  ETERM_0 := EX_AUX[1];
  TETAV0 := EX_AUX[2];
  ITERM_0 := EX_AUX[3];
  TETAI0 := EX_AUX[4];
  IFD_0 := XADIFD;
  EFD_0 := EFD0;
  ECOMP_0 := ETERM0;
  VE0 := compoundedTransformerFunction(ETERM_0, TETAV0, ITERM_0, TETAI0, XL, KP, THETAP, KI);
  IN0 := KC * currentNormalizationFunction(IFD_0, VE0);
  FEX0 := rectifierFunction(IN0);
  VB0 := if VE0 * FEX0 > VBMAX then VBMAX else VE0 * FEX0;
  VM0 := EFD_0 / VB0;
  VR0 := KG * EFD_0 + VM0 / KM;
  VA0 := VR0 / KA;
  VREF_0 := ECOMP_0 + VA0;
  VUEL0 := -Modelica.Constants.inf;
  VOEL0 := 0;
equation
  connect(VUEL, HV_Gate.u2) annotation(Line(points = {{-100, 20}, {-80, 20}, {-80, -10}, {-43, -10}, {-43, -14}}, color = {0, 0, 127}));
  connect(add3.u1, dVREF) annotation(Line(points={{-106,43},{-109.109,43},{
          -109.109,58.085},{-100,58.085},{-100,58}},                                                                                         color = {0, 0, 127}));
  connect(add1.u2, add3.y) annotation(Line(points={{-66,20},{-78.8134,20},{
          -78.8134,21.8673},{-87.0136,21.8673},{-87.0136,40.09},{-94.5,40.09},{
          -94.5,40}},                                                                                                                                                               color = {0, 0, 127}));
  connect(VOEL, add1.u3) annotation(Line(points = {{-100, -8}, {-86.203, -8}, {-86.203, 15.7355}, {-66, 15.7355}, {-66, 16}}, color = {0, 0, 127}));
  connect(add1.u1, add4.y) annotation(Line(points = {{-66, 24}, {-79.8176, 24}, {-79.8176, 54.5}, {-80, 54.5}}, color = {0, 0, 127}));
  connect(add1.y, limiter2.u) annotation(Line(points = {{-54.5, 20}, {-46.9783, 20}, {-46.9783, 20}, {-46, 20}}, color = {0, 0, 127}));
  connect(add2.y, lag_non_windup_limit1.u) annotation(Line(points = {{25.5, -40}, {31.2057, -40}, {31.2057, -43.9716}, {38.875, -43.9716}, {38.875, -43.75}}, color = {0, 0, 127}));
  connect(lag_non_windup_limit1.y, product1.u1) annotation(Line(points = {{63.625, -43.75}, {69.3273, -43.75}, {69.3273, -47.4344}, {74, -47.4344}, {74, -47}}, color = {0, 0, 127}));
  connect(lag_non_windup_limit2.y, add2.u2) annotation(Line(points = {{8.25, -40}, {10.6383, -40}, {10.6383, -43.026}, {14, -43.026}, {14, -43}}, color = {0, 0, 127}));
  connect(limiter3.y, add2.u1) annotation(Line(points = {{54.5, -20}, {9.92908, -20}, {9.92908, -36.643}, {13.948, -36.643}, {13.948, -37}, {14, -37}}, color = {0, 0, 127}));
  connect(lead_lag1.y, lag_non_windup_limit2.u) annotation(Line(points = {{-15, -40}, {-7.98176, -40}, {-8.25, -40}, {-8.25, -40}}, color = {0, 0, 127}));
  connect(gain1.y, limiter3.u) annotation(Line(points = {{74.5, -20}, {65.1327, -20}, {65.1327, -20}, {66, -20}}, color = {0, 0, 127}));
  connect(constant1.y, add3.u2) annotation(Line(points={{-114.5,44},{-111.159,
          44},{-111.159,43.7346},{-106,43.7346},{-106,37}},                                                                                           color = {0, 0, 127}));
  connect(EFD, gain1.u) annotation(Line(points = {{100, 0}, {92.1323, 0}, {92.1323, -19.8404}, {86, -19.8404}, {86, -20}}, color = {0, 0, 127}));
  connect(EFD, product1.y) annotation(Line(points = {{100, 0}, {108, 0}, {108, -50}, {85.5, -50}}, color = {0, 0, 127}));
  connect(lag1.y, add4.u1) annotation(Line(points = {{-75, 82}, {-71.3797, 82}, {-71.3797, 70.2395}, {-76.8529, 70.2395}, {-76.8529, 66}, {-77, 66}}, color = {0, 0, 127}));
  connect(add4.u2, VOTHSG) annotation(Line(points = {{-83, 66}, {-83, 68.8712}, {-87.1152, 68.8712}, {-87.1152, 64.0821}, {-100, 64.0821}, {-100, -36}}, color = {0, 0, 127}));
  connect(limiter2.y, HV_Gate.u1) annotation(Line(points = {{-34.5, 20}, {-32.1551, 20}, {-32.1551, 6}, {-32, 6}, {-32, -10}, {-37, -10}, {-37, -14}}, color = {0, 0, 127}));
  connect(HV_Gate.y, lead_lag1.u) annotation(Line(points = {{-40, -25.5}, {-30.3307, -25.5}, {-30.3307, -40.1368}, {-25, -40.1368}, {-25, -40}}, color = {0, 0, 127}));
  connect(limiter1.y, product1.u2) annotation(Line(points = {{-22.5, -76}, {66.3626, -76}, {66.3626, -53.3637}, {74, -53.3637}, {74, -53}}, color = {0, 0, 127}));
  connect(trans_rectifier_normalization_function1.VB, limiter1.u) annotation(Line(points = {{-43.25, -75.75}, {-46.0661, -75.75}, {-46.0661, -76}, {-34, -76}}, color = {0, 0, 127}));
  connect(trans_rectifier_normalization_function1.IFD, XADIFD) annotation(Line(points = {{-74, -63}, {-95.553, -63}, {-95.553, -64}, {-100, -64}}, color = {0, 0, 127}));
  connect(trans_rectifier_normalization_function1.Iimg, VI[4]) annotation(Line(points={{-74,-87},
          {-78.1491,-87},{-78.1491,-96.144},{-60,-96.144},{-60,-92.5}},                                                                                                               color = {0, 0, 127}));
  connect(trans_rectifier_normalization_function1.Ire, VI[3]) annotation(Line(points={{-74,-81},
          {-78.1491,-81},{-78.1491,-96.144},{-60,-96.144},{-60,-97.5}},                                                                                                              color = {0, 0, 127}));
  connect(trans_rectifier_normalization_function1.Vimg, VI[2]) annotation(Line(points={{-74,-75},
          {-78.1491,-75},{-78.1491,-96.144},{-60,-96.144},{-60,-102.5}},                                                                                                              color = {0, 0, 127}));
  connect(trans_rectifier_normalization_function1.Vre, VI[1]) annotation(Line(points={{-74,-69},
          {-78.1491,-69},{-78.1491,-96.144},{-60,-96.144},{-60,-107.5}},                                                                                                             color = {0, 0, 127}));
  connect(Ecomp.y, lag1.u) annotation(Line(points = {{-100, 82}, {-84, 82}}, color = {0, 0, 127}));
  connect(constant2.y, VF) annotation(Line(points = {{79.5, 80}, {100, 80}}, color = {0, 0, 127}));
  annotation(Documentation(info = "<html>


<img
src=\"modelica://OpalRT/resource/Excitation/ESST3A.png\"
alt=\"ESST3A.png\"><br>
<p>
IMPORTANT!
</p>
<p>
</p>

<p>
In this model, the filter block is as following:
</p>
<img src=\"modelica://OpalRT/resource/Excitation/EXAC1_FILTER.png\"
alt=\"EXAC1.png\"><br>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = false, initialScale = 0.1, grid = {2, 2}), graphics={  Text(origin = {11.4064, -48.3021}, lineColor = {255, 85, 127}, extent = {{-3.08, 3.99}, {3.08, -3.99}}, textString = "VR"), Text(origin = {74.35, -72.92}, lineColor = {170, 0, 0}, extent = {{-3.08, 3.99}, {3.08, -3.99}}, textString = "VB", fontName = "Bahnschrift Light"), Text(origin = {26.9558, -15.5275}, lineColor = {255, 85, 127}, extent = {{-3.08, 3.99}, {3.08, -3.99}}, textString = "VG"), Text(origin = {68.2222, -38.732}, lineColor = {255, 85, 127}, extent = {{-3.08, 3.99}, {3.08, -3.99}}, textString = "VM"), Text(origin = {-11.2013, -34.6312}, lineColor = {255, 85, 127}, extent = {{-3.08, 3.99}, {3.08, -3.99}}, textString = "VA")}));
end ESST3A;
