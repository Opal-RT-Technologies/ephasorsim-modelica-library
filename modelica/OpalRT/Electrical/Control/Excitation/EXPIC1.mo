within OpalRT.Electrical.Control.Excitation;
model EXPIC1
  extends OpalRT.Electrical.PartialModel.Exciter;
  parameter Real TR = 0.1 "(sec)";
  parameter Real KA = 0.2;
  parameter Real TA1 = 12 "(sec)";
  parameter Real VR1 = 5;
  parameter Real VR2 = -5;
  parameter Real TA2 = 10 "(sec)";
  parameter Real TA3 = 400;
  parameter Real TA4 = 5 "(sec)";
  parameter Real VRMAX = 5;
  parameter Real VRMIN = -5;
  parameter Real KF = 0.2;
  parameter Real TF1 = 1.2 "(>0) (sec)";
  parameter Real TF2 = 1.2 "(>0) (sec)";
  parameter Real EFDMAX = 5 "or zero";
  parameter Real EFDMIN = -5;
  parameter Real KE = 0.2;
  parameter Real TE = 0.08 "(sec)";
  parameter Real E1 = 4;
  parameter Real SE_E1 = 0.4;
  parameter Real E2 = 5;
  parameter Real SE_E2 = 0.5;
  parameter Real KP = 0.4;
  parameter Real KI = 0.5;
  parameter Real KC = 0.4;
  import sat_q = OpalRT.NonElectrical.Math.Nonlinear.computeSaturationQuadratic;
  import OpalRT.Electrical.Control.Excitation.Common.compoundedTransformerFunction;
  import OpalRT.Electrical.Control.Excitation.Common.currentNormalizationFunction;
  import OpalRT.Electrical.Control.Excitation.Common.rectifierFunction;
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag lag1(T = TR, y_start = ECOMP_0) annotation(Placement(visible = true, transformation(origin = {-80, -20}, extent = {{-6.25, -6.25}, {6.25, 6.25}}, rotation = 0)));
  Modelica.Blocks.Math.Add3 add31 annotation(Placement(visible = true, transformation(origin = {-78, -48}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1(k2 = +1, k1 = -1) annotation(Placement(visible = true, transformation(origin = {-40, -20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add3 add32(k2 = -1) annotation(Placement(visible = true, transformation(origin = {-60, -20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Product product1 annotation(Placement(visible = true, transformation(origin = {40, 20}, extent = {{-5, -5}, {5, 5}}, rotation = 90)));
  Modelica.Blocks.Continuous.Integrator integrator1(k = if TE <> 0 then 1 / TE else 1, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = if TE <> 0 then EFD_0 else 0) annotation(Placement(visible = true, transformation(origin = {80, -40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  NonElectrical.Math.Nonlinear.SaturationQuadratic saturation1(E1 = E1, E2 = E2, SE_E1 = SE_E1, SE_E2 = SE_E2) annotation(Placement(visible = true, transformation(origin = {80, -58}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain3(k = KE) annotation(Placement(visible = true, transformation(origin = {80, -84}, extent = {{-5, -5}, {5, 5}}, rotation = 180)));
  Modelica.Blocks.Math.Add add3(k2 = -1, k1 = +1) annotation(Placement(visible = true, transformation(origin = {60, -40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add2(k2 = +1, k1 = +1) annotation(Placement(visible = true, transformation(origin = {40, -68}, extent = {{5, -5}, {-5, 5}}, rotation = 360)));
  Modelica.Blocks.Nonlinear.Limiter limiter2(uMax = EFDMAX, uMin = EFDMIN) annotation(Placement(visible = true, transformation(origin = {80, 0}, extent = {{5, -5}, {-5, 5}}, rotation = 360)));
  Modelica.Blocks.Continuous.TransferFunction transferfunction4(initType = Modelica.Blocks.Types.Init.InitialOutput, b = {1, 0}, a = {TF10 + TF20, 1}) annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunctionWindup.PI_WindupLimit pi_non_windup_limit1(KI = KA, KP = KA * TA1, MAX = VR1, MIN = VR2, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = VA0) annotation(Placement(visible = true, transformation(origin = {-20, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction transferfunction1(b = {TA30, 1}, a = if TA20 * TA40 <> 0 then {TA20 * TA40, TA20 + TA40, 1} else {1, 1, 1}, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = VA0) annotation(Placement(visible = true, transformation(origin = {0, -20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiter1(uMax = VRMAX, uMin = VRMIN) annotation(Placement(visible = true, transformation(origin = {20, -20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction transferfunction3(initType = Modelica.Blocks.Types.Init.SteadyState, b = {1, 0}, a = if TF10 * TF20 <> 0 then {TF10 * TF20, TF10 + TF20, 1} else {1, 1, 1}, y_start = 0) annotation(Placement(visible = true, transformation(origin = {0, 20}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = KF) annotation(Placement(visible = true, transformation(origin = {-34, 6}, extent = {{-5, -5}, {5, 5}}, rotation = 180)));
  Modelica.Blocks.Continuous.TransferFunction transferfunction2(b = {TA30, 1}, a = if TA20 + TA40 <> 0 then {TA20 + TA40, 1} else {1, 1}, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = VA0) annotation(Placement(visible = true, transformation(origin = {0, -42}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Product product annotation(Placement(transformation(extent = {{66, -66}, {56, -56}})));
  OpalRT.Electrical.Control.Excitation.Common.CompoundedTransformer compoundedtransformer1(XL = 0, KPmag = KP, KPang = 0, KI = KI) annotation(Placement(visible = true, transformation(origin = {-60, 60}, extent = {{-20, -10}, {10, 10}}, rotation = 0)));
  OpalRT.Electrical.Control.Excitation.Common.CurrentNormalization currentnormalization1 annotation(Placement(visible = true, transformation(origin = {-20, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain2(k = KC) annotation(Placement(visible = true, transformation(origin = {0, 60}, extent = {{5, -5}, {-5, 5}}, rotation = 180)));
  OpalRT.Electrical.Control.Excitation.Common.Rectifier rectifier1 annotation(Placement(visible = true, transformation(origin = {20, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Product product2 annotation(Placement(visible = true, transformation(origin = {20, 20}, extent = {{-5, -5}, {5, 5}}, rotation = -90)));
  Modelica.Blocks.Sources.Constant const(k = VREF_0) annotation(Placement(transformation(extent = {{-149, 34}, {-129, 54}})));
  Modelica.Blocks.Math.Add add4(k2 = +1, k1 = +1) annotation(Placement(visible = true, transformation(origin = {-100, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 360)));
  Modelica.Blocks.Sources.RealExpression Ecomp(y = ETERM) annotation(Placement(visible = true, transformation(origin = {-137, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
protected
  parameter Real ETERM_0(fixed = false);
  parameter Real TETAV0(fixed = false);
  parameter Real ITERM_0(fixed = false);
  parameter Real TETAI0(fixed = false);
  parameter Real IFD0(fixed = false);
  parameter Real EFD_0(fixed = false);
  parameter Real ECOMP_0(fixed = false);
  parameter Real VREF_0(fixed = false);
  parameter Real SE0(fixed = false);
  parameter Real VB0(fixed = false);
  parameter Real VA0(fixed = false);
  parameter Real VE0(fixed = false);
  parameter Real IN0(fixed = false);
  parameter Real FEX0(fixed = false);
  parameter Real E00(fixed = false);
  parameter Real TA20(start = 1, fixed = false);
  parameter Real TA30(fixed = false);
  parameter Real TA40(start = 1, fixed = false);
  parameter Real TF10(start = 1, fixed = false);
  parameter Real TF20(start = 1, fixed = false);
initial algorithm
  TA20 := TA2;
  TA30 := TA3;
  TA40 := TA4;
  TF10 := TF1;
  TF20 := TF2;
initial equation
  ETERM_0 = EX_AUX[1];
  TETAV0 = EX_AUX[2];
  ITERM_0 = EX_AUX[3];
  TETAI0 = EX_AUX[4];
  IFD0 = XADIFD;
  EFD_0 = EFD0;
  ECOMP_0 = ETERM0;
  VREF_0 = ECOMP_0;
  SE0 = sat_q(EFD_0, E1, E2, SE_E1, SE_E2);
  VE0 = compoundedTransformerFunction(ETERM_0, TETAV0, ITERM_0, TETAI0, 0, KP, 0, KI);
  IN0 = KC * currentNormalizationFunction(IFD0, VE0);
  FEX0 = rectifierFunction(IN0);
  VB0 = VE0 * FEX0;
  E00 = if TE <> 0 then (KE + SE0) * EFD_0 else EFD_0;
  VA0 = E00 / VB0;
  VUEL0 = 0;
  VOEL0 = 0;
equation
  connect(add1.u1, VF) annotation(Line(points = {{-46, -17}, {-47.836, -17}, {-47.836, 20}, {-48, 20}, {-48, 80}, {100, 80}}, color = {0, 0, 127}));
  connect(product2.y, product1.u1) annotation(Line(points = {{20, 14.5}, {20, 5.14208}, {37.0771, 5.14208}, {37.0771, 14}, {37, 14}}, color = {0, 0, 127}));
  connect(product2.u1, rectifier1.FEX) annotation(Line(points = {{23, 26}, {23, 38.4303}, {39.5129, 38.4303}, {39.5129, 56.8336}, {30, 56.8336}, {30, 56}}, color = {0, 0, 127}));
  connect(product2.u2, currentnormalization1.VE) annotation(Line(points = {{17, 26}, {17, 37.0771}, {-43.3018, 37.0771}, {-43.3018, 53.3153}, {-29.6, 53.3153}, {-29.6, 53}}, color = {0, 0, 127}));
  connect(rectifier1.IN, gain2.y) annotation(Line(points = {{10, 56}, {5.41272, 56}, {5.41272, 60}, {5.5, 60}}, color = {0, 0, 127}));
  connect(currentnormalization1.IN, gain2.u) annotation(Line(points = {{-10, 60}, {-5.95399, 60}, {-5.95399, 60}, {-6, 60}}, color = {0, 0, 127}));
  connect(currentnormalization1.IFD, XADIFD) annotation(Line(points = {{-29.8, 66.8}, {-36, 66.8}, {-36, 66}, {-44, 66}, {-44, 100.168}, {-120.379, 100.168}, {-120.379, -64}, {-100, -64}}, color = {0, 0, 127}));
  connect(currentnormalization1.VE, compoundedtransformer1.VE) annotation(Line(points = {{-29.6, 53}, {-43.0311, 53}, {-43.0311, 60.3518}, {-49.6, 60.3518}, {-49.6, 60}}, color = {0, 0, 127}));
  connect(compoundedtransformer1.ITimg, VI[4]) annotation(Line(points={{-79.9,52.3},
          {-112.082,52.3},{-112.082,-98.4576},{-60,-98.4576},{-60,-92.5}},                                                                                                   color = {0, 0, 127}));
  connect(compoundedtransformer1.ITre, VI[3]) annotation(Line(points={{-79.9,57.5},
          {-112.082,57.5},{-112.082,-98.4576},{-60,-98.4576},{-60,-97.5}},                                                                                                  color = {0, 0, 127}));
  connect(compoundedtransformer1.VTimg, VI[2]) annotation(Line(points={{-79.9,62.5},
          {-112.082,62.5},{-112.082,-98.4576},{-60,-98.4576},{-60,-102.5}},                                                                                                  color = {0, 0, 127}));
  connect(compoundedtransformer1.VTre, VI[1]) annotation(Line(points={{-79.7,67.3},
          {-112.082,67.3},{-112.082,-98.4576},{-60,-98.4576},{-60,-107.5}},                                                                                                 color = {0, 0, 127}));
  connect(pi_non_windup_limit1.y, transferfunction2.u) annotation(Line(points = {{-10, -20}, {-9.38834, -20}, {-9.38834, -42.2475}, {-6.49962, -42}, {-6, -42}}, color = {0, 0, 127}));
  gain1.u = if TF1 * TF2 <> 0 then transferfunction3.y else transferfunction4.y;
  limiter1.u = if TA2 * TA4 <> 0 then transferfunction1.y elseif TA2 + TA4 <> 0 then transferfunction2.y else pi_non_windup_limit1.y;
  // In the block diagram, E0 = limiter2.y;
  EFD = if TE <> 0 then integrator1.y else limiter2.y;
  connect(integrator1.y, gain3.u) annotation(Line(points = {{85.5, -40}, {93.851, -40}, {93.851, -84.4745}, {86, -84.4745}, {86, -84}}, color = {0, 0, 127}));
  connect(transferfunction3.u, transferfunction4.u) annotation(Line(points = {{6, 20}, {13.4396, 20}, {13.4396, -0.455581}, {6, -0.455581}, {6, 0}}, color = {0, 0, 127}));
  connect(gain1.y, add1.u1) annotation(Line(points = {{-39.5, 6}, {-47.7084, 6}, {-47.7084, -17.0843}, {-46, -17.0843}, {-46, -17}}, color = {0, 0, 127}));
  connect(add2.y, add3.u2) annotation(Line(points = {{34.5, -68}, {27.2192, -68}, {27.2192, -43.2192}, {54, -43.2192}, {54, -43}}, color = {0, 0, 127}));
  connect(gain3.y, add2.u2) annotation(Line(points = {{74.5, -84}, {60.4606, -84}, {60.4606, -70.8213}, {46, -70.8213}, {46, -71}}, color = {0, 0, 127}));
  connect(limiter2.y, add3.u1) annotation(Line(points = {{74.5, 0}, {47.9406, 0}, {47.9406, -36.8634}, {54, -36.8634}, {54, -37}}, color = {0, 0, 127}));
  connect(add3.y, integrator1.u) annotation(Line(points = {{65.5, -40}, {74.2716, -40}, {74.2716, -40}, {74, -40}}, color = {0, 0, 127}));
  connect(limiter1.y, transferfunction4.u) annotation(Line(points = {{25.5, -20}, {43.0524, -20}, {43.0524, -0.455581}, {6, -0.455581}, {6, 0}}, color = {0, 0, 127}));
  connect(limiter1.y, product1.u2) annotation(Line(points = {{25.5, -20}, {43.0524, -20}, {43.0524, 14}, {43, 14}}, color = {0, 0, 127}));
  connect(pi_non_windup_limit1.y, transferfunction1.u) annotation(Line(points = {{-10, -20}, {-6.15034, -20}, {-6.15034, -20}, {-6, -20}}, color = {0, 0, 127}));
  connect(add1.y, pi_non_windup_limit1.u) annotation(Line(points = {{-34.5, -20}, {-30.5239, -20}, {-30.5239, -20}, {-30, -20}}, color = {0, 0, 127}));
  connect(product1.y, limiter2.u) annotation(Line(points = {{40, 25.5}, {40, 28.9294}, {91.7995, 28.9294}, {91.7995, 0}, {86, 0}, {86, 0}}, color = {0, 0, 127}));
  connect(Ecomp.y, lag1.u) annotation(Line(points = {{-126, -20}, {-86, -20}}, color = {0, 0, 127}));
  connect(dVREF, add4.u1) annotation(Line(points={{-100,58},{-114.653,58},{-114.653,
          59.6401},{-106,59.6401},{-106,43}},                                                                                                   color = {0, 0, 127}));
  connect(add4.y, add32.u1) annotation(Line(points={{-94.5,40},{-71.4653,40},{-71.4653,
          -15.9383},{-66,-15.9383},{-66,-16}},                                                                                                        color = {0, 0, 127}));
  connect(add31.y, add32.u3) annotation(Line(points = {{-72.5, -48}, {-71.3402, -48}, {-71.3402, -23.8341}, {-66, -23.8341}, {-66, -24}}, color = {0, 0, 127}));
  connect(lag1.y, add32.u2) annotation(Line(points = {{-73.75, -20}, {-65.9896, -20}, {-65.9896, -20}, {-66, -20}}, color = {0, 0, 127}));
  connect(add32.y, add1.u2) annotation(Line(points = {{-54.5, -20}, {-52.0459, -20}, {-52.0459, -23.3477}, {-46, -23.3477}, {-46, -23}}, color = {0, 0, 127}));
  connect(VUEL, add31.u3) annotation(Line(points = {{-100, 20}, {-87.0674, 20}, {-87.0674, -52}, {-84, -52}}, color = {0, 0, 127}));
  connect(VOTHSG, add31.u1) annotation(Line(points = {{-100, -36}, {-86.9053, -36}, {-86.9053, -44}, {-84, -44}}, color = {0, 0, 127}));
  connect(VOEL, add31.u2) annotation(Line(points = {{-100, -8}, {-86.5604, -8}, {-86.5604, -48}, {-84, -48}}, color = {0, 0, 127}));
  connect(saturation1.u, gain3.u) annotation(Line(points = {{85, -58}, {90, -58}, {94, -58}, {94, -84.4745}, {86, -84.4745}, {86, -84}}, color = {0, 0, 127}));
  connect(product.u2, gain3.u) annotation(Line(points = {{67, -64}, {94, -64}, {94, -84.4745}, {86, -84.4745}, {86, -84}}, color = {0, 0, 127}));
  connect(product.u1, saturation1.y) annotation(Line(points = {{67, -58}, {75, -58}}, color = {0, 0, 127}));
  connect(add2.u1, product.y) annotation(Line(points = {{46, -65}, {50, -65}, {50, -61}, {55.5, -61}}, color = {0, 0, 127}));
  connect(const.y, add4.u2) annotation(Line(points={{-128,44},{-116.967,44},{-116.967,
          37.018},{-106,37.018},{-106,37}},                                                                                                    color = {0, 0, 127}));
  annotation(Documentation(info = "<html>

<p>
1- In this model, VS = VOTHSG+VUEL+VOEL
</p>
<p>
2- In this model, if KP = 0 and KI=0, then VB=1.
</p>
<p>
3- In addition, if TE = 0, then EFD=E0.
</p>
<img src=\"modelica://OpalRT/resource/Excitation/EXPIC1.png\"
alt=\"EXPIC1.png\"><br>
<p>
4- In this model, the filter block is as following:
</p>
<img src=\"modelica://OpalRT/resource/Excitation/EXAC1_FILTER.png\"
alt=\"EXAC1.png\"><br>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = false, initialScale = 0.1, grid = {2, 2}), graphics={  Text(origin = {-67.1213, -18.8346}, lineColor = {255, 85, 0}, extent = {{-4.1, 2.28}, {-1.28433, -1.96109}}, textString = "ET"), Text(origin = {33.8962, 8.61396}, lineColor = {255, 85, 0}, extent = {{-4.1, 2.28}, {4.1, -2.28}}, textString = "VB"), Text(origin = {-6.32335, -24.6034}, lineColor = {255, 85, 0}, extent = {{-4.1, 2.28}, {2.48, -1.63}}, textString = "VA"), Text(origin = {12.6868, -31.4056}, lineColor = {255, 85, 0}, extent = {{-4.1, 2.28}, {1.83009, -1.46932}}, textString = "VR"), Text(origin = {55.0285, -14.7735}, lineColor = {255, 85, 0}, extent = {{-4.1, 2.28}, {1.0194, -3.25282}}, textString = "E0"), Text(origin = {-39.86, -72.55}, lineColor = {255, 0, 0}, extent = {{-4.33, 3.3}, {4.33, -3.3}}, textString = "VF")}));
end EXPIC1;
