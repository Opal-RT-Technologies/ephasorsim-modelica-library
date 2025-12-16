within OpalRT.ModelSets.Old;
model GENROU_ST6B_OLD
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
  // ST6B Parameters
  // This Model is located at system bus IBUS
  parameter Real TR_ex = 0.012 "(sec)";
  parameter Real KPA_ex = 18.038;
  parameter Real KIA_ex = 45.094;
  parameter Real KDA_ex = 0;
  parameter Real TDA_ex = 0;
  parameter Real VAMAX_ex = 4.81;
  parameter Real VAMIN_ex = -3.85;
  parameter Real KFF_ex = 1;
  parameter Real KM_ex = 1;
  parameter Real KCI_ex = 1.0577;
  parameter Real KLR_ex = 17.33;
  parameter Real ILR_ex = 4.164;
  parameter Real VRMAX_ex = 4.81;
  parameter Real VRMIN_ex = -3.85;
  parameter Real KG_ex = 1;
  parameter Real TG_ex = 0.02;
  parameter Real OEL_ex = 1;
  //
  OpalRT.Electrical.Machine.SynchronousMachine.GENROU genrou1(ID = M_ID, P_gen = P_gen, Q_gen = Q_gen, Vt_abs = Vt_abs, Vt_ang = Vt_ang, SB = SB, fn = fn, ZSOURCE_RE = ZSOURCE_RE, Tdo_p = Tdo_p, Tdo_s = Tdo_s, Tqo_p = Tqo_p, Tqo_s = Tqo_s, H = H, D = D, Xd = Xd, Xq = Xq, Xd_p = Xd_p, Xq_p = Xq_p, Xd_s = Xd_s, Xl = Xl, S1 = S1, S12 = S12) annotation(Placement(visible = true, transformation(origin = {40, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  input OpalRT.NonElectrical.Connector.InputInterfacePin TRIP annotation(Placement(visible = true, transformation(origin = {35, 65}, extent = {{-5, -5}, {5, 5}}, rotation = 0), iconTransformation(origin = {40, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.Connector.PwPin bus0 annotation(Placement(visible = true, transformation(origin = {80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.Electrical.Control.Excitation.ST6B st6b1(TR = TR_ex, KPA = KPA_ex, KIA = KIA_ex, KDA = KDA_ex, TDA = TDA_ex, VAMAX = VAMAX_ex, VAMIN = VAMIN_ex, KFF = KFF_ex, KM = KM_ex, KCI = KCI_ex, KLR = KLR_ex, ILR = ILR_ex, VRMAX = VRMAX_ex, VRMIN = VRMIN_ex, KG = KG_ex, TG = TG_ex, OEL = OEL_ex) annotation(Placement(visible = true, transformation(origin={14,28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 0) annotation(Placement(visible = true, transformation(origin={-24,42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant1(k = noVUEL) annotation(Placement(visible = true, transformation(origin={-20,72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  input OpalRT.NonElectrical.Connector.InputInterfacePin dVREF annotation(Placement(visible = true, transformation(origin = {-20, 20}, extent = {{-7, -7}, {7, 7}}, rotation = 0), iconTransformation(origin = {-36, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Real noVUEL(fixed = false, start = 1);
initial equation
  noVUEL = -Modelica.Constants.inf;
equation
  connect(genrou1.p, bus0) annotation(Line(points = {{40,10},{40,-2.90237},{80,
          -2.90237},{80,0}}));
  connect(TRIP, genrou1.TRIP) annotation(Line(points = {{35,65},{40.3694,65},{
          40.3694,30.6069},{40.3694,30},{40,30}}));
  connect(st6b1.EFD0, genrou1.EFD0)
    annotation (Line(points = {{24,20},{29.8,20}}, color={0,0,127}));
  connect(st6b1.EFD, genrou1.EFD) annotation (Line(points = {{24,22},{28,22},{
          28,22.8},{30,22.8}}, color = {0,0,127}));
  connect(st6b1.ETERM0, genrou1.ETERM0) annotation (Line(points = {{24,24},{26,
          24},{26,25},{29.8,25}}, color = {0,0,127}));
  connect(st6b1.EX_AUX, genrou1.EX_AUX) annotation (Line(points = {{24,26.6},{
          27,26.6},{27,28},{29.8,28}}, color = {0,0,127}));
  connect(genrou1.PMECH0, genrou1.PMECH) annotation (Line(points = {{30,12},{26,
          12},{26,14},{30,14}}, color = {0,0,127}));
  connect(st6b1.dVREF, dVREF) annotation(Line(points={{4,22},{-18.37,22},{
          -18.37,20},{-20,20}},                  color = {0, 0, 127}));
  connect(const.y, st6b1.VOTHSG) annotation (Line(points = {{-13,42},{-8,42},{
          -8,24.4},{4,24.4}}, color = {0,0,127}));
  connect(st6b1.VOEL, st6b1.VOTHSG) annotation (Line(points = {{4,27.2},{-8,
          27.2},{-8,24.4},{4,24.4}}, color = {0,0,127}));
  connect(st6b1.VUEL, constant1.y) annotation (Line(points = {{4,30},{-6,30},{
          -6,72},{-9,72}}, color = {0,0,127}));
  connect(genrou1.VI, st6b1.VI) annotation(Line(points={{50,20},{59.6401,20},{59.6401,
          33.6761},{24,33.6761},{24,34}},                            color = {0, 0, 127}));
  connect(st6b1.XADIFD, genrou1.XADIFD) annotation (Line(points = {{4,33},{0,33},
          {0,42},{54,42},{54,25},{50,25}}, color = {0,0,127}));
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={ Rectangle(origin = {-1.36674, 26.4237}, extent = {{-88.3827, 36.4465}, {94.3052, -90.4328}}), Text(origin = {-31.8919, -1.02164}, extent = {{-48.06, 27.45}, {116.397, -21.0719}}, textString = "GENROU_ST6B")}));
end GENROU_ST6B_OLD;
