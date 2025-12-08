within OpalRT.ePHASORSIM.WrappedModels;
block GENROU_ST6B_OLD
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
  ModelSets.Old.GENROU_ST6B_OLD modelSet(
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
      KPA_ex = KPA_ex,
      KIA_ex = KIA_ex,
      KDA_ex = KDA_ex,
      TDA_ex = TDA_ex,
      VAMAX_ex = VAMAX_ex,
      VAMIN_ex = VAMIN_ex,
      KFF_ex = KFF_ex,
      KM_ex = KM_ex,
      KCI_ex = KCI_ex,
      KLR_ex = KLR_ex,
      ILR_ex = ILR_ex,
      VRMAX_ex = VRMAX_ex,
      VRMIN_ex = VRMIN_ex,
      KG_ex = KG_ex,
      TG_ex = TG_ex,
      OEL_ex = OEL_ex)
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
    annotation (Line(points={{0,100},{0,30.8},{7.2,30.8}},
                                              color={0,0,0}));
  connect(modelSet.bus0, bus0_PIN2INOUT.p) annotation (Line(points={{14.4,20},{40,
          20},{40,-40},{52,-40}},      color={0,0,0}));
  connect(modelSet.dVREF, dVREF)
    annotation (Line(points={{-6.48,24.32},{-60,24.32},{-60,100}},
                                                               color={0,0,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end GENROU_ST6B_OLD;
