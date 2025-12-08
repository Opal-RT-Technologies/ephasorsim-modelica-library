within OpalRT.ModelSets.Old;
model GENROU_ESST3A_OLD
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
  // ESST3A Parameters
  parameter Real TR_ex = 0.02 "(sec) regulator input filter time constant" annotation(Dialog(tab = "ESST3A Parameters"));
  parameter Real VIMAX_ex = 10 "(pu) Voltage regulator input maximum limit" annotation(Dialog(tab = "ESST3A Parameters"));
  parameter Real VIMIN_ex = -10 "(pu) Voltage regulator input minimum limit" annotation(Dialog(tab = "ESST3A Parameters"));
  parameter Real KM_ex = 0.02 "Forward gain constant of the inner loop field regulator" annotation(Dialog(tab = "ESST3A Parameters"));
  parameter Real TC_ex = 1 " lead time constant of voltage regulator (s)" annotation(Dialog(tab = "ESST3A Parameters"));
  parameter Real TB_ex = 0.1 " lag time constant of voltage regulator (s)" annotation(Dialog(tab = "ESST3A Parameters"));
  parameter Real KA_ex = 10 "(pu) voltage regulator gain" annotation(Dialog(tab = "ESST3A Parameters"));
  parameter Real TA_ex = 0.02 "(sec) regulator time constant" annotation(Dialog(tab = "ESST3A Parameters"));
  parameter Real VRMAX_ex = 10 "(pu) regulator output maximum limit" annotation(Dialog(tab = "ESST3A Parameters"));
  parameter Real VRMIN_ex = -10 "(pu) regulator output minimum limit" annotation(Dialog(tab = "ESST3A Parameters"));
  parameter Real KG_ex = 1 "Feedback gain constant of the inner loop field regulator" annotation(Dialog(tab = "ESST3A Parameters"));
  parameter Real KP_ex = 1 "Potential circuit gain coefficient" annotation(Dialog(tab = "ESST3A Parameters"));
  parameter Real KI_ex = 0.02 "Potential circuit gain coefficient" annotation(Dialog(tab = "ESST3A Parameters"));
  parameter Real VBMAX_ex = 10 "(pu) regulator output maximum limit" annotation(Dialog(tab = "ESST3A Parameters"));
  parameter Real KC_ex = 1 "Rectifier loading factor proportional to commutating reactance" annotation(Dialog(tab = "ESST3A Parameters"));
  parameter Real XL_ex = 0.02 "Reactance associated with potential source" annotation(Dialog(tab = "ESST3A Parameters"));
  parameter Real VGMAX_ex = 10 "(pu) regulator output maximum limit" annotation(Dialog(tab = "ESST3A Parameters"));
  parameter Real THETAP_ex = 0.52 "Potential circuit phase angle (degrees)" annotation(Dialog(tab = "ESST3A Parameters"));
  parameter Real TM_ex = 0.02 "Forward time constant of the inner loop field regulator" annotation(Dialog(tab = "ESST3A Parameters"));
  parameter Real VMMAX_ex = 10 "(pu) regulator output maximum limit" annotation(Dialog(tab = "ESST3A Parameters"));
  parameter Real VMMIN_ex = -10 "(pu) regulator output minimum limit" annotation(Dialog(tab = "ESST3A Parameters"));
  //
  Modelica.Blocks.Sources.Constant const(k = 0) annotation(Placement(visible = true, transformation(origin={-37,14}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  input OpalRT.NonElectrical.Connector.InputInterfacePin dVREF annotation(Placement(visible = true, transformation(origin={-57,5}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-90, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.Electrical.Control.Excitation.ESST3A ESST3A1(TR = TR_ex, VIMAX = VIMAX_ex, VIMIN = VIMIN_ex, KM = KM_ex, TC = TC_ex, TB = TB_ex, KA = KA_ex, TA = TA_ex, VRMAX = VRMAX_ex, VRMIN = VRMIN_ex, KG = KG_ex, KP = KP_ex, KI = KI_ex, VBMAX = VBMAX_ex, KC = KC_ex, XL = XL_ex, VGMAX = VGMAX_ex, THETAP = THETAP_ex, TM = TM_ex, VMMAX = VMMAX_ex, VMMIN = VMMIN_ex) annotation(Placement(visible = true, transformation(origin={-2,11}, extent={{-14,-14},
            {14,14}}, rotation = 0)));
  OpalRT.Electrical.Machine.SynchronousMachine.GENROU genrou1(ID = M_ID, P_gen = P_gen, Q_gen = Q_gen, Vt_abs = Vt_abs, Vt_ang = Vt_ang, SB = SB, fn = fn, ZSOURCE_RE = ZSOURCE_RE, Tdo_p = Tdo_p, Tdo_s = Tdo_s, Tqo_p = Tqo_p, Tqo_s = Tqo_s, H = H, D = D, Xd = Xd, Xq = Xq, Xd_p = Xd_p, Xq_p = Xq_p, Xd_s = Xd_s, Xl = Xl, S1 = S1, S12 = S12) annotation(Placement(visible = true, transformation(origin = {40, 0}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
  input OpalRT.NonElectrical.Connector.InputInterfacePin TRIP annotation(Placement(visible = true, transformation(origin={34,27}, extent = {{-5, -5}, {5, 5}}, rotation = 0), iconTransformation(origin = {-90, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.Connector.PwPin bus0 annotation(Placement(visible = true, transformation(origin={49,-25}, extent = {{-5, -5}, {5, 5}}, rotation = 0), iconTransformation(origin = {100, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant1(k = -Modelica.Constants.inf) annotation(Placement(visible = true, transformation(origin={-37,28}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
equation
  connect(bus0, genrou1.p) annotation(Line(points = {{49,-25},{40,-25},{40,-15}}));
  connect(genrou1.TRIP, TRIP) annotation(Line(points = {{40,15},{40.2733,15},{
          40.2733,27},{34,27}}, color = {0, 0, 127}));
  connect(ESST3A1.dVREF, dVREF) annotation(Line(points={{-16,2.6},{-54.6796,2.6},
          {-54.6796,5},{-57,5}},                         color = {0, 0, 127}));
  connect(ESST3A1.EFD0, genrou1.EFD0) annotation (Line(points = {{12,-0.2},{19,
          -0.2},{19,0},{24.7,0}}, color = {0,0,127}));
  connect(ESST3A1.EFD, genrou1.EFD) annotation (Line(points = {{12,2.6},{19,2.6},
          {19,4.2},{25,4.2}}, color = {0,0,127}));
  connect(ESST3A1.ETERM0, genrou1.ETERM0) annotation (Line(points = {{12,5.4},{
          18.5,5.4},{18.5,7.5},{24.7,7.5}}, color = {0,0,127}));
  connect(ESST3A1.EX_AUX, genrou1.EX_AUX) annotation (Line(points = {{12,9.04},
          {19,9.04},{19,12},{24.7,12}}, color = {0,0,127}));
  connect(genrou1.VI, ESST3A1.VI) annotation(Line(points={{55,0},{68.4842,0},{68.4842,
          19.193},{12,19.193},{12,19.4}},                           color = {0, 0, 127}));
  connect(ESST3A1.XADIFD, genrou1.XADIFD) annotation (Line(points = {{-16,18},{
          -24,18},{-24,36},{63,36},{63,7.5},{55,7.5}}, color = {0,0,127}));
  connect(genrou1.PMECH0, genrou1.PMECH) annotation (Line(points = {{25,-12},{
          21,-12},{21,-9},{25,-9}}, color = {0,0,127}));
  connect(ESST3A1.VUEL, constant1.y) annotation (Line(points = {{-16,13.8},{-28,
          13.8},{-28,28},{-31.5,28}}, color = {0,0,127}));
  connect(const.y, ESST3A1.VOEL) annotation (Line(points = {{-31.5,14},{-30,14},
          {-30,9.88},{-16,9.88}}, color = {0,0,127}));
  connect(ESST3A1.VOTHSG, ESST3A1.VOEL) annotation (Line(points = {{-16,5.96},{
          -25,5.96},{-25,9.88},{-16,9.88}}, color = {0,0,127}));
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1}), graphics={ Rectangle(origin = {-1.36674, 26.4237}, extent = {{-88.3827, 36.4465}, {94.3052, -90.4328}}), Text(origin = {-31.89, -1.02}, extent = {{-48.06, 27.45}, {116.4, -21.07}}, textString = "GENROU_ESST3A"), Text(origin = {-28.0449, 24.0306}, extent = {{-48.06, 27.45}, {-14.7288, 7.43627}}, textString = "TRIP"), Text(origin = {-29.22, -57.42}, extent = {{-48.06, 27.45}, {-7.66044, 9.49245}}, textString = "dVREF"), Text(origin = {93.4388, -56.31}, extent = {{-25.9391, 26.3097}, {-7.66, 9.49}}, textString = "Pin")}));
end GENROU_ESST3A_OLD;
