within OpalRT.Electrical.Control.Excitation;
model ESAC3A "IEEE Type AC3A Excitation System"
  extends OpalRT.Electrical.PartialModel.Exciter;
  parameter Real TR = 0.02 "regulator input filter time constant (sec)";
  parameter Real TB = 0.1 " lag time constant of voltage regulator (s)";
  parameter Real TC = 1 " lead time constant of voltage regulator (s)";
  parameter Real KA = 10 "(pu) voltage regulator gain";
  parameter Real TA = 0.02 "(sec) regulator time constant";
  parameter Real VAMAX = 10 "(pu) regulator output maximum limit";
  parameter Real VAMIN = -10 "(pu) regulator output minimum limit";
  parameter Real TE = 0.35 "Exciter time constant";
  parameter Real VEMIN = -10 "exciter field current minimum limit";
  parameter Real KR = 0.4 "Constant associated with regulator and alternator field power";
  parameter Real KF = 1 "Excitation control system stabilizer gains";
  parameter Real TF = 1.0 "Excitation control system stabilizer time constant, sec";
  parameter Real KN = 0.4 "Excitation control system stabilizer gain";
  parameter Real EFDN = 0.4 "Value of EFD at which feedback gain changes";
  parameter Real KC = 0.02 "Rectifier loading factor proportional to commutating reactance";
  parameter Real KD = 0.02 "Demagnetizing factor";
  parameter Real KE = 1 "exciter constant related fo self-excited field";
  parameter Real VFEMAX = 10 "exciter field current maximum limit";
  parameter Real E1 = 4 "Exciter voltages at which exciter saturation is defined";
  parameter Real SE_E1 = 0.4 "Exciter saturation function value at E1";
  parameter Real E2 = 5 "Exciter voltages at which exciter saturation is defined";
  parameter Real SE_E2 = 0.5 "Exciter saturation function value at E2";
  import sat_q = OpalRT.NonElectrical.Math.Nonlinear.computeSaturationQuadratic;
  import OpalRT.Electrical.Control.Excitation.Common.currentNormalizationFunction;
  import OpalRT.Electrical.Control.Excitation.Common.rectifierFunction;
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag lag1(T = TR, y_start = ETERM_0) annotation(Placement(visible = true, transformation(origin = {-150, 70}, extent = {{-7.5, -7.5}, {7.5, 7.5}}, rotation = 0)));
  Modelica.Blocks.Math.Add3 add31(k2 = -1, k3 = +1) annotation(Placement(visible = true, transformation(origin = {-130, 70}, extent = {{-7.5, -7.5}, {7.5, 7.5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.LeadLag lead_lag1(TA = TC, TB = TB, initType = Modelica.Blocks.Types.Init.InitialOutput, K = 1, y_start = VA0 / KA) annotation(Placement(visible = true, transformation(origin = {-110, 70}, extent = {{-8.75, -8.75}, {8.75, 8.75}}, rotation = 0)));
  Modelica.Blocks.Math.Product product1 annotation(Placement(visible = true, transformation(origin = {150, 70}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.Electrical.Control.Excitation.Common.Rectifier filter1 annotation(Placement(visible = true, transformation(origin = {140, 30}, extent = {{7.5, -7.5}, {-7.5, 7.5}}, rotation = -90)));
  Modelica.Blocks.Sources.Constant constant3(k = VREF_0) annotation(Placement(visible = true, transformation(origin = {-123, 44}, extent = {{-7.5, -7.5}, {7.5, 7.5}}, rotation = 0)));
  OpalRT.Electrical.Control.Excitation.Common.CurrentNormalization division_modified1 annotation(Placement(visible = true, transformation(origin = {120, -60}, extent = {{-7.5, -7.5}, {7.5, 7.5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunctionNonWindup.Integrator_NonWindupVariableLimit non_windup_integrator_var1(KI = 1 / TE, y_init = VE0) annotation(Placement(visible = true, transformation(origin = {100, 70}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant1(k = VEMIN) annotation(Placement(visible = true, transformation(origin = {90, 40}, extent = {{-7.5, -7.5}, {7.5, 7.5}}, rotation = 0)));
  Modelica.Blocks.Math.Product product2 annotation(Placement(visible = true, transformation(origin = {40, -10}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = KE) annotation(Placement(visible = true, transformation(origin = {60, -30}, extent = {{-7.5, -7.5}, {7.5, 7.5}}, rotation = 180)));
  NonElectrical.Math.Nonlinear.SaturationQuadratic saturation1(E1 = E1, E2 = E2, SE_E1 = SE_E1, SE_E2 = SE_E2) annotation(Placement(visible = true, transformation(origin = {80, -10}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain3(k = KC) annotation(Placement(visible = true, transformation(origin = {60, -60}, extent = {{7.5, -7.5}, {-7.5, 7.5}}, rotation = 180)));
  Modelica.Blocks.Math.Add add2(k2 = +1, k1 = +1) annotation(Placement(visible = true, transformation(origin = {2.5, 2.5}, extent = {{-7.5, -7.5}, {7.5, 7.5}}, rotation = 90)));
  Modelica.Blocks.Math.Add add1(k2 = +1, k1 = +1) annotation(Placement(visible = true, transformation(origin = {17.5, -22.5}, extent = {{-7.5, -7.5}, {7.5, 7.5}}, rotation = 180)));
  Modelica.Blocks.Math.Add add5(k2 = +1, k1 = -1) annotation(Placement(visible = true, transformation(origin = {-140, -10}, extent = {{-7.5, -7.5}, {7.5, 7.5}}, rotation = 360)));
  Modelica.Blocks.Sources.Constant constant2(k = VFEMAX) annotation(Placement(visible = true, transformation(origin = {-170, -10}, extent = {{-7.5, -7.5}, {7.5, 7.5}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = KE) annotation(Placement(visible = true, transformation(origin = {-170, -40}, extent = {{-7.5, -7.5}, {7.5, 7.5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add4(k2 = +1, k1 = +1) annotation(Placement(visible = true, transformation(origin = {-140, -40}, extent = {{7.5, -7.5}, {-7.5, 7.5}}, rotation = 180)));
  Modelica.Blocks.Math.Division division1 annotation(Placement(visible = true, transformation(origin = {-110, -20}, extent = {{-7.5, -7.5}, {7.5, 7.5}}, rotation = 360)));
  Modelica.Blocks.Math.Gain gain2(k = KD) annotation(Placement(visible = true, transformation(origin = {0, -40}, extent = {{-7.5, -7.5}, {7.5, 7.5}}, rotation = 90)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunctionNonWindup.Lag_NonWindupLimit lag_non_windup_limit1(KI = KA, TI = TA, y_init = VA0, VRMAX = VAMAX, VRMIN = VAMIN) annotation(Placement(visible = true, transformation(origin = {-30, 70}, extent = {{-11.25, -11.25}, {11.25, 11.25}}, rotation = 0)));
  Modelica.Blocks.Math.Product product3 annotation(Placement(visible = true, transformation(origin = {0, 70}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add8(k2 = -1, k1 = +1) annotation(Placement(visible = true, transformation(origin = {40, 70}, extent = {{-7.5, -7.5}, {7.5, 7.5}}, rotation = 360)));
  Modelica.Blocks.Math.Gain gain4(k = KR) annotation(Placement(visible = true, transformation(origin = {50, 90}, extent = {{-7.5, -7.5}, {7.5, 7.5}}, rotation = 180)));
  Modelica.Blocks.Math.Add add3(k2 = -1, k1 = +1) annotation(Placement(visible = true, transformation(origin = {-60, 70}, extent = {{-7.5, -7.5}, {7.5, 7.5}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction transferfunction1(initType = Modelica.Blocks.Types.Init.InitialOutput, b = {1, 0}, a = {TF01, 1}) annotation(Placement(visible = true, transformation(origin = {-60, 40}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  OpalRT.Electrical.Control.Excitation.Common.PieceWiseLinearGain piecewiselineargain1(KF = KF, KN = KN, EFDN = EFDN) annotation(Placement(visible = true, transformation(origin = {-30, 40}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add6(k2 = +1, k1 = +1) annotation(Placement(visible = true, transformation(origin = {-150, 40}, extent = {{-7.5, -7.5}, {7.5, 7.5}}, rotation = 0)));
  Modelica.Blocks.Math.Max HVgate annotation(Placement(visible = true, transformation(origin = {-90, 70}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant4(k = 0) annotation(Placement(visible = true, transformation(origin = {77, 106}, extent = {{-7.5, -7.5}, {7.5, 7.5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add7 annotation(Placement(visible = true, transformation(origin = {-100, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression Ecomp(y = ETERM) annotation(Placement(visible = true, transformation(origin = {-176, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
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
  VUEL0 = -Modelica.Constants.inf;
  VOEL0 = 0;
equation
  connect(HVgate.y, add3.u1) annotation(Line(points = {{-84.5, 70}, {-77.3719, 70}, {-77.3719, 74.5657}, {-69, 74.5657}, {-69, 74.5}}, color = {0, 0, 127}));
  connect(HVgate.u1, VUEL) annotation(Line(points = {{-96, 73}, {-99.02, 73}, {-99.02, 98.6192}, {-100, 98.6192}, {-100, 20}}, color = {0, 0, 127}));
  connect(lead_lag1.y, HVgate.u2) annotation(Line(points = {{-101.25, 70}, {-97.4165, 70}, {-97.4165, 67}, {-96, 67}}, color = {0, 0, 127}));
  connect(add6.y, add31.u3) annotation(Line(points = {{-141.75, 40}, {-139.566, 40}, {-139.566, 64}, {-139, 64}}, color = {0, 0, 127}));
  connect(VOEL, add6.u2) annotation(Line(points = {{-100, -8}, {-164.77, -8}, {-164.77, 34.9593}, {-159, 34.9593}, {-159, 35.5}}, color = {0, 0, 127}));
  connect(VOTHSG, add6.u1) annotation(Line(points = {{-100, -36}, {-159.621, -36}, {-159.621, 44.5}, {-159, 44.5}}, color = {0, 0, 127}));
  connect(piecewiselineargain1.EFD, gain4.u) annotation(Line(points = {{-20, 34}, {33.6043, 34}, {49.5935, 42.2764}, {65.3117, 50.9485}, {65.3117, 89.7019}, {59, 89.7019}, {59, 90}}, color = {0, 0, 127}));
  connect(piecewiselineargain1.VN, transferfunction1.u) annotation(Line(points = {{-40, 34}, {-46.8835, 34}, {-46.8835, 40.1084}, {-54, 40.1084}, {-54, 40}}, color = {0, 0, 127}));
  connect(transferfunction1.y, add3.u2) annotation(Line(points = {{-65.5, 40}, {-72.9761, 40}, {-72.9761, 65.2223}, {-69, 65.2223}, {-69, 65.5}}, color = {0, 0, 127}));
  connect(add3.y, lag_non_windup_limit1.u) annotation(Line(points = {{-51.75, 70}, {-42.6454, 70}, {-42.6454, 70}, {-42.375, 70}}, color = {0, 0, 127}));
  connect(gain4.u, product1.y) annotation(Line(points = {{59, 90}, {160.354, 90}, {160.354, 69.7345}, {155.398, 69.7345}, {155.398, 70}, {155.5, 70}}, color = {0, 0, 127}));
  connect(gain4.y, product3.u1) annotation(Line(points = {{41.75, 90}, {-9.20354, 90}, {-9.20354, 73.2743}, {-6, 73.2743}, {-6, 73}}, color = {0, 0, 127}));
  connect(product3.u2, lag_non_windup_limit1.y) annotation(Line(points = {{-6, 67}, {-16.6372, 67}, {-16.6372, 70}, {-17.625, 70}}, color = {0, 0, 127}));
  connect(product3.y, add8.u1) annotation(Line(points = {{5.5, 70}, {19.469, 70}, {19.469, 74.6903}, {31, 74.6903}, {31, 74.5}}, color = {0, 0, 127}));
  connect(add2.y, add8.u2) annotation(Line(points = {{2.5, 10.75}, {2.5, 41.7699}, {24.0708, 41.7699}, {24.0708, 65.4867}, {30.4425, 65.4867}, {30.4425, 65.5}, {31, 65.5}}, color = {0, 0, 127}));
  connect(add8.y, non_windup_integrator_var1.u) annotation(Line(points = {{48.25, 70}, {93.0973, 70}, {93.0973, 70}, {92.5, 70}}, color = {0, 0, 127}));
  connect(division1.y, non_windup_integrator_var1.VU) annotation(Line(points = {{-101.75, -20}, {-49.5575, -20}, {13.8053, -20}, {13.8053, 46.7257}, {71.5044, 46.7257}, {71.5044, 92.0354}, {98.5, 92.0354}, {98.5, 83.5}}, color = {0, 0, 127}));
  connect(add5.u1, gain2.y) annotation(Line(points = {{-149, -5.5}, {-153.628, -5.5}, {-153.628, 6.0177}, {-17.6991, 6.0177}, {-17.6991, -32.2124}, {-7.07965, -31.75}, {5.0515e-16, -31.75}}, color = {0, 0, 127}));
  connect(gain3.u, XADIFD) annotation(Line(points = {{51, -60}, {0, -60}, {0, -70.0885}, {-100, -70.0885}, {-100, -64}}, color = {0, 0, 127}));
  connect(gain2.u, XADIFD) annotation(Line(points = {{-5.51073e-16, -49}, {-5.51073e-16, -70.7965}, {-16.9912, -70.7965}, {-16.9912, -64}, {-100, -64}}, color = {0, 0, 127}));
  connect(gain2.y, add2.u1) annotation(Line(points = {{5.0515e-16, -31.75}, {5.0515e-16, -7.78761}, {-2, -7.78761}, {-2, -6.5}}, color = {0, 0, 127}));
  connect(saturation1.y, add4.u1) annotation(Line(points = {{75, -10}, {72.5664, -10}, {72.5664, -54.1593}, {-153.982, -54.1593}, {-153.982, -44.9558}, {-149, -44.9558}, {-149, -44.5}}, color = {0, 0, 127}));
  connect(const.y, add4.u2) annotation(Line(points = {{-161.75, -40}, {-154.336, -40}, {-154.336, -35.3982}, {-149, -35.3982}, {-149, -35.5}}, color = {0, 0, 127}));
  connect(constant2.y, add5.u2) annotation(Line(points = {{-161.75, -10}, {-149.735, -10}, {-149.735, -14.5}, {-149, -14.5}}, color = {0, 0, 127}));
  connect(add4.y, division1.u2) annotation(Line(points = {{-131.75, -40}, {-127.434, -40}, {-127.434, -24.7788}, {-119, -24.7788}, {-119, -24.5}}, color = {0, 0, 127}));
  connect(add5.y, division1.u1) annotation(Line(points = {{-131.75, -10}, {-123.894, -10}, {-123.894, -15.9292}, {-119, -15.9292}, {-119, -15.5}}, color = {0, 0, 127}));
  connect(add1.u1, gain1.y) annotation(Line(points = {{26.5, -27}, {44.9558, -27}, {44.9558, -30.0885}, {52.0354, -30.0885}, {52.0354, -30}, {51.75, -30}}, color = {0, 0, 127}));
  connect(add1.y, add2.u2) annotation(Line(points = {{9.25, -22.5}, {7.43363, -22.5}, {7.43363, -6.5}, {7, -6.5}}, color = {0, 0, 127}));
  connect(add1.u2, product2.y) annotation(Line(points = {{26.5, -18}, {29.7345, -18}, {29.7345, -9.9115}, {34.5, -9.9115}, {34.5, -10}}, color = {0, 0, 127}));
  connect(gain3.y, division_modified1.IFD) annotation(Line(points = {{68.25, -60}, {101.239, -60}, {101.239, -54.8673}, {112.65, -54.8673}, {112.65, -54.9}}, color = {0, 0, 127}));
  connect(product2.u2, saturation1.y) annotation(Line(points = {{46, -13}, {63.7168, -13}, {63.7168, -10.6195}, {75.0442, -10.6195}, {75.0442, -10}, {75, -10}}, color = {0, 0, 127}));
  connect(saturation1.u, non_windup_integrator_var1.y) annotation(Line(points = {{85, -10}, {108.673, -10}, {108.673, 70}, {107.5, 70}}, color = {0, 0, 127}));
  connect(product2.u1, non_windup_integrator_var1.y) annotation(Line(points = {{46, -7}, {49.5575, -7}, {49.5575, 1.41593}, {108.673, 1.41593}, {108.673, 70}, {107.5, 70}}, color = {0, 0, 127}));
  connect(gain1.u, non_windup_integrator_var1.y) annotation(Line(points = {{69, -30}, {108.319, -30}, {108.319, 70}, {107.5, 70}}, color = {0, 0, 127}));
  connect(constant1.y, non_windup_integrator_var1.VL) annotation(Line(points = {{98.25, 40}, {101.947, 40}, {101.947, 56.5}, {101.5, 56.5}}, color = {0, 0, 127}));
  connect(non_windup_integrator_var1.y, product1.u1) annotation(Line(points = {{107.5, 70}, {126.726, 70}, {126.726, 72.9204}, {144, 72.9204}, {144, 73}}, color = {0, 0, 127}));
  connect(non_windup_integrator_var1.y, division_modified1.VE) annotation(Line(points = {{107.5, 70}, {109.027, 70}, {109.027, -64.7788}, {112.8, -64.7788}, {112.8, -65.25}}, color = {0, 0, 127}));
  connect(division_modified1.IN, filter1.IN) annotation(Line(points = {{127.5, -60}, {136.991, -60}, {136.991, 22.5}, {137, 22.5}}, color = {0, 0, 127}));
  connect(filter1.FEX, product1.u2) annotation(Line(points = {{137, 37.5}, {137, 67.6106}, {144.779, 67.6106}, {144.779, 67}, {144, 67}}, color = {0, 0, 127}));
  connect(constant3.y, add7.u2) annotation(Line(points={{-114.75,44},{-113.111,44},
          {-113.111,37.018},{-106,37.018},{-106,37}},                                                                                                 color = {0, 0, 127}));
  connect(product1.y, EFD) annotation(Line(points = {{155.5, 70}, {168.496, 70}, {168.496, 0}, {100, 0}}, color = {0, 0, 127}));
  connect(add31.y, lead_lag1.u) annotation(Line(points = {{-121.75, 70}, {-118.938, 70}, {-118.938, 70}, {-118.75, 70}}, color = {0, 0, 127}));
  connect(add7.y, add31.u1) annotation(Line(points={{-94.5,40},{-84.8329,40},{-84.8329,
          30.3342},{-138.817,30.3342},{-138.817,76},{-139,76}},                                                                                                         color = {0, 0, 127}));
  connect(dVREF, add7.u1) annotation(Line(points={{-100,58},{-110.026,58},{-110.026,
          42.9306},{-106,42.9306},{-106,43}},                                                                                                   color = {0, 0, 127}));
  connect(lag1.y, add31.u2) annotation(Line(points = {{-142.5, 70}, {-135.575, 70}, {-139, 70}, {-139, 70}}, color = {0, 0, 127}));
  connect(Ecomp.y, lag1.u) annotation(Line(points = {{-165, 70}, {-157, 70}}, color = {0, 0, 127}));
  connect(constant4.y, VF) annotation(Line(points = {{85.25, 106}, {87, 106}, {87, 80}, {100, 80}}, color = {0, 0, 127}));
  annotation(Documentation(info = "<html>

<img
src=\"modelica://OpalRT/resource/Excitation/ESAC3A.png\"
alt=\"ESAC3A.png\"><br>
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
</html>"), experiment(StartTime = 0, StopTime = 30, Tolerance = 1e-06, Interval = 0.001), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1}), graphics={  Text(origin = {66.6239, 81.5608}, extent = {{-30.31, 11.5}, {-8.93, -4.46}}, textString = "XADIFD", fontSize = 44)}), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1}), graphics={  Text(origin = {119.632, 62.0005}, lineColor = {255, 0, 0}, extent = {{-3.57, 4.32}, {3.87, -4.45}}, textString = "VE", textstyle = {TextStyle.Bold}), Text(origin = {-12.0251, 61.4838}, lineColor = {255, 0, 0}, extent = {{-3.57, 4.32}, {5.06, -4.92}}, textString = "VA", textstyle = {TextStyle.Bold}), Text(origin = {145.805, -55.8113}, lineColor = {255, 0, 0}, extent = {{-1.8063, 3.81608}, {3.57, -4.32}}, textString = "IN", textstyle = {TextStyle.Bold}), Text(origin = {143.969, 50.0896}, lineColor = {255, 0, 0}, extent = {{-3.57, 4.32}, {3.57, -4.32}}, textString = "FEX", textstyle = {TextStyle.Bold}), Text(origin = {10.0349, 20.5041}, lineColor = {255, 0, 0}, extent = {{-3.57, 4.32}, {3.87, -4.45}}, textString = "VFE", textstyle = {TextStyle.Bold}), Text(origin = {11.3783, 77.9369}, lineColor = {255, 0, 0}, extent = {{-3.57, 4.32}, {5.06, -4.92}}, textString = "VR", textstyle = {TextStyle.Bold}), Text(origin = {-76.25, 51.22}, lineColor = {255, 0, 0}, extent = {{-3.57, 4.32}, {1.52, -4.21}}, textString = "VF", textstyle = {TextStyle.Bold})}));
end ESAC3A;
