within OpalRT.ePHASORSIM.WrappedModels;
block GENROU_EXAC1_UEL1_OLD
  parameter Real partType = 1;

  // --------- GENROU Parameters (aliased from machineData / generalData) ---------
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

  // --------- EXAC1 Parameters (aliased from exciterData) ---------
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

  // --------- UEL1 Parameters (aliased from uelData) ---------
  parameter Real KUR_uel = 2 "UEL radius setting (pu)" annotation(Dialog(tab = "UEL1 Parameters"));
  parameter Real KUC_uel = 1 "(pu) UEL center setting (pu)" annotation(Dialog(tab = "UEL1 Parameters"));
  parameter Real KUF_uel = 1 "(pu) UEL excitation system stabilizer gain" annotation(Dialog(tab = "UEL1 Parameters"));
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

  OpalRT.NonElectrical.SignalRouting.PIN2INOUT bus0_PIN2INOUT
    annotation (Placement(transformation(extent={{52,-42},{72,-22}})));
  OpalRT.NonElectrical.Connector.InputInterfacePin bus0_vr
    annotation (Placement(transformation(extent={{-106,34},{-94,46}})));
  OpalRT.NonElectrical.Connector.InputInterfacePin bus0_vi
    annotation (Placement(transformation(extent={{-106,-46},{-94,-34}})));
  OpalRT.NonElectrical.Connector.OutputInterfacePin bus0_ir
    annotation (Placement(transformation(extent={{94,34},{106,46}})));
  OpalRT.NonElectrical.Connector.OutputInterfacePin bus0_ii
    annotation (Placement(transformation(extent={{94,-46},{106,-34}})));
  OpalRT.NonElectrical.Connector.InputInterfacePin TRIP
    annotation (Placement(transformation(extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={0,100})));
  ModelSets.Old.GENROU_EXAC1_UEL1_OLD modelSet(
      partType = partType,
      IBUS = IBUS,
      M_ID = M_ID,
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
      S12 = S12,
      TR_ex = TR_ex,
      TB_ex = TB_ex,
      TC_ex = TC_ex,
      KA_ex = KA_ex,
      TA_ex = TA_ex,
      VRMAX_ex = VRMAX_ex,
      VRMIN_ex = VRMIN_ex,
      TE_ex = TE_ex,
      KF_ex = KF_ex,
      TF_ex = TF_ex,
      KC_ex = KC_ex,
      KD_ex = KD_ex,
      KE_ex = KE_ex,
      E1_ex = E1_ex,
      SE_E1_ex = SE_E1_ex,
      E2_ex = E2_ex,
      SE_E2_ex = SE_E2_ex,
      KUR_uel = KUR_uel,
      KUC_uel = KUC_uel,
      KUF_uel = KUF_uel,
      VURMAX_uel = VURMAX_uel,
      VUCMAX_uel = VUCMAX_uel,
      KUI_uel = KUI_uel,
      KUL_uel = KUL_uel,
      VUIMAX_uel = VUIMAX_uel,
      VUIMIN_uel = VUIMIN_uel,
      TU1_uel = TU1_uel,
      TU2_uel = TU2_uel,
      TU3_uel = TU3_uel,
      TU4_uel = TU4_uel,
      VULMAX_uel = VULMAX_uel,
      VULMIN_uel = VULMIN_uel)
    annotation (Placement(transformation(extent={{-18,2},{18,38}})));
  OpalRT.NonElectrical.Connector.InputInterfacePin dVREF
    annotation (Placement(transformation(extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={-60,100})));
equation
  connect(bus0_PIN2INOUT.vr, bus0_vr) annotation (Line(points={{52,-24.2},{-6,-24.2},
          {-6,-24},{-80,-24},{-80,40},{-100,40}}, color={0,0,127}));
  connect(bus0_PIN2INOUT.vi, bus0_vi) annotation (Line(points={{51.8,-31.8},{-40,
          -31.8},{-40,-40},{-100,-40}}, color={0,0,127}));
  connect(bus0_PIN2INOUT.ir, bus0_ir) annotation (Line(points={{72.2,-27.6},{80,
          -27.6},{80,40},{100,40}}, color={0,0,127}));
  connect(bus0_PIN2INOUT.ii, bus0_ii) annotation (Line(points={{72.2,-36},{80,-36},
          {80,-40},{100,-40}}, color={0,0,127}));

  connect(TRIP, modelSet.TRIP)
    annotation (Line(points={{0,100},{0,52},{-28,52},{-28,34.4},{-18,34.4}},
                                              color={0,0,0}));
  connect(modelSet.bus0, bus0_PIN2INOUT.p) annotation (Line(points={{19.08,7.4},
          {40,7.4},{40,-40},{52,-40}}, color={0,0,0}));
  connect(modelSet.dVREF, dVREF)
    annotation (Line(points={{-18,5.6},{-60,5.6},{-60,100}},   color={0,0,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end GENROU_EXAC1_UEL1_OLD;
