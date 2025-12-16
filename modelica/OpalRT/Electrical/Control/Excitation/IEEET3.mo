within OpalRT.Electrical.Control.Excitation;
model IEEET3 "IEEE Type 3 Excitation System"
  extends OpalRT.Electrical.PartialModel.Exciter;
  parameter Real TR = 0.025 "(sec) regulator input filter time constant";
  parameter Real KA = 10 "(pu) voltage regulator gain";
  parameter Real TA = 0.02 "(sec) regulator time constant";
  parameter Real VRMAX = 10 "(pu) Voltage regulator output maximum limit";
  parameter Real VRMIN = -10 "(pu) Voltage regulator output minimum limit";
  parameter Real TE = 0.35 "Exciter time constant, integration rate associated with exciter control (>0) (sec)";
  parameter Real KF = 0.03 "Excitation control system stabilizer gains";
  parameter Real TF = 0.4 "Excitation control system stabilizer time constant (sec)";
  parameter Real KP = 1 "Potential circuit gain coefficient";
  parameter Real KI = 0.02 "Potential circuit gain coefficient";
  parameter Real VBMAX = 10 "(pu) regulator output maximum limit";
  parameter Real KE = 0.5 "Exciter constant related to self-excited field";
  import OpalRT.Electrical.Control.Excitation.Common.compoundedTransformerFunction;
  import OpalRT.Electrical.Control.Excitation.Common.currentNormalizationFunction;
  Modelica.Blocks.Math.Add3 add31 annotation(Placement(visible = true, transformation(origin = {-60, -20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add2(k1 = -1) annotation(Placement(visible = true, transformation(origin = {0, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag lag1(T = TR, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = ECOMP_0) annotation(Placement(visible = true, transformation(origin = {-60, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add3 add32(k2 = -1) annotation(Placement(visible = true, transformation(origin = {-20, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunctionNonWindup.Lag_NonWindupLimit lag_non_windup_limit1(KI = KA, TI = TA, VRMAX = VRMAX, VRMIN = VRMIN, y_init = VR0) annotation(Placement(visible = true, transformation(origin = {40, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction transferfunction1(initType = Modelica.Blocks.Types.Init.InitialOutput, b = {KF0, 0}, a = {TF0, 1}) annotation(Placement(visible = true, transformation(origin = {40, 60}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain2(k = KE) annotation(Placement(visible = true, transformation(origin = {60, -20}, extent = {{-5, -5}, {5, 5}}, rotation = 180)));
  Modelica.Blocks.Continuous.Integrator integrator1(k = 1 / TE, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = EFD_0) annotation(Placement(visible = true, transformation(origin = {60, 0}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1(k1 = +1, k2 = -1) annotation(Placement(visible = true, transformation(origin = {40, 0}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiter3(uMax = VBMAX, uMin = 0) annotation(Placement(visible = true, transformation(origin = {20, 0}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.Electrical.Control.Excitation.Common.CompoundedTransformer compoundedtransformer1(XL = 0, KPmag = KP, KPang = 0, KI = KI) annotation(Placement(visible = true, transformation(origin = {-40, -80}, extent = {{-20, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = VREF_0) annotation(Placement(visible = true, transformation(origin = {-128, 44}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add3(k1 = +1, k2 = +1) annotation(Placement(visible = true, transformation(origin = {-20, 0}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Product product1 annotation(Placement(visible = true, transformation(origin = {-20, -40}, extent = {{5, -5}, {-5, 5}}, rotation = -90)));
  Modelica.Blocks.Math.Gain gain1(k = 0.78) annotation(Placement(visible = true, transformation(origin = {20, -80}, extent = {{5, -5}, {-5, 5}}, rotation = 180)));
  Modelica.Blocks.Math.Product product3 annotation(Placement(visible = true, transformation(origin = {40, -80}, extent = {{5, -5}, {-5, 5}}, rotation = 180)));
  Modelica.Blocks.Math.Product product2 annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{5, -5}, {-5, 5}}, rotation = 180)));
  OpalRT.Electrical.Control.Excitation.Common.CurrentNormalization currentnormalization1 annotation(Placement(visible = true, transformation(origin = {0, -80}, extent = {{10, 10}, {-10, -10}}, rotation = 180)));

  OpalRT.Electrical.Control.Excitation.Internal.Rectifier2 rectifier21
    annotation (Placement(visible=true, transformation(
        origin={40,-60},
        extent={{10,-10},{-10,10}},
        rotation=0)));
  Modelica.Blocks.Sources.Constant const1(k = 0) annotation(Placement(visible = true, transformation(origin = {74, 80}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add4(k1 = +1, k2 = +1) annotation(Placement(visible = true, transformation(origin = {-40, 60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression Ecomp(y = ETERM) annotation(Placement(visible = true, transformation(origin = {-95, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
protected
  parameter Real TF0(start = 1, fixed = false);
  parameter Real KF0(fixed = false);
  parameter Real ITERM_0(fixed = false);
  parameter Real ETERM_0(fixed = false);
  parameter Real TETAV0(fixed = false);
  parameter Real TETAI0(fixed = false);
  parameter Real IFD0(fixed = false);
  parameter Real EFD_0(fixed = false);
  parameter Real ECOMP_0(fixed = false);
  parameter Real VR0(fixed = false);
  parameter Real VREF_0(fixed = false);
  parameter Real VE0(fixed = false);
  parameter Real VB0(fixed = false);
  parameter Real V30(fixed = false);
  parameter Real V40(fixed = false);
  parameter Real IN0(fixed = false);
  parameter Real IN1(fixed = false);
initial algorithm
  TF0 := TF;
  KF0 := KF;
initial equation
  ETERM_0 = EX_AUX[1];
  TETAV0 = EX_AUX[2];
  ITERM_0 = EX_AUX[3];
  TETAI0 = EX_AUX[4];
  IFD0 = XADIFD;
  EFD_0 = EFD0;
  VE0 = compoundedTransformerFunction(ETERM_0, TETAV0, ITERM_0, TETAI0, 0, KP, 0, KI);
  IN0 = currentNormalizationFunction(IFD0, VE0);
  IN1 = 0.78 * 0.78 * IN0 * IN0;
  V30 = if KE <> 0 then KE * EFD_0 else 0;
  V40 =VE0*Internal.rectifierFunction2(IN1);
  VB0 = V30;
  VR0 = VB0 - V40;
  ECOMP_0 = ETERM0;
  VREF_0 = VR0 / KA + ECOMP_0;
  VUEL0 = 0;
  VOEL0 = 0;
equation
  connect(product3.y, rectifier21.IN) annotation(Line(points = {{45.5, -80}, {58.1528, -80}, {58.1528, -64.0821}, {50, -64.0821}, {50, -64}}, color = {0, 0, 127}));
  connect(XADIFD, currentnormalization1.IFD) annotation(Line(points = {{-100, -64}, {-29.6465, -64}, {-29.6465, -72.9761}, {-9.8, -72.9761}, {-9.8, -73.2}}, color = {0, 0, 127}));
  connect(currentnormalization1.VE, compoundedtransformer1.VE) annotation(Line(points = {{-9.6, -87}, {-30.0885, -87}, {-30.0885, -80.354}, {-29.6, -80.354}, {-29.6, -80}}, color = {0, 0, 127}));
  connect(currentnormalization1.IN, gain1.u) annotation(Line(points = {{10, -80}, {14.1593, -80}, {14.1593, -80}, {14, -80}}, color = {0, 0, 127}));
  connect(rectifier21.FEX, product1.u1) annotation(Line(points = {{30, -64}, {-16.6372, -64}, {-16.6372, -46}, {-17, -46}}, color = {0, 0, 127}));
  product2.u1 = if product3.y >= 1 then 0 else 1;
  connect(add3.y, product2.u2) annotation(Line(points = {{-14.5, 0}, {-11.1745, 0}, {-11.1745, 3.1927}, {-6, 3.1927}, {-6, 3}}, color = {0, 0, 127}));
  connect(product2.y, limiter3.u) annotation(Line(points = {{5.5, 0}, {13.9111, 0}, {13.9111, 0}, {14, 0}}, color = {0, 0, 127}));
  connect(product3.u1, gain1.y) annotation(Line(points = {{34, -83}, {30.0885, -83}, {30.0885, -80.354}, {25.5, -80.354}, {25.5, -80}}, color = {0, 0, 127}));
  connect(gain1.y, product3.u2) annotation(Line(points = {{25.5, -80}, {27.9646, -80}, {27.9646, -76.8142}, {34, -76.8142}, {34, -77}}, color = {0, 0, 127}));
  connect(product1.y, add3.u2) annotation(Line(points = {{-20, -34.5}, {-20, -12.7708}, {-31.927, -12.7708}, {-31.927, -2.7366}, {-26, -2.7366}, {-26, -3}}, color = {0, 0, 127}));
  connect(compoundedtransformer1.VE, product1.u2) annotation(Line(points = {{-29.6, -80}, {-22.805, -80}, {-22.805, -46}, {-23, -46}}, color = {0, 0, 127}));
  connect(add3.u1, lag_non_windup_limit1.y) annotation(Line(points = {{-26, 3}, {-36.26, 3}, {-36.26, 27.5941}, {57.9247, 27.5941}, {57.9247, 40.1368}, {51, 40.1368}, {51, 40}}, color = {0, 0, 127}));
  connect(const.y, add4.u2) annotation(Line(points={{-122.5,44},{-80.9769,44},{
          -80.9769,43.9589},{-46,43.9589},{-46,57}},                                                                                             color = {0, 0, 127}));
  connect(compoundedtransformer1.VTre, VI[1]) annotation(Line(points={{-59.7,
          -72.7},{-75.0273,-72.7},{-75.0273,-98.5823},{-60,-98.5823},{-60,
          -107.5}},                                                                                                                                                           color = {0, 0, 127}));
  connect(compoundedtransformer1.VTimg, VI[2]) annotation(Line(points={{-59.9,
          -77.5},{-73.2824,-77.5},{-73.2824,-97.4918},{-60,-97.4918},{-60,
          -102.5}},                                                                                                                                                            color = {0, 0, 127}));
  connect(compoundedtransformer1.ITre, VI[3]) annotation(Line(points={{-59.9,
          -82.5},{-71.7557,-82.5},{-71.7557,-96.1832},{-60,-96.1832},{-60,-97.5}},                                                                                            color = {0, 0, 127}));
  connect(compoundedtransformer1.ITimg, VI[4]) annotation(Line(points={{-59.9,
          -87.7},{-70.4471,-87.7},{-70.4471,-94.4384},{-60,-94.4384},{-60,-92.5}},                                                                                             color = {0, 0, 127}));
  connect(limiter3.y, add1.u1) annotation(Line(points = {{25.5, 0}, {29.1904, 0}, {29.1904, 2.7366}, {34, 2.7366}, {34, 3}}, color = {0, 0, 127}));
  connect(gain2.y, add1.u2) annotation(Line(points = {{54.5, -20}, {28.7343, -20}, {28.7343, -2.96465}, {33.7514, -2.96465}, {33.7514, -3}, {34, -3}}, color = {0, 0, 127}));
  connect(add1.y, integrator1.u) annotation(Line(points = {{45.5, 0}, {53.5918, 0}, {53.5918, 0}, {54, 0}}, color = {0, 0, 127}));
  connect(integrator1.y, EFD) annotation(Line(points = {{65.5, 0}, {74.0319, 0}, {74.0319, 9.5672}, {100, 9.5672}, {100, 0}}, color = {0, 0, 127}));
  connect(gain2.u, EFD) annotation(Line(points = {{66, -20}, {74.0319, -20}, {74.0319, 9.79499}, {100, 9.79499}, {100, 0}}, color = {0, 0, 127}));
  connect(transferfunction1.y, add2.u1) annotation(Line(points = {{34.5, 60}, {-12.0729, 60}, {-12.0729, 42.369}, {-6, 42.369}, {-6, 43}}, color = {0, 0, 127}));
  connect(transferfunction1.u, EFD) annotation(Line(points = {{46, 60}, {74.2597, 60}, {74.2597, 9.33941}, {100, 9.33941}, {100, 0}}, color = {0, 0, 127}));
  connect(add32.y, add2.u2) annotation(Line(points = {{-14.5, 40}, {-12.0729, 40}, {-12.0729, 36.4465}, {-6, 36.4465}, {-6, 37}}, color = {0, 0, 127}));
  connect(add2.y, lag_non_windup_limit1.u) annotation(Line(points = {{5.5, 40}, {28.246, 40}, {28.246, 40}, {29, 40}}, color = {0, 0, 127}));
  connect(lag1.y, add32.u2) annotation(Line(points = {{-50, 40}, {-25.9681, 40}, {-26, 39.4077}, {-26, 40}}, color = {0, 0, 127}));
  connect(dVREF, add4.u1) annotation(Line(points={{-100,58},{-95.3728,58},{
          -95.3728,63},{-46,63}},                                                                                         color = {0, 0, 127}));
  connect(add4.y, add32.u1) annotation(Line(points={{-34.5,60},{-31.1054,60},{
          -31.1054,44.473},{-26,44.473},{-26,44}},                                                                                              color = {0, 0, 127}));
  connect(add31.y, add32.u3) annotation(Line(points = {{-54.5, -20}, {-41.9134, -20}, {-41.9134, 35.7631}, {-26.1959, 36}, {-26, 36}}, color = {0, 0, 127}));
  connect(VOEL, add31.u3) annotation(Line(points = {{-100, -8}, {-77.6928, -8}, {-77.6928, -24.3378}, {-66, -24.3378}, {-66, -24}}, color = {0, 0, 127}));
  connect(VOTHSG, add31.u1) annotation(Line(points = {{-100, -36}, {-76.6759, -36}, {-76.6759, -16.6092}, {-66, -16.6092}, {-66, -16}}, color = {0, 0, 127}));
  connect(VUEL, add31.u2) annotation(Line(points = {{-100, 20}, {-65.6931, 20}, {-65.6931, -20}, {-66, -20}}, color = {0, 0, 127}));
  connect(Ecomp.y, lag1.u) annotation(Line(points = {{-84, 40}, {-70, 40}}, color = {0, 0, 127}));
  connect(const1.y, VF) annotation(Line(points = {{79.5, 80}, {100, 80}}, color = {0, 0, 127}));
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Documentation(info = "<html>

<p>
1- In this model, VS = VOTHSG+VUEL+VOEL
</p>
<img src=\"modelica://OpalRT/resource/Excitation/IEEET3.png\"
alt=\"IEEET3.png\"><br>

</html>"), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = false, initialScale = 0.1, grid = {2, 2}), graphics={  Line(origin = {-8.67, -14.03}, points = {{-1.8244, -11.0604}, {-1.8244, 11.0604}, {1.8244, 11.0604}}, color = {255, 0, 0}, pattern = LinePattern.Dash, thickness = 1), Text(origin = {0.91, -19.39}, extent = {{-8.67, 3.88}, {14.82, -1.83}}, textString = "if A>1, VB=0;"), Text(origin = {0.84195, -23.3287}, extent = {{-8.67, 3.88}, {51.99, -6.85}}, textString = "(implemented in the code view only)"), Text(origin = {27.1391, -11.3071}, lineColor = {255, 0, 0}, fillColor = {255, 0, 0}, extent = {{-22.221, 18.782}, {-12.28, 13.07}}, textString = "VB")}));
end IEEET3;
