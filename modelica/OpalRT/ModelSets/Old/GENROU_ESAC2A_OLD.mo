within OpalRT.ModelSets.Old;
model GENROU_ESAC2A_OLD
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
  // ESAC2A Parameters
  parameter Real TR_ex = 0.02 "regulator input filter time constant (sec)" annotation(Dialog(tab = "ESAC2A Parameters"));
  parameter Real TB_ex = 0.1 " lag time constant of voltage regulator (s)" annotation(Dialog(tab = "ESAC2A Parameters"));
  parameter Real TC_ex = 1 " lead time constant of voltage regulator (s)" annotation(Dialog(tab = "ESAC2A Parameters"));
  parameter Real KA_ex = 10 "(pu) voltage regulator gain" annotation(Dialog(tab = "ESAC2A Parameters"));
  parameter Real TA_ex = 0.02 "(sec) regulator time constant" annotation(Dialog(tab = "ESAC2A Parameters"));
  parameter Real VAMAX_ex = 10 "Maximum voltage regulator output" annotation(Dialog(tab = "ESAC2A Parameters"));
  parameter Real VAMIN_ex = -10 "Minimum voltage regulator output" annotation(Dialog(tab = "ESAC2A Parameters"));
  parameter Real KB_ex = 0.02 "Second stage regulator gain" annotation(Dialog(tab = "ESAC2A Parameters"));
  parameter Real VRMAX_ex = 10 "(pu) regulator output maximum limit" annotation(Dialog(tab = "ESAC2A Parameters"));
  parameter Real VRMIN_ex = -10 "(pu) regulator output minimum limit" annotation(Dialog(tab = "ESAC2A Parameters"));
  parameter Real TE_ex = 0.35 "Exciter time constant" annotation(Dialog(tab = "ESAC2A Parameters"));
  parameter Real VFEMAX_ex = 10 "exciter field current limit (> 0)" annotation(Dialog(tab = "ESAC2A Parameters"));
  parameter Real KH_ex = 0.02 "Exciter field current feedback gain" annotation(Dialog(tab = "ESAC2A Parameters"));
  parameter Real KF_ex = 1 "Excitation control system stabilizer gains" annotation(Dialog(tab = "ESAC2A Parameters"));
  parameter Real TF_ex = 1.0 "Excitation control system stabilizer time constant, sec" annotation(Dialog(tab = "ESAC2A Parameters"));
  parameter Real KC_ex = 0.02 "Rectifier loading factor proportional to commutating reactance" annotation(Dialog(tab = "ESAC2A Parameters"));
  parameter Real KD_ex = 0.02 "Demagnetizing factor" annotation(Dialog(tab = "ESAC2A Parameters"));
  parameter Real KE_ex = 1 "exciter constant related fo self-excited field" annotation(Dialog(tab = "ESAC2A Parameters"));
  parameter Real E1_ex = 4 "Exciter voltages at which exciter saturation is defined" annotation(Dialog(tab = "ESAC2A Parameters"));
  parameter Real SE_E1_ex = 0.4 "Exciter saturation function value at E1" annotation(Dialog(tab = "ESAC2A Parameters"));
  parameter Real E2_ex = 5 "Exciter voltages at which exciter saturation is defined" annotation(Dialog(tab = "ESAC2A Parameters"));
  parameter Real SE_E2_ex = 0.5 "Exciter saturation function value at E2" annotation(Dialog(tab = "ESAC2A Parameters"));
  //
  Modelica.Blocks.Sources.Constant const(k = 0) annotation(Placement(visible = true, transformation(origin={-80,35}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant1(k = -Modelica.Constants.inf) annotation(Placement(visible = true, transformation(origin={-56,54}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant2(k = Modelica.Constants.inf) annotation(Placement(visible = true, transformation(origin={-56,39}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.Electrical.Machine.SynchronousMachine.GENROU genrou1(ID = M_ID, P_gen = P_gen, Q_gen = Q_gen, Vt_abs = Vt_abs, Vt_ang = Vt_ang, SB = SB, fn = fn, ZSOURCE_RE = ZSOURCE_RE, Tdo_p = Tdo_p, Tdo_s = Tdo_s, Tqo_p = Tqo_p, Tqo_s = Tqo_s, H = H, D = D, Xd = Xd, Xq = Xq, Xd_p = Xd_p, Xq_p = Xq_p, Xd_s = Xd_s, Xl = Xl, S1 = S1, S12 = S12) annotation(Placement(visible = true, transformation(origin={43,11}, extent = {{-17.5, -17.5}, {17.5, 17.5}}, rotation = 0)));
  OpalRT.Electrical.Control.Excitation.ESAC2A ESAC2A1(TR = TR_ex, TB = TB_ex, TC = TC_ex, KA = KA_ex, TA = TA_ex, VAMAX = VAMAX_ex, VAMIN = VAMIN_ex, KB = KB_ex, VRMAX = VRMAX_ex, VRMIN = VRMIN_ex, TE = TE_ex, VFEMAX = VFEMAX_ex, KH = KH_ex, KF = KF_ex, TF = TF_ex, KC = KC_ex, KD = KD_ex, KE = KE_ex, E1 = E1_ex, SE_E1 = SE_E1_ex, E2 = E2_ex, SE_E2 = SE_E2_ex) annotation(Placement(visible = true, transformation(origin={-8,25}, extent={{-17,-17},
            {17,17}}, rotation = 0)));
  input OpalRT.NonElectrical.Connector.InputInterfacePin TRIP annotation(Placement(visible = true, transformation(origin={35,41}, extent = {{-5, -5}, {5, 5}}, rotation = 0), iconTransformation(origin = {-90, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  input OpalRT.NonElectrical.Connector.InputInterfacePin dVREF annotation(Placement(visible = true, transformation(origin={-63,17}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-90, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.Connector.PwPin bus0 annotation(Placement(visible = true, transformation(origin = {65, -25}, extent = {{-5, -5}, {5, 5}}, rotation = 0), iconTransformation(origin = {100, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ESAC2A1.dVREF, dVREF) annotation(Line(points={{-25,14.8},{-64.2674,
          14.8},{-64.2674,17},{-63,17}},             color = {0, 0, 127}));
  connect(genrou1.TRIP, TRIP)
    annotation (Line(points = {{43,28.5},{43,41},{35,41}}, color={0,0,127}));
  connect(genrou1.EFD0, ESAC2A1.EFD0) annotation (Line(points = {{25.15,11},{17,
          11},{17,11.4},{9,11.4}}, color = {0,0,127}));
  connect(ESAC2A1.EFD, genrou1.EFD) annotation (Line(points = {{9,14.8},{17,
          14.8},{17,15.9},{25.5,15.9}}, color = {0,0,127}));
  connect(ESAC2A1.ETERM0, genrou1.ETERM0) annotation (Line(points = {{9,18.2},{
          18,18.2},{18,19.75},{25.15,19.75}}, color = {0,0,127}));
  connect(ESAC2A1.EX_AUX, genrou1.EX_AUX) annotation (Line(points = {{9,22.62},
          {18,22.62},{18,25},{25.15,25}}, color = {0,0,127}));
  connect(genrou1.VI, ESAC2A1.VI) annotation(Line(points={{60.5,11},{75.3213,11},
          {75.3213,48.8432},{17.9949,48.8432},{17.9949,35.4756},{9,35.4756},{9,35.2}},                         color = {0, 0, 127}));
  connect(ESAC2A1.XADIFD, genrou1.XADIFD) annotation (Line(points = {{-25,33.5},
          {-34,33.5},{-34,53},{71,53},{71,19.75},{60.5,19.75}}, color = {0,0,
          127}));
  connect(constant1.y, ESAC2A1.VUEL) annotation (Line(points = {{-50.5,54},{-37,
          54},{-37,28.4},{-25,28.4}}, color = {0,0,127}));
  connect(ESAC2A1.VOEL, constant2.y) annotation (Line(points = {{-25,23.64},{
          -41,23.64},{-41,39},{-50.5,39}}, color = {0,0,127}));
  connect(const.y, ESAC2A1.VOTHSG) annotation (Line(points = {{-74.5,35},{-67,
          35},{-67,27},{-47,27},{-47,21},{-34,21},{-34,18.88},{-25,18.88}},
        color = {0,0,127}));
  connect(genrou1.PMECH0, genrou1.PMECH) annotation (Line(points = {{25.5,-3},{
          20,-3},{20,0.5},{25.5,0.5}}, color = {0,0,127}));
  connect(bus0, genrou1.p)
    annotation (Line(points = {{65,-25},{43,-25},{43,-6.5}}, color={0,0,0}));
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1}), graphics={ Rectangle(origin = {-1.36674, 26.4237}, extent = {{-88.3827, 36.4465}, {94.3052, -90.4328}}), Text(origin = {-31.89, -1.02}, extent = {{-48.06, 27.45}, {116.4, -21.07}}, textString = "GENROU_ESAC2A"), Text(origin = {-156.207, 49.5706}, extent = {{78.9639, 2.59253}, {116.4, -21.07}}, textString = "TRIP"), Text(origin = {-157.15, -30.28}, extent = {{78.96, 2.59}, {125.066, -19.0175}}, textString = "dVREF"), Text(origin = {-37.69, -30.77}, extent = {{99.7126, 2.1339}, {125.07, -19.02}}, textString = "Pin")}));
end GENROU_ESAC2A_OLD;
