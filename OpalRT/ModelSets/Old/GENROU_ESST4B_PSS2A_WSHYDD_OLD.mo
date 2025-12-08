within OpalRT.ModelSets.Old;
model GENROU_ESST4B_PSS2A_WSHYDD_OLD
  parameter Real partType = 1;
  // GENROU Parameters
  parameter Integer IBUS = 100 "Located system bus" annotation(Dialog(tab = "General"));
  parameter String M_ID = "M1" "Machine Identifier" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real P_gen = 1100 "Bus Active Power, MW" annotation(Dialog(tab = "General"));
  parameter Real Q_gen = 342.702 "Bus Reactive Power, MVAR" annotation(Dialog(tab = "General"));
  parameter Real Vt_abs = 1.03 "Bus Voltage Magnitude, p.u." annotation(Dialog(tab = "General"));
  parameter Real Vt_ang = -10.96 "Bus Voltage Angle, deg." annotation(Dialog(tab = "General"));
  parameter Real SB = 1000 "Machine Base Power, MVA" annotation(Dialog(tab = "General"));
  parameter Real fn = 50 "Nominal frequency" annotation(Dialog(tab = "General"));
  parameter Real ZSOURCE_RE = 0 "Machine source impedence" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Tdo_p = 7 "d-axis transient time constant" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Tdo_s = 0.03 "d-axis sub-transient time constant, s" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Tqo_p = 0.7 "q-axis transient time constant, s" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Tqo_s = 0.04 "d-axis sub-transient time constant, s" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real H = 50 "Inertia constant" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real D = 0 "Speed damping" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xd = 0.2 "d-axis reactance, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xq = 0.19 "q-axis reactance, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xd_p = 0.06 "d-axis transient reactance, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xq_p = 0.06 "q-axis transient reactance, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xd_s = 0.02 "d-axis sub-transient reactance, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xl = 0.03 "Reactance due to the leakage flux which does not cross the air gap, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real S1 = 0.4 "saturation function value for 1 p.u. input" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real S12 = 0.8 "saturation function value for 1.2 p.u. input" annotation(Dialog(tab = "GENROU Parameters"));
  // ESST4B Parameters
  parameter Real TR_ex = 0.02 annotation(Dialog(tab = "ESST4B Parameters"));
  parameter Real KPR_ex = 1 annotation(Dialog(tab = "ESST4B Parameters"));
  parameter Real KIR_ex = 0.03 annotation(Dialog(tab = "ESST4B Parameters"));
  parameter Real VRMAX_ex = 10 annotation(Dialog(tab = "ESST4B Parameters"));
  parameter Real VRMIN_ex = -10 annotation(Dialog(tab = "ESST4B Parameters"));
  parameter Real TA_ex = 0.2 annotation(Dialog(tab = "ESST4B Parameters"));
  parameter Real KPM_ex = 0.02 annotation(Dialog(tab = "ESST4B Parameters"));
  parameter Real KIM_ex = 0.02 annotation(Dialog(tab = "ESST4B Parameters"));
  parameter Real VMMAX_ex = 0.02 annotation(Dialog(tab = "ESST4B Parameters"));
  parameter Real VMMIN_ex = 0.02 annotation(Dialog(tab = "ESST4B Parameters"));
  parameter Real KG_ex = 0.02 annotation(Dialog(tab = "ESST4B Parameters"));
  parameter Real KP_ex = 0.02 annotation(Dialog(tab = "ESST4B Parameters"));
  parameter Real KI_ex = 0.02 annotation(Dialog(tab = "ESST4B Parameters"));
  parameter Real VBMAX_ex = 0.02 annotation(Dialog(tab = "ESST4B Parameters"));
  parameter Real KC_ex = 0.02 annotation(Dialog(tab = "ESST4B Parameters"));
  parameter Real XL_ex = 0.02 annotation(Dialog(tab = "ESST4B Parameters"));
  parameter Real THETAP_ex = 0.52 annotation(Dialog(tab = "ESST4B Parameters"));
  // PSS2A Parameters
  parameter Real TW1_pss = 0.1 ">0" annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real TW2_pss = 1 "To bypass second washout, first signal: set Tw2 = 0" annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real T6_pss = 1 "To bypass first signal transducer: set T6 = 0" annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real TW3_pss = 1.5 ">0" annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real TW4_pss = 0.2 "To bypass second washout, second signal: set Tw4 = 0" annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real T7_pss = 0.2 "To bypass second signal transducer: set T7 = 0" annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real KS2_pss = 0.1 "T7/(2*H)" annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real KS3_pss = 0.1 annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real T8_pss = 0.05 annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real T9_pss = 0.01 ">0" annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real KS1_pss = 0.15 annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real T1_pss = 0.1 "To bypass first lead-lag: set T1 = T2 = 0" annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real T2_pss = 0.1 annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real T3_pss = 0.01 "To bypass first lead-lag: set T1 = T2 = 0" annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real T4_pss = 1 annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real VSTMAX_pss = 1 annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real VSTMIN_pss = -1 annotation(Dialog(tab = "PSS2A Parameters"));
  // PSS2A ICONs
  parameter Real M0_pss = 2 "ICS1, first stabilizer input code" annotation(Dialog(tab = "PSS2A Parameters", group = "ICONs"));
  parameter Real M1_pss = 2 "REMBUS1, first remote bus number" annotation(Dialog(tab = "PSS2A Parameters", group = "ICONs"));
  parameter Real M2_pss = 2 "ICS2, second stabilizer input code" annotation(Dialog(tab = "PSS2A Parameters", group = "ICONs"));
  parameter Real M3_pss = 2 "REMBUS2, second remote bus number" annotation(Dialog(tab = "PSS2A Parameters", group = "ICONs"));
  parameter Real M4_pss = 1 "M, ramp tracking filter" annotation(Dialog(tab = "PSS2A Parameters", group = "ICONs"));
  parameter Real M5_pss = 2 "N, ramp tracking filter" annotation(Dialog(tab = "PSS2A Parameters", group = "ICONs"));
  // WSHYDD Parameters
  parameter Real db1_tg = 0 annotation(Dialog(tab = "WSHYDD"));
  parameter Real err_tg = 0 annotation(Dialog(tab = "WSHYDD"));
  parameter Real Td_tg = 1 "(sec)" annotation(Dialog(tab = "WSHYDD"));
  parameter Real K1_tg = 0.8 annotation(Dialog(tab = "WSHYDD"));
  parameter Real Tf_tg = 0.1 "(sec)" annotation(Dialog(tab = "WSHYDD"));
  parameter Real KD_tg = 0.8 annotation(Dialog(tab = "WSHYDD"));
  parameter Real KP_tg = 0.25 annotation(Dialog(tab = "WSHYDD"));
  parameter Real R_tg = 0.04 annotation(Dialog(tab = "WSHYDD"));
  parameter Real Tt_tg = 0.4 annotation(Dialog(tab = "WSHYDD"));
  parameter Real KG_tg = 2.0 annotation(Dialog(tab = "WSHYDD"));
  parameter Real TP_tg = 0.2 "(sec)" annotation(Dialog(tab = "WSHYDD"));
  parameter Real VELopen_tg = 0.007 "(>0)" annotation(Dialog(tab = "WSHYDD"));
  parameter Real VELclose_tg = 0.002 "(>0)" annotation(Dialog(tab = "WSHYDD"));
  parameter Real PMAX_tg = 1.0 annotation(Dialog(tab = "WSHYDD"));
  parameter Real PMIN_tg = 0 annotation(Dialog(tab = "WSHYDD"));
  parameter Real db2_tg = 0 annotation(Dialog(tab = "WSHYDD"));
  parameter Real GV1_tg = 0 annotation(Dialog(tab = "WSHYDD"));
  parameter Real PGV1_tg = 0 annotation(Dialog(tab = "WSHYDD"));
  parameter Real GV2_tg = 0.6 annotation(Dialog(tab = "WSHYDD"));
  parameter Real PGV2_tg = 0.7 annotation(Dialog(tab = "WSHYDD"));
  parameter Real GV3_tg = 0.7 annotation(Dialog(tab = "WSHYDD"));
  parameter Real PGV3_tg = 0.82 annotation(Dialog(tab = "WSHYDD"));
  parameter Real GV4_tg = 0.80 annotation(Dialog(tab = "WSHYDD"));
  parameter Real PGV4_tg = 0.90 annotation(Dialog(tab = "WSHYDD"));
  parameter Real GV5_tg = 0.90 annotation(Dialog(tab = "WSHYDD"));
  parameter Real PGV5_tg = 0.95 annotation(Dialog(tab = "WSHYDD"));
  parameter Real Aturb_tg = -1 annotation(Dialog(tab = "WSHYDD"));
  parameter Real Bturb_tg = 0.5 "(>0)" annotation(Dialog(tab = "WSHYDD"));
  parameter Real Tturb_tg = 0.9 "(>0)(sec)" annotation(Dialog(tab = "WSHYDD"));
  parameter Real TRATE_tg = 900 annotation(Dialog(tab = "WSHYDD"));
  parameter Real noVOEL(fixed = false, start = 1);
  Modelica.Blocks.Sources.Constant constant1(k = noVOEL) annotation(Placement(visible = true, transformation(origin = {-66, 50}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 0) annotation(Placement(visible = true, transformation(origin = {-66, 68}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.Electrical.Machine.SynchronousMachine.GENROU genrou1(ID = M_ID, P_gen = P_gen, Q_gen = Q_gen, Vt_abs = Vt_abs, Vt_ang = Vt_ang, SB = SB, fn = fn, ZSOURCE_RE = ZSOURCE_RE, Tdo_p = Tdo_p, Tdo_s = Tdo_s, Tqo_p = Tqo_p, Tqo_s = Tqo_s, H = H, D = D, Xd = Xd, Xq = Xq, Xd_p = Xd_p, Xq_p = Xq_p, Xd_s = Xd_s, Xl = Xl, S1 = S1, S12 = S12) annotation(Placement(visible = true, transformation(origin = {60, 10}, extent = {{-28, -28}, {28, 28}}, rotation = 0)));
  OpalRT.Electrical.Control.Excitation.ESST4B esst4b1(TR = TR_ex, KPR = KPR_ex, KIR = KIR_ex, VRMAX = VRMAX_ex, VRMIN = VRMIN_ex, TA = TA_ex, KPM = KPM_ex, KIM = KIM_ex, VMMAX = VMMAX_ex, VMMIN = VMMIN_ex, KG = KG_ex, KP = KP_ex, KI = KI_ex, VBMAX = VBMAX_ex, KC = KC_ex, XL = XL_ex, THETAP = THETAP_ex) annotation(Placement(visible = true, transformation(origin = {-10, 36}, extent = {{-28.25, -28.25}, {28.25, 28.25}}, rotation = 0)));
  OpalRT.Electrical.Control.Stabilizer.PSS2A pss2a1(M2 = M2_pss, TW1 = TW1_pss, TW2 = TW2_pss, T6 = T6_pss, TW3 = TW3_pss, TW4 = TW4_pss, T7 = T7_pss, KS2 = KS2_pss, KS3 = KS3_pss, T8 = T8_pss, T9 = T9_pss, KS1 = KS1_pss, T1 = T1_pss, T2 = T2_pss, T3 = T3_pss, T4 = T4_pss, VSTMAX = VSTMAX_pss, VSTMIN = VSTMIN_pss, M0 = M0_pss, M1 = M1_pss, M3 = M3_pss, M4 = M4_pss, M5 = M5_pss, initType = Modelica.Blocks.Types.Init.InitialOutput, ID = M_ID) annotation(Placement(visible = true, transformation(origin = {-80, -20}, extent = {{-15, -10}, {15, 10}}, rotation = 0)));
  OpalRT.Electrical.Control.TurbineGovernor.WSHYDD wshydd1(db1 = db1_tg, err = err_tg, Td = Td_tg, K1 = K1_tg, Tf = Tf_tg, KD = KD_tg, KP = KP_tg, R = R_tg, Tt = Tt_tg, KG = KG_tg, TP = TP_tg, VELopen = VELopen_tg, VELclose = VELclose_tg, PMAX = PMAX_tg, PMIN = PMIN_tg, db2 = db2_tg, GV1 = GV1_tg, PGV1 = PGV1_tg, GV2 = GV2_tg, PGV2 = PGV2_tg, GV3 = GV3_tg, PGV3 = PGV3_tg, GV4 = GV4_tg, PGV4 = PGV4_tg, GV5 = GV5_tg, PGV5 = PGV5_tg, Aturb = Aturb_tg, Bturb = Bturb_tg, Tturb = Tturb_tg, TRATE = TRATE_tg, IBUS = IBUS, ID = M_ID) annotation(Placement(visible = true, transformation(origin = {-20, -60}, extent = {{-27.5, -27.5}, {27.5, 27.5}}, rotation = 0)));
  input OpalRT.NonElectrical.Connector.InputInterfacePin dGREF annotation(Placement(visible = true, transformation(origin = {-80, -40}, extent = {{-5, -5}, {5, 5}}, rotation = 0), iconTransformation(origin = {-100, -60}, extent = {{-12.5, -12.5}, {12.5, 12.5}}, rotation = 0)));
  input OpalRT.NonElectrical.Connector.InputInterfacePin dVREF annotation(Placement(visible = true, transformation(origin = {-82, 10}, extent = {{-5, -5}, {5, 5}}, rotation = 0), iconTransformation(origin = {-100, 60}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
  input OpalRT.NonElectrical.Connector.InputInterfacePin TRIP annotation(Placement(visible = true, transformation(origin = {58, 56}, extent = {{-8.5, -8.5}, {8.5, 8.5}}, rotation = 0), iconTransformation(origin = {100, 60}, extent = {{13, -13}, {-13, 13}}, rotation = 0)));
  OpalRT.NonElectrical.Connector.PwPin bus0 annotation(Placement(visible = true, transformation(origin = {58, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -60}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
initial equation
  noVOEL = Modelica.Constants.inf;
equation
  connect(genrou1.VI, esst4b1.VI) annotation(Line(points={{88,10},{104.253,10},{
          104.253,90.9487},{27.9171,90.9487},{27.9171,53.217},{18.25,53.217},{18.25,
          52.95}},                                                                                                                                                                     color = {0, 0, 127}));
  connect(genrou1.VI, pss2a1.VI) annotation(Line(points={{88,10},{104.253,10},{104.253,
          90.9487},{-102.726,90.9487},{-102.726,-17.8844},{-95,-17.8844},{-95,-18}},                                                                                                            color = {0, 0, 127}));
  connect(genrou1.VI, pss2a1.VI2) annotation(Line(points={{88,10},{104.253,10},{
          104.253,90.9487},{-102.726,90.9487},{-102.726,-23.9913},{-95,-23.9913},
          {-95,-24}},                                                                                                                                                                            color = {0, 0, 127}));
  connect(genrou1.VI, wshydd1.VI) annotation(Line(points={{88,10},{104.37,10},{104.37,
          -97.9434},{-59.6401,-97.9434},{-59.6401,-60.1542},{-47.5,-60.1542},{-47.5,
          -60}},                                                                                                                                                                                 color = {0, 0, 127}));
  connect(genrou1.MBASE, wshydd1.MBASE) annotation(Line(points={{88,-5.12},{98.7147,
          -5.12},{98.7147,-95.3728},{-55.527,-95.3728},{-55.527,-70.9512},{-47.5,
          -70.9512},{-47.5,-71}},                                                                                                                                                                          color = {0, 0, 127}));
  connect(genrou1.SLIP, wshydd1.SLIP) annotation(Line(points={{88,-12.4},{95.3728,
          -12.4},{95.3728,-91.5167},{-52.9563,-91.5167},{-52.9563,-81.491},{-47.5,
          -81.491},{-47.5,-82}},                                                                                                                                                                          color = {0, 0, 127}));
  connect(wshydd1.dGREF, dGREF) annotation(Line(points={{-47.5,-38},{-80.207,
          -38},{-80.207,-40},{-80,-40}},                                                                                           color = {0, 0, 127}));
  connect(genrou1.PMECH0, wshydd1.PMECH0) annotation(Line(points={{32,-12.4},{25.7069,
          -12.4},{25.7069,-43.1877},{7.5,-43.1877},{7.5,-43.5}},                                                                                                 color = {0, 0, 127}));
  connect(genrou1.PMECH, wshydd1.PMECH) annotation(Line(points={{32,-6.8},{20.8226,
          -6.8},{20.8226,-37.7892},{7.5,-37.7892},{7.5,-38}},                                                                                                color = {0, 0, 127}));
  connect(pss2a1.PSS_AUX2, pss2a1.PSS_AUX) annotation(Line(points={{-95,-26},{-106.17,
          -26},{-106.17,-20.0514},{-95,-20.0514},{-95,-20}},                                                                                                       color = {0, 0, 127}));
  connect(genrou1.AccPower, pss2a1.PSS_AUX[2]) annotation(Line(points={{88,2.72},
          {95.3728,2.72},{95.3728,80.2057},{-106.17,80.2057},{-106.17,-20.0514},
          {-95,-20.0514},{-95,-19.5}},                                                                                                                                                                          color = {0, 0, 127}));
  connect(genrou1.SLIP, pss2a1.PSS_AUX[1]) annotation(Line(points={{88,-12.4},{95.3728,
          -12.4},{95.3728,80.2057},{-106.17,80.2057},{-106.17,-20.0514},{-95,-20.0514},
          {-95,-20.5}},                                                                                                                                                                                       color = {0, 0, 127}));
  connect(esst4b1.VOTHSG, pss2a1.VOTHSG) annotation(Line(points={{-38.25,25.83},
          {-53.2134,25.83},{-53.2134,-25.964},{-65,-25.964},{-65,-26}},                                                                                                color = {0, 0, 127}));
  connect(TRIP, genrou1.TRIP) annotation(Line(points={{58,56},{60.0939,56},{
          60.0939,38},{60,38}}));
  connect(genrou1.p, bus0) annotation(Line(points={{60,-18},{61.0329,-18},{61.0329,
          -50},{58,-50}}));
  connect(constant1.y, esst4b1.VOEL) annotation(Line(points={{-60.5,50},{-53.0516,
          50},{-53.0516,33.8028},{-38.25,33.8028},{-38.25,33.74}},                                                                                          color = {0, 0, 127}));
  connect(genrou1.XADIFD, esst4b1.XADIFD) annotation(Line(points={{88,24},{98.1221,
          24},{98.1221,86.8545},{-47.8873,86.8545},{-47.8873,50.2347},{-38.25,50.2347},
          {-38.25,50.125}},                                                                                                                                                                           color = {0, 0, 127}));
  connect(genrou1.EFD0, esst4b1.EFD0) annotation(Line(points = {{31.44, 10}, {26.2911, 10}, {26.2911, 13.615}, {16.25, 13.4}, {18.25, 13.4}}, color = {0, 0, 127}));
  connect(esst4b1.EFD, genrou1.EFD) annotation(Line(points = {{18.25, 19.05}, {30.0469, 19.05}, {30.0469, 17.84}, {32, 17.84}}, color = {0, 0, 127}));
  connect(genrou1.ETERM0, esst4b1.ETERM0) annotation(Line(points = {{31.44, 24}, {17.8404, 24}, {18.25, 24.7}, {18.25, 24.7}}, color = {0, 0, 127}));
  connect(esst4b1.VUEL, const.y) annotation(Line(points = {{-38.25, 41.65}, {-52, 41.65}, {-52, 68}, {-60.5, 68}}, color = {0, 0, 127}));
  connect(genrou1.EX_AUX, esst4b1.EX_AUX) annotation(Line(points = {{31.44, 32.4}, {18.7793, 32.4}, {18.25, 31.4554}, {18.25, 32.045}}, color = {0, 0, 127}));
  connect(esst4b1.dVREF, dVREF) annotation(Line(points={{-38.25,19.05},{
          -82.2768,19.05},{-82.2768,10},{-82,10}},                                                                                     color = {0, 0, 127}));
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Rectangle(origin = {1.87793, -1.13745}, extent = {{-100, 98.5915}, {95.3052, -96.7136}}), Text(origin = {-34.94, -8.27}, extent = {{-58, 29}, {127.95, 9.5}}, textString = "GENROU_ESST4B_PSS2A_WSHYDD"), Text(origin = {71.6993, -62.2719}, extent = {{-30, 14}, {22.4883, -7.89671}}, textString = "PIN"), Text(origin = {62.769, 59.0563}, extent = {{-17.75, 9.89}, {24.1396, -6.96241}}, textString = "TRIP"), Text(origin = {-61.8205, 60.0203}, extent = {{-17.75, 9.89}, {17.75, -9.89}}, textString = "dVREF"), Text(origin = {-63.8754, -58.5012}, extent = {{-17.75, 9.89}, {17.75, -9.89}}, textString = "dGREF")}));
end GENROU_ESST4B_PSS2A_WSHYDD_OLD;
