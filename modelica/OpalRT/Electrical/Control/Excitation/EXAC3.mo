within OpalRT.Electrical.Control.Excitation;
model EXAC3 "IEEE Type AC3 Excitation System"
  extends OpalRT.Electrical.PartialModel.Exciter;
  parameter Real TR = 0.02 "regulator input filter time constant (sec)";
  parameter Real TB = 0.1 " lag time constant of voltage regulator (s)";
  parameter Real TC = 1 " lead time constant of voltage regulator (s)";
  parameter Real KA = 10 "(pu) voltage regulator gain";
  parameter Real TA = 0.02 "(sec) regulator time constant";
  parameter Real VAMAX = 10 "(pu) regulator output maximum limit";
  parameter Real VAMIN = -10 "(pu) regulator output minimum limit";
  parameter Real TE = 0.35 "Exciter time constant";
  parameter Real KLV = 0.4 "Gain used in the minimum field voltage limiter loop";
  parameter Real KR = 0.4 "Constant associated with regulator and alternator field";
  parameter Real KF = 1 "Excitation control system stabilizer gains";
  parameter Real TF = 1.0 "Excitation control system stabilizer time constant, sec";
  parameter Real KN = 0.4 "Excitation control system stabilizer gain";
  parameter Real EFDN = 0.4 "Value of EFD at which feedback gain changes";
  parameter Real KC = 0.02 "Rectifier loading factor proportional to commutating reactance";
  parameter Real KD = 0.02 "Demagnetizing factor";
  parameter Real KE = 1 "exciter constant related fo self-excited field";
  parameter Real VLV = 0.4 "Field voltage used in the minimum field voltage limiter loop";
  parameter Real E1 = 4 "Exciter voltages at which exciter saturation is defined";
  parameter Real SE_E1 = 0.4 "Exciter saturation function value at E1";
  parameter Real E2 = 5 "Exciter voltages at which exciter saturation is defined";
  parameter Real SE_E2 = 0.5 "Exciter saturation function value at E2";
  import sat_q = OpalRT.NonElectrical.Math.Nonlinear.computeSaturationQuadratic;
  import OpalRT.Electrical.Control.Excitation.Common.currentNormalizationFunction;
  import OpalRT.Electrical.Control.Excitation.Common.rectifierFunction;
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag lag1(T = TR, y_start = ETERM_0) annotation(Placement(visible = true, transformation(origin = {-150, 70}, extent = {{-7.5, -7.5}, {7.5, 7.5}}, rotation = 0)));
  Modelica.Blocks.Math.Add3 add31(k2 = -1, k3 = +1) annotation(Placement(visible = true, transformation(origin = {-130, 70}, extent = {{-7.5, -7.5}, {7.5, 7.5}}, rotation = 0)));
  Modelica.Blocks.Math.Product product1 annotation(Placement(visible = true, transformation(origin = {150, 70}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.Electrical.Control.Excitation.Common.Rectifier filter1 annotation(Placement(visible = true, transformation(origin = {140, 30}, extent = {{7.5, -7.5}, {-7.5, 7.5}}, rotation = -90)));
  Modelica.Blocks.Sources.Constant constant3(k = VREF_0) annotation(Placement(visible = true, transformation(origin = {-157, 44}, extent = {{-7.5, -7.5}, {7.5, 7.5}}, rotation = 0)));
  OpalRT.Electrical.Control.Excitation.Common.CurrentNormalization division_modified1 annotation(Placement(visible = true, transformation(origin = {120, -60}, extent = {{-7.5, -7.5}, {7.5, 7.5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunctionNonWindup.Integrator_NonWindupLimit non_windup_integrator1(KI = 1 / TE, y_init = VE0, VRMAX = Modelica.Constants.inf, VRMIN = 0) annotation(Placement(visible = true, transformation(origin = {100, 70}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
  Modelica.Blocks.Math.Product product2 annotation(Placement(visible = true, transformation(origin = {40, -10}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = KE) annotation(Placement(visible = true, transformation(origin = {60, -30}, extent = {{-7.5, -7.5}, {7.5, 7.5}}, rotation = 180)));
  NonElectrical.Math.Nonlinear.SaturationQuadratic saturation1(E1 = E1, E2 = E2, SE_E1 = SE_E1, SE_E2 = SE_E2) annotation(Placement(visible = true, transformation(origin = {80, -10}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain3(k = KC) annotation(Placement(visible = true, transformation(origin = {60, -60}, extent = {{7.5, -7.5}, {-7.5, 7.5}}, rotation = 180)));
  Modelica.Blocks.Math.Add add2(k2 = +1, k1 = +1) annotation(Placement(visible = true, transformation(origin = {2.5, 2.5}, extent = {{-7.5, -7.5}, {7.5, 7.5}}, rotation = 90)));
  Modelica.Blocks.Math.Add add1(k2 = +1, k1 = +1) annotation(Placement(visible = true, transformation(origin = {17.5, -22.5}, extent = {{-7.5, -7.5}, {7.5, 7.5}}, rotation = 180)));
  Modelica.Blocks.Math.Gain gain2(k = KD) annotation(Placement(visible = true, transformation(origin = {0, -40}, extent = {{-7.5, -7.5}, {7.5, 7.5}}, rotation = 90)));
  Modelica.Blocks.Math.Add add8(k2 = -1, k1 = +1) annotation(Placement(visible = true, transformation(origin = {40, 70}, extent = {{-7.5, -7.5}, {7.5, 7.5}}, rotation = 360)));
  Modelica.Blocks.Math.Gain gain4(k = KR) annotation(Placement(visible = true, transformation(origin = {50, 90}, extent = {{-7.5, -7.5}, {7.5, 7.5}}, rotation = 180)));
  Modelica.Blocks.Continuous.TransferFunction transferfunction1(initType = Modelica.Blocks.Types.Init.InitialOutput, b = {1, 0}, a = {TF01, 1}) annotation(Placement(visible = true, transformation(origin = {-60, 40}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Max HVgate annotation(Placement(visible = true, transformation(origin = {-50, 70}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Product product3 annotation(Placement(visible = true, transformation(origin = {10, 70}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunctionNonWindup.Lag_NonWindupLimit lag_non_windup_limit1(KI = KA, TI = TA, VRMAX = VAMAX, VRMIN = VAMIN, y_init = VA0) annotation(Placement(visible = true, transformation(origin = {-20, 70}, extent = {{-11.25, -11.25}, {11.25, 11.25}}, rotation = 0)));
  Modelica.Blocks.Math.Add add3(k2 = -1, k1 = +1) annotation(Placement(visible = true, transformation(origin = {-100, 70}, extent = {{-7.5, -7.5}, {7.5, 7.5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.LeadLag lead_lag1(TA = TC, TB = TB, initType = Modelica.Blocks.Types.Init.InitialOutput, K = 1, y_start = VA0 / KA) annotation(Placement(visible = true, transformation(origin = {-70, 70}, extent = {{-8.75, -8.75}, {8.75, 8.75}}, rotation = 0)));
  Modelica.Blocks.Math.Add add4(k2 = -1, k1 = +1) annotation(Placement(visible = true, transformation(origin = {-70, -20}, extent = {{-7.5, -7.5}, {7.5, 7.5}}, rotation = 180)));
  Modelica.Blocks.Math.Gain gain5(k = KLV) annotation(Placement(visible = true, transformation(origin = {-110, -20}, extent = {{-7.5, -7.5}, {7.5, 7.5}}, rotation = 180)));
  Modelica.Blocks.Sources.Constant const(k = VLV) annotation(Placement(visible = true, transformation(origin = {-60, -50}, extent = {{-7.5, -7.5}, {7.5, 7.5}}, rotation = 0)));
  OpalRT.Electrical.Control.Excitation.Common.PieceWiseLinearGain piecewiselineargain1(KF = KF, KN = KN, EFDN = EFDN) annotation(Placement(visible = true, transformation(origin = {-30, 40}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add3 add32(k2 = +1, k3 = +1) annotation(Placement(visible = true, transformation(origin = {-150, 10}, extent = {{-7.5, -7.5}, {7.5, 7.5}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant1(k = 0) annotation(Placement(visible = true, transformation(origin = {74, 80}, extent = {{-7.5, -7.5}, {7.5, 7.5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add5 annotation(Placement(visible = true, transformation(origin = {-180, 80}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression Ecomp(y = ETERM) annotation(Placement(visible = true, transformation(origin = {-178, 98}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
protected
  parameter Real VA0(fixed = false);
  parameter Real VR0(fixed = false);
  parameter Real VE0(start = 1, fixed = false);
  parameter Real SE0(fixed = false);
  parameter Real TF01(start = 1, fixed = false);
  parameter Real VFE0(fixed = false);
  parameter Real ETERM_0(fixed = false);
  parameter Real IFD0(fixed = false);
  parameter Real VREF_0(fixed = false);
  parameter Real EFD_0(fixed = false);
  parameter Real IN0(fixed = false);
  parameter Real FEX0(fixed = false);
initial algorithm
  TF01 := TF;
initial equation
  ETERM_0 = ETERM0;
  IFD0 = XADIFD;
  EFD_0 = EFD0;
  EFD0 = VE0 * FEX0;
  FEX0 = rectifierFunction(IN0);
  IN0 = KC * IFD0 / VE0;
  SE0 = sat_q(VE0, E1, E2, SE_E1, SE_E2);
  VFE0 = IFD0 * KD + (KE + SE0) * VE0;
  VR0 = VFE0;
  VA0 = VR0 / (KR * EFD_0);
  VREF_0 = ETERM_0 + VA0 / KA;
  VUEL0 = 0;
  VOEL0 = 0;
equation
  connect(add32.y, add31.u3) annotation(Line(points = {{-141.75, 10}, {-139.666, 10}, {-139.666, 64}, {-139, 64}}, color = {0, 0, 127}));
  connect(VOTHSG, add32.u1) annotation(Line(points = {{-100, -36}, {-160.134, -36}, {-160.134, 14.8495}, {-159, 14.8495}, {-159, 16}}, color = {0, 0, 127}));
  connect(VOEL, add32.u2) annotation(Line(points = {{-100, -8}, {-158.93, -8}, {-158.93, 10}, {-159, 10}}, color = {0, 0, 127}));
  connect(VUEL, add32.u3) annotation(Line(points = {{-100, 20}, {-160.936, 20}, {-160.936, 4}, {-159, 4}}, color = {0, 0, 127}));
  connect(piecewiselineargain1.EFD, EFD) annotation(Line(points = {{-20, 34}, {160.535, 34}, {160.535, 70.2341}, {100, 70.2341}, {100, 0}}, color = {0, 0, 127}));
  connect(piecewiselineargain1.VN, transferfunction1.u) annotation(Line(points = {{-40, 34}, {-46.1538, 34}, {-46.1538, 40.1338}, {-54, 40.1338}, {-54, 40}}, color = {0, 0, 127}));
  connect(gain5.y, HVgate.u1) annotation(Line(points = {{-118.25, -20}, {-122.007, -20}, {-122.007, 84.8347}, {-56.7845, 84.8347}, {-56.7845, 73}, {-56, 73}}, color = {0, 0, 127}));
  connect(gain5.u, add4.y) annotation(Line(points = {{-101, -20}, {-78.9054, -20}, {-78.9054, -20}, {-78.25, -20}}, color = {0, 0, 127}));
  connect(add4.u2, product1.y) annotation(Line(points = {{-61, -15.5}, {155.074, -15.5}, {155.074, 70}, {155.5, 70}}, color = {0, 0, 127}));
  connect(add4.u1, const.y) annotation(Line(points = {{-61, -24.5}, {-49.0308, -24.5}, {-49.0308, -49.943}, {-51.75, -49.943}, {-51.75, -50}}, color = {0, 0, 127}));
  connect(lead_lag1.y, HVgate.u2) annotation(Line(points = {{-61.25, 70}, {-59.293, 70}, {-59.293, 67.2748}, {-56, 67.2748}, {-56, 67}}, color = {0, 0, 127}));
  connect(add3.y, lead_lag1.u) annotation(Line(points = {{-91.75, 70}, {-78.4493, 70}, {-78.75, 69.5553}, {-78.75, 70}}, color = {0, 0, 127}));
  connect(transferfunction1.y, add3.u2) annotation(Line(points = {{-65.5, 40}, {-116.306, 40}, {-116.306, 65.9065}, {-110.148, 65.9065}, {-110.148, 65.5}, {-109, 65.5}}, color = {0, 0, 127}));
  connect(add31.y, add3.u1) annotation(Line(points = {{-121.75, 70}, {-114.025, 70}, {-114.025, 74.5724}, {-109, 74.5724}, {-109, 74.5}}, color = {0, 0, 127}));
  connect(product3.u1, gain4.y) annotation(Line(points = {{4, 73}, {0.684151, 73}, {0.684151, 90.0798}, {41.5051, 90.0798}, {41.5051, 90}, {41.75, 90}}, color = {0, 0, 127}));
  connect(lag_non_windup_limit1.y, product3.u2) annotation(Line(points = {{-7.625, 70}, {-4.78905, 70}, {-4.78905, 67.2748}, {4, 67.2748}, {4, 67}}, color = {0, 0, 127}));
  connect(HVgate.y, lag_non_windup_limit1.u) annotation(Line(points = {{-44.5, 70}, {-42.6454, 70}, {-32.375, 70}, {-32.375, 70}}, color = {0, 0, 127}));
  connect(product3.y, add8.u1) annotation(Line(points = {{15.5, 70}, {19.469, 70}, {19.469, 74.6903}, {31, 74.6903}, {31, 74.5}}, color = {0, 0, 127}));
  connect(gain4.u, product1.y) annotation(Line(points = {{59, 90}, {160.354, 90}, {160.354, 69.7345}, {155.398, 69.7345}, {155.398, 70}, {155.5, 70}}, color = {0, 0, 127}));
  connect(add2.y, add8.u2) annotation(Line(points = {{2.5, 10.75}, {2.5, 41.7699}, {24.0708, 41.7699}, {24.0708, 65.4867}, {30.4425, 65.4867}, {30.4425, 65.5}, {31, 65.5}}, color = {0, 0, 127}));
  connect(add8.y, non_windup_integrator1.u) annotation(Line(points = {{48.25, 70}, {93.0973, 70}, {93.0973, 70}, {92.5, 70}}, color = {0, 0, 127}));
  connect(gain3.u, XADIFD) annotation(Line(points = {{51, -60}, {0, -60}, {0, -70.0885}, {-100, -70.0885}, {-100, -64}}, color = {0, 0, 127}));
  connect(gain2.u, XADIFD) annotation(Line(points = {{-5.51073e-16, -49}, {-5.51073e-16, -70.7965}, {-16.9912, -70.7965}, {-16.9912, -64}, {-100, -64}}, color = {0, 0, 127}));
  connect(gain2.y, add2.u1) annotation(Line(points = {{5.0515e-16, -31.75}, {5.0515e-16, -7.78761}, {-2, -7.78761}, {-2, -6.5}}, color = {0, 0, 127}));
  connect(add1.u1, gain1.y) annotation(Line(points = {{26.5, -27}, {44.9558, -27}, {44.9558, -30.0885}, {52.0354, -30.0885}, {52.0354, -30}, {51.75, -30}}, color = {0, 0, 127}));
  connect(add1.y, add2.u2) annotation(Line(points = {{9.25, -22.5}, {7.43363, -22.5}, {7.43363, -6.5}, {7, -6.5}}, color = {0, 0, 127}));
  connect(add1.u2, product2.y) annotation(Line(points = {{26.5, -18}, {29.7345, -18}, {29.7345, -9.9115}, {34.5, -9.9115}, {34.5, -10}}, color = {0, 0, 127}));
  connect(gain3.y, division_modified1.IFD) annotation(Line(points = {{68.25, -60}, {101.239, -60}, {101.239, -54.8673}, {112.65, -54.8673}, {112.65, -54.9}}, color = {0, 0, 127}));
  connect(product2.u2, saturation1.y) annotation(Line(points = {{46, -13}, {63.7168, -13}, {63.7168, -10.6195}, {75.0442, -10.6195}, {75.0442, -10}, {75, -10}}, color = {0, 0, 127}));
  connect(saturation1.u, non_windup_integrator1.y) annotation(Line(points = {{85, -10}, {108.673, -10}, {108.673, 70}, {107.5, 70}}, color = {0, 0, 127}));
  connect(product2.u1, non_windup_integrator1.y) annotation(Line(points = {{46, -7}, {49.5575, -7}, {49.5575, 1.41593}, {108.673, 1.41593}, {108.673, 70}, {107.5, 70}}, color = {0, 0, 127}));
  connect(gain1.u, non_windup_integrator1.y) annotation(Line(points = {{69, -30}, {108.319, -30}, {108.319, 70}, {107.5, 70}}, color = {0, 0, 127}));
  connect(non_windup_integrator1.y, product1.u1) annotation(Line(points = {{107.5, 70}, {126.726, 70}, {126.726, 72.9204}, {144, 72.9204}, {144, 73}}, color = {0, 0, 127}));
  connect(non_windup_integrator1.y, division_modified1.VE) annotation(Line(points = {{107.5, 70}, {109.027, 70}, {109.027, -64.7788}, {112.8, -64.7788}, {112.8, -65.25}}, color = {0, 0, 127}));
  connect(division_modified1.IN, filter1.IN) annotation(Line(points = {{127.5, -60}, {136.991, -60}, {136.991, 22.5}, {137, 22.5}}, color = {0, 0, 127}));
  connect(filter1.FEX, product1.u2) annotation(Line(points = {{137, 37.5}, {137, 67.6106}, {144.779, 67.6106}, {144.779, 67}, {144, 67}}, color = {0, 0, 127}));
  connect(constant3.y, add5.u1) annotation(Line(points={{-148.75,44},{-147.301,44},
          {-147.301,53.7275},{-193.316,53.7275},{-193.316,83.0334},{-186,83.0334},
          {-186,83}},                                                                                                                                                                              color = {0, 0, 127}));
  connect(product1.y, EFD) annotation(Line(points = {{155.5, 70}, {168.496, 70}, {168.496, 0}, {100, 0}}, color = {0, 0, 127}));
  connect(add5.y, add31.u1) annotation(Line(points={{-174.5,80},{-143.188,80},{-143.188,
          79.9486},{-139.332,79.9486},{-139.332,76},{-139,76}},                                                                                                          color = {0, 0, 127}));
  connect(dVREF, add5.u2) annotation(Line(points={{-100,58},{-188.946,58},{-188.946,
          76.8638},{-186,76.8638},{-186,77}},                                                                                                   color = {0, 0, 127}));
  connect(lag1.y, add31.u2) annotation(Line(points = {{-142.5, 70}, {-135.575, 70}, {-139, 70}, {-139, 70}}, color = {0, 0, 127}));
  connect(Ecomp.y, lag1.u) annotation(Line(points = {{-167, 98}, {-162, 98}, {-162, 70}, {-157, 70}}, color = {0, 0, 127}));
  connect(constant1.y, VF) annotation(Line(points = {{82.25, 80}, {100, 80}}, color = {0, 0, 127}));
  annotation(Documentation(info = "<html>

<img
src=\"modelica://OpalRT/resource/Excitation/EXAC3.png\"
alt=\"EXAC3.png\"><br>
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
</html>"), experiment(StartTime = 0, StopTime = 30, Tolerance = 1e-06, Interval = 0.001), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1}), graphics={  Text(origin = {66.6239, 81.5608}, extent = {{-30.31, 11.5}, {-8.93, -4.46}}, textString = "XADIFD", fontSize = 44)}), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1}), graphics={  Text(origin = {119.713, 61.7086}, lineColor = {255, 0, 0}, extent = {{-3.57, 4.32}, {3.87, -4.45}}, textString = "VE", textstyle = {TextStyle.Bold}), Text(origin = {-5.5434, 63.6047}, lineColor = {255, 0, 0}, extent = {{-3.57, 4.32}, {5.06, -4.92}}, textString = "VA", textstyle = {TextStyle.Bold}), Text(origin = {145.805, -55.8113}, lineColor = {255, 0, 0}, extent = {{-1.8063, 3.81608}, {3.57, -4.32}}, textString = "IN", textstyle = {TextStyle.Bold}), Text(origin = {143.969, 50.0896}, lineColor = {255, 0, 0}, extent = {{-3.57, 4.32}, {3.57, -4.32}}, textString = "FEX", textstyle = {TextStyle.Bold}), Text(origin = {10.0349, 20.5041}, lineColor = {255, 0, 0}, extent = {{-3.57, 4.32}, {3.87, -4.45}}, textString = "VFE", textstyle = {TextStyle.Bold}), Text(origin = {22.6555, 79.1333}, lineColor = {255, 0, 0}, extent = {{-3.57, 4.32}, {5.06, -4.92}}, textString = "VR", textstyle = {TextStyle.Bold}), Text(origin = {-76.65, 44.79}, lineColor = {255, 0, 0}, extent = {{-3.57, 4.32}, {1.52, -4.21}}, textString = "VF", textstyle = {TextStyle.Bold})}));
end EXAC3;
