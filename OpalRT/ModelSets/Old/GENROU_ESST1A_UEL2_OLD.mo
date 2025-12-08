within OpalRT.ModelSets.Old;
model GENROU_ESST1A_UEL2_OLD
  parameter Real partType = 1;
  // GENROU Parameters
  parameter Integer IBUS = 100 "Located system bus" annotation(Dialog(tab = "General"));
  parameter String M_ID = "M1" "Machine Identifier" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real P_gen = 900 "Bus Active Power, MW" annotation(Dialog(tab = "General"));
  parameter Real Q_gen = 200 "Bus Reactive Power, MVAR" annotation(Dialog(tab = "General"));
  parameter Real Vt_abs = 1.03 "Bus Voltage Magnitude, p.u." annotation(Dialog(tab = "General"));
  parameter Real Vt_ang = -10.96 "Bus Voltage Angle, deg." annotation(Dialog(tab = "General"));
  parameter Real SB = 1000 "Machine Base Power, MVA" annotation(Dialog(tab = "General"));
  parameter Real fn = 50 "Nominal frequency" annotation(Dialog(tab = "General"));
  parameter Real ZSOURCE_RE = 0 "Machine source impedence" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Tdo_p = 7 "d-axis transient time constant" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Tdo_s = 0.3 "d-axis sub-transient time constant, s" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Tqo_p = 0.04 "q-axis transient time constant, s" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Tqo_s = 0.4 "d-axis sub-transient time constant, s" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real H = 2.6 "Inertia constant" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real D = 0 "Speed damping" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xd = 0.67 "d-axis reactance, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xq = 0.62 "q-axis reactance, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xd_p = 0.3 "d-axis transient reactance, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xq_p = 0.3 "q-axis transient reactance, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xd_s = 0.01 "d-axis sub-transient reactance, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xl = 0.04 "Reactance due to the leakage flux which does not cross the air gap, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real S1 = 0.1 "saturation function value for 1 p.u. input" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real S12 = 0.2 "saturation function value for 1.2 p.u. input" annotation(Dialog(tab = "GENROU Parameters"));
  // ESST1A parameters
  parameter Real TR_ex = 0.02 "(sec)" annotation(Dialog(tab = "ESST1A Parameters"));
  parameter Real VIMAX_ex = 10 annotation(Dialog(tab = "ESST1A Parameters"));
  parameter Real VIMIN_ex = -10 annotation(Dialog(tab = "ESST1A Parameters"));
  parameter Real TC_ex = 1 "(sec)" annotation(Dialog(tab = "ESST1A Parameters"));
  parameter Real TB_ex = 1 "(sec)" annotation(Dialog(tab = "ESST1A Parameters"));
  parameter Real TC1_ex = 0 "(sec)" annotation(Dialog(tab = "ESST1A Parameters"));
  parameter Real TB1_ex = 0 "(sec)" annotation(Dialog(tab = "ESST1A Parameters"));
  parameter Real KA_ex = 210 annotation(Dialog(tab = "ESST1A Parameters"));
  parameter Real TA_ex = 0 "(sec)" annotation(Dialog(tab = "ESST1A Parameters"));
  parameter Real VAMAX_ex = 10 annotation(Dialog(tab = "ESST1A Parameters"));
  parameter Real VAMIN_ex = -10 annotation(Dialog(tab = "ESST1A Parameters"));
  parameter Real VRMAX_ex = 6.43 annotation(Dialog(tab = "ESST1A Parameters"));
  parameter Real VRMIN_ex = -6 annotation(Dialog(tab = "ESST1A Parameters"));
  parameter Real KC_ex = 0.038 annotation(Dialog(tab = "ESST1A Parameters"));
  parameter Real KF_ex = 0 annotation(Dialog(tab = "ESST1A Parameters"));
  parameter Real TF_ex = 0 "> 0 (sec)" annotation(Dialog(tab = "ESST1A Parameters"));
  parameter Real KLR_ex = 4.54 annotation(Dialog(tab = "ESST1A Parameters"));
  parameter Real ILR_ex = 4.4 annotation(Dialog(tab = "ESST1A Parameters"));
  // ICONS
  parameter Real UEL_ex = 1 "1,2 or 3" annotation(Dialog(tab = "ESST1A Parameters"));
  parameter Real VOS_ex = 1 "1 or 2" annotation(Dialog(tab = "ESST1A Parameters"));
  // UEL2 parameters
  parameter Real TUV_uel = 5 "(sec) voltage filter time constant" annotation(Dialog(tab = "UEL2 Parameters"));
  parameter Real TUP_uel = 5 "(sec) real power filter time constant" annotation(Dialog(tab = "UEL2 Parameters"));
  parameter Real TUQ_uel = 0 "(sec) reactive power filter time constant" annotation(Dialog(tab = "UEL2 Parameters"));
  parameter Real KUI_uel = 0.5 "(pu) UEL integral gain" annotation(Dialog(tab = "UEL2 Parameters"));
  parameter Real KUL_uel = 0.8 "(pu) UEL proportional gain" annotation(Dialog(tab = "UEL2 Parameters"));
  parameter Real VUIMAX_uel = 0.25 "(pu) UEL integrator output maximum limit" annotation(Dialog(tab = "UEL2 Parameters"));
  parameter Real VUIMIN_uel = 0 "(pu) UEL integrator output minimum limit" annotation(Dialog(tab = "UEL2 Parameters"));
  parameter Real KUF_uel = 0 "(pu) UEL excitation system stabilizer gain" annotation(Dialog(tab = "UEL2 Parameters"));
  parameter Real KFB_uel = 0 "(pu)" annotation(Dialog(tab = "UEL2 Parameters"));
  parameter Real TUL_uel = 0 "(sec)" annotation(Dialog(tab = "UEL2 Parameters"));
  parameter Real TU1_uel = 0 "UEL lead time constant (sec)" annotation(Dialog(tab = "UEL2 Parameters"));
  parameter Real TU2_uel = 0 "UEL lag time constant (sec)" annotation(Dialog(tab = "UEL2 Parameters"));
  parameter Real TU3_uel = 0 "UEL lead time constant (sec)" annotation(Dialog(tab = "UEL2 Parameters"));
  parameter Real TU4_uel = 0 "UEL lag time constant (sec)" annotation(Dialog(tab = "UEL2 Parameters"));
  parameter Real P0_uel = 0 "(pu on gen. MVA base)" annotation(Dialog(tab = "UEL2 Parameters"));
  parameter Real Q0_uel = -0.31 "(pu on gen. MVA base)" annotation(Dialog(tab = "UEL2 Parameters"));
  parameter Real P1_uel = 0.3 "(pu on gen. MVA base)" annotation(Dialog(tab = "UEL2 Parameters"));
  parameter Real Q1_uel = -0.31 "(pu on gen. MVA base)" annotation(Dialog(tab = "UEL2 Parameters"));
  parameter Real P2_uel = 0.6 "(pu on gen. MVA base)" annotation(Dialog(tab = "UEL2 Parameters"));
  parameter Real Q2_uel = -0.28 "(pu on gen. MVA base)" annotation(Dialog(tab = "UEL2 Parameters"));
  parameter Real P3_uel = 0.9 "(pu on gen. MVA base)" annotation(Dialog(tab = "UEL2 Parameters"));
  parameter Real Q3_uel = -0.21 "(pu on gen. MVA base)" annotation(Dialog(tab = "UEL2 Parameters"));
  parameter Real P4_uel = 1.02 "(pu on gen. MVA base)" annotation(Dialog(tab = "UEL2 Parameters"));
  parameter Real Q4_uel = 0 "(pu on gen. MVA base)" annotation(Dialog(tab = "UEL2 Parameters"));
  parameter Real P5_uel = 0 "(pu on gen. MVA base)" annotation(Dialog(tab = "UEL2 Parameters"));
  parameter Real Q5_uel = 0 "(pu on gen. MVA base)" annotation(Dialog(tab = "UEL2 Parameters"));
  parameter Real P6_uel = 0 "(pu on gen. MVA base)" annotation(Dialog(tab = "UEL2 Parameters"));
  parameter Real Q6_uel = 0 "(pu on gen. MVA base)" annotation(Dialog(tab = "UEL2 Parameters"));
  parameter Real P7_uel = 0 "(pu on gen. MVA base)" annotation(Dialog(tab = "UEL2 Parameters"));
  parameter Real Q7_uel = 0 "(pu on gen. MVA base)" annotation(Dialog(tab = "UEL2 Parameters"));
  parameter Real P8_uel = 0 "(pu on gen. MVA base)" annotation(Dialog(tab = "UEL2 Parameters"));
  parameter Real Q8_uel = 0 "(pu on gen. MVA base)" annotation(Dialog(tab = "UEL2 Parameters"));
  parameter Real P9_uel = 0 "(pu on gen. MVA base)" annotation(Dialog(tab = "UEL2 Parameters"));
  parameter Real Q9_uel = 0 "(pu on gen. MVA base)" annotation(Dialog(tab = "UEL2 Parameters"));
  parameter Real P10_uel = 0 "(pu on gen. MVA base)" annotation(Dialog(tab = "UEL2 Parameters"));
  parameter Real Q10_uel = 0 "(pu on gen. MVA base)" annotation(Dialog(tab = "UEL2 Parameters"));
  parameter Real VULMAX_uel = 0.25 "(pu) UEL output maximum limit" annotation(Dialog(tab = "UEL2 Parameters"));
  parameter Real VULMIN_uel = 0 "(pu) UEL output minimum limit" annotation(Dialog(tab = "UEL2 Parameters"));
  parameter Real M0_uel = 0 "k1, exponent in function F1" annotation(Dialog(tab = "UEL2 Parameters"));
  parameter Real M1_uel = 0 "k2, exponent in function F2" annotation(Dialog(tab = "UEL2 Parameters"));
  parameter Real M2_uel = 0 " 0: MVAR curve interpreted as mirror image around MVAR axis; 1: MVAR is found by linear extrapolation" annotation(Dialog(tab = "UEL2 Parameters"));
  OpalRT.Electrical.Control.Excitation.ESST1A esst1a1(UEL = UEL_ex, VOS = VOS_ex, TR = TR_ex, VIMAX = VIMAX_ex, VIMIN = VIMIN_ex, TC = TC_ex, TB = TB_ex, TC1 = TC1_ex, TB1 = TB1_ex, KA = KA_ex, TA = TA_ex, VAMAX = VAMAX_ex, VAMIN = VAMIN_ex, VRMAX = VRMAX_ex, VRMIN = VRMIN_ex, KC = KC_ex, KF = KF_ex, TF = TF_ex, KLR = KLR_ex, ILR = ILR_ex) annotation(Placement(visible = true, transformation(origin={-26,40}, extent = {{-25, -25}, {25, 25}}, rotation = 0)));
  OpalRT.Electrical.Machine.SynchronousMachine.GENROU genrou1(IBUS = IBUS, ID = M_ID, P_gen = P_gen, Q_gen = Q_gen, Vt_abs = Vt_abs, Vt_ang = Vt_ang, SB = SB, fn = fn, ZSOURCE_RE = ZSOURCE_RE, Tdo_p = Tdo_p, Tdo_s = Tdo_s, Tqo_p = Tqo_p, Tqo_s = Tqo_s, H = H, D = D, Xd = Xd, Xq = Xq, Xd_p = Xd_p, Xq_p = Xq_p, Xd_s = Xd_s, Xl = Xl, S1 = S1, S12 = S12) annotation(Placement(visible = true, transformation(origin = {40, 20}, extent = {{-25, -25}, {25, 25}}, rotation = 0)));
  OpalRT.NonElectrical.Connector.PwPin bus0 annotation(Placement(visible = true, transformation(origin={100,-32}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin={100,-32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  input OpalRT.NonElectrical.Connector.InputInterfacePin TRIP annotation(Placement(visible = true, transformation(origin={24,56}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 0) annotation(Placement(visible = true, transformation(origin={-88,-16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.Electrical.Control.UnderExcitationLimiter.UEL2 uel21(TUV = TUV_uel, TUP = TUP_uel, TUQ = TUQ_uel, KUI = KUI_uel, KUL = KUL_uel, VUIMAX = VUIMAX_uel, VUIMIN = VUIMIN_uel, KUF = KUF_uel, KFB = KFB_uel, TUL = TUL_uel, TU1 = TU1_uel, TU2 = TU2_uel, TU3 = TU3_uel, TU4 = TU4_uel, P0 = P0_uel, Q0 = Q0_uel, P1 = P1_uel, Q1 = Q1_uel, P2 = P2_uel, Q2 = Q2_uel, P3 = P3_uel, Q3 = Q3_uel, P4 = P4_uel, Q4 = Q4_uel, P5 = P5_uel, Q5 = Q5_uel, P6 = P6_uel, Q6 = Q6_uel, P7 = P7_uel, Q7 = Q7_uel, P8 = P8_uel, Q8 = Q8_uel, P9 = P9_uel, Q9 = Q9_uel, P10 = P10_uel, Q10 = Q10_uel, VULMAX = VULMAX_uel, VULMIN = VULMIN_uel, M0 = M0_uel, M1 = M1_uel, M2 = M2_uel) annotation(Placement(visible = true, transformation(origin={-100,46}, extent = {{-10, -10}, {25, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant1(k = noVOEL) annotation(Placement(visible = true, transformation(origin={-88,14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Real noVOEL(fixed = false, start = 1);
  NonElectrical.Connector.InputInterfacePin        dVREF annotation(Placement(visible = true, transformation(origin={-82,-50}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
initial equation
  noVOEL = Modelica.Constants.inf;
equation
  connect(genrou1.p, bus0) annotation(Line(points = {{40,-5},{39.6219,-5},{
          39.6219,-32},{100,-32}}));
  connect(TRIP, genrou1.TRIP) annotation(Line(points = {{24,56},{38.9522,56},{
          38.9522,45},{40,45}}));
  connect(genrou1.PMECH0, genrou1.PMECH) annotation (Line(points = {{15,0},{
          10.2506,0},{10.2506,5},{15,5}}, color = {0,0,
          127}));
  connect(esst1a1.EFD0, genrou1.EFD0)
    annotation (Line(points = {{-1,20},{14.5,20}}, color={0,0,127}));
  connect(esst1a1.EFD, genrou1.EFD) annotation (Line(points = {{-1,25},{5.5,25},
          {5.5,27},{15,27}}, color = {0,0,127}));
  connect(esst1a1.ETERM0, genrou1.ETERM0) annotation (Line(points = {{-1,30},{8,
          30},{8,32.5},{14.5,32.5}}, color = {0,0,127}));
  connect(esst1a1.EX_AUX, genrou1.EX_AUX) annotation (Line(points = {{-1,36.5},
          {6.5,36.5},{6.5,40},{14.5,40}}, color = {0,0,127}));
  connect(uel21.VUEL, esst1a1.VUEL) annotation (Line(points = {{-74.3,46},{-58,
          46},{-58,45},{-51,45}},
                              color = {0,0,127}));
  connect(constant1.y, esst1a1.VOEL) annotation (Line(points = {{-77,14},{-72,
          14},{-72,38},{-51,38}}, color = {0,0,127}));
  connect(const.y, esst1a1.VOTHSG) annotation (Line(points = {{-77,-16},{-64,
          -16},{-64,31},{-51,31}}, color = {0,0,127}));
  connect(esst1a1.XADIFD, genrou1.XADIFD) annotation (Line(points = {{-51,52.5},
          {-60,52.5},{-60,72},{78,72},{78,32.5},{65,32.5}}, color = {0,0,127}));
  connect(uel21.VF, esst1a1.VF) annotation (Line(points = {{-109.65,46},{-122,
          46},{-122,82},{6,82},{6,60},{0,60}},
                                           color = {0,0,127}));
  connect(uel21.EX_AUX, genrou1.EX_AUX) annotation (Line(points={{-109.65,54},{
          -130,54},{-130,86},{8,86},{8,40},{14.5,40}},
        color = {0,0,127}));
  connect(genrou1.VI, esst1a1.VI) annotation (Line(points={{65,20},{70,20},{70,
          55},{-1,55}}, color={0,0,127}));
  connect(genrou1.VI, uel21.VI) annotation (Line(points={{65,20},{70,20},{70,92},
          {-114,92},{-114,50},{-109.65,50}}, color={0,0,127}));
  connect(dVREF, esst1a1.dVREF) annotation (Line(points={{-82,-50},{-58,-50},{
          -58,25},{-51,25}}, color={0,0,0}));
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), experiment(StartTime = 0, StopTime = 5, Tolerance = 1e-06, Interval = 0.01002), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={ Rectangle(origin = {0.405954, -0.270636}, extent = {{-99.7294, 99.3234}, {99.7294, -99.3234}}), Text(origin = {-63.8731, 80.1054}, extent = {{-24.09, 15.43}, {24.09, -15.43}}, textString = "TRIP"), Text(origin = {66.8172, -78.5168}, extent = {{-24.09, 14.8887}, {24.09, -15.43}}, textString = "PIN"), Text(origin = {-7.3, 53.32}, extent = {{-79.56, -36.26}, {85.79, -71.99}}, textString = "GENROU_ESST1A_UEL2")}));
end GENROU_ESST1A_UEL2_OLD;
