within OpalRT.ModelSets.Old;
model GENROU_TGOV3_OLD
  parameter Real partType = 1;
  // GENROU Parameters
  parameter Integer IBUS = 100 "Located system bus" annotation(Dialog(tab = "General"));
  parameter String M_ID = "M1" "Machine Identifier" annotation(Dialog(tab = "General"));
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
  // TGOV3 Parameters
  parameter Real K_tg = 25 annotation(Dialog(tab = "TGOV3"));
  parameter Real T1_tg = 0.2 "(sec)" annotation(Dialog(tab = "TGOV3"));
  parameter Real T2_tg = 0.00 "(sec)" annotation(Dialog(tab = "TGOV3"));
  parameter Real T3_tg = 0.3 "(>0)(sec)" annotation(Dialog(tab = "TGOV3"));
  parameter Real Uo_tg = 0.1 "(pu/sec)" annotation(Dialog(tab = "TGOV3"));
  parameter Real Uc_tg = -0.1 "(<0)(pu/sec)" annotation(Dialog(tab = "TGOV3"));
  parameter Real PMAX_tg = 1.0 "(pu on machine MVA rating)" annotation(Dialog(tab = "TGOV3"));
  parameter Real PMIN_tg = 0.2 "(pu on machine MVA rating)" annotation(Dialog(tab = "TGOV3"));
  parameter Real T4_tg = 1.0 "(sec)" annotation(Dialog(tab = "TGOV3"));
  parameter Real K1_tg = 0.3 annotation(Dialog(tab = "TGOV3"));
  parameter Real T5_tg = 0.7 "(>0)(sec)" annotation(Dialog(tab = "TGOV3"));
  parameter Real K2_tg = 0.2 annotation(Dialog(tab = "TGOV3"));
  parameter Real T6_tg = 0.2 "(sec)" annotation(Dialog(tab = "TGOV3"));
  parameter Real K3_tg = 0.2 annotation(Dialog(tab = "TGOV3"));
  parameter Real TA_tg = 0.2 "(sec)" annotation(Dialog(tab = "TGOV3"));
  parameter Real TB_tg = 1.0 "(sec)" annotation(Dialog(tab = "TGOV3"));
  parameter Real TC_tg = 4.0 "(sec)" annotation(Dialog(tab = "TGOV3"));
  parameter Real PRMAX_tg = 1.1 "(pu)" annotation(Dialog(tab = "TGOV3"));
  OpalRT.Electrical.Control.TurbineGovernor.TGOV3 tgov31(IBUS = IBUS, ID = M_ID, K = K_tg, T1 = T1_tg, T2 = T2_tg, T3 = T3_tg, Uo = Uo_tg, Uc = Uc_tg, PMAX = PMAX_tg, PMIN = PMIN_tg, T4 = T4_tg, K1 = K1_tg, T5 = T5_tg, K2 = K2_tg, T6 = T6_tg, K3 = K3_tg, TA = TA_tg, TB = TB_tg, TC = TC_tg, PRMAX = PRMAX_tg) annotation(Placement(visible = true, transformation(origin = {-40, -20}, extent = {{-25, -25}, {25, 25}}, rotation = 0)));
  OpalRT.Electrical.Machine.SynchronousMachine.GENROU genrou1(IBUS = IBUS, ID = M_ID, P_gen = P_gen, Q_gen = Q_gen, Vt_abs = Vt_abs, Vt_ang = Vt_ang, SB = SB, fn = fn, ZSOURCE_RE = ZSOURCE_RE, Tdo_p = Tdo_p, Tdo_s = Tdo_s, Tqo_p = Tqo_p, Tqo_s = Tqo_s, H = H, D = D, Xd = Xd, Xq = Xq, Xd_p = Xd_p, Xq_p = Xq_p, Xd_s = Xd_s, Xl = Xl, S1 = S1, S12 = S12) annotation(Placement(visible = true, transformation(origin = {40, 20}, extent = {{-25, -25}, {25, 25}}, rotation = 0)));
  input OpalRT.NonElectrical.Connector.InputInterfacePin dGREF annotation(Placement(visible = true, transformation(origin = {-60, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.Connector.PwPin bus0 annotation(Placement(visible = true, transformation(origin = {80, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant1(k = 0) annotation(Placement(visible = true, transformation(origin = {-80, -80}, extent = {{-5, -5}, {5, 5}}, rotation = 90)));
  Modelica.Blocks.Math.Add add2 annotation(Placement(visible = true, transformation(origin = {-80, -60}, extent = {{5, -5}, {-5, 5}}, rotation = -90)));
  input OpalRT.NonElectrical.Connector.InputInterfacePin vTrig annotation(Placement(visible = true, transformation(origin = {-40, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 360)));
  input OpalRT.NonElectrical.Connector.InputInterfacePin TRIP annotation(Placement(visible = true, transformation(origin = {40, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 40}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(genrou1.VI, tgov31.VI) annotation(Line(points={{65,20},{102.057,20},{102.057,
          -51.928},{-76.3496,-51.928},{-76.3496,-19.7943},{-65,-19.7943},{-65,-20}},                                                                                                            color = {0, 0, 127}));
  connect(genrou1.MBASE, tgov31.MBASE) annotation(Line(points={{65,6.5},{98.7147,
          6.5},{98.7147,-50.1285},{-74.5501,-50.1285},{-74.5501,-30.3342},{-65,-30.3342},
          {-65,-30}},                                                                                                                                                                                     color = {0, 0, 127}));
  connect(genrou1.SLIP, tgov31.SLIP) annotation(Line(points={{65,0},{96.748,0},{
          96.748,-48.5095},{-72.6287,-48.5095},{-72.6287,-40.6504},{-65,-40.6504},
          {-65,-40}},                                                                                                                                                                             color = {0, 0, 127}));
  connect(add2.y, tgov31.vTrig) annotation(Line(points={{-80,-54.5},{-80,-12.3393},
          {-65,-12.3393},{-65,-12.5}},                                                                                                color = {0, 0, 127}));
  connect(add2.u2, constant1.y) annotation(Line(points={{-83,-66},{-83,-70.1897},
          {-79.9458,-70.1897},{-79.9458,-74.5},{-80,-74.5}},                                                                                              color = {0, 0, 127}));
  connect(add2.u1, vTrig) annotation(Line(points={{-77,-66},{-77,-68.2927},{
          -39.8374,-68.2927},{-39.8374,-80},{-40,-80}},                                                                                             color = {0, 0, 127}));
  connect(tgov31.dGREF, dGREF) annotation(Line(points={{-65,0},{-76.0925,0},{
          -76.0925,39.8458},{-60,39.8458},{-60,40}},                                                                                              color = {0, 0, 127}));
  connect(bus0, genrou1.p) annotation(Line(points={{80,-20},{40.1084,-20},{40.1084,
          -5},{40,-5}}));
  connect(genrou1.PMECH, tgov31.PMECH) annotation(Line(points={{15,5},{-2.16802,
          5},{-2.16802,0},{-15,0},{-15,0}},                                                                                            color = {0, 0, 127}));
  connect(genrou1.PMECH0, tgov31.PMECH0) annotation(Line(points={{15,0},{0.542005,
          0},{0.542005,-5.42005},{-15,-5.42005},{-15,-5}},                                                                                                    color = {0, 0, 127}));
  connect(genrou1.EFD0, genrou1.EFD) annotation(Line(points={{14.5,20},{8.13008,
          20},{8.13008,27.1003},{15,27.1003},{15,27}},                                                                                                 color = {0, 0, 127}));
  connect(genrou1.TRIP, TRIP) annotation(Line(points={{40,45},{40.1084,45},{
          40.1084,80},{40,80}},                                                                                           color = {0, 0, 127}));
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Rectangle(origin = {1.09064, -18.8762}, extent = {{-101.224, 67.827}, {98.5034, -50.7483}}), Text(origin = {0.407913, -3.79892}, extent = {{-68.16, 21.41}, {72.496, -26.017}}, textString = "GENROU_TGOV3")}));
end GENROU_TGOV3_OLD;
