within OpalRT.ModelSets.Old;
model GENSAL_ESDC2A_OLD
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
  input OpalRT.NonElectrical.Connector.InputInterfacePin dVREF annotation(Placement(visible = true, transformation(origin={-86,-34}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Connector.PwPin bus0 annotation(Placement(visible = true, transformation(origin = {60, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {80, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  input OpalRT.NonElectrical.Connector.InputInterfacePin Trip annotation(Placement(visible = true, transformation(origin = {-5, 25}, extent = {{-5, -5}, {5, 5}}, rotation = 0), iconTransformation(origin = {0, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.Electrical.Control.Excitation.ESDC2A esdc2a1(TR = TR_ex, KA = KA_ex, TA = TA_ex, TB = TB_ex, TC = TC_ex, VRMAX = VRMAX_ex, VRMIN = VRMIN_ex, KE = KE_ex, KF = KF_ex, TF1 = TF1_ex, Switch = Switch_ex, E1 = E1_ex, SE_E1 = SE_E1_ex, E2 = E2_ex, SE_E2 = SE_E2_ex, TE = TE_ex) annotation(Placement(visible = true, transformation(origin={-40,-26}, extent={{-16,-16},
            {16,16}}, rotation = 0)));
  parameter Real noVUEL(fixed = false, start = 1);
  Modelica.Blocks.Sources.Constant const(k = 0) annotation(Placement(visible = true, transformation(origin={-76,-22}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant1(k = noVUEL) annotation(Placement(visible = true, transformation(origin={-76,-4}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
initial equation
  noVUEL = -Modelica.Constants.inf;
equation
  connect(gensal1.PMECH0, gensal1.PMECH) annotation(Line(points = {{-15,-52},{
          -16.3616,-52},{-16.3616,-49},{-15,-49}}, color = {0, 0, 127}));
  connect(Trip, gensal1.TRIP) annotation(Line(points = {{-5,25},{-0.256739,25},
          {-0.256739,-25},{0,-25}}));
  connect(bus0, gensal1.p) annotation(Line(points = {{60,-60},{0,-60},{0,-55}}));
  connect(esdc2a1.EFD0, gensal1.EFD0) annotation (Line(points = {{-24,-38.8},{
          -20,-38.8},{-20,-40},{-15.3,-40}}, color = {0,0,127}));
  connect(esdc2a1.EFD, gensal1.EFD) annotation (Line(points = {{-24,-35.6},{-20,
          -35.6},{-20,-35.8},{-15,-35.8}}, color = {0,0,127}));
  connect(esdc2a1.ETERM0, gensal1.ETERM0) annotation (Line(points = {{-24,-32.4},
          {-20,-32.4},{-20,-32.5},{-15.3,-32.5}}, color = {0,0,127}));
  connect(esdc2a1.EX_AUX, gensal1.EX_AUX) annotation (Line(points = {{-24,
          -28.24},{-18,-28.24},{-18,-28},{-15.3,-28}}, color = {0,0,127}));
  connect(gensal1.VI, esdc2a1.VI) annotation(Line(points={{15,-40},{32.9049,-40},
          {32.9049,-16.7095},{-24,-16.7095},{-24,-16.4}},                  color = {0, 0, 127}));
  connect(esdc2a1.XADIFD, gensal1.XADIFD) annotation (Line(points = {{-56,-18},
          {-62,-18},{-62,-2},{26,-2},{26,-32.5},{15,-32.5}}, color = {0,0,127}));
  connect(esdc2a1.dVREF, dVREF) annotation(Line(points={{-56,-35.6},{-88.4319,
          -35.6},{-88.4319,-34},{-86,-34}}, color = {0, 0, 127}));
  connect(esdc2a1.VOTHSG, const.y) annotation (Line(points = {{-56,-31.76},{-66,
          -31.76},{-66,-22},{-70.5,-22}}, color = {0,0,127}));
  connect(constant1.y, esdc2a1.VUEL) annotation (Line(points = {{-70.5,-4},{-64,
          -4},{-64,-22.8},{-56,-22.8}}, color = {0,0,127}));
  connect(esdc2a1.VOEL, const.y) annotation (Line(points = {{-56,-27.28},{-66,
          -27.28},{-66,-22},{-70.5,-22}}, color = {0,0,127}));
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={ Text(origin = {-95.8874, -22.34}, extent = {{8.6, 26.96}, {181.13, -7.96128}}, textString = "GENROU_ESDC1A"), Rectangle(origin = {2.05392, -19.5122}, extent = {{-99.6149, 78.819}, {99.6149, -78.819}})}));
end GENSAL_ESDC2A_OLD;
