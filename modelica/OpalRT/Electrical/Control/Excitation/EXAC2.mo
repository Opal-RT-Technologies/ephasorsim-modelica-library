within OpalRT.Electrical.Control.Excitation;
model EXAC2
  extends OpalRT.Electrical.PartialModel.Exciter;
  parameter Integer IBUS = 100 "Located Bus No.";
  parameter String ID = "M1" "Machine Identifier";
  parameter Real TR = 0.1 "(sec)";
  parameter Real TB = 12 "(sec)";
  parameter Real TC = 10 "(sec)";
  parameter Real KA = 400;
  parameter Real TA = 5 "(sec)";
  parameter Real VAMAX = 5 "or zero";
  parameter Real VAMIN = -5;
  parameter Real KB = 0.4;
  parameter Real VRMAX = 5 "or zero";
  parameter Real VRMIN = -5;
  parameter Real TE = 0.08 "(sec)";
  parameter Real KL = 0.4;
  parameter Real KH = 0.4;
  parameter Real KF = 0.2;
  parameter Real TF = 1.2 "(>0) (sec)";
  parameter Real KC = 0.4;
  parameter Real KD = 0.4;
  parameter Real KE = 0.5 "or zero";
  parameter Real VLR = 4;
  parameter Real E1 = 4;
  parameter Real SE_E1 = 0.4;
  parameter Real E2 = 5;
  parameter Real SE_E2 = 0.5;
  import sat_q = OpalRT.NonElectrical.Math.Nonlinear.computeSaturationQuadratic;
  import OpalRT.Electrical.Control.Excitation.Common.rectifierFunction;
  Modelica.Blocks.Math.Add add1(k2 = -1) annotation(Placement(visible = true, transformation(origin = {-55, -5}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add3 add31 annotation(Placement(visible = true, transformation(origin = {-60, -60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add2(k2 = +1, k1 = -1) annotation(Placement(visible = true, transformation(origin = {60, -40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunctionNonWindup.Integrator_NonWindupLimit non_windup_integrator1(KI = 1 / TE, VRMAX = Modelica.Constants.inf, VRMIN = 0, y_init = VE0) annotation(Placement(visible = true, transformation(origin = {80, 60}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = KD) annotation(Placement(visible = true, transformation(origin = {-60, 20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add4(k2 = +1) annotation(Placement(visible = true, transformation(origin = {-60, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 270)));
  Modelica.Blocks.Math.Gain gain2(k = KE) annotation(Placement(visible = true, transformation(origin = {-80, 60}, extent = {{5, -5}, {-5, 5}}, rotation = 90)));
  Modelica.Blocks.Math.Product product1 annotation(Placement(visible = true, transformation(origin = {40, 80}, extent = {{-5, -5}, {5, 5}}, rotation = 90)));
  Modelica.Blocks.Math.Gain gain3(k = KC) annotation(Placement(visible = true, transformation(origin = {-60, 80}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Common.Rectifier filter1 annotation(Placement(visible = true, transformation(origin = {5, 75}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag lag1(T = TR, initType = Modelica.Blocks.Types.Init.SteadyState, y_start = 0) annotation(Placement(visible = true, transformation(origin = {-80, -20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.LeadLag lead_lag1(TA = TC, TB = TB, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = VA0 / KA) annotation(Placement(visible = true, transformation(origin = {0, -40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunctionNonWindup.Lag_NonWindupLimit lag_non_windup_limit2(KI = KA, TI = TA, VRMAX = VAMAX, VRMIN = VAMIN, y_init = VA0) annotation(Placement(visible = true, transformation(origin = {20, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Product product2 annotation(Placement(visible = true, transformation(origin = {-20, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 180)));
  Modelica.Blocks.Math.Add3 add32(k3 = +1, k1 = -1) annotation(Placement(visible = true, transformation(origin = {-20, -20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add3(k2 = +1) annotation(Placement(visible = true, transformation(origin = {-40, 20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction transferfunction1(b = {KF0, 0}, a = {TF0, 1}, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = 0) annotation(Placement(visible = true, transformation(origin = {-20, 20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain4(k = KH) annotation(Placement(visible = true, transformation(origin = {20, -20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Min min1 annotation(Placement(visible = true, transformation(origin = {80, -40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add5(k2 = -1, k1 = +1) annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{-5, -5}, {5, 5}}, rotation = -90)));
  Modelica.Blocks.Math.Gain gain6(k = KB) annotation(Placement(visible = true, transformation(origin = {100, -20}, extent = {{-5, -5}, {5, 5}}, rotation = 90)));
  Modelica.Blocks.Nonlinear.Limiter limiter1(uMax = VRMAX, uMin = VRMIN) annotation(Placement(visible = true, transformation(origin = {100, 20}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add6(k2 = -1, k1 = +1) annotation(Placement(visible = true, transformation(origin = {60, 20}, extent = {{5, -5}, {-5, 5}}, rotation = -90)));
  Modelica.Blocks.Math.Gain gain5(k = KL) annotation(Placement(visible = true, transformation(origin = {60, -20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = VLR) annotation(Placement(visible = true, transformation(origin = {20, 20}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  NonElectrical.Math.Nonlinear.SaturationQuadratic saturation1(E1 = E1, E2 = E2, SE_E1 = SE_E1, SE_E2 = SE_E2) annotation(Placement(visible = true, transformation(origin = {20, 40}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  OpalRT.Electrical.Control.Excitation.Common.CurrentNormalization division_modified1 annotation(Placement(visible = true, transformation(origin = {-20, 80}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add7 annotation(Placement(visible = true, transformation(origin = {-100, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const1(k = VREF_0) annotation(Placement(transformation(extent = {{-133, 34}, {-113, 54}})));
  Modelica.Blocks.Sources.RealExpression Ecomp(y = ETERM) annotation(Placement(visible = true, transformation(origin = {-117, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
protected
  parameter Real EFD_0(fixed = false);
  parameter Real EC_0(fixed = false);
  parameter Real VFE0(fixed = false);
  parameter Real VREF_0(fixed = false);
  parameter Real SE0(fixed = false);
  parameter Real TF0(start = 1, fixed = false);
  parameter Real KF0(fixed = false);
  parameter Real FEX0(fixed = false);
  parameter Real IN0(fixed = false);
  parameter Real IFD0(fixed = false);
  parameter Real VE0(start = 1, fixed = false);
  parameter Real VA0(fixed = false);
initial algorithm
  TF0 := TF;
  KF0 := KF;
initial equation
  EFD_0 = EFD0;
  IFD0 = XADIFD;
  EC_0 = ETERM0;
  VREF_0 = VA0 / KA + EC_0;
  VA0 = (1 + KH * KB) / KB * VFE0;
  SE0 = sat_q(VE0, E1, E2, SE_E1, SE_E2);
  VFE0 = IFD0 * KD + (KE + SE0) * VE0;
  IN0 = KC * IFD0 / VE0;
  EFD_0 = VE0 * FEX0;
  FEX0 = rectifierFunction(IN0);
  VUEL0 = 0;
  VOEL0 = 0;
equation
  connect(VF, transferfunction1.y) annotation(Line(points = {{100, 80}, {-11.7216, 80}, {-11.7216, 19.7802}, {-14.5, 19.7802}, {-14.5, 20}}, color = {0, 0, 127}));
  connect(division_modified1.IN, filter1.IN) annotation(Line(points = {{-15, 80}, {-5.09229, 80}, {-5.09229, 73.3289}, {0, 73.3289}, {0, 73}}, color = {0, 0, 127}));
  connect(division_modified1.IFD, gain3.y) annotation(Line(points = {{-24.9, 83.4}, {-48.5465, 83.4}, {-48.5465, 80.4581}, {-54.5, 80.4581}, {-54.5, 80}}, color = {0, 0, 127}));
  connect(division_modified1.VE, non_windup_integrator1.y) annotation(Line(points = {{-24.8, 76.5}, {-33.2696, 76.5}, {-33.2696, 59.7495}, {75, 59.7495}, {75, 60}}, color = {0, 0, 127}));
  connect(saturation1.u, non_windup_integrator1.y) annotation(Line(points = {{25, 40}, {42.4899, 40}, {42.4899, 59.8106}, {75, 59.8106}, {75, 60}}, color = {0, 0, 127}));
  connect(saturation1.y, product2.u1) annotation(Line(points = {{15, 40}, {-5.01139, 40}, {-5.01139, 37.3576}, {-14, 37.3576}, {-14, 37}}, color = {0, 0, 127}));
  connect(const.y, add5.u1) annotation(Line(points = {{14.5, 20}, {2.96128, 20}, {2.96128, 6}, {3, 6}}, color = {0, 0, 127}));
  connect(add3.y, add6.u2) annotation(Line(points = {{-34.5, 20}, {-33.0296, 20}, {-33.0296, 28.4738}, {47.3804, 28.4738}, {47.3804, 9.33941}, {56.9476, 9.33941}, {56.9476, 14}, {57, 14}}, color = {0, 0, 127}));
  connect(gain5.y, min1.u1) annotation(Line(points = {{65.5, -20}, {68.1093, -20}, {68.1093, -37.1298}, {74, -37.1298}, {74, -37}}, color = {0, 0, 127}));
  connect(add5.y, gain5.u) annotation(Line(points = {{3.36767e-016, -5.5}, {3.36767e-016, -12.5285}, {46.9248, -12.5285}, {46.9248, -20.0456}, {54, -20.0456}, {54, -20}}, color = {0, 0, 127}));
  connect(limiter1.y, add6.u1) annotation(Line(points = {{94.5, 20}, {83.8269, 20}, {83.8269, 8.88383}, {63.0979, 8.88383}, {63.0979, 14}, {63, 14}}, color = {0, 0, 127}));
  connect(add6.y, non_windup_integrator1.u) annotation(Line(points = {{60, 25.5}, {60, 37.1298}, {92.0273, 37.1298}, {92.0273, 60.5923}, {85, 60.5923}, {85, 60}}, color = {0, 0, 127}));
  connect(gain6.y, limiter1.u) annotation(Line(points = {{100, -14.5}, {100, 5.69476}, {111.39, 5.69476}, {111.39, 20.2733}, {106, 20.2733}, {106, 20}}, color = {0, 0, 127}));
  connect(min1.y, gain6.u) annotation(Line(points = {{85.5, -40}, {100.228, -40}, {100.228, -26}, {100, -26}}, color = {0, 0, 127}));
  connect(add3.y, add5.u2) annotation(Line(points = {{-34.5, 20}, {-33.0296, 20}, {-33.0296, 28.4738}, {-2.73349, 28.4738}, {-2.73349, 6}, {-3, 6}}, color = {0, 0, 127}));
  connect(add2.y, min1.u2) annotation(Line(points = {{65.5, -40}, {68.7927, -40}, {68.7927, -43.0524}, {74, -43.0524}, {74, -43}}, color = {0, 0, 127}));
  connect(gain4.y, add2.u1) annotation(Line(points = {{25.5, -20}, {33.2574, -20}, {33.2574, -37.1298}, {54, -37.1298}, {54, -37}}, color = {0, 0, 127}));
  connect(add3.y, gain4.u) annotation(Line(points = {{-34.5, 20}, {-33.0296, 20}, {-33.0296, 28.4738}, {-7.51708, 28.4738}, {-7.51708, -20.2733}, {14, -20.2733}, {14, -20}}, color = {0, 0, 127}));
  connect(transferfunction1.y, add32.u1) annotation(Line(points = {{-14.5, 20}, {-11.8451, 20}, {-11.8451, -11.6173}, {-36.9021, -11.6173}, {-36.9021, -16.1731}, {-26, -16.1731}, {-26, -16}}, color = {0, 0, 127}));
  connect(add3.y, transferfunction1.u) annotation(Line(points = {{-34.5, 20}, {-26.4237, 20}, {-26.4237, 20}, {-26, 20}}, color = {0, 0, 127}));
  connect(gain1.y, add3.u2) annotation(Line(points = {{-54.5, 20}, {-50.7973, 20}, {-50.7973, 16.8565}, {-46, 16.8565}, {-46, 17}}, color = {0, 0, 127}));
  connect(add4.y, add3.u1) annotation(Line(points = {{-60, 34.5}, {-60, 28.0182}, {-51.0251, 28.0182}, {-51.0251, 22.5513}, {-46, 22.5513}, {-46, 23}}, color = {0, 0, 127}));
  connect(XADIFD, gain1.u) annotation(Line(points = {{-100, -64}, {-88.0654, -64}, {-88.0654, 20.135}, {-66, 20.135}, {-66, 20}}, color = {0, 0, 127}));
  connect(add31.y, add32.u3) annotation(Line(points = {{-54.5, -60}, {-38.7244, -60}, {-38.7244, -23.918}, {-26, -23.918}, {-26, -24}}, color = {0, 0, 127}));
  connect(add1.y, add32.u2) annotation(Line(points = {{-49.5, -5}, {-39.7689, -5}, {-39.5411, -20.0947}, {-31.234, -20}, {-26, -20}}, color = {0, 0, 127}));
  connect(add32.y, lead_lag1.u) annotation(Line(points = {{-14.5, -20}, {-14.123, -20}, {-14.123, -40.3189}, {-5, -40.3189}, {-5, -40}}, color = {0, 0, 127}));
  connect(product2.y, add4.u1) annotation(Line(points = {{-25.5, 40}, {-37.1298, 40}, {-37.1298, 51.2528}, {-56.9476, 51.2528}, {-56.9476, 46}, {-57, 46}}, color = {0, 0, 127}));
  connect(non_windup_integrator1.y, product2.u2) annotation(Line(points = {{75, 60}, {-4.55581, 60}, {-4.55581, 42.8246}, {-14, 42.8246}, {-14, 43}}, color = {0, 0, 127}));
  connect(lag_non_windup_limit2.y, add2.u2) annotation(Line(points = {{31, -40}, {41.9134, -40}, {41.9134, -42.8246}, {54, -42.8246}, {54, -43}}, color = {0, 0, 127}));
  connect(lead_lag1.y, lag_non_windup_limit2.u) annotation(Line(points = {{5, -40}, {8.88383, -40}, {8.88383, -40}, {9, -40}}, color = {0, 0, 127}));
  connect(lag1.y, add1.u2) annotation(Line(points = {{-75, -20}, {-69.2483, -20}, {-69.2483, -7.74487}, {-61, -7.74487}, {-61, -8}}, color = {0, 0, 127}));
  connect(Ecomp.y, lag1.u) annotation(Line(points = {{-106, -20}, {-84, -20}}, color = {0, 0, 127}));
  connect(XADIFD, gain3.u) annotation(Line(points = {{-100, -64}, {-88.0208, -64}, {-88.0208, 80.2083}, {-66, 80.2083}, {-66, 80}}, color = {0, 0, 127}));
  connect(filter1.FEX, product1.u1) annotation(Line(points = {{10, 73}, {18.1593, 73}, {18.1593, 64.4656}, {37.045, 64.4656}, {37.045, 74}, {37, 74}}, color = {0, 0, 127}));
  connect(non_windup_integrator1.y, gain2.u) annotation(Line(points = {{75, 60}, {-25.9681, 60}, {-25.9681, 72.8929}, {-79.9544, 72.8929}, {-79.9544, 66}, {-80, 66}}, color = {0, 0, 127}));
  connect(non_windup_integrator1.y, product1.u2) annotation(Line(points = {{75, 60}, {42.8246, 60}, {42.8246, 74}, {43, 74}}, color = {0, 0, 127}));
  connect(product1.y, EFD) annotation(Line(points = {{40, 85.5}, {40, 88.1549}, {79.2711, 88.1549}, {79.2711, 79.2711}, {100, 79.2711}, {100, 0}}, color = {0, 0, 127}));
  connect(gain2.y, add4.u2) annotation(Line(points = {{-80, 54.5}, {-80, 50.5695}, {-62.8702, 50.5695}, {-62.8702, 46}, {-63, 46}}, color = {0, 0, 127}));
  connect(VUEL, add31.u3) annotation(Line(points = {{-100, 20}, {-78.085, 20}, {-78.085, -64.0198}, {-66, -64.0198}, {-66, -64}}, color = {0, 0, 127}));
  connect(VOTHSG, add31.u1) annotation(Line(points = {{-100, -36}, {-77.9043, -36}, {-77.9043, -55.7631}, {-66, -55.7631}, {-66, -56}}, color = {0, 0, 127}));
  connect(VOEL, add31.u2) annotation(Line(points = {{-100, -8}, {-65.8275, -8}, {-65.8275, -60}, {-66, -60}}, color = {0, 0, 127}));
  connect(add7.y, add1.u1) annotation(Line(points={{-94.5,40},{-69.9229,40},{-69.9229,
          -2.05656},{-61,-2.05656},{-61,-2}},                                                                                                        color = {0, 0, 127}));
  connect(add7.u2, const1.y) annotation(Line(points={{-106,37},{-112.082,37},{-112.082,
          44},{-112,44}},                                                                                                     color = {0, 0, 127}));
  connect(dVREF, add7.u1) annotation(Line(points={{-100,58},{-108.226,58},{-108.226,
          43.1877},{-106,43.1877},{-106,43}},                                                                                                   color = {0, 0, 127}));
  annotation(Documentation(info = "<html>

<p>
1- In this model, VS = VOTHSG+VUEL+VOEL
</p>
<p>
2- In this model, VE is the output voltage.
</p>
<img src=\"modelica://OpalRT/resource/Excitation/EXAC2.png\"
alt=\"EXAC2.png\"><br>
<p>
3- In this model, the filter block is as following:
</p>
<img src=\"modelica://OpalRT/resource/Excitation/EXAC1_FILTER.png\"
alt=\"EXAC1.png\"><br>

</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Text(origin = {63.015, 63.0689}, lineColor = {255, 0, 0}, extent = {{-2.68, 2.59}, {2.68, -2.59}}, textString = "VE"), Text(origin = {38.81, -43.03}, lineColor = {255, 0, 0}, extent = {{-2.68, 2.59}, {2.68, -2.59}}, textString = "VA"), Text(origin = {-64.33, -13.73}, lineColor = {255, 0, 0}, extent = {{-2.68, 2.59}, {2.68, -2.59}}, textString = "VC"), Text(origin = {-44.82, -55.4115}, lineColor = {255, 0, 0}, extent = {{-2.68, 2.59}, {2.68, -2.59}}, textString = "VS"), Text(origin = {-19.9798, 3.8802}, lineColor = {255, 0, 0}, extent = {{-2.68, 2.59}, {2.68, -2.59}}, textString = "VF"), Text(origin = {28.2137, 66.6399}, lineColor = {255, 0, 0}, extent = {{-2.68, 2.59}, {2.68, -2.59}}, textString = "FEX"), Text(origin = {-42.9819, 69.9312}, lineColor = {255, 0, 0}, extent = {{-2.68, 2.59}, {2.68, -2.59}}, textString = "VE"), Text(origin = {-4.92744, 77.3069}, lineColor = {255, 0, 0}, extent = {{-2.68, 2.59}, {2.68, -2.59}}, textString = "IN"), Text(origin = {-29.3059, 23.6962}, lineColor = {255, 0, 0}, extent = {{-2.68, 2.59}, {2.68, -2.59}}, textString = "VFE"), Text(origin = {37.3995, -29.6399}, lineColor = {255, 0, 0}, extent = {{-2.68, 2.59}, {2.68, -2.59}}, textString = "VH"), Text(origin = {72.4345, -29.2267}, lineColor = {255, 0, 0}, extent = {{-2.68, 2.59}, {2.68, -2.59}}, textString = "VL"), Text(origin = {79.1464, 12.6786}, lineColor = {255, 0, 0}, extent = {{-2.68, 2.59}, {2.68, -2.59}}, textString = "VR"), Text(origin = {42.6303, 23.6506}, lineColor = {255, 0, 0}, extent = {{-2.68, 2.59}, {2.68, -2.59}}, textString = "VFE")}));
end EXAC2;
