within OpalRT.ModelSets.Old;
model GENROU_ST5B_OLD
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
  //ST5B
  parameter Real TR_ex = 0.1 "regulator input filter time constant (sec)" annotation(Dialog(tab = "ST5B Parameters"));
  parameter Real TC1_ex = 0.1 "lead time constant of first lead-lag block (voltage regulator channel) (sec)" annotation(Dialog(tab = "ST5B Parameters"));
  parameter Real TB1_ex = 0.1 "lag time constant of first lead-lag block (voltage regulator channel) (sec)" annotation(Dialog(tab = "ST5B Parameters"));
  parameter Real TC2_ex = 0.1 "lead time constant of second lead-lag block (voltage regulator channel) (sec)" annotation(Dialog(tab = "ST5B Parameters"));
  parameter Real TB2_ex = 0.1 "lag time constant of second lead-lag block (voltage regulator channel) (sec)" annotation(Dialog(tab = "ST5B Parameters"));
  parameter Real KR_ex = 0.1 "(>0) (pu) voltage regulator gain" annotation(Dialog(tab = "ST5B Parameters"));
  parameter Real VRMAX_ex = 100 "(pu) voltage regulator maximum limit" annotation(Dialog(tab = "ST5B Parameters"));
  parameter Real VRMIN_ex = -100 "(pu) voltage regulator minimum limit" annotation(Dialog(tab = "ST5B Parameters"));
  parameter Real T1_ex = 0.1 "voltage regulator time constant (sec)" annotation(Dialog(tab = "ST5B Parameters"));
  parameter Real KC_ex = 0.1 "(pu)" annotation(Dialog(tab = "ST5B Parameters"));
  parameter Real TUC1_ex = 0.1 "lead time constant of first lead-lag block (under excitation channel) (sec)" annotation(Dialog(tab = "ST5B Parameters"));
  parameter Real TUB1_ex = 0.1 "lag time constant of first lead-lag block (under-excitation channel) (sec)" annotation(Dialog(tab = "ST5B Parameters"));
  parameter Real TUC2_ex = 0.1 "lead time constant of second lead-lag block (under-excitation channel) (sec)" annotation(Dialog(tab = "ST5B Parameters"));
  parameter Real TUB2_ex = 0.1 "lag time constant of second lead-lag block (under-excitation channel) (sec)" annotation(Dialog(tab = "ST5B Parameters"));
  parameter Real TOC1_ex = 0.1 "lead time constant of first lead-lag block (over-excitation channel) (sec)" annotation(Dialog(tab = "ST5B Parameters"));
  parameter Real TOB1_ex = 0.1 "lag time constant of first lead-lag block (over-excitation channel) (sec)" annotation(Dialog(tab = "ST5B Parameters"));
  parameter Real TOC2_ex = 0.1 "lead time constant of second lead-lag block (over-excitation channel) (sec)" annotation(Dialog(tab = "ST5B Parameters"));
  parameter Real TOB2_ex = 0.1 "lag time constant of second lead-lag block (over-excitation channel) (sec)" annotation(Dialog(tab = "ST5B Parameters"));
  //
  OpalRT.Electrical.Machine.SynchronousMachine.GENROU genrou1(ID = M_ID, P_gen = P_gen, Q_gen = Q_gen, Vt_abs = Vt_abs, Vt_ang = Vt_ang, SB = SB, fn = fn, ZSOURCE_RE = ZSOURCE_RE, Tdo_p = Tdo_p, Tdo_s = Tdo_s, Tqo_p = Tqo_p, Tqo_s = Tqo_s, H = H, D = D, Xd = Xd, Xq = Xq, Xd_p = Xd_p, Xq_p = Xq_p, Xd_s = Xd_s, Xl = Xl, S1 = S1, S12 = S12) annotation(Placement(visible = true, transformation(origin = {15, -15}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
  OpalRT.NonElectrical.Connector.PwPin bus0 annotation(Placement(visible = true, transformation(origin = {60, -40}, extent = {{-5, -5}, {5, 5}}, rotation = 0), iconTransformation(origin = {100, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  input OpalRT.NonElectrical.Connector.InputInterfacePin TRIP annotation(Placement(visible = true, transformation(origin = {0, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 0), iconTransformation(origin = {0, 80}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  input OpalRT.NonElectrical.Connector.InputInterfacePin dVREF annotation(Placement(visible = true, transformation(origin={-70,-23}, extent = {{-5, -5}, {5, 5}}, rotation = 0), iconTransformation(origin = {-90, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.Electrical.Control.Excitation.ST5B st5b1(TR = TR_ex, TC1 = TC1_ex, TB1 = TB1_ex, TC2 = TC2_ex, TB2 = TB2_ex, KR = KR_ex, VRMAX = VRMAX_ex, VRMIN = VRMIN_ex, T1 = T1_ex, KC = KC_ex, TUC1 = TUC1_ex, TUB1 = TUB1_ex, TUC2 = TUC2_ex, TUB2 = TUB2_ex, TOC1 = TOC1_ex, TOB1 = TOB1_ex, TOC2 = TOC2_ex, TOB2 = TOB2_ex) annotation(Placement(visible = true, transformation(origin={-25,-3}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant2(k = noVUEL) annotation(Placement(visible = true, transformation(origin={-61,24}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 0) annotation(Placement(visible = true, transformation(origin={-61,-8}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant1(k = noVOEL) annotation(Placement(visible = true, transformation(origin={-61,9}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  parameter Real noVOEL(fixed = false, start = 1);
  parameter Real noVUEL(fixed = false, start = 1);
initial equation
  noVOEL = Modelica.Constants.inf;
  noVUEL = -Modelica.Constants.inf;
equation
  connect(genrou1.PMECH0, genrou1.PMECH) annotation (Line(points = {{0,-27},{
          -2.71399,-27},{-2.71399,-24},{0,-24}}, color = {
          0,0,127}));
  connect(genrou1.p, bus0) annotation(Line(points = {{15,-30},{15,-42},{60,-42},
          {60,-40}}));
  connect(TRIP, genrou1.TRIP) annotation(Line(points = {{0,40},{14.9166,40},{
          14.9166,0},{15,0}}));
  connect(st5b1.EFD0, genrou1.EFD0) annotation (Line(points = {{-10,-15},{-4,
          -15},{-4,-15},{-0.3,-15}}, color = {0,0,127}));
  connect(st5b1.EFD, genrou1.EFD) annotation (Line(points = {{-10,-12},{-6,-12},
          {-6,-10.8},{0,-10.8}}, color = {0,0,127}));
  connect(st5b1.ETERM0, genrou1.ETERM0) annotation (Line(points = {{-10,-9},{-5,
          -9},{-5,-7.5},{-0.3,-7.5}}, color = {0,0,127}));
  connect(st5b1.EX_AUX, genrou1.EX_AUX) annotation (Line(points = {{-10,-5.1},{
          -5,-5.1},{-5,-3},{-0.3,-3}}, color = {0,0,127}));
  connect(constant2.y, st5b1.VUEL) annotation (Line(points = {{-55.5,24},{-48,
          24},{-48,0},{-40,0}}, color = {0,0,127}));
  connect(constant1.y, st5b1.VOEL) annotation (Line(points = {{-55.5,9},{-50,9},
          {-50,-4.2},{-40,-4.2}}, color = {0,0,127}));
  connect(const.y, st5b1.VOTHSG) annotation (Line(points = {{-55.5,-8},{-48,-8},
          {-48,-8.4},{-40,-8.4}}, color = {0,0,127}));
  connect(st5b1.dVREF, dVREF) annotation(Line(points={{-40,-12},{-49.8715,-12},
          {-49.8715,-23.1362},{-70,-23.1362},{-70,-23}},                     color = {0, 0, 127}));
  connect(genrou1.VI, st5b1.VI) annotation(Line(points={{30,-15},{42.4165,-15},{
          42.4165,5.9126},{-10,5.9126},{-10,6}},                      color = {0, 0, 127}));
  connect(st5b1.XADIFD, genrou1.XADIFD) annotation (Line(points = {{-40,4.5},{
          -45,4.5},{-45,19},{36,19},{36,-7.5},{30,-7.5}}, color = {0,0,127}));
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1}), graphics={ Rectangle(origin = {1.13895, -0.455581}, extent = {{-95.8998, 87.016}, {94.0775, -92.2551}}), Text(origin = {57.7941, -57.2869}, extent = {{25.85, -23.58}, {-20.1552, 17.8852}}, textString = "PIN"), Text(origin = {-5.13093, 9.23212}, extent = {{-73.46, 18.79}, {83.94, -29.04}}, textString = "GENROU_EXAC1A"), Text(origin = {-59.4304, -59.9804}, extent = {{59.0612, -18.9402}, {-20.16, 17.89}}, textString = "dVREF"), Text(origin = {-29.6516, 61.375}, extent = {{59.06, -18.94}, {3.03902, 10.3198}}, textString = "TRIP")}));
end GENROU_ST5B_OLD;
