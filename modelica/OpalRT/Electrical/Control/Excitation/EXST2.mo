within OpalRT.Electrical.Control.Excitation;
model EXST2
  extends OpalRT.Electrical.PartialModel.Exciter;
  parameter Real TR = 0.1 "(sec)";
  parameter Real KA = 0.2;
  parameter Real TA = 12 "(sec)";
  parameter Real VRMAX = 5;
  parameter Real VRMIN = -5;
  parameter Real KE = 0.2;
  parameter Real TE = 0.08 "(sec)";
  parameter Real KF = 0.2;
  parameter Real TF = 1.2 "(>0) (sec)";
  parameter Real KP = 0.4;
  parameter Real KI = 0.5;
  parameter Real KC = 0.4;
  parameter Real EFDMAX = 5;
  import OpalRT.Electrical.Control.Excitation.Common.compoundedTransformerFunction;
  import OpalRT.Electrical.Control.Excitation.Common.currentNormalizationFunction;
  import OpalRT.Electrical.Control.Excitation.Common.rectifierFunction;
  Modelica.Blocks.Math.Add3 add31 annotation(Placement(visible = true, transformation(origin = {-65, -41}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add3 add32(k3 = +1, k2 = +1, k1 = -1) annotation(Placement(visible = true, transformation(origin = {-30, -20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1(k2 = -1) annotation(Placement(visible = true, transformation(origin = {-50, -20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add4 annotation(Placement(visible = true, transformation(origin = {56, -5}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain3(k = KE) annotation(Placement(visible = true, transformation(origin = {80, -80}, extent = {{-5, -5}, {5, 5}}, rotation = 180)));
  Modelica.Blocks.Math.Add add3(k2 = -1, k1 = +1) annotation(Placement(visible = true, transformation(origin = {60, -40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunctionNonWindup.Integrator_NonWindupLimit non_windup_integrator1(KI = TE0, VRMAX = EFDMAX, VRMIN = 0, y_init = EFD_0) annotation(Placement(visible = true, transformation(origin = {80, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction transferfunction4(initType = Modelica.Blocks.Types.Init.InitialOutput, b = {KF0, 0}, a = {TF10, 1}) annotation(Placement(visible = true, transformation(origin = {123, 71}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunctionNonWindup.Lag_NonWindupLimit lag_non_windup_limit1(KI = KA0, TI = TA0, VRMAX = VRMAX, VRMIN = VRMIN, y_init = VR0) annotation(Placement(visible = true, transformation(origin = {0, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag lag1(T = TR, y_start = ETERM_0) annotation(Placement(visible = true, transformation(origin = {-69, -23}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.Electrical.Control.Excitation.Common.CompoundedTransformer compoundedtransformer1(XL = 0, KPmag = KP, KPang = 0, KI = KI) annotation(Placement(visible = true, transformation(origin = {-49, -90}, extent = {{-20, -10}, {10, 10}}, rotation = 0)));
  OpalRT.Electrical.Control.Excitation.Common.CurrentNormalization currentnormalization1 annotation(Placement(visible = true, transformation(origin = {0, 56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = KC) annotation(Placement(visible = true, transformation(origin = {27, 56}, extent = {{5, -5}, {-5, 5}}, rotation = 180)));
  OpalRT.Electrical.Control.Excitation.Common.Rectifier rectifier1 annotation(Placement(visible = true, transformation(origin = {51, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Product product1 annotation(Placement(visible = true, transformation(origin = {5, 25}, extent = {{-5, -5}, {5, 5}}, rotation = -90)));
  Modelica.Blocks.Sources.Constant const(k = VREF_0) annotation(Placement(visible = true, transformation(origin = {-132, 44}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add2 annotation(Placement(visible = true, transformation(origin = {-100, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression Ecomp(y = ETERM) annotation(Placement(visible = true, transformation(origin = {-122, -23}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
protected
  parameter Real ETERM_0(fixed = false);
  parameter Real TETAV0(fixed = false);
  parameter Real ITERM_0(fixed = false);
  parameter Real TETAI0(fixed = false);
  parameter Real IFD0(fixed = false);
  parameter Real EFD_0(fixed = false);
  parameter Real ECOMP_0(fixed = false);
  parameter Real VREF_0(fixed = false);
  parameter Real VB0(fixed = false);
  parameter Real VR0(fixed = false);
  parameter Real VE0(fixed = false);
  parameter Real FEX0(fixed = false);
  parameter Real IN0(fixed = false);
  parameter Real E00(fixed = false);
  parameter Real TA0(start = 1, fixed = false);
  parameter Real TF10(start = 1, fixed = false);
  parameter Real KA0(fixed = false);
  parameter Real KF0(start = 1, fixed = false);
  parameter Real TE0(start = 1, fixed = false);
initial algorithm
  KA0 := KA;
  TA0 := TA;
  KF0 := KF;
  TF10 := TF;
  TE0 := 1 / TE;
initial equation
  ETERM_0 = EX_AUX[1];
  TETAV0 = EX_AUX[2];
  ITERM_0 = EX_AUX[3];
  TETAI0 = EX_AUX[4];
  IFD0 = XADIFD;
  EFD_0 = EFD0;
  ECOMP_0 = ETERM0;
  VREF_0 = ECOMP_0 + VR0 / KA0;
  VE0 = compoundedTransformerFunction(ETERM_0, TETAV0, ITERM_0, TETAI0, 0, KP, 0, KI);
  IN0 = KC * currentNormalizationFunction(IFD0, VE0);
  FEX0 = rectifierFunction(IN0);
  VB0 = VE0 * FEX0;
  E00 = if TE <> 0 then KE * EFD_0 else EFD_0;
  VR0 = E00 - VB0;
  VUEL0 = 0;
  VOEL0 = 0;
equation
  connect(VF, transferfunction4.y) annotation(Line(points = {{100, 80}, {100, 71}, {117.5, 71}}, color = {0, 0, 127}));
  connect(const.y, add2.u2) annotation(Line(points={{-126.5,44},{-118.509,44},{
          -118.509,36.5039},{-106,36.5039},{-106,37}},                                                                                              color = {0, 0, 127}));
  connect(product1.y, add4.u1) annotation(Line(points = {{5, 19.5}, {5, -1.35318}, {36.2652, -1.35318}, {36.2652, -2}, {50, -2}}, color = {0, 0, 127}));
  connect(product1.u2, currentnormalization1.VE) annotation(Line(points = {{2, 31}, {2, 32}, {-15, 32}, {-15, 48.774}, {-9.6, 48.774}, {-9.6, 49}}, color = {0, 0, 127}));
  connect(rectifier1.FEX, product1.u1) annotation(Line(points = {{61, 56}, {64.1691, 56}, {64.1691, 31.2652}, {46.5778, 31.2652}, {46.5778, 31}, {8, 31}}, color = {0, 0, 127}));
  connect(rectifier1.IN, gain1.y) annotation(Line(points = {{41, 56}, {32.5, 56}}, color = {0, 0, 127}));
  connect(currentnormalization1.IN, gain1.u) annotation(Line(points = {{10, 56}, {21, 56}}, color = {0, 0, 127}));
  connect(currentnormalization1.IFD, XADIFD) annotation(Line(points = {{-9.8, 62.8}, {-20, 62.8}, {-20, 60}, {-19.8376, 60}, {-19.8376, -64}, {-100, -64}}, color = {0, 0, 127}));
  connect(currentnormalization1.VE, compoundedtransformer1.VE) annotation(Line(points = {{-9.6, 49}, {-15, 49}, {-15, -90}, {-38.6, -90}}, color = {0, 0, 127}));
  connect(compoundedtransformer1.ITimg, VI[4]) annotation(Line(points={{-68.9,
          -97.7},{-78.0257,-97.7},{-78.0257,-101.347},{-59.8869,-101.347},{
          -59.8869,-92.5},{-60,-92.5}},                                                                                                                                                              color = {0, 0, 127}));
  connect(compoundedtransformer1.ITre, VI[3]) annotation(Line(points={{-68.9,
          -92.5},{-79.4653,-92.5},{-79.4653,-102.499},{-59.8869,-102.499},{
          -59.8869,-97.5},{-60,-97.5}},                                                                                                                                                             color = {0, 0, 127}));
  connect(compoundedtransformer1.VTimg, VI[2]) annotation(Line(points={{-68.9,
          -87.5},{-81.4807,-87.5},{-81.4807,-103.65},{-59.8869,-103.65},{
          -59.8869,-102.5},{-60,-102.5}},                                                                                                                                                          color = {0, 0, 127}));
  connect(compoundedtransformer1.VTre, VI[1]) annotation(Line(points={{-68.7,
          -82.7},{-83.4961,-82.7},{-83.4961,-104.802},{-59.8869,-104.802},{
          -59.8869,-107.5},{-60,-107.5}},                                                                                                                                                           color = {0, 0, 127}));
  connect(lag1.y, add1.u2) annotation(Line(points = {{-64, -23}, {-61.5139, -23}, {-61.5139, -23.4519}, {-56, -23.4519}, {-56, -23}}, color = {0, 0, 127}));
  connect(Ecomp.y, lag1.u) annotation(Line(points = {{-111, -23}, {-74, -23}}, color = {0, 0, 127}));
  connect(non_windup_integrator1.y, EFD) annotation(Line(points = {{85, -40}, {100.356, -40}, {100.356, -27.6049}, {100, -27.6049}, {100, 0}}, color = {0, 0, 127}));
  connect(lag_non_windup_limit1.y, add4.u2) annotation(Line(points = {{11, -20}, {43.2802, -20}, {43.2802, -8}, {50, -8}}, color = {0, 0, 127}));
  connect(add32.y, lag_non_windup_limit1.u) annotation(Line(points = {{-24.5, -20}, {-11, -20}}, color = {0, 0, 127}));
  connect(transferfunction4.y, add32.u1) annotation(Line(points = {{117.5, 71}, {-38, 71}, {-38, -15.4897}, {-36, -15.4897}, {-36, -16}}, color = {0, 0, 127}));
  connect(non_windup_integrator1.y, transferfunction4.u) annotation(Line(points = {{85, -40}, {138.244, -40}, {138.244, 71}, {129, 71}}, color = {0, 0, 127}));
  connect(non_windup_integrator1.y, gain3.u) annotation(Line(points = {{85, -40}, {100.255, -40}, {100.255, -78.9544}, {86, -78.9544}, {86, -80}}, color = {0, 0, 127}));
  connect(gain3.y, add3.u2) annotation(Line(points = {{74.5, -80}, {46.0137, -80}, {46.0137, -43.0524}, {54, -43.0524}, {54, -43}}, color = {0, 0, 127}));
  connect(add3.y, non_windup_integrator1.u) annotation(Line(points = {{65.5, -40}, {74.9431, -40}, {74.9431, -40}, {75, -40}}, color = {0, 0, 127}));
  connect(add31.y, add32.u3) annotation(Line(points = {{-59.5, -41}, {-38.9749, -41}, {-38.9749, -23.6902}, {-36.2415, -23.6902}, {-36.2415, -24}, {-36, -24}}, color = {0, 0, 127}));
  connect(add1.y, add32.u2) annotation(Line(points = {{-44.5, -20}, {-36, -20}}, color = {0, 0, 127}));
  connect(add2.y, add1.u1) annotation(Line(points={{-94.5,40},{-60.1542,40},{
          -60.1542,-16.9666},{-56,-16.9666},{-56,-17}},                                                                                              color = {0, 0, 127}));
  connect(dVREF, add2.u1) annotation(Line(points={{-100,58},{-113.882,58},{
          -113.882,43.1877},{-106,43.1877},{-106,43}},                                                                                          color = {0, 0, 127}));
  connect(add4.y, add3.u1) annotation(Line(points = {{61.5, -5}, {63, -5}, {63, -27}, {49, -27}, {49, -37}, {54, -37}}, color = {0, 0, 127}));
  connect(VUEL, add31.u1) annotation(Line(points = {{-100, 20}, {-80, 20}, {-80, -37}, {-71, -37}}, color = {0, 0, 127}));
  connect(VOEL, add31.u2) annotation(Line(points = {{-100, -8}, {-82, -8}, {-82, -41}, {-71, -41}}, color = {0, 0, 127}));
  connect(VOTHSG, add31.u3) annotation(Line(points = {{-100, -36}, {-84, -36}, {-84, -45}, {-71, -45}}, color = {0, 0, 127}));
  annotation(Documentation(info = "<html>

<p>
1- In this model, VS = VOTHSG+VUEL+VOEL
</p>
<p>
2- In this model, if KP = 0 and KI=1, then VB=1
</p>
<img src=\"modelica://OpalRT/resource/Excitation/EXST2.png\"
alt=\"EXAC2.png\"><br>
<p>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1})));
end EXST2;
