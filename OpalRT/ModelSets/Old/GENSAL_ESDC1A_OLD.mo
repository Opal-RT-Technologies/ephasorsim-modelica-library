within OpalRT.ModelSets.Old;
model GENSAL_ESDC1A_OLD
  parameter Real partType = 1;
  //GENSAL
  parameter Integer IBUS = 100 "Located system bus";
  parameter String ID = "M1" "Machine Identifier";
  parameter Real P_gen = 1100 "Bus Active Power, MW";
  parameter Real Q_gen = 342.702 "Bus Reactive Power, MVAR";
  parameter Real Vt_abs = 1.03 "Bus Voltage Magnitude, p.u.";
  parameter Real Vt_ang = -10.96 "Bus Voltage Angle, deg.";
  parameter Real SB = 1000 "Machine Base Power, MVA";
  parameter Real fn = 50 "Nominal frequency";
  parameter Real ZSOURCE_RE = 0 "Machine source impedence";
  parameter Real Tdo_p = 7 "d-axis transient time constant";
  parameter Real Tdo_s = 0.03 "d-axis sub-transient time constant, s";
  parameter Real Tqo_s = 0.04 "d-axis sub-transient time constant, s";
  parameter Real H = 50 "Inertia constant";
  parameter Real D = 0 "Speed damping";
  parameter Real Xd = 0.2 "d-axis reactance, p.u.";
  parameter Real Xq = 0.19 "q-axis reactance, p.u.";
  parameter Real Xd_p = 0.06 "d-axis transient reactance, p.u.";
  parameter Real Xd_s = 0.02 "d-axis sub-transient reactance, p.u.";
  parameter Real Xl = 0.03 "Reactance due to the leakage flux which does not cross the air gap, p.u.";
  parameter Real S1 = 0.4 "saturation function value for 1 p.u. input";
  parameter Real S12 = 0.8 "saturation function value for 1.2 p.u. input";
  parameter Real ZSOURCE_IM = Xd_s "Machine source impedence";
  //ESDC1A
  parameter Real TR_ex = 0.1 "(sec)" annotation(Dialog(tab = "ESDC1A parameters"));
  parameter Real KA_ex = 400 annotation(Dialog(tab = "ESDC1A parameters"));
  parameter Real TA_ex = 5 "(sec)" annotation(Dialog(tab = "ESDC1A parameters"));
  parameter Real TB_ex = 12 "(sec)" annotation(Dialog(tab = "ESDC1A parameters"));
  parameter Real TC_ex = 10 "(sec)" annotation(Dialog(tab = "ESDC1A parameters"));
  parameter Real VRMAX_ex = 5 "or zero" annotation(Dialog(tab = "ESDC1A parameters"));
  parameter Real VRMIN_ex = -5 annotation(Dialog(tab = "ESDC1A parameters"));
  parameter Real KE_ex = 0.5 "or zero" annotation(Dialog(tab = "ESDC1A parameters"));
  parameter Real TE_ex = 0.08 "(sec)" annotation(Dialog(tab = "ESDC1A parameters"));
  parameter Real KF_ex = 0.2 annotation(Dialog(tab = "ESDC1A parameters"));
  parameter Real TF1_ex = 1.2 "(>0) (sec)" annotation(Dialog(tab = "ESDC1A parameters"));
  parameter Real Switch_ex = 0 annotation(Dialog(tab = "ESDC1A parameters"));
  parameter Real E1_ex = 4 annotation(Dialog(tab = "ESDC1A parameters"));
  parameter Real SE_E1_ex = 0.4 annotation(Dialog(tab = "ESDC1A parameters"));
  parameter Real E2_ex = 5 annotation(Dialog(tab = "ESDC1A parameters"));
  parameter Real SE_E2_ex = 0.5 annotation(Dialog(tab = "ESDC1A parameters"));
  OpalRT.Electrical.Machine.SynchronousMachine.GENSAL gensal1(P_gen = P_gen, Q_gen = Q_gen, Vt_abs = Vt_abs, Vt_ang = Vt_ang, SB = SB, fn = fn, Tdo_p = Tdo_p, Tdo_s = Tdo_s, Tqo_s = Tqo_s, H = H, D = D, Xd = Xd, Xq = Xq, Xd_p = Xd_p, Xd_s = Xd_s, Xl = Xl, S1 = S1, S12 = S12, ZSOURCE_RE = ZSOURCE_RE) annotation(Placement(visible = true, transformation(origin = {0, -40}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
  OpalRT.Electrical.Control.Excitation.ESDC1A esdc1a1(TR = TR_ex, KA = KA_ex, TA = TA_ex, TB = TB_ex, TC = TC_ex, VRMAX = VRMAX_ex, VRMIN = VRMIN_ex, KE = KE_ex, TE = TE_ex, KF = KF_ex, TF1 = TF1_ex, Switch = Switch_ex, E1 = E1_ex, SE_E1 = SE_E1_ex, E2 = E2_ex, SE_E2 = SE_E2_ex) annotation(Placement(visible = true, transformation(origin={-36,-28}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 0) annotation(Placement(visible = true, transformation(origin={-72,-22}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Connector.PwPin bus0 annotation(Placement(visible = true, transformation(origin = {60, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -60}, extent = {{-12.5, -12.5}, {12.5, 12.5}}, rotation = 0)));
  input OpalRT.NonElectrical.Connector.InputInterfacePin Trip annotation(Placement(visible = true, transformation(origin = {-7, -1}, extent = {{-5, -5}, {5, 5}}, rotation = 0), iconTransformation(origin = {-100, 20}, extent = {{-12.5, -12.5}, {12.5, 12.5}}, rotation = 0)));
  input OpalRT.NonElectrical.Connector.InputInterfacePin dVREF annotation(Placement(visible = true, transformation(origin = {-80, -40}, extent = {{-5, -5}, {5, 5}}, rotation = 0), iconTransformation(origin = {-100, -60}, extent = {{-12.5, -12.5}, {12.5, 12.5}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant1(k = noVUEL) annotation(Placement(visible = true, transformation(origin={-72,-6}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  parameter Real noVUEL(fixed = false, start = 1);
initial equation
  noVUEL = -Modelica.Constants.inf;
equation
  connect(gensal1.VI, esdc1a1.VI) annotation(Line(points={{15,-40},{24.2141,-40},
          {24.2141,-18.9629},{-21,-18.9629},{-21,-19}},
          color = {0, 0, 127}));
  connect(esdc1a1.dVREF, dVREF) annotation(Line(points={{-51,-37},{-59.6855,-37},
          {-59.6855,-39.8709},{-80,-39.8709},{-80,-40}},
          color = {0, 0, 127}));
  connect(gensal1.PMECH0, gensal1.PMECH) annotation(Line(points = {{-15,-52},{
          -16.5312,-52},{-16.5312,-49},{-15,-49}}, color = {0, 0, 127}));
  connect(Trip, gensal1.TRIP) annotation(Line(points = {{-7,-1},{-0.256739,-1},
          {-0.256739,-25},{0,-25}}));
  connect(bus0, gensal1.p) annotation(Line(points = {{60,-60},{0,-60},{0,-55}}));
  connect(esdc1a1.EFD0, gensal1.EFD0)
    annotation (Line(points = {{-21,-40},{-15.3,-40}}, color={0,0,127}));
  connect(esdc1a1.EFD, gensal1.EFD) annotation (Line(points = {{-21,-37},{-18.5,
          -37},{-18.5,-35.8},{-15,-35.8}}, color = {0,0,127}));
  connect(esdc1a1.ETERM0, gensal1.ETERM0) annotation (Line(points = {{-21,-34},
          {-18,-34},{-18,-32.5},{-15.3,-32.5}}, color = {0,0,127}));
  connect(esdc1a1.EX_AUX, gensal1.EX_AUX) annotation (Line(points = {{-21,-30.1},
          {-18.5,-30.1},{-18.5,-28},{-15.3,-28}}, color = {0,0,127}));
  connect(constant1.y, esdc1a1.VUEL) annotation (Line(points = {{-66.5,-6},{-58,
          -6},{-58,-25},{-51,-25}}, color = {0,0,127}));
  connect(const.y, esdc1a1.VOEL) annotation (Line(points = {{-66.5,-22},{-60,
          -22},{-60,-29.2},{-51,-29.2}}, color = {0,0,127}));
  connect(esdc1a1.VOTHSG, esdc1a1.VOEL) annotation (Line(points = {{-51,-33.4},
          {-60,-33.4},{-60,-29.2},{-51,-29.2}}, color = {0,0,127}));
  connect(gensal1.XADIFD, esdc1a1.XADIFD) annotation (Line(points = {{15,-32.5},
          {20,-32.5},{20,-10},{-56,-10},{-56,-20.5},{-51,-20.5}}, color = {0,0,
          127}));
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Text(origin = {-95.8874, -22.34}, extent = {{8.6, 26.96}, {181.13, -7.96128}}, textString = "GENROU_ESDC1A"), Rectangle(origin = {0.533007, -18.7517}, extent = {{-99.9951, 79.1992}, {99.6149, -78.819}}), Text(origin = {66.783, -60.1431}, extent = {{15.38, 8.04}, {-15.38, -8.04}}, textString = "PIN"), Text(origin = {-69.86, 21.4}, extent = {{15.38, 8.04}, {-15.38, -8.04}}, textString = "TRIP"), Text(origin = {-68.04, -58.25}, extent = {{15.38, 8.04}, {-15.38, -8.04}}, textString = "dVREF")}));
end GENSAL_ESDC1A_OLD;
