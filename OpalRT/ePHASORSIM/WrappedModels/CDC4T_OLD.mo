within OpalRT.ePHASORSIM.WrappedModels;
block CDC4T_OLD
  parameter Real partType = 1;
  parameter Real RDC = 1 "The DC line resistance in ohms";
  parameter Real DELTI = 0.25 "Margin entred in per unit of desired power or current";
  parameter Real NBR = 1 "Number of bridges in series";
  parameter Real RCR = 0 "Commutating transformer resistance per bridge in ohms";
  parameter Real XCR = 0.57 "Commutating transformer reactance per bridge in ohms";
  parameter Real EBASR = 230 "Primary base ac voltage in kV";
  parameter Real TRR = 1 "Transformer ratio";
  parameter Real TAPR = 1 "Tap setting";
  parameter Real NBI = 1 "Number of bridges in series";
  parameter Real RCI = 0 "Commutating transformer resistance per bridge in ohms";
  parameter Real XCI = 0.57 "Commutating transformer reactance per bridge in ohms";
  parameter Real EBASI = 230 "Primary base ac voltage in kV";
  parameter Real TRI = 1 "Transformer ratio";
  parameter Real TAPI = 1 "Tap setting";
  parameter Real ALFDY = 0 "Minimum alpha for dynamics (degrees)" annotation(Dialog(tab = "Dynamic parameters"));
  parameter Real GAMDY = 0 "Minimum gamma for dynamics (degrees)" annotation(Dialog(tab = "Dynamic parameters"));
  parameter Real C0 = 20 "Minimum current demand (amps)" annotation(Dialog(tab = "Dynamic parameters"));
  parameter Real SB = 100 "Network base Power (MVA)";
  parameter Real GAMMX = 90 "Nominal maximum firing angle in degrees";
  parameter Real GAMMN = 0 "Nominal minimum firing angle in degrees";
  parameter Real Vmag_rec = 1 "rectifier side injecting active power" annotation(Dialog(tab = "Power Flow"));
  parameter Real Vang_rec = -7.8102 "rectifier side injecting reactive power" annotation(Dialog(tab = "Power Flow"));
  parameter Real Vmag_inv = 1 "inverter side injecting active power" annotation(Dialog(tab = "Power Flow"));
  parameter Real Vang_inv = -24.0517 "inverter side injecting reactive power" annotation(Dialog(tab = "Power Flow"));
  parameter Real SETVL = 800 "Current ( amps ) or power (MW) demand";
  parameter Real MDC = 2 "Control mode: 1 for power, 2 for current";
  parameter Real Tidc = 0.05 "Dc current transducer time constant (sec)" annotation(Dialog(tab = "Dynamic parameters"));
  parameter Real Tvdc = 0.05 "Dc voltage transducer time constant (sec)" annotation(Dialog(tab = "Dynamic parameters"));
  parameter Real C1 = 1000 "Current limit point 1 (amps)" annotation(Dialog(tab = "Dynamic parameters"));
  parameter Real C2 = 1000 "Current limit point 2 (amps)" annotation(Dialog(tab = "Dynamic parameters"));
  parameter Real C3 = 1000 "Current limit point 3 (amps)" annotation(Dialog(tab = "Dynamic parameters"));
  parameter Real V1 = 300 "Voltage limit point 1 (kV)" annotation(Dialog(tab = "Dynamic parameters"));
  parameter Real V2 = 400 "Voltage limit point 2 (kV)" annotation(Dialog(tab = "Dynamic parameters"));
  parameter Real V3 = 500 "Voltage limit point 3 (kV)" annotation(Dialog(tab = "Dynamic parameters"));
  parameter Real RCOMP = 0 "Compounding resistance in ohms";
  parameter Real VSCHED = 124.2 "Scheduled compunded dc voltage";

  OpalRT.NonElectrical.SignalRouting.PIN2INOUT bus0_PIN2INOUT
    annotation (Placement(transformation(extent={{40,-10},{60,10}})));
  OpalRT.NonElectrical.Connector.InputInterfacePin bus0_vr
    annotation (Placement(transformation(extent={{-106,64},{-94,76}})));
  OpalRT.NonElectrical.Connector.InputInterfacePin bus0_vi
    annotation (Placement(transformation(extent={{-106,24},{-94,36}})));
  OpalRT.NonElectrical.Connector.OutputInterfacePin bus0_ir
    annotation (Placement(transformation(extent={{94,64},{106,76}})));
  OpalRT.NonElectrical.Connector.OutputInterfacePin bus0_ii
    annotation (Placement(transformation(extent={{94,24},{106,36}})));

  ModelSets.Old.CDC4T_OLD modelSet(
      partType = partType,
      RDC = RDC,
      DELTI = DELTI,
      NBR = NBR,
      RCR = RCR,
      XCR = XCR,
      EBASR = EBASR,
      TRR = TRR,
      TAPR = TAPR,
      NBI = NBI,
      RCI = RCI,
      XCI = XCI,
      EBASI = EBASI,
      TRI = TRI,
      TAPI = TAPI,
      ALFDY = ALFDY,
      GAMDY = GAMDY,
      C0 = C0,
      SB = SB,
      GAMMX = GAMMX,
      GAMMN = GAMMN,
      Vmag_rec = Vmag_rec,
      Vang_rec = Vang_rec,
      Vmag_inv = Vmag_inv,
      Vang_inv = Vang_inv,
      SETVL = SETVL,
      MDC = MDC,
      Tidc = Tidc,
      Tvdc = Tvdc,
      C1 = C1,
      C2 = C2,
      C3 = C3,
      V1 = V1,
      V2 = V2,
      V3 = V3,
      RCOMP = RCOMP,
      VSCHED = VSCHED)
    annotation (Placement(transformation(extent={{-18,22},{18,58}})));
  NonElectrical.SignalRouting.PIN2INOUT bus0_PIN2INOUT1
    annotation (Placement(transformation(extent={{40,-50},{60,-30}})));
  NonElectrical.Connector.InputInterfacePin bus1_vr
    annotation (Placement(transformation(extent={{-106,-36},{-94,-24}})));
  NonElectrical.Connector.InputInterfacePin bus1_vi
    annotation (Placement(transformation(extent={{-106,-76},{-94,-64}})));
  NonElectrical.Connector.OutputInterfacePin bus1_ir
    annotation (Placement(transformation(extent={{94,-36},{106,-24}})));
  NonElectrical.Connector.OutputInterfacePin bus1_ii
    annotation (Placement(transformation(extent={{94,-76},{106,-64}})));
  NonElectrical.Connector.InputInterfacePin dVSCHED annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={-60,100})));
  NonElectrical.Connector.InputInterfacePin dSETVL annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={60,100})));
