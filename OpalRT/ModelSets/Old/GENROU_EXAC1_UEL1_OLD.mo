within OpalRT.ModelSets.Old;
model GENROU_EXAC1_UEL1_OLD
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
  // EXAC1 Parameters
  parameter Real TR_ex = 0.1 "(sec)" annotation(Dialog(tab = "EXAC1 Parameters"));
  parameter Real TB_ex = 12 "(sec)" annotation(Dialog(tab = "EXAC1 Parameters"));
  parameter Real TC_ex = 10 "(sec)" annotation(Dialog(tab = "EXAC1 Parameters"));
  parameter Real KA_ex = 400 annotation(Dialog(tab = "EXAC1 Parameters"));
  parameter Real TA_ex = 5 "(sec)" annotation(Dialog(tab = "EXAC1 Parameters"));
  parameter Real VRMAX_ex = 5 "or zero" annotation(Dialog(tab = "EXAC1 Parameters"));
  parameter Real VRMIN_ex = -5 annotation(Dialog(tab = "EXAC1 Parameters"));
  parameter Real TE_ex = 0.08 "(sec)" annotation(Dialog(tab = "EXAC1 Parameters"));
  parameter Real KF_ex = 0.2 annotation(Dialog(tab = "EXAC1 Parameters"));
  parameter Real TF_ex = 1.2 "(>0) (sec)" annotation(Dialog(tab = "EXAC1 Parameters"));
  parameter Real KC_ex = 0.4 annotation(Dialog(tab = "EXAC1 Parameters"));
  parameter Real KD_ex = 0.4 annotation(Dialog(tab = "EXAC1 Parameters"));
  parameter Real KE_ex = 0.5 "or zero" annotation(Dialog(tab = "EXAC1 Parameters"));
  parameter Real E1_ex = 4 annotation(Dialog(tab = "EXAC1 Parameters"));
  parameter Real SE_E1_ex = 0.4 annotation(Dialog(tab = "EXAC1 Parameters"));
  parameter Real E2_ex = 5 annotation(Dialog(tab = "EXAC1 Parameters"));
  parameter Real SE_E2_ex = 0.5 annotation(Dialog(tab = "EXAC1 Parameters"));
  // UEL1 Parameters
  parameter Real KUR_uel = 2 "UEL radius setting (pu)" annotation(Dialog(tab = "UEL1 Parameters"));
  parameter Real KUC_uel = 1 "(pu) UEL center setting (pu)" annotation(Dialog(tab = "UEL1 Parameters"));
  parameter Real KUF_uel = 1 "(pu) UEL excitation system stabilizergain (pu)" annotation(Dialog(tab = "UEL1 Parameters"));
  parameter Real VURMAX_uel = 1 "UEL maximum limit for radius phasor magnitude (pu)" annotation(Dialog(tab = "UEL1 Parameters"));
  parameter Real VUCMAX_uel = 1 "UEL maximum limit for operating point phasor magnitude (pu)" annotation(Dialog(tab = "UEL1 Parameters"));
  parameter Real KUI_uel = 1 "UEL integral gain (pu)" annotation(Dialog(tab = "UEL1 Parameters"));
  parameter Real KUL_uel = 1 "UEL proportional gain (pu)" annotation(Dialog(tab = "UEL1 Parameters"));
  parameter Real VUIMAX_uel = 1 "UEL integrator output maximum limit (pu)" annotation(Dialog(tab = "UEL1 Parameters"));
  parameter Real VUIMIN_uel = 1 "UEL integrator output minimum limit (pu)" annotation(Dialog(tab = "UEL1 Parameters"));
  parameter Real TU1_uel = 1 "UEL lead time constant (sec)" annotation(Dialog(tab = "UEL1 Parameters"));
  parameter Real TU2_uel = 1 "UEL lag time constant (sec)" annotation(Dialog(tab = "UEL1 Parameters"));
  parameter Real TU3_uel = 1 "UEL lead time constant (sec)" annotation(Dialog(tab = "UEL1 Parameters"));
  parameter Real TU4_uel = 1 "UEL lag time constant (sec)" annotation(Dialog(tab = "UEL1 Parameters"));
  parameter Real VULMAX_uel = 1 "UEL output maximum limit (pu)" annotation(Dialog(tab = "UEL1 Parameters"));
  parameter Real VULMIN_uel = 1 "UEL output minimum limit (pu)" annotation(Dialog(tab = "UEL1 Parameters"));
  OpalRT.Electrical.Control.UnderExcitationLimiter.UEL1 uel11(KUR = KUR_uel, KUC = KUC_uel, KUF = KUF_uel, VURMAX = VURMAX_uel, VUCMAX = VUCMAX_uel, KUI = KUI_uel, KUL = KUL_uel, VUIMAX = VUIMAX_uel, VUIMIN = VUIMIN_uel, TU1 = TU1_uel, TU2 = TU2_uel, TU3 = TU3_uel, TU4 = TU4_uel, VULMAX = VULMAX_uel, VULMIN = VULMIN_uel) annotation(Placement(visible = true, transformation(origin={-70,18}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
  OpalRT.Electrical.Machine.SynchronousMachine.GENROU genrou1(
    ID = M_ID,
    P_gen = P_gen,
    Q_gen = Q_gen,
    Vt_abs = Vt_abs,
    Vt_ang = Vt_ang,
    SB = SB,
    fn = fn,
    ZSOURCE_RE = ZSOURCE_RE,
    Tdo_p = Tdo_p,
    Tdo_s = Tdo_s,
    Tqo_p = Tqo_p,
    Tqo_s = Tqo_s,
    H = H,
    D = D,
    Xd = Xd,
    Xq = Xq,
    Xd_p = Xd_p,
    Xq_p = Xq_p,
    Xd_s = Xd_s,
    Xl = Xl,
    S1 = S1,
    S12 = S12) annotation(Placement(visible = true, transformation(origin={66,-10}, extent = {{-25, -25}, {25, 25}}, rotation = 0)));
  OpalRT.Electrical.Control.Excitation.EXAC1 exac11(
    ID = M_ID,
    TR = TR_ex,
    TB = TB_ex,
    TC = TC_ex,
    KA = KA_ex,
    TA = TA_ex,
    VRMAX = VRMAX_ex,
    VRMIN = VRMIN_ex,
    TE = TE_ex,
    KF = KF_ex,
    TF = TF_ex,
    KC = KC_ex,
    KD = KD_ex,
    KE = KE_ex,
    E1 = E1_ex,
    SE_E1 = SE_E1_ex,
    E2 = E2_ex,
    SE_E2 = SE_E2_ex) annotation(Placement(visible = true, transformation(origin={4,10}, extent = {{-25, -25}, {25, 25}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 0) annotation(Placement(visible = true, transformation(origin={-60,68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.Connector.PwPin bus0 annotation(Placement(visible = true, transformation(origin={106,-70}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin={106,-70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.Connector.InputInterfacePin dVREF annotation(Placement(visible = true, transformation(origin={-90,-12}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.Connector.InputInterfacePin TRIP annotation(Placement(visible = true, transformation(origin={66,60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(TRIP,genrou1. TRIP) annotation(Line(points = {{66,60},{66.0473,60},{
          66.0473,15},{66,15}}));
  connect(bus0,genrou1. p) annotation(Line(points = {{106,-70},{67.0495,-70},{
          67.0495,-42.1499},{66,-42.1499},{66,-35}}));
  connect(exac11.EFD0, genrou1.EFD0)
    annotation (Line(points = {{29,-10},{40.5,-10}}, color={0,0,127}));
  connect(exac11.EFD, genrou1.EFD) annotation (Line(points = {{29,-5},{35.5,-5},
          {35.5,-3},{41,-3}}, color = {0,0,127}));
  connect(exac11.ETERM0, genrou1.ETERM0) annotation (Line(points = {{29,0},{36,
          0},{36,2.5},{40.5,2.5}}, color = {0,0,127}));
  connect(exac11.EX_AUX, genrou1.EX_AUX) annotation (Line(points = {{29,6.5},{
          34.5,6.5},{34.5,10},{40.5,10}}, color = {0,0,127}));
  connect(exac11.XADIFD, genrou1.XADIFD) annotation (Line(points = {{-21,22.5},
          {-32,22.5},{-32,46},{100,46},{100,2.5},{91,2.5}}, color = {0,0,127}));
  connect(const.y, exac11.VOEL) annotation (Line(points = {{-49,68},{-38,68},{
          -38,8},{-21,8}}, color = {0,0,127}));
  connect(exac11.VOTHSG, exac11.VOEL) annotation (Line(points = {{-21,1},{-38,1},
          {-38,8},{-21,8}}, color = {0,0,127}));
  connect(exac11.VUEL, uel11.VUEL) annotation (Line(points = {{-21,15},{-46,15},
          {-46,18},{-54.4,18}},
                              color = {0,0,127}));
  connect(uel11.VF, exac11.VF) annotation (Line(points = {{-84.7,18},{-96,18},{
          -96,52},{34,52},{34,30},{30,30}}, color = {0,0,127}));
  connect(genrou1.PMECH0, genrou1.PMECH) annotation (Line(points = {{41,-30},{
          36,-30},{36,-25},{41,-25}}, color = {0,0,127}));
  connect(genrou1.VI, exac11.VI) annotation (Line(points={{91,-10},{96,-10},{96,
          25},{29,25}}, color={0,0,127}));
  connect(genrou1.VI, uel11.VI) annotation (Line(points={{91,-10},{94,-10},{94,
          38},{-90,38},{-90,24},{-84.7,24}}, color={0,0,127}));
  connect(dVREF, exac11.dVREF) annotation (Line(points={{-90,-12},{-44,-12},{
          -44,-5},{-21,-5}}, color={0,0,0}));
  connect(uel11.EX_AUX, genrou1.EX_AUX) annotation (Line(points={{-84.7,30},{
          -92,30},{-92,42},{36,42},{36,10},{40.5,10}}, color={0,0,127}));
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={ Rectangle(origin = {0, -0.141443}, extent = {{-99.5757, 100}, {99.5757, -100}}), Text(origin = {-47.9517, 18.9531}, extent = {{-39.4668, -11.0304}, {131.122, -33.3826}}, textString = "GENROU_EXAC1_UEL2"), Text(origin = {-42.9469, -55.5302}, extent = {{99.1458, -14.4242}, {131.12, -33.38}}, textString = "PIN")}));
end GENROU_EXAC1_UEL1_OLD;
