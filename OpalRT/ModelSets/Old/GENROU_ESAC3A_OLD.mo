within OpalRT.ModelSets.Old;
model GENROU_ESAC3A_OLD
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
  // ESAC3A Parameters
  // This Model is located at system bus IBUS
  parameter Real TR_ex = 0.02 "regulator input filter time constant (sec)" annotation(Dialog(tab = "ESAC3A Parameters"));
  parameter Real TB_ex = 0.1 " lag time constant of voltage regulator (s)" annotation(Dialog(tab = "ESAC3A Parameters"));
  parameter Real TC_ex = 1 " lead time constant of voltage regulator (s)" annotation(Dialog(tab = "ESAC3A Parameters"));
  parameter Real KA_ex = 10 "(pu) voltage regulator gain" annotation(Dialog(tab = "ESAC3A Parameters"));
  parameter Real TA_ex = 0.02 "(sec) regulator time constant" annotation(Dialog(tab = "ESAC3A Parameters"));
  parameter Real VAMAX_ex = 10 "(pu) regulator output maximum limit" annotation(Dialog(tab = "ESAC3A Parameters"));
  parameter Real VAMIN_ex = -10 "(pu) regulator output minimum limit" annotation(Dialog(tab = "ESAC3A Parameters"));
  parameter Real TE_ex = 0.35 "Exciter time constant" annotation(Dialog(tab = "ESAC3A Parameters"));
  parameter Real VEMIN_ex = -10 "exciter field current minimum limit" annotation(Dialog(tab = "ESAC3A Parameters"));
  parameter Real KR_ex = 0.4 "Constant associated with regulator and alternator field power" annotation(Dialog(tab = "ESAC3A Parameters"));
  parameter Real KF_ex = 1 "Excitation control system stabilizer gains" annotation(Dialog(tab = "ESAC3A Parameters"));
  parameter Real TF_ex = 1.0 "Excitation control system stabilizer time constant, sec" annotation(Dialog(tab = "ESAC3A Parameters"));
  parameter Real KN_ex = 0.4 "Excitation control system stabilizer gain" annotation(Dialog(tab = "ESAC3A Parameters"));
  parameter Real EFDN_ex = 0.4 "Value of EFD at which feedback gain changes" annotation(Dialog(tab = "ESAC3A Parameters"));
  parameter Real KC_ex = 0.02 "Rectifier loading factor proportional to commutating reactance" annotation(Dialog(tab = "ESAC3A Parameters"));
  parameter Real KD_ex = 0.02 "Demagnetizing factor" annotation(Dialog(tab = "ESAC3A Parameters"));
  parameter Real KE_ex = 1 "exciter constant related fo self-excited field" annotation(Dialog(tab = "ESAC3A Parameters"));
  parameter Real VFEMAX_ex = 10 "exciter field current maximum limit" annotation(Dialog(tab = "ESAC3A Parameters"));
  parameter Real E1_ex = 4 "Exciter voltages at which exciter saturation is defined" annotation(Dialog(tab = "ESAC3A Parameters"));
  parameter Real SE_E1_ex = 0.4 "Exciter saturation function value at E1" annotation(Dialog(tab = "ESAC3A Parameters"));
  parameter Real E2_ex = 5 "Exciter voltages at which exciter saturation is defined" annotation(Dialog(tab = "ESAC3A Parameters"));
  parameter Real SE_E2_ex = 0.5 "Exciter saturation function value at E2" annotation(Dialog(tab = "ESAC3A Parameters"));
  //
  OpalRT.Electrical.Control.Excitation.ESAC3A esac3a1(TR = TR_ex, TB = TB_ex, TC = TC_ex, KA = KA_ex, TA = TA_ex, VAMAX = VAMAX_ex, VAMIN = VAMIN_ex, TE = TE_ex, VEMIN = VEMIN_ex, KR = KR_ex, KF = KF_ex, TF = TF_ex, KN = KN_ex, EFDN = EFDN_ex, KE = KE_ex, KC = KC_ex, KD = KD_ex, VFEMAX = VFEMAX_ex, E1 = E1_ex, SE_E1 = SE_E1_ex, E2 = E2_ex, SE_E2 = SE_E2_ex) annotation(Placement(visible = true, transformation(origin = {-10.5, 17.5}, extent = {{-15.5, -15.5}, {15.5, 15.5}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 0) annotation(Placement(visible = true, transformation(origin = {-49, 21}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.Electrical.Machine.SynchronousMachine.GENROU genrou1(ID = M_ID, P_gen = P_gen, Q_gen = Q_gen, Vt_abs = Vt_abs, Vt_ang = Vt_ang, SB = SB, fn = fn, ZSOURCE_RE = ZSOURCE_RE, Tdo_p = Tdo_p, Tdo_s = Tdo_s, Tqo_p = Tqo_p, Tqo_s = Tqo_s, H = H, D = D, Xd = Xd, Xq = Xq, Xd_p = Xd_p, Xq_p = Xq_p, Xd_s = Xd_s, Xl = Xl, S1 = S1, S12 = S12) annotation(Placement(visible = true, transformation(origin = {33, 5}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant1(k = -Modelica.Constants.inf) annotation(Placement(visible = true, transformation(origin = {-49, 37}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  input OpalRT.NonElectrical.Connector.InputInterfacePin TRIP annotation(Placement(visible = true, transformation(origin = {29, 32}, extent = {{-5, -5}, {5, 5}}, rotation = 0), iconTransformation(origin = {-90, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  input OpalRT.NonElectrical.Connector.InputInterfacePin dVREF annotation(Placement(visible = true, transformation(origin = {-76, 11}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-90, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.Connector.PwPin bus0 annotation(Placement(visible = true, transformation(origin = {40, -20}, extent = {{-5, -5}, {5, 5}}, rotation = 0), iconTransformation(origin = {100, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(TRIP, genrou1.TRIP) annotation(Line(points = {{29, 32}, {33, 32}, {33, 20}}, color = {0, 0, 0}));
  connect(esac3a1.EFD0, genrou1.EFD0) annotation(Line(points = {{5, 5.1}, {11.5, 5.1}, {11.5, 5}, {17.7, 5}}, color = {0, 0, 127}));
  connect(esac3a1.EFD, genrou1.EFD) annotation(Line(points = {{5, 8.2}, {11, 8.2}, {11, 9.2}, {18, 9.2}}, color = {0, 0, 127}));
  connect(esac3a1.ETERM0, genrou1.ETERM0) annotation(Line(points = {{5, 11.3}, {12, 11.3}, {12, 12.5}, {17.7, 12.5}}, color = {0, 0, 127}));
  connect(esac3a1.EX_AUX, genrou1.EX_AUX) annotation(Line(points = {{5, 15.33}, {12, 15.33}, {12, 17}, {17.7, 17}}, color = {0, 0, 127}));
  connect(genrou1.VI, esac3a1.VI) annotation(Line(points={{48,5},{60.4113,5},{60.4113,
          30.8483},{9.51157,30.8483},{9.51157,26.7352},{5,26.7352},{5,26.8}},                                                                                                           color = {0, 0, 127}));
  connect(esac3a1.XADIFD, genrou1.XADIFD) annotation(Line(points = {{-26, 25.25}, {-32, 25.25}, {-32, 42}, {56, 42}, {56, 12.5}, {48, 12.5}}, color = {0, 0, 127}));
  connect(bus0, genrou1.p) annotation(Line(points = {{40, -20}, {33, -20}, {33, -10}}, color = {0, 0, 0}));
  connect(genrou1.PMECH0, genrou1.PMECH) annotation(Line(points = {{18, -7}, {13, -7}, {13, -4}, {18, -4}}, color = {0, 0, 127}));
  connect(esac3a1.dVREF, dVREF) annotation(Line(points={{-26,8.2},{-74.5501,8.2},
          {-74.5501,11},{-76,11}},                                                                                                color = {0, 0, 127}));
  connect(esac3a1.VUEL, constant1.y) annotation(Line(points = {{-26, 20.6}, {-35, 20.6}, {-35, 37}, {-43.5, 37}}, color = {0, 0, 127}));
  connect(esac3a1.VOEL, const.y) annotation(Line(points = {{-26, 16.26}, {-37, 16.26}, {-37, 21}, {-43.5, 21}}, color = {0, 0, 127}));
  connect(esac3a1.VOTHSG, const.y) annotation(Line(points = {{-26, 11.92}, {-37, 11.92}, {-37, 21}, {-43.5, 21}}, color = {0, 0, 127}));
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1}), graphics={  Rectangle(origin = {-1.36674, 26.4237}, extent = {{-88.3827, 36.4465}, {94.3052, -90.4328}}), Text(origin = {-31.89, -1.02}, extent = {{-48.06, 27.45}, {116.4, -21.07}}, textString = "GENROU_ESAC3A"), Text(origin = {-155.295, 50.4853}, extent = {{79.192, 3.27668}, {116.4, -21.07}}, textString = "TRIP"), Text(origin = {-156.694, -32.5588}, extent = {{79.19, 3.28}, {126.662, -15.8248}}, textString = "dVREF"), Text(origin = {-40.1919, -31.6836}, extent = {{98.5743, 5.1044}, {126.66, -15.82}}, textString = "Pin")}));
end GENROU_ESAC3A_OLD;
