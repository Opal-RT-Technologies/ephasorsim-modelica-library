within OpalRT.ModelSets.Old;
model GENROU_ESST4B_OLD
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
  //
  OpalRT.Electrical.Machine.SynchronousMachine.GENROU genrou1(ID = M_ID, P_gen = P_gen, Q_gen = Q_gen, Vt_abs = Vt_abs, Vt_ang = Vt_ang, SB = SB, fn = fn, ZSOURCE_RE = ZSOURCE_RE, Tdo_p = Tdo_p, Tdo_s = Tdo_s, Tqo_p = Tqo_p, Tqo_s = Tqo_s, H = H, D = D, Xd = Xd, Xq = Xq, Xd_p = Xd_p, Xq_p = Xq_p, Xd_s = Xd_s, Xl = Xl, S1 = S1, S12 = S12) annotation(Placement(visible = true, transformation(origin = {40, 0}, extent = {{-17.5, -17.5}, {17.5, 17.5}}, rotation = 0)));
  OpalRT.Electrical.Control.Excitation.ESST4B esst4b1(TR = TR_ex, KPR = KPR_ex, KIR = KIR_ex, VRMAX = VRMAX_ex, VRMIN = VRMIN_ex, TA = TA_ex, KPM = KPM_ex, KIM = KIM_ex, VMMAX = VMMAX_ex, VMMIN = VMMIN_ex, KG = KG_ex, KP = KP_ex, KI = KI_ex, VBMAX = VBMAX_ex, KC = KC_ex, XL = XL_ex, THETAP = THETAP_ex) annotation(Placement(visible = true, transformation(origin={-13.25,
            17.25}, extent = {{-21.25, -21.25}, {21.25, 21.25}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant1(k = 0) annotation(Placement(visible = true, transformation(origin={-58,20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  input OpalRT.NonElectrical.Connector.InputInterfacePin TRIP annotation(Placement(visible = true, transformation(origin = {38, 44}, extent = {{-5, -5}, {5, 5}}, rotation = 0), iconTransformation(origin = {40, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.Connector.PwPin bus0 annotation(Placement(visible = true, transformation(origin = {80, -20}, extent = {{-5, -5}, {5, 5}}, rotation = 0), iconTransformation(origin = {100, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = noVOEL) annotation(Placement(visible = true, transformation(origin={-58,4}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  input OpalRT.NonElectrical.Connector.InputInterfacePin dVREF annotation(Placement(visible = true, transformation(origin = {-40, -20}, extent = {{-5, -5}, {5, 5}}, rotation = 0), iconTransformation(origin = {60, 60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  parameter Real noVOEL(fixed = false, start = 1);
initial equation
  noVOEL = Modelica.Constants.inf;
equation
  connect(TRIP, genrou1.TRIP) annotation(Line(points = {{38,44},{38.1597,44},{
          38.1597,17.5},{40,17.5}}));
  connect(genrou1.p, bus0) annotation(Line(points = {{40,-17.5},{40,-20},{80,
          -20}}));
  connect(esst4b1.EX_AUX, genrou1.EX_AUX) annotation (Line(points = {{8,14.275},
          {16,14.275},{16,14},{22.15,14}}, color = {0,0,127}));
  connect(esst4b1.ETERM0, genrou1.ETERM0) annotation (Line(points = {{8,8.75},{
          15,8.75},{15,8.75},{22.15,8.75}}, color = {0,0,127}));
  connect(esst4b1.EFD, genrou1.EFD) annotation (Line(points = {{8,4.5},{16,4.5},
          {16,4.9},{22.5,4.9}}, color = {0,0,127}));
  connect(esst4b1.EFD0, genrou1.EFD0) annotation (Line(points = {{8,0.25},{15,
          0.25},{15,0},{22.15,0}}, color = {0,0,127}));
  connect(genrou1.PMECH0, genrou1.PMECH) annotation (Line(points = {{22.5,-14},
          {16,-14},{16,-10.5},{22.5,-10.5}}, color = {0,0,127}));
  connect(genrou1.VI, esst4b1.VI) annotation(Line(points={{57.5,0},{74.8072,0},{
          74.8072,30.3342},{8,30.3342},{8,30}},                        color = {0, 0, 127}));
  connect(esst4b1.XADIFD, genrou1.XADIFD) annotation (Line(points = {{-34.5,
          27.875},{-46,27.875},{-46,56},{66,56},{66,8.75},{57.5,8.75}}, color=
         {0,0,127}));
  connect(esst4b1.dVREF, dVREF) annotation(Line(points={{-34.5,4.5},{-41.3882,
          4.5},{-41.3882,-17.4807},{-40,-17.4807},{-40,-20}},                color = {0, 0, 127}));
  connect(const.y, esst4b1.VOEL) annotation (Line(points = {{-52.5,4},{-48,4},{
          -48,15.55},{-34.5,15.55}}, color = {0,0,127}));
  connect(esst4b1.VOTHSG, constant1.y) annotation (Line(points = {{-34.5,9.6},{
          -42,9.6},{-42,20},{-52.5,20}}, color = {0,0,127}));
  connect(esst4b1.VUEL, constant1.y) annotation (Line(points = {{-34.5,21.5},{
          -42,21.5},{-42,20},{-52.5,20}}, color = {0,0,127}));
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={ Rectangle(origin = {-0.135318, -2.57104}, extent = {{-95.9405, 88.3627}, {95.9405, -88.3627}}), Text(origin = {-36.2636, -4.19901}, extent = {{-48.17, 24.76}, {116.912, -10.4163}}, textString = "GENROU_ESST4B")}));
end GENROU_ESST4B_OLD;
