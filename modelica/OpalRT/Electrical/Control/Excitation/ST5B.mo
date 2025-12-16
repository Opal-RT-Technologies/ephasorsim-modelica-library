within OpalRT.Electrical.Control.Excitation;
model ST5B "IEEE 421.5 2005 ST5B Excitation System"
  extends OpalRT.Electrical.PartialModel.Exciter;
  parameter Real TR = 0.1 "regulator input filter time constant (sec)";
  parameter Real TC1 = 0.1 "lead time constant of first lead-lag block (voltage regulator channel) (sec)";
  parameter Real TB1 = 0.1 "lag time constant of first lead-lag block (voltage regulator channel) (sec)";
  parameter Real TC2 = 0.1 "lead time constant of second lead-lag block (voltage regulator channel) (sec)";
  parameter Real TB2 = 0.1 "lag time constant of second lead-lag block (voltage regulator channel) (sec)";
  parameter Real KR = 0.1 "(>0) (pu) voltage regulator gain";
  parameter Real VRMAX = 100 "(pu) voltage regulator maximum limit";
  parameter Real VRMIN = -100 "(pu) voltage regulator minimum limit";
  parameter Real T1 = 0.1 "voltage regulator time constant (sec)";
  parameter Real KC = 0.1 "(pu)";
  parameter Real TUC1 = 0.1 "lead time constant of first lead-lag block (under excitation channel) (sec)";
  parameter Real TUB1 = 0.1 "lag time constant of first lead-lag block (under-excitation channel) (sec)";
  parameter Real TUC2 = 0.1 "lead time constant of second lead-lag block (under-excitation channel) (sec)";
  parameter Real TUB2 = 0.1 "lag time constant of second lead-lag block (under-excitation channel) (sec)";
  parameter Real TOC1 = 0.1 "lead time constant of first lead-lag block (over-excitation channel) (sec)";
  parameter Real TOB1 = 0.1 "lag time constant of first lead-lag block (over-excitation channel) (sec)";
  parameter Real TOC2 = 0.1 "lead time constant of second lead-lag block (over-excitation channel) (sec)";
  parameter Real TOB2 = 0.1 "lag time constant of second lead-lag block (over-excitation channel) (sec)";
  OpalRT.NonElectrical.Math.Continuous.TransferFunctionNonWindup.LeadLag_NonWindupLimit leadlag_non_windup_limit1(T1 = TC1, T2 = TB1, MIN = VRMIN / KR, MAX = VRMAX / KR, y_start = V1_0, initType = Modelica.Blocks.Types.Init.InitialOutput) annotation(Placement(visible = true, transformation(origin = {-20, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunctionNonWindup.LeadLag_NonWindupLimit leadlag_non_windup_limit2(T1 = TC2, T2 = TB2, MIN = VRMIN / KR, MAX = VRMAX / KR, y_start = V1_0, initType = Modelica.Blocks.Types.Init.InitialOutput) annotation(Placement(visible = true, transformation(origin = {20, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunctionNonWindup.LeadLag_NonWindupLimit leadlag_non_windup_limit3(T1 = TUC2, T2 = TUB2, MIN = VRMIN / KR, MAX = VRMAX / KR, y_start = V1_0, initType = Modelica.Blocks.Types.Init.InitialOutput) annotation(Placement(visible = true, transformation(origin = {20, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunctionNonWindup.LeadLag_NonWindupLimit leadlag_non_windup_limit4(T1 = TUC1, T2 = TUB1, MIN = VRMIN / KR, MAX = VRMAX / KR, y_start = V1_0, initType = Modelica.Blocks.Types.Init.InitialOutput) annotation(Placement(visible = true, transformation(origin = {-20, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunctionNonWindup.LeadLag_NonWindupLimit leadlag_non_windup_limit5(T1 = TOC1, T2 = TOB1, MIN = VRMIN / KR, MAX = VRMAX / KR, y_start = V1_0, initType = Modelica.Blocks.Types.Init.InitialOutput) annotation(Placement(visible = true, transformation(origin = {-20, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunctionNonWindup.LeadLag_NonWindupLimit leadlag_non_windup_limit6(T1 = TOC2, T2 = TOB2, MIN = VRMIN / KR, MAX = VRMAX / KR, y_start = V1_0, initType = Modelica.Blocks.Types.Init.InitialOutput) annotation(Placement(visible = true, transformation(origin = {20, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Min min1 annotation(Placement(visible = true, transformation(origin = {-20, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Max max1 annotation(Placement(visible = true, transformation(origin = {-40, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1(y(start = V1_0)) annotation(Placement(visible = true, transformation(origin = {0, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = KR) annotation(Placement(visible = true, transformation(origin = {-65, -55}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiter1(uMax = VRMAX, uMin = VRMIN) annotation(Placement(visible = true, transformation(origin = {-45, -55}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add4(k2 = -1) annotation(Placement(visible = true, transformation(origin = {-20, -60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain2(k = KC) annotation(Placement(visible = true, transformation(origin = {-54, -70}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunctionNonWindup.Lag_NonWindupVariableLimit lag_non_windup_var_limit1(TI = T1, y_init = EFD_0) annotation(Placement(visible = true, transformation(origin = {20, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag lag1(T = TR, y_start = Vterm_0, initType = Modelica.Blocks.Types.Init.InitialOutput) annotation(Placement(visible = true, transformation(origin = {-78, 86}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add5(k1 = -1, k2 = +1) annotation(Placement(visible = true, transformation(origin = {-60, 20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));

  OpalRT.Electrical.Control.Excitation.Internal.Selector selector1 annotation (
      Placement(visible=true, transformation(
        origin={60,0},
        extent={{-15,-15},{15,15}},
        rotation=0)));
  Modelica.Blocks.Math.Gain gain3(k = VRMAX) annotation(Placement(visible = true, transformation(origin = {0, -40}, extent = {{-2.5, -2.5}, {2.5, 2.5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain4(k = VRMIN) annotation(Placement(visible = true, transformation(origin = {0, -80}, extent = {{-2.5, -2.5}, {2.5, 2.5}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = VREF_0) annotation(Placement(transformation(extent = {{-153, 34}, {-133, 54}})));
  Modelica.Blocks.Sources.Constant const1(k = 0) annotation(Placement(transformation(extent = {{55, 70}, {75, 90}})));
  Modelica.Blocks.Math.Add add2 annotation(Placement(visible = true, transformation(origin = {-100, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression Ecomp(y = ETERM) annotation(Placement(visible = true, transformation(origin = {-107, 86}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
protected
  parameter Real EFD_0(fixed = false);
  parameter Real IFD_0(fixed = false);
  parameter Real V1_0(fixed = false);
  parameter Real VREF_0(fixed = false);
  parameter Real Vterm_0(fixed = false);
initial algorithm
  EFD_0 := EFD0;
  IFD_0 := XADIFD;
  Vterm_0 := ETERM0;
  V1_0 := (IFD_0 * KC + EFD_0) / KR;
  VREF_0 := V1_0 + Vterm_0;
  VUEL0 := -Modelica.Constants.inf;
  VOEL0 := Modelica.Constants.inf;
equation
  connect(selector1.Verr, max1.u2) annotation(Line(points = {{69, 15}, {69.2483, 15}, {69.2483, 69.0205}, {-49.8861, 69.0205}, {-49.8861, 36.6743}, {-46, 36.6743}, {-46, 37}}, color = {0, 0, 127}));
  connect(selector1.VUEL, max1.u1) annotation(Line(points = {{60, 15}, {59.6811, 15}, {59.6811, 61.7312}, {-58.0866, 61.7312}, {-58.0866, 43.0524}, {-46, 43.0524}, {-46, 43}}, color = {0, 0, 127}));
  connect(min1.u1, selector1.VOEL) annotation(Line(points = {{-26, 43}, {-29.6128, 43}, {-29.6128, 57.4032}, {50.7973, 57.4032}, {50.7973, 15}, {51, 15}}, color = {0, 0, 127}));
  connect(selector1.y, gain1.u) annotation(Line(points = {{75, -9}, {78.3599, -9}, {78.3599, -17.9954}, {78, -17.9954}, {78, -34}, {-74.4875, -34}, {-74.4875, -54.8975}, {-71, -54.8975}, {-71, -55}}, color = {0, 0, 127}));
  connect(lag_non_windup_var_limit1.VL, gain4.y) annotation(Line(points = {{21, -69}, {21.0648, -69}, {21.0648, -80.0826}, {2.75, -80.0826}, {2.75, -80}}, color = {0, 0, 127}));
  connect(gain3.y, lag_non_windup_var_limit1.VU) annotation(Line(points = {{2.75, -40}, {16.3434, -40}, {16.3434, -51}, {16, -51}}, color = {0, 0, 127}));
  connect(Ecomp.y, gain3.u) annotation(Line(points = {{-96, 86}, {-88, 86}, {-88, 96}, {-8, 96}, {-8, -40}, {-2, -40}}, color = {0, 0, 127}));
  connect(leadlag_non_windup_limit6.y, selector1.V3) annotation(Line(points = {{31, -20}, {37.3576, -20}, {37.3576, -10.2506}, {45, -10.2506}, {45, -9}}, color = {0, 0, 127}));
  connect(leadlag_non_windup_limit3.y, selector1.V2) annotation(Line(points = {{31, 0}, {44.8747, 0}, {44.8747, 0}, {45, 0}}, color = {0, 0, 127}));
  connect(leadlag_non_windup_limit2.y, selector1.V1) annotation(Line(points = {{31, 20}, {35.7631, 20}, {35.7631, 9.11162}, {45, 9.11162}, {45, 9}}, color = {0, 0, 127}));
  connect(lag_non_windup_var_limit1.y, EFD) annotation(Line(points = {{31, -60}, {100, -60}, {100, 0}}, color = {0, 0, 127}));
  connect(max1.u1, VUEL) annotation(Line(points = {{-46, 43}, {-57.8588, 43}, {-57.8588, 31.8633}, {-100, 31.8633}, {-100, 20}}, color = {0, 0, 127}));
  connect(VOTHSG, add1.u1) annotation(Line(points = {{-100, -36}, {-124, -36}, {-124, 52}, {-10.2506, 52}, {-10.2506, 42.369}, {-6, 42.369}, {-6, 43}}, color = {0, 0, 127}));
  connect(VOEL, min1.u1) annotation(Line(points = {{-100, -8}, {-112, -8}, {-112, 50}, {-29.5997, 50}, {-29.5997, 42.6744}, {-26, 42.6744}, {-26, 43}}, color = {0, 0, 127}));
  connect(XADIFD, gain2.u) annotation(Line(points = {{-100, -64}, {-66.4631, -64}, {-66.4631, -70}, {-60, -70}}, color = {0, 0, 127}));
  connect(Ecomp.y, lag1.u) annotation(Line(points = {{-96, 86}, {-82, 86}}, color = {0, 0, 127}));
  connect(add5.y, max1.u2) annotation(Line(points = {{-54.5, 20}, {-49.8553, 20}, {-49.8553, 36.3528}, {-46, 36.3528}, {-46, 37}}, color = {0, 0, 127}));
  connect(leadlag_non_windup_limit5.u, add1.y) annotation(Line(points = {{-31, -20}, {-37.7495, -20}, {-37.7495, 30.49}, {7.25953, 30.49}, {7.25953, 39.5644}, {5.5, 39.5644}, {5.5, 40}}, color = {0, 0, 127}));
  connect(leadlag_non_windup_limit4.u, add1.y) annotation(Line(points = {{-31, 0}, {-37.3866, 0}, {-37.3866, 30.853}, {7.6225, 30.853}, {7.6225, 39.5644}, {5.5, 39.5644}, {5.5, 40}}, color = {0, 0, 127}));
  connect(leadlag_non_windup_limit1.u, add1.y) annotation(Line(points = {{-31, 20}, {-37.0236, 20}, {-37.0236, 30.853}, {8.34846, 30.853}, {8.34846, 39.2015}, {5.5, 39.2015}, {5.5, 40}}, color = {0, 0, 127}));
  connect(add4.y, lag_non_windup_var_limit1.u) annotation(Line(points = {{-14.5, -60}, {8.71143, -60}, {8.71143, -60}, {9, -60}}, color = {0, 0, 127}));
  connect(gain2.y, add4.u2) annotation(Line(points = {{-48.5, -70}, {-33.7278, -70}, {-33.7278, -64.2012}, {-26, -64.2012}, {-26, -63}}, color = {0, 0, 127}));
  connect(limiter1.y, add4.u1) annotation(Line(points = {{-39.5, -55}, {-31.9527, -55}, {-31.9527, -57.3964}, {-26, -57.3964}, {-26, -57}}, color = {0, 0, 127}));
  connect(gain1.y, limiter1.u) annotation(Line(points = {{-59.5, -55}, {-51.4793, -55}, {-51.4793, -55}, {-51, -55}}, color = {0, 0, 127}));
  connect(min1.y, add1.u2) annotation(Line(points = {{-14.5, 40}, {-10.7062, 40}, {-10.7062, 36.2187}, {-6, 36.2187}, {-6, 37}}, color = {0, 0, 127}));
  connect(min1.u2, max1.y) annotation(Line(points = {{-26, 37}, {-30.7517, 37}, {-30.7517, 40.3189}, {-34.5, 40.3189}, {-34.5, 40}}, color = {0, 0, 127}));
  connect(leadlag_non_windup_limit5.y, leadlag_non_windup_limit6.u) annotation(Line(points = {{-9, -20}, {8.65604, -20}, {8.65604, -20}, {9, -20}}, color = {0, 0, 127}));
  connect(leadlag_non_windup_limit4.y, leadlag_non_windup_limit3.u) annotation(Line(points = {{-9, 0}, {9.33941, 0}, {9.33941, 0}, {9, 0}}, color = {0, 0, 127}));
  connect(leadlag_non_windup_limit1.y, leadlag_non_windup_limit2.u) annotation(Line(points = {{-9, 20}, {8.42825, 20}, {8.42825, 20}, {9, 20}}, color = {0, 0, 127}));
  connect(Ecomp.y, gain4.u) annotation(Line(points = {{-96, 86}, {-88, 86}, {-88, 96}, {-8, 96}, {-8, -80}, {-2, -80}}, color = {0, 0, 127}));
  connect(add5.u1, lag1.y) annotation(Line(points = {{-66, 23}, {-70, 23}, {-70, 86}, {-73, 86}}, color = {0, 0, 127}));
  connect(add2.y, add5.u2) annotation(Line(points={{-94.5,40},{-75.5784,40},{
          -75.5784,16.9666},{-66,16.9666},{-66,17}},                                                                                              color = {0, 0, 127}));
  connect(dVREF, add2.u1) annotation(Line(points={{-100,58},{-114.653,58},{
          -114.653,42.9306},{-106,42.9306},{-106,43}},                                                                                          color = {0, 0, 127}));
  connect(const.y, add2.u2) annotation(Line(points={{-132,44},{-118.766,44},{
          -118.766,36.7609},{-106,36.7609},{-106,37}},                                                                                            color = {0, 0, 127}));
  connect(const1.y, VF) annotation(Line(points = {{76, 80}, {100, 80}}, color = {0, 0, 127}));
  annotation(Documentation(info = "<html>

<p>
<b>Note:</b> The lag with non-windup variable limiter at the output of the block does not work propoerly.
<img src=\"modelica://OpalRT/resource/Excitation/ST5B.png\"
alt=\"ST5B.png\"><br></html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Text(origin = {-51.4784, 17.9941}, lineColor = {255, 0, 0}, extent = {{-0.68, 0.46}, {8.88326, -5.02}}, textString = "Verr")}));
end ST5B;