equation
  connect(bus0_PIN2INOUT.vr, bus0_vr) annotation (Line(points={{40,7.8},{-6,7.8},
          {-6,10},{-70,10},{-70,70},{-100,70}},   color={0,0,127}));
  connect(bus0_PIN2INOUT.vi, bus0_vi) annotation (Line(points={{39.8,0.2},{-6,0.2},
          {-6,0},{-80,0},{-80,30},{-100,30}},
                                        color={0,0,127}));
  connect(bus0_PIN2INOUT.ir, bus0_ir) annotation (Line(points={{60.2,4.4},{70,4.4},
          {70,70},{100,70}},        color={0,0,127}));
  connect(bus0_PIN2INOUT.ii, bus0_ii) annotation (Line(points={{60.2,-4},{80,-4},
          {80,30},{100,30}},   color={0,0,127}));

  connect(modelSet.bus0, bus0_PIN2INOUT.p) annotation (Line(points={{18,29.2},{30,
          29.2},{30,-8},{40,-8}},      color={0,0,0}));
  connect(modelSet.bus1, bus0_PIN2INOUT1.p) annotation (Line(points={{-18,29.2},
          {-40,29.2},{-40,-48},{40,-48}},
                                        color={0,0,0}));
  connect(bus0_PIN2INOUT1.ir, bus1_ir) annotation (Line(points={{60.2,-35.6},{80,
          -35.6},{80,-30},{100,-30}}, color={0,0,127}));
  connect(bus0_PIN2INOUT1.ii, bus1_ii) annotation (Line(points={{60.2,-44},{80,-44},
          {80,-70},{100,-70}}, color={0,0,127}));
  connect(bus0_PIN2INOUT1.vr, bus1_vr) annotation (Line(points={{40,-32.2},{0,-32.2},
          {0,-30},{-100,-30}}, color={0,0,127}));
  connect(bus0_PIN2INOUT1.vi, bus1_vi) annotation (Line(points={{39.8,-39.8},{0,
          -39.8},{0,-70},{-100,-70}}, color={0,0,127}));
  connect(dSETVL, modelSet.d_SETVL) annotation (Line(points={{60,100},{60,68},{-26,
          68},{-26,50.8},{-18,50.8}}, color={0,0,0}));
  connect(dVSCHED, modelSet.d_VSCHED)
    annotation (Line(points={{-60,100},{-60,36.4},{-18,36.4}}, color={0,0,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end CDC4T_OLD;
