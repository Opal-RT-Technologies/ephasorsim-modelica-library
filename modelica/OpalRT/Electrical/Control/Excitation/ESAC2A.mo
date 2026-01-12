within OpalRT.Electrical.Control.Excitation;
model ESAC2A "IEEE Type AC2A Excitation System"
  extends OpalRT.Electrical.PartialModel.Exciter;
  parameter Real TR = 0.02 "regulator input filter time constant (sec)";
  parameter Real TB = 0.1 " lag time constant of voltage regulator (s)";
  parameter Real TC = 1 " lead time constant of voltage regulator (s)";
  parameter Real KA = 10 "(pu) voltage regulator gain";
  parameter Real TA = 0.02 "(sec) regulator time constant";
  parameter Real VAMAX = 10 "Maximum voltage regulator output";
  parameter Real VAMIN = -10 "Minimum voltage regulator output";
  parameter Real KB = 0.02 "Second stage regulator gain";
  parameter Real VRMAX = 10 "(pu) regulator output maximum limit";
  parameter Real VRMIN = -10 "(pu) regulator output minimum limit";
  parameter Real TE = 0.35 "Exciter time constant";
  parameter Real VFEMAX = 10 "exciter field current limit (> 0)";
  parameter Real KH = 0.02 "Exciter field current feedback gain";
  parameter Real KF = 1 "Excitation control system stabilizer gains";
  parameter Real TF = 1.0 "Excitation control system stabilizer time constant, sec";
  parameter Real KC = 0.02 "Rectifier loading factor proportional to commutating reactance";
  parameter Real KD = 0.02 "Demagnetizing factor";
  parameter Real KE = 1 "exciter constant related fo self-excited field";
  parameter Real E1 = 4 "Exciter voltages at which exciter saturation is defined";
  parameter Real SE_E1 = 0.4 "Exciter saturation function value at E1";
  parameter Real E2 = 5 "Exciter voltages at which exciter saturation is defined";
  parameter Real SE_E2 = 0.5 "Exciter saturation function value at E2";
  import sat_q = OpalRT.NonElectrical.Math.Nonlinear.computeSaturationQuadratic;
  import OpalRT.Electrical.Control.Excitation.Common.currentNormalizationFunction;
  import OpalRT.Electrical.Control.Excitation.Common.rectifierFunction;
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag lag1(T = TR, y_start = ETERM_0) annotation(Placement(visible = true, transformation(origin = {-150, 70}, extent = {{-7.5, -7.5}, {7.5, 7.5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunctionNonWindup.Lag_NonWindupLimit lag_non_windup_limit1(KI = KA, TI = TA, VRMAX = VAMAX, VRMIN = VAMIN, y_init = VA0) annotation(Placement(visible = true, transformation(origin = {-80, 70}, extent = {{-11.25, -11.25}, {11.25, 11.25}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain4(k = KB) annotation(Placement(visible = true, transformation(origin = {-30, 70}, extent = {{7.5, -7.5}, {-7.5, 7.5}}, rotation = 180)));
  Modelica.Blocks.Math.Max HVgate annotation(Placement(visible = true, transformation(origin = {-10, 70}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Min LVgate annotation(Placement(visible = true, transformation(origin = {10, 70}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiter1(uMax = VRMAX, uMin = VRMIN) annotation(Placement(visible = true, transformation(origin = {30, 70}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add8(k2 = -1, k1 = +1) annotation(Placement(visible = true, transformation(origin = {50, 70}, extent = {{-7.5, -7.5}, {7.5, 7.5}}, rotation = 360)));
  Modelica.Blocks.Math.Product product1 annotation(Placement(visible = true, transformation(origin = {150, 70}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.Electrical.Control.Excitation.Common.Rectifier filter1 annotation(Placement(visible = true, transformation(origin = {140, 30}, extent = {{7.5, -7.5}, {-7.5, 7.5}}, rotation = -90)));
  Modelica.Blocks.Sources.Constant constant3(k = VREF_0) annotation(Placement(visible = true, transformation(origin = {-118.75, 49.25}, extent = {{-4.75, -4.75}, {4.75, 4.75}}, rotation = 0)));
  OpalRT.Electrical.Control.Excitation.Common.CurrentNormalization division_modified1 annotation(Placement(visible = true, transformation(origin = {120, -60}, extent = {{-7.5, -7.5}, {7.5, 7.5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunctionNonWindup.Integrator_NonWindupVariableLimit non_windup_integrator_var1(KI = 1 / TE, y_init = VE0) annotation(Placement(visible = true, transformation(origin = {100, 70}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant1(k = 0) annotation(Placement(visible = true, transformation(origin = {90, 40}, extent = {{-7.5, -7.5}, {7.5, 7.5}}, rotation = 0)));
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
  Modelica.Blocks.Math.Add add3(k2 = -1, k1 = +1) annotation(Placement(visible = true, transformation(origin = {-50, 70}, extent = {{-3.75, -3.75}, {3.75, 3.75}}, rotation = 360)));
  Modelica.Blocks.Math.Gain gain5(k = KH) annotation(Placement(visible = true, transformation(origin = {-30, 20}, extent = {{-7.5, -7.5}, {7.5, 7.5}}, rotation = 180)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.LeadLag lead_lag1(TA = TC, TB = TB, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = VA0 / KA) annotation(Placement(visible = true, transformation(origin = {-110, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add3 add31(k2 = -1, k3 = +1) annotation(Placement(visible = true, transformation(origin = {-130, 70}, extent = {{-3.75, -3.75}, {3.75, 3.75}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction transferfunction1(b = {1, 0}, a = {TF0, 1}, initType = Modelica.Blocks.Types.Init.InitialOutput) annotation(Placement(visible = true, transformation(origin = {-110, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Math.Gain gain6(k = KF) annotation(Placement(visible = true, transformation(origin = {-80, 30}, extent = {{-7.5, -7.5}, {7.5, 7.5}}, rotation = 180)));
  Modelica.Blocks.Math.Add add6(k2 = -1, k1 = +1) annotation(Placement(visible = true, transformation(origin = {-140, 40}, extent = {{-7.5, -7.5}, {7.5, 7.5}}, rotation = 90)));
  Modelica.Blocks.Sources.Constant constant4(k = 0) annotation(Placement(visible = true, transformation(origin = {63, 96}, extent = {{-7.5, -7.5}, {7.5, 7.5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add7 annotation(Placement(visible = true, transformation(origin = {-100, 50}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression Ecomp(y = ETERM) annotation(Placement(visible = true, transformation(origin = {-176, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
protected
  parameter Real TF0(start = 1, fixed = false);
  parameter Real VR0(fixed = false);
  parameter Real VA0(fixed = false);
  parameter Real VE0(start = 1, fixed = false);
  parameter Real SE0(fixed = false);
  parameter Real VFE0(fixed = false);
  parameter Real ETERM_0(fixed = false);
  parameter Real IFD0(fixed = false);
  parameter Real VREF_0(fixed = false);
  parameter Real EFD_0(fixed = false);
  parameter Real IN0(fixed = false);
  parameter Real FEX0(fixed = false);
initial algorithm
  TF0 := TF;
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
  VA0 = VR0 / KB + VFE0 * KH;
  VREF_0 = ETERM_0 + VA0 / KA;
  VUEL0 = -Modelica.Constants.inf;
  VOEL0 = Modelica.Constants.inf;
equation
  connect(LVgate.y, limiter1.u) annotation(Line(points = {{15.5, 70}, {23.7168, 70}, {23.7168, 70}, {24, 70}}, color = {0, 0, 127}));
  connect(HVgate.y, LVgate.u2) annotation(Line(points = {{-4.5, 70}, {-1.41593, 70}, {-1.41593, 66.5487}, {4, 66.5487}, {4, 67}}, color = {0, 0, 127}));
  connect(add6.u2, transferfunction1.y) annotation(Line(points = {{-135.5, 31}, {-135.5, 30.0885}, {-121, 30.0885}, {-121, 30}}, color = {0, 0, 127}));
  connect(add6.u1, VOTHSG) annotation(Line(points = {{-144.5, 31}, {-144.5, 34.6903}, {-100, 34.6903}, {-100, -36}}, color = {0, 0, 127}));
  connect(add6.y, add31.u3) annotation(Line(points = {{-140, 48.25}, {-140, 65.1327}, {-139.823, 65.1327}, {-139.823, 66.9027}, {-134.5, 66.9027}, {-134.5, 67}}, color = {0, 0, 127}));
  connect(transferfunction1.u, gain6.y) annotation(Line(points = {{-98, 30}, {-87.7876, 30}, {-87.7876, 30}, {-88.25, 30}}, color = {0, 0, 127}));
  connect(gain6.u, add2.y) annotation(Line(points = {{-71, 30}, {2.12389, 30}, {2.12389, 10.2655}, {2.5, 10.2655}, {2.5, 10.75}}, color = {0, 0, 127}));
  connect(add31.y, lead_lag1.u) annotation(Line(points = {{-125.875, 70}, {-120.354, 70}, {-120.354, 70}, {-120, 70}}, color = {0, 0, 127}));
  connect(lag1.y, add31.u2) annotation(Line(points = {{-142.5, 70}, {-135.575, 70}, {-134.5, 70}, {-134.5, 70}}, color = {0, 0, 127}));
  connect(add7.y, add31.u1) annotation(Line(points={{-94.5,50},{-79.6915,50},{-79.6915,
          82.7763},{-137.789,82.7763},{-137.789,73.0077},{-134.5,73.0077},{-134.5,
          73}},                                                                                                                                                                              color = {0, 0, 127}));
  connect(dVREF, add7.u1) annotation(Line(points={{-100,58},{-111.311,58},{-111.311,
          52.9563},{-106,52.9563},{-106,53}},                                                                                                 color = {0, 0, 127}));
  connect(lead_lag1.y, lag_non_windup_limit1.u) annotation(Line(points = {{-100, 70}, {-92.7434, 70}, {-92.7434, 70}, {-92.375, 70}}, color = {0, 0, 127}));
  connect(lag_non_windup_limit1.y, add3.u1) annotation(Line(points = {{-67.625, 70}, {-61.5929, 70}, {-61.5929, 72.2124}, {-54.5, 72.2124}, {-54.5, 72.25}}, color = {0, 0, 127}));
  connect(gain5.y, add3.u2) annotation(Line(points = {{-38.25, 20}, {-60.177, 20}, {-60.177, 67.6106}, {-54.5, 67.6106}, {-54.5, 67.75}}, color = {0, 0, 127}));
  connect(gain5.u, add2.y) annotation(Line(points = {{-21, 20}, {2.47788, 20}, {2.47788, 9.9115}, {2.47788, 10.75}, {2.5, 10.75}}, color = {0, 0, 127}));
  connect(add3.y, gain4.u) annotation(Line(points = {{-45.875, 70}, {-38.9381, 70}, {-38.9381, 70}, {-39, 70}}, color = {0, 0, 127}));
  connect(gain4.y, HVgate.u2) annotation(Line(points = {{-21.75, 70}, {-19.115, 70}, {-19.115, 66.5487}, {-16.6372, 66.5487}, {-16.6372, 67}, {-16, 67}}, color = {0, 0, 127}));
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
  connect(add2.y, add8.u2) annotation(Line(points = {{2.5, 10.75}, {2.5, 44.6018}, {36.8142, 44.6018}, {36.8142, 65.8407}, {41, 65.5}, {41, 65.5}}, color = {0, 0, 127}));
  connect(gain3.y, division_modified1.IFD) annotation(Line(points = {{68.25, -60}, {101.239, -60}, {101.239, -54.8673}, {112.65, -54.8673}, {112.65, -54.9}}, color = {0, 0, 127}));
  connect(product2.u2, saturation1.y) annotation(Line(points = {{46, -13}, {63.7168, -13}, {63.7168, -10.6195}, {75.0442, -10.6195}, {75.0442, -10}, {75, -10}}, color = {0, 0, 127}));
  connect(saturation1.u, non_windup_integrator_var1.y) annotation(Line(points = {{85, -10}, {108.673, -10}, {108.673, 70}, {107.5, 70}}, color = {0, 0, 127}));
  connect(product2.u1, non_windup_integrator_var1.y) annotation(Line(points = {{46, -7}, {49.5575, -7}, {49.5575, 1.41593}, {108.673, 1.41593}, {108.673, 70}, {107.5, 70}}, color = {0, 0, 127}));
  connect(gain1.u, non_windup_integrator_var1.y) annotation(Line(points = {{69, -30}, {108.319, -30}, {108.319, 70}, {107.5, 70}}, color = {0, 0, 127}));
  connect(constant1.y, non_windup_integrator_var1.VL) annotation(Line(points = {{98.25, 40}, {101.947, 40}, {101.947, 56.5}, {101.5, 56.5}}, color = {0, 0, 127}));
  connect(non_windup_integrator_var1.y, product1.u1) annotation(Line(points = {{107.5, 70}, {126.726, 70}, {126.726, 72.9204}, {144, 72.9204}, {144, 73}}, color = {0, 0, 127}));
  connect(add8.y, non_windup_integrator_var1.u) annotation(Line(points = {{58.25, 70}, {93.0973, 70}, {93.0973, 70}, {92.5, 70}}, color = {0, 0, 127}));
  connect(non_windup_integrator_var1.y, division_modified1.VE) annotation(Line(points = {{107.5, 70}, {109.027, 70}, {109.027, -64.7788}, {112.8, -64.7788}, {112.8, -65.25}}, color = {0, 0, 127}));
  connect(division_modified1.IN, filter1.IN) annotation(Line(points = {{127.5, -60}, {136.991, -60}, {136.991, 22.5}, {137, 22.5}}, color = {0, 0, 127}));
  connect(filter1.FEX, product1.u2) annotation(Line(points = {{137, 37.5}, {137, 67.6106}, {144.779, 67.6106}, {144.779, 67}, {144, 67}}, color = {0, 0, 127}));
  connect(product1.y, EFD) annotation(Line(points = {{155.5, 70}, {168.496, 70}, {168.496, 0}, {100, 0}}, color = {0, 0, 127}));
  connect(VOEL, LVgate.u1) annotation(Line(points = {{-100, -8}, {0.707965, -8}, {0.707965, 73.2743}, {4.60177, 73.2743}, {4.60177, 73}, {4, 73}}, color = {0, 0, 127}));
  connect(limiter1.y, add8.u1) annotation(Line(points = {{35.5, 70}, {37.1681, 70}, {37.1681, 73.9823}, {41, 73.9823}, {41, 74.5}}, color = {0, 0, 127}));
  connect(VUEL, HVgate.u1) annotation(Line(points = {{-100, 20}, {-19.823, 20}, {-19.823, 73.2743}, {-16, 73.2743}, {-16, 73}}, color = {0, 0, 127}));
  connect(Ecomp.y, lag1.u) annotation(Line(points = {{-165, 70}, {-157, 70}}, color = {0, 0, 127}));
  connect(constant4.y, VF) annotation(Line(points = {{71.25, 96}, {85, 96}, {85, 80}, {100, 80}}, color = {0, 0, 127}));
  connect(add7.u2, constant3.y) annotation(Line(points={{-106,47},{-110.54,47},{
          -110.54,47.0437},{-113.525,47.0437},{-113.525,49.25}},                                                                                              color = {0, 0, 127}));
  annotation(Documentation(info = "<html>

<img
src=\"modelica://OpalRT/resource/Excitation/ESAC2A.png\"
alt=\"ESAC2A.png\"><br>
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
</html>"), experiment(StartTime = 0, StopTime = 30, Tolerance = 1e-06, Interval = 0.001), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1}), graphics={  Text(origin = {66.6239, 81.5608}, extent = {{-30.31, 11.5}, {-8.93, -4.46}}, textString = "XADIFD", fontSize = 44)}), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1}), graphics={  Text(origin = {117.402, 61.8991}, lineColor = {255, 0, 0}, extent = {{-3.57, 4.32}, {3.87, -4.45}}, textString = "VE", textstyle = {TextStyle.Bold}), Text(origin = {-62.7188, 78.2529}, lineColor = {255, 0, 0}, extent = {{-3.57, 4.32}, {5.06, -4.92}}, textString = "VA", textstyle = {TextStyle.Bold}), Text(origin = {145.805, -55.8113}, lineColor = {255, 0, 0}, extent = {{-1.8063, 3.81608}, {3.57, -4.32}}, textString = "IN", textstyle = {TextStyle.Bold}), Text(origin = {143.969, 50.0896}, lineColor = {255, 0, 0}, extent = {{-3.57, 4.32}, {3.57, -4.32}}, textString = "FEX", textstyle = {TextStyle.Bold}), Text(origin = {10.0349, 20.5041}, lineColor = {255, 0, 0}, extent = {{-3.57, 4.32}, {3.87, -4.45}}, textString = "VFE", textstyle = {TextStyle.Bold}), Text(origin = {36.3051, 80.8301}, lineColor = {255, 0, 0}, extent = {{-3.57, 4.32}, {5.06, -4.92}}, textString = "VR", textstyle = {TextStyle.Bold}), Text(origin = {-73.0622, 54.4017}, lineColor = {255, 0, 0}, extent = {{-3.57, 4.32}, {1.52018, -4.21204}}, textString = "VH", textstyle = {TextStyle.Bold}), Text(origin = {-129.492, 25.1483}, lineColor = {255, 0, 0}, extent = {{-1.44611, 4.32}, {5.06, -4.92}}, textString = "VF", textstyle = {TextStyle.Bold})}));
end ESAC2A;
