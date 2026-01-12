within OpalRT.Electrical.Control.TurbineGovernor;
model WEHGOV
  extends OpalRT.Electrical.PartialModel.TurbineGovernor;
  parameter Integer IBUS = 100 "Located Bus No.";
  parameter String ID = "M1" "Machine Identifier";
  parameter Real R_PERM_GATE = 0.05;
  parameter Real R_PERM_PE = 0.01;
  parameter Real TPE = 0.2 "(sec)";
  parameter Real KP = 3.0;
  parameter Real KI = 1.0;
  parameter Real KD = 0.01;
  parameter Real TD = 0.01 "(sec)";
  parameter Real TP = 0.20 "(sec)";
  parameter Real TDV = 0.10 "(sec)";
  parameter Real Tg = 0.10 "(sec)";
  parameter Real GTMXOP = 0.08;
  parameter Real GTMXCL = -0.1;
  parameter Real GMAX = 0.5;
  parameter Real GMIN = -0.5;
  parameter Real DTURB = 0.1;
  parameter Real TW = 3.0 "(sec)";
  parameter Real DBAND = 0.003;
  parameter Real DPV = 0.0;
  parameter Real DICN = 0.04;
  parameter Real GATE1 = 0.0;
  parameter Real FLOWG1 = 0.0;
  parameter Real GATE2 = 1.0;
  parameter Real FLOWG2 = 1.0;
  parameter Real GATE3 = 1.0;
  parameter Real FLOWG3 = 1.0;
  parameter Real GATE4 = 1.0;
  parameter Real FLOWG4 = 1.0;
  parameter Real GATE5 = 1.0;
  parameter Real FLOWG5 = 1.0;
  parameter Real FLOWP1 = 0.0;
  parameter Real PMECH1 = -0.478;
  parameter Real FLOWP2 = 0.303;
  parameter Real PMECH2 = 0.000;
  parameter Real FLOWP3 = 0.500;
  parameter Real PMECH3 = 0.312;
  parameter Real FLOWP4 = 0.750;
  parameter Real PMECH4 = 0.707;
  parameter Real FLOWP5 = 0.800;
  parameter Real PMECH5 = 0.786;
  parameter Real FLOWP6 = 0.850;
  parameter Real PMECH6 = 0.836;
  parameter Real FLOWP7 = 0.900;
  parameter Real PMECH7 = 0.876;
  parameter Real FLOWP8 = 0.950;
  parameter Real PMECH8 = 0.896;
  parameter Real FLOWP9 = 0.990;
  parameter Real PMECH9 = 0.900;
  parameter Real FLOWP10 = 1.00;
  parameter Real PMECH10 = 0.910;
  parameter Real M = 0;
  Modelica.Blocks.Math.Add3 add31(k2 = -1, k3 = -1) annotation(Placement(visible = true, transformation(origin = {-69, 75}, extent = {{-7.4375, -7.4375}, {7.4375, 7.4375}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1 annotation(Placement(visible = true, transformation(origin = {-70, 46}, extent = {{-6, -6}, {6, 6}}, rotation = 180)));
  Modelica.Blocks.Nonlinear.DeadZone deadzone1(uMax = DBAND, uMin = -DBAND) annotation(Placement(visible = true, transformation(origin = {-48, 75}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = KP) annotation(Placement(visible = true, transformation(origin = {-26, 76}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Add3 add32 annotation(Placement(visible = true, transformation(origin = {0, 76}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.TransferFunction1 transferfunction11(b = {KD, 0}, a = {TD0, 1}) annotation(Placement(visible = true, transformation(origin = {-28, 96}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunctionNonWindup.Integrator_NonWindupLimit integrator_nonwinduplimit1(KI = KI, VRMAX = GMAX + DICN, VRMIN = GMIN - DICN, y_init = GATE0) annotation(Placement(visible = true, transformation(origin = {-26, 56}, extent = {{-13, -13}, {13, 13}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunctionNonWindup.Lag_NonWindupLimit lag_nonwinduplimit1(TI = TP, VRMAX = GMAX + DPV, VRMIN = GMIN - DPV, y_init = GATE0) annotation(Placement(visible = true, transformation(origin = {28, 76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add3 add33(k2 = -1, k3 = -1) annotation(Placement(visible = true, transformation(origin = {60, 72}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunctionNonWindup.Integrator_NonWindupLimit integrator_nonwinduplimit2(KI = 1 / TDV, VRMAX = GTMXOP * Tg, VRMIN = GTMXCL * Tg) annotation(Placement(visible = true, transformation(origin = {84, 72}, extent = {{-13, -13}, {13, 13}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain2(k = 1 / Tg) annotation(Placement(visible = true, transformation(origin = {76, 22}, extent = {{7, -7}, {-7, 7}}, rotation = 0)));
  OpalRT.NonElectrical.SignalRouting.Multiplexer multiplexer1(n = 2, s = M + 1) annotation(Placement(visible = true, transformation(origin = {22, 22}, extent = {{8, -8}, {-8, 8}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain3(k = R_PERM_GATE) annotation(Placement(visible = true, transformation(origin = {-8, 22}, extent = {{7, -7}, {-7, 7}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 0) annotation(Placement(visible = true, transformation(origin = {-100, -20}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunctionNonWindup.Integrator_NonWindupLimit integrator_nonwinduplimit3(VRMAX = GMAX, VRMIN = GMIN, y_init = GATE0) annotation(Placement(visible = true, transformation(origin = {50, 22}, extent = {{11.5, -11.5}, {-11.5, 11.5}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant2(k = 0) annotation(Placement(visible = true, transformation(origin = {80, -80}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Nonlinear.PieceWiseLinear10 piecewiselinear101(y1 = PMECH1, y2 = PMECH2, y3 = PMECH3, y4 = PMECH4, y5 = PMECH5, y6 = PMECH6, y7 = PMECH7, y8 = PMECH8, y9 = PMECH9, y10 = PMECH10, u1 = FLOWP1, u2 = FLOWP2, u3 = FLOWP3, u4 = FLOWP4, u5 = FLOWP5, u6 = FLOWP6, u7 = FLOWP7, u8 = FLOWP8, u9 = FLOWP9, u10 = FLOWP10) annotation(Placement(visible = true, transformation(origin = {62, -41}, extent = {{-9.5, -9.5}, {9.5, 9.5}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant1(k = 1) annotation(Placement(visible = true, transformation(origin = {-5, -52}, extent = {{-4, -4}, {4, 4}}, rotation = 0)));
  Modelica.Blocks.Math.Add add2(k1 = -1) annotation(Placement(visible = true, transformation(origin = {15, -41}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Product product2 annotation(Placement(visible = true, transformation(origin = {85, -37}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Product product1 annotation(Placement(visible = true, transformation(origin = {-5, -38}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Nonlinear.PieceWiseLinear5 piecewiselinear51(y1 = FLOWG1, y2 = FLOWG2, y3 = FLOWG3, y4 = FLOWG4, y5 = FLOWG5, u1 = GATE1, u2 = GATE2, u3 = GATE3, u4 = GATE4, u5 = GATE5) annotation(Placement(visible = true, transformation(origin = {-51, -34}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Blocks.Math.Add add3(k1 = -1) annotation(Placement(visible = true, transformation(origin = {70, -7}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain5(k = DTURB) annotation(Placement(visible = true, transformation(origin = {-24, -7}, extent = {{-6.5, -6.5}, {6.5, 6.5}}, rotation = 0)));
  Modelica.Blocks.Math.Product product3 annotation(Placement(visible = true, transformation(origin = {49, -3}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant3(k = GREF_0) annotation(Placement(visible = true, transformation(origin = {-118, 60}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator integrator1(k = 1 / TW, y_start = FLOWP0) annotation(Placement(visible = true, transformation(origin = {33, -41}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Blocks.Math.Division division1 annotation(Placement(visible = true, transformation(origin = {-28, -38}, extent = {{-6, 6}, {6, -6}}, rotation = 0)));
  OpalRT.NonElectrical.SignalRouting.Multiplexer multiplexer2(n = 2, s = M + 1) annotation(Placement(visible = true, transformation(origin = {-74, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag lag1(K = R_PERM_PE, T = TPE, y_start = PELEC_0 * R_PERM_PE) annotation(Placement(visible = true, transformation(origin = {-74, -16}, extent = {{-8.5, -8.5}, {8.5, 8.5}}, rotation = 90)));
  Modelica.Blocks.Math.Add add4 annotation(Placement(visible = true, transformation(origin = {-100, 60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
protected
  parameter Real TD0(start = 1, fixed = false);
  parameter Real PMECH_0(fixed = false);
  parameter Real PELEC_0(fixed = false);
  parameter Real GREF_0(fixed = false);
  parameter Real PMSS0(fixed = false);
  parameter Real FLOWP0(fixed = false);
  parameter Real FLOWG0(fixed = false);
  parameter Real GATE0(fixed = false);
initial algorithm
  TD0 := TD;
  PMSS0 := PMECH_0;
  if PMSS0 > PMECH10 then
    FLOWP0 := FLOWP10;
  elseif PMSS0 > PMECH9 then
    FLOWP0 := (PMSS0 - PMECH9) * (FLOWP10 - FLOWP9) / (PMECH10 - PMECH9) + FLOWP9;
  elseif PMSS0 > PMECH8 then
    FLOWP0 := (PMSS0 - PMECH8) * (FLOWP9 - FLOWP8) / (PMECH9 - PMECH8) + FLOWP8;
  elseif PMSS0 > PMECH7 then
    FLOWP0 := (PMSS0 - PMECH7) * (FLOWP8 - FLOWP7) / (PMECH8 - PMECH7) + FLOWP7;
  elseif PMSS0 > PMECH6 then
    FLOWP0 := (PMSS0 - PMECH6) * (FLOWP7 - FLOWP6) / (PMECH7 - PMECH6) + FLOWP6;
  elseif PMSS0 > PMECH5 then
    FLOWP0 := (PMSS0 - PMECH5) * (FLOWP6 - FLOWP5) / (PMECH6 - PMECH5) + FLOWP5;
  elseif PMSS0 > PMECH4 then
    FLOWP0 := (PMSS0 - PMECH4) * (FLOWP5 - FLOWP4) / (PMECH5 - PMECH4) + FLOWP4;
  elseif PMSS0 > PMECH3 then
    FLOWP0 := (PMSS0 - PMECH3) * (FLOWP4 - FLOWP3) / (PMECH4 - PMECH3) + FLOWP3;
  elseif PMSS0 > PMECH2 then
    FLOWP0 := (PMSS0 - PMECH2) * (FLOWP3 - FLOWP2) / (PMECH3 - PMECH2) + FLOWP2;
  elseif PMSS0 > PMECH1 then
    FLOWP0 := (PMSS0 - PMECH1) * (FLOWP2 - FLOWP1) / (PMECH2 - PMECH1) + FLOWP1;
  else
    FLOWP0 := FLOWP1;
  end if;
  FLOWG0 := FLOWP0;
  if FLOWG0 > FLOWG5 then
    GATE0 := GATE5;
  elseif FLOWG0 > FLOWG4 then
    GATE0 := (FLOWG0 - FLOWG4) * (GATE5 - GATE4) / (FLOWG5 - FLOWG4) + GATE4;
  elseif FLOWG0 > FLOWG3 then
    GATE0 := (FLOWG0 - FLOWG3) * (GATE4 - GATE3) / (FLOWG4 - FLOWG3) + GATE3;
  elseif FLOWG0 > FLOWG2 then
    GATE0 := (FLOWG0 - FLOWG2) * (GATE3 - GATE2) / (FLOWG3 - FLOWG2) + GATE2;
  elseif FLOWG0 > FLOWG1 then
    GATE0 := (FLOWG0 - FLOWG1) * (GATE2 - GATE1) / (FLOWG2 - FLOWG1) + GATE1;
  else
    GATE0 := GATE1;
  end if;
  GREF_0 := if M == 0 then R_PERM_GATE * GATE0 + PELEC_0 * R_PERM_PE else R_PERM_GATE * GATE0;
initial equation
  PMECH_0 = PMECH0;
  PELEC_0 = PELEC;
equation
  lag1.u = PELEC;
  connect(lag1.y, multiplexer2.u[1]) annotation(Line(points={{-74,-7.5},{-74,0},
          {-74,8},{-73.5,8}},                                                                                   color = {0, 0, 127}));
  connect(const.y, multiplexer2.u[2]) annotation(Line(points={{-92.3,-20},{
          -86.1131,-20},{-86.1131,-4.07904},{-74.5,-4.07904},{-74.5,-0.453227},
          {-74.5,8}},                                                                                                                                                  color = {0, 0, 127}));
  connect(multiplexer2.y, add1.u1) annotation(Line(points={{-74,28},{-74,
          31.7259},{-58.0131,31.7259},{-58.0131,42.6033},{-62.8,42.6033},{-62.8,
          42.4}},                                                                                                                                                            color = {0, 0, 127}));
  connect(division1.y, product1.u1) annotation(Line(points={{-21.4,-38},{
          -17.7984,-38},{-17.7984,-34.9275},{-11,-34.9275},{-11,-35}},                                                                                          color = {0, 0, 127}));
  connect(product1.u2, division1.y) annotation(Line(points = {{-11, -41}, {-17.8886, -41}, {-17.8886, -38.2431}, {-20.1848, -38}, {-21.4, -38}}, color = {0, 0, 127}));
  connect(piecewiselinear51.y, division1.u2) annotation(Line(points = {{-43, -34}, {-33.6991, -34}, {-35.2, -34.8885}, {-35.2, -34.4}}, color = {0, 0, 127}));
  connect(division1.u1, integrator1.y) annotation(Line(points = {{-35.2, -41.6}, {-39.646, -41.6}, {-39.646, -59.0726}, {48.3681, -59.0726}, {48.3681, -41.2319}, {45.1965, -41}, {40.7, -41}}, color = {0, 0, 127}));
  connect(integrator1.y, piecewiselinear101.u) annotation(Line(points = {{40.7, -41}, {52.3894, -41}, {52.3894, -41}, {52.5, -41}}, color = {0, 0, 127}));
  connect(add2.y, integrator1.u) annotation(Line(points = {{20.5, -41}, {28.884, -41}, {24.6, -41.7259}, {24.6, -41}}, color = {0, 0, 127}));
  connect(constant3.y, add4.u2) annotation(Line(points={{-109.2,60},{-108.226,
          60},{-108.226,57.0694},{-106,57.0694},{-106,57}},                                                                                             color = {0, 0, 127}));
  connect(product3.y, add3.u1) annotation(Line(points={{55.6,-3},{63.7168,-3},{
          63.7168,-3.4},{62.8,-3.4}},                                                                                          color = {0, 0, 127}));
  connect(product3.u1, integrator_nonwinduplimit3.y) annotation(Line(points={{41.8,
          0.6},{38.9381,0.6},{38.9381,21.9469},{44.25,21.9469},{44.25,22}},                                                                                              color = {0, 0, 127}));
  connect(gain5.y, product3.u2) annotation(Line(points = {{-16.85, -7}, {-6.37168, -7}, {41.8, -7.6}, {41.8, -6.6}}, color = {0, 0, 127}));
  connect(SLIP, gain5.u) annotation(Line(points = {{-102, 0}, {-52.7434, 0}, {-52.7434, -7.07965}, {-38.3, -7}, {-31.8, -7}}, color = {0, 0, 127}));
  connect(add3.y, PMECH) annotation(Line(points={{76.6,-7},{86.7257,-7},{
          86.7257,-1.41593},{104,-1.41593},{104,4.44089e-16}},                                                                                color = {0, 0, 127}));
  connect(product2.y, add3.u2) annotation(Line(points={{91.6,-37},{95.2212,-37},
          {95.2212,-16.6372},{58.7611,-16.6372},{58.7611,-10.9735},{62.8,
          -10.9735},{62.8,-10.6}},                                                                                                                                                              color = {0, 0, 127}));
  connect(piecewiselinear51.u, integrator_nonwinduplimit3.y) annotation(Line(points = {{-59, -34}, {-61.9469, -34}, {-61.9469, 10.2655}, {38.9381, 10.2655}, {38.9381, 21.9469}, {44.25, 22}, {44.25, 22}}, color = {0, 0, 127}));
  connect(product2.u1, product1.y) annotation(Line(points = {{77.8, -33.4}, {73.6283, -33.4}, {73.6283, -24.9558}, {6.37168, -24.9558}, {6.37168, -38.4071}, {0.5, -38.4071}, {0.5, -38}}, color = {0, 0, 127}));
  connect(product1.y, add2.u1) annotation(Line(points={{0.5,-38},{8.7472,-38},{
          8.7472,-38},{9,-38}},                                                                                              color = {0, 0, 127}));
  connect(piecewiselinear101.y, product2.u2) annotation(Line(points = {{71.5, -41}, {77.5221, -41}, {77.5221, -40.6}, {77.8, -40.6}}, color = {0, 0, 127}));
  connect(constant1.y, add2.u2) annotation(Line(points={{-0.6,-52},{3.466,-52},
          {3.466,-44.2132},{9,-44.2132},{9,-44}},                                                                                                color = {0, 0, 127}));
  connect(constant2.y, PMECH_LP) annotation(Line(points = {{86.6, -80}, {89.2035, -80}, {89.2035, -60.531}, {104, -60.531}, {104, -60}}, color = {0, 0, 127}));
  connect(gain2.y, integrator_nonwinduplimit3.u) annotation(Line(points = {{68.3, 22}, {54.8223, 22}, {55.75, 22.335}, {55.75, 22}}, color = {0, 0, 127}));
  connect(integrator_nonwinduplimit3.y, multiplexer1.u[1]) annotation(Line(points={{44.25,
          22},{29.9325,22},{29.9325,21.6},{30,21.6}},                                                                                                     color = {0, 0, 127}));
  connect(integrator_nonwinduplimit3.y, add33.u2) annotation(Line(points={{44.25,
          22},{38.5243,22},{38.5243,69.3437},{47.5888,69.3437},{47.5888,71.6099},
          {52.8,71.6099},{52.8,72}},                                                                                                                                                                         color = {0, 0, 127}));
  connect(integrator_nonwinduplimit2.y, add33.u3) annotation(Line(points={{90.5,72},
          {106.055,72},{106.055,55.2937},{49.4017,55.2937},{49.4017,67.0776},{
          52.8,67.0776},{52.8,67.2}},                                                                                                                                                                       color = {0, 0, 127}));
  connect(add1.u2, gain3.y) annotation(Line(points={{-62.8,49.6},{-42.1501,49.6},
          {-42.1501,22.2081},{-15.7,22.2081},{-15.7,22}},                                                                                              color = {0, 0, 127}));
  connect(multiplexer1.y, gain3.u) annotation(Line(points={{14,22},{0,22},{0,22},
          {0.4,22}},                                                                                         color = {0, 0, 127}));
  connect(add32.y, multiplexer1.u[2]) annotation(Line(points={{7.7,76},{14.3512,
          76},{14.3512,38.5432},{33.4177,38.5432},{33.4177,21.9368},{30,21.9368},
          {30,22.4}},                                                                                                                                                                          color = {0, 0, 127}));
  connect(gain2.u, integrator_nonwinduplimit2.y) annotation(Line(points = {{84.4, 22}, {106.091, 22}, {106.091, 72.0812}, {90.5, 72.0812}, {90.5, 72}}, color = {0, 0, 127}));
  connect(add33.y, integrator_nonwinduplimit2.u) annotation(Line(points={{66.6,72},
          {77.1574,72},{77.1574,72},{77.5,72}},                                                                                                color = {0, 0, 127}));
  connect(lag_nonwinduplimit1.y, add33.u1) annotation(Line(points={{39,76},{
          52.7919,76},{52.7919,76.8},{52.8,76.8}},                                                                                     color = {0, 0, 127}));
  connect(add32.y, lag_nonwinduplimit1.u) annotation(Line(points = {{7.7, 76}, {17.2589, 76}, {17, 76}, {17, 76}}, color = {0, 0, 127}));
  connect(integrator_nonwinduplimit1.u, deadzone1.y) annotation(Line(points={{-32.5,
          56},{-38.0711,56},{-38.0711,75.1269},{-42.5,75.1269},{-42.5,75}},                                                                                               color = {0, 0, 127}));
  connect(integrator_nonwinduplimit1.y, add32.u3) annotation(Line(points={{-19.5,
          56},{-11.6751,56},{-11.6751,70.5584},{-8.4,70.5584},{-8.4,70.4}},                                                                                              color = {0, 0, 127}));
  connect(transferfunction11.y, add32.u1) annotation(Line(points={{-21,96},{
          -14.2132,96},{-14.2132,81.7259},{-8.4,81.7259},{-8.4,81.6}},                                                                                         color = {0, 0, 127}));
  connect(transferfunction11.u, deadzone1.y) annotation(Line(points={{-35,96},{
          -37.0558,96},{-37.0558,75.1269},{-42.5,75.1269},{-42.5,75}},                                                                                            color = {0, 0, 127}));
  connect(gain1.y, add32.u2) annotation(Line(points={{-19.4,76},{-7.61421,76},{
          -7.61421,76},{-8.4,76}},                                                                                             color = {0, 0, 127}));
  connect(gain1.u, deadzone1.y) annotation(Line(points={{-33.2,76},{-42.132,76},
          {-42.132,75.1269},{-42.132,75},{-42.5,75}},                                                                                              color = {0, 0, 127}));
  connect(add31.y, deadzone1.u) annotation(Line(points={{-60.8188,75},{-60.8188,
          75},{-54,75},{-54,75}},                                                                                color = {0, 0, 127}));
  connect(add1.y, add31.u3) annotation(Line(points={{-76.6,46},{-82.7411,46},{
          -82.7411,69.0355},{-77.925,69.0355},{-77.925,69.05}},                                                                                  color = {0, 0, 127}));
  connect(SLIP, add31.u2) annotation(Line(points = {{-102, 0}, {-87.3096, 0}, {-87.3096, 74.6193}, {-81.4875, 75}, {-77.925, 75}}, color = {0, 0, 127}));
  connect(add4.y, add31.u1) annotation(Line(points={{-94.5,60},{-84.8329,60},{
          -84.8329,80.7198},{-77.925,80.7198},{-77.925,80.95}},                                                                                    color = {0, 0, 127}));
  connect(dGREF, add4.u1) annotation(Line(points={{-100,80},{-108.483,80},{
          -108.483,63.2391},{-106,63.2391},{-106,63}},                                                                                        color = {0, 0, 127}));
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Text(origin = {42.3459, 25.342}, lineColor = {255, 0, 0}, extent = {{-5.13, 4.42}, {2.29407, -2.65009}}, textString = "g"), Text(origin = {34.9601, -61.722}, lineColor = {255, 0, 0}, extent = {{-3.72, 3.54}, {5.14095, -4.01532}}, textString = "q"), Text(origin = {11.8535, -22.6538}, lineColor = {255, 0, 0}, extent = {{-3.72, 3.89}, {1.95009, -2.47407}}, textString = "h"), Text(origin = {-38.9398, -30.0837}, lineColor = {255, 0, 0}, extent = {{-5.31, 3.19}, {5.31, -3.19}}, textString = "qss"), Text(origin = {-16.0759, -29.7866}, lineColor = {255, 0, 0}, extent = {{-6.15, 4.73}, {6.15, -4.73}}, textString = "q/qss")}),
             Documentation(info = "<html>
<p>
1. The block diagram of Woodward Electric Hydro Governor Model is shown below. </p>
<p>
2. The GATE-FLOW block represents the the governor nonlinear gate/flow relationship with a five-piece nonlinear function.   
</p>
<p>
3. The FLOW-Pmss block represents the the governor nonlinear  relationship between turbine flow and mechanical power with a ten-piece nonlinear function.
</p>
<p>
4. The block SBASE/MBASE is not modeled because PELEC is always in machine base.
</p>
<p>
5. Only three combinations of ICON(M), R-PERM-GATE and R-PERM-PE provide acceptable feedback signals:
</p>
<p>
&nbsp; &nbsp; &nbsp;   -Electrical Power (ICON(M)=0; R-PERM-GATE=0; R-PERM-PE=Droop)
<p>
&nbsp; &nbsp; &nbsp;  -Gate position (ICON(M)=0; R-PERM-GATE=Droop; R-PERM-PE=0)
<p>
&nbsp; &nbsp; &nbsp;  -PID output (ICON(M)=1; R-PERM-GATE=Droop; R-PERM-PE=0)
</p>
<img src=\"modelica://OpalRT/resource/Turbine-Governor/WEHGOV.png\"
alt=\"WEHGOV.png\"><br>

</html>"));
end WEHGOV;
