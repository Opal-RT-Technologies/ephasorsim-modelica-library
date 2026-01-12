within OpalRT.ModelSets;
partial model GenUnitAll "Core GenUnit model"
  // === External connectors ===
  NonElectrical.Connector.InputInterfacePin TRIP annotation (Placement(
      visible=true,
      transformation(
        origin={80,46},
        extent={{-5,-5},{5,5}},
        rotation=-90),
      iconTransformation(
        origin={0,100},
        extent={{-10,-10},{10,10}},
        rotation=-90)));
  NonElectrical.Connector.PwPin bus0 annotation (Placement(
      visible=true,
      transformation(
        origin={106,-30},
        extent={{-5,-5},{5,5}},
        rotation=0),
      iconTransformation(
        origin={104,-70},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  input NonElectrical.Connector.InputInterfacePin dVREF annotation(Placement(
      visible = true,
      transformation(
        origin={-35,-7},
        extent={{-5,-5},{5,5}},
        rotation=0),
      iconTransformation(origin={-100,60},
      extent = {{-10, -10}, {10, 10}},
      rotation = 0)));
  input NonElectrical.Connector.InputInterfacePin dGREF annotation (Placement(
      visible=true,
      transformation(
        origin={-47,-29},
        extent={{-5,-5},{5,5}},
        rotation=0),
      iconTransformation(
        origin={-100,-60},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  input NonElectrical.Connector.InputInterfacePin vTrig annotation(Placement(
      visible = true,
      transformation(
        origin={-107,-65},
        extent={{-5,-5}, {5,5}},
        rotation = 0),
      iconTransformation(
        origin={-100,-90},
        extent = {{-10, -10}, {10, 10}},
        rotation = 360)));
  // === Replaceable core components ===
  replaceable Electrical.PartialModel.SynchronousGenerator synchronousGenerator
    annotation (Placement(transformation(extent={{62,-8},{98,28}})));
  replaceable Electrical.PartialModel.Exciter exciter
    annotation (Placement(transformation(extent={{-18,-8},{18,28}})));
  replaceable Electrical.PartialModel.TurbineGovernor turbineGovernor
    annotation (Placement(transformation(extent={{-18,-68},{18,-32}})));
  replaceable Electrical.PartialModel.Stabilizer stabilizer
    annotation (Placement(transformation(extent={{-118,-48},{-82,-12}})));
  replaceable Electrical.PartialModel.UnderExcitationLimiter uel
    annotation(Placement(transformation(extent={{10,62},{-26,98}})));
  replaceable Electrical.PartialModel.OverExcitationLimiter oel
    annotation(Placement(transformation(extent={{-62,114},{-98,78}})));
  // === Replaceable data records
  replaceable Data.Machines.MachineDynamicData machineData
    annotation (Placement(transformation(extent={{-154,86},{-146,94}})));
  replaceable Data.General.PlantGeneralData generalData
    annotation (Placement(transformation(extent={{-154,106},{-146,114}})));
  replaceable Data.Exciters.ExciterData exciterData
    annotation (Placement(transformation(extent={{-154,66},{-146,74}})));
  replaceable Data.Governors.GovernorData governorData
    annotation (Placement(transformation(extent={{-154,26},{-146,34}})));
  replaceable Data.Stabilizers.StabilizerData stabilizerData
    annotation (Placement(transformation(extent={{-154,46},{-146,54}})));
  replaceable Data.UELs.UELData uelData
    annotation (Placement(transformation(extent={{-154,6},{-146,14}})));
  replaceable Data.OELs.OELData oelData
    annotation (Placement(transformation(extent={{-154,-14},{-146,-6}})));
  // === Utility constants and add blocks
  Modelica.Blocks.Sources.Constant constVOTHSG(k=0)
    annotation (Placement(transformation(extent={{-122,30},{-114,38}})));
  Modelica.Blocks.Sources.Constant constVOEL(k=0)
    annotation (Placement(transformation(extent={{-108,42},{-100,50}})));
  Modelica.Blocks.Sources.Constant constVUEL(k=0)
    annotation (Placement(transformation(extent={{-94,54},{-86,62}})));
  Modelica.Blocks.Sources.Constant constant1(k=0)   annotation(Placement(
      visible = true,
      transformation(
        origin={-100,-80},
        extent = {{-5, -5}, {5, 5}}, rotation=0)));
  Modelica.Blocks.Math.Add add2 annotation (Placement(
      visible = true,
      transformation(
        origin={-79,-77},
        extent={{5,5},{-5,-5}},
        rotation=180)));
equation
  // Core plant I/O
  connect(TRIP, synchronousGenerator.TRIP)
    annotation (Line(points={{80,46},{80,28}}, color={115,170,0}));
  connect(synchronousGenerator.p, bus0)
    annotation (Line(points={{80,-8},{80,-30},{106,-30}}, color={255,0,0}));
  // Exciter <-> Synchronous machine
  connect(synchronousGenerator.EFD0, exciter.EFD0) annotation (Line(points={{61.64,
          10},{44,10},{44,-4.4},{18,-4.4}},
                                         color={244,109,67}));
  connect(exciter.EFD, synchronousGenerator.EFD) annotation (Line(points={{18,-0.8},
          {40,-0.8},{40,15.04},{62,15.04}}, color={244,109,67}));
  connect(synchronousGenerator.ETERM0, exciter.ETERM0) annotation (Line(points={{61.64,
          19},{36,19},{36,2.8},{18,2.8}},           color={244,109,67}));
  connect(synchronousGenerator.EX_AUX, exciter.EX_AUX) annotation (Line(points={{61.64,
          24.4},{32,24.4},{32,7.48},{18,7.48}}, color={244,109,67}));
  connect(synchronousGenerator.VI, exciter.VI) annotation (Line(points={{98,10},
          {112,10},{112,34},{28,34},{28,20.8},{18,20.8}}, color={50,136,189}));
  connect(synchronousGenerator.XADIFD, exciter.XADIFD) annotation (Line(points={{98,19},
          {106,19},{106,38},{-24,38},{-24,19},{-18,19}}, color={244,109,67}));
  connect(dVREF, exciter.dVREF) annotation (Line(points={{-35,-7},{-28,-7},{-28,
          -0.8},{-18,-0.8}},   color={115,170,0}));
  // Turbine/Governor <-> Synchronous machine
  connect(synchronousGenerator.PMECH0, turbineGovernor.PMECH0) annotation (Line(
        points={{62,-4.4},{62,-4},{54,-4},{54,-39.2},{18,-39.2}}, color={118,42,131}));
  connect(turbineGovernor.PMECH, synchronousGenerator.PMECH) annotation (Line(
        points={{18,-35.6},{50,-35.6},{50,-0.8},{62,-0.8}},color={118,42,131}));
  connect(synchronousGenerator.SLIP, turbineGovernor.SLIP) annotation (Line(
        points={{98,-4.4},{114,-4.4},{114,-74},{-24,-74},{-24,-64.4},{-18,-64.4}},
        color={118,42,131}));
  connect(synchronousGenerator.MBASE, turbineGovernor.MBASE) annotation (Line(
        points={{98,0.28},{118,0.28},{118,-78},{-28,-78},{-28,-57.2},{-18,-57.2}},
        color={118,42,131}));
  connect(synchronousGenerator.VI, turbineGovernor.VI) annotation (Line(points={{98,10},
          {122,10},{122,-82},{-32,-82},{-32,-50},{-18,-50}}, color={118,42,131}));
  connect(dGREF, turbineGovernor.dGREF) annotation (Line(points={{-47,-29},{-36,
          -29},{-36,-35.6},{-18,-35.6}}, color={115,170,0}));
  // Stabilizer <-> Synchronous machine, Exciter
  connect(synchronousGenerator.SLIP, stabilizer.PSS_AUX2[1]) annotation (Line(
        points={{98,-4.4},{114,-4.4},{114,-96},{-126,-96},{-126,-41.7},{-118,-41.7}},
        color={1,102,94}));
  connect(synchronousGenerator.AccPower, stabilizer.PSS_AUX2[2]) annotation (
      Line(points={{98,5.32},{126,5.32},{126,-100},{-130,-100},{-130,-39.9},{-118,
          -39.9}}, color={1,102,94}));
  connect(stabilizer.PSS_AUX, stabilizer.PSS_AUX2) annotation (Line(points={{-118,
          -30},{-134,-30},{-134,-40.8},{-118,-40.8}},color={197,27,125}));
  connect(synchronousGenerator.VI, stabilizer.VI) annotation (Line(points={{98,10},
          {132,10},{132,-110},{-140,-110},{-140,-26.4},{-118,-26.4}},    color=
          {1,102,94}));
  connect(stabilizer.VI2, stabilizer.VI) annotation (Line(points={{-118,-37.2},{
          -140,-37.2},{-140,-26.4},{-118,-26.4}},color={197,27,125}));
  connect(stabilizer.VOTHSG, exciter.VOTHSG) annotation (Line(points={{-82,-40.8},
          {-60,-40.8},{-60,3.52},{-18,3.52}},        color={0,0,127}));

  // UEL integration pattern
  connect(synchronousGenerator.VI, uel.VI) annotation (Line(points={{98,10},{132,
          10},{132,87.2},{9.64,87.2}}, color={0,0,127}));
  connect(uel.VUEL, exciter.VUEL) annotation (Line(points={{-26.72,80},{-40,80},
          {-40,13.6},{-18,13.6}}, color={0,255,0}));
  connect(uel.VF, exciter.VF) annotation (Line(points={{9.64,80},{24,80},{24,24.4},
          {18.72,24.4}}, color={0,255,0}));
  connect(uel.EX_AUX, synchronousGenerator.EX_AUX) annotation (Line(points={{9.64,
          94.4},{56,94.4},{56,24.4},{61.64,24.4}},
        color={0,0,127}));
  // OEL integration pattern
  connect(synchronousGenerator.XADIFD, oel.XADIFD) annotation (Line(points={{98,19},
          {106,19},{106,106.8},{-62.36,106.8}}, color={0,0,127}));
  connect(oel.VOEL, exciter.VOEL) annotation (Line(points={{-98.72,96},{-140,96},
          {-140,8.56},{-18,8.56}}, color={0,255,0}));
  connect(oel.EFD, synchronousGenerator.EFD) annotation (Line(points={{-62.36,85.2},
          {-52,85.2},{-52,-20},{40,-20},{40,15.04},{62,15.04}}, color={0,0,127}));
  // Other
  connect(add2.u2,constant1. y) annotation(Line(points={{-85,-80},{-94.5,-80}}, color = {0, 0, 127}));
  connect(add2.u1,vTrig)  annotation(Line(points={{-85,-74},{-92,-74},{-92,-65},{-107,-65}}, color = {0, 0, 127}));
  annotation (Icon(
                coordinateSystem(
                  extent = {{-100, -100}, {100, 100}},
                  preserveAspectRatio = true, initialScale = 0.1),
                  graphics={
                    Rectangle(
                      extent={{-100,100},{100,-100}},
                      lineColor={0,0,0},
                      lineThickness=0.5),
                    Text(
                      origin={75.0632,-73.7728},
                      extent = {{-11.7679, 11.8688}, {11.55, -6.64}},
                      textString = "PIN"),
                    Text(
                      origin={-7.68,79.6},
                      extent = {{-11.77, 11.87}, {29.09, -11.2}},
                      textString = "TRIP"),
                    Text(
                      origin={-45.52,52.9023},
                      extent = {{-39.43, 24.94}, {20.1741, -8.82}},
                      textString = "dVREF"),
                    Text(
                      origin={-45.52,-67.0977},
                      extent = {{-39.43, 24.94}, {20.1741, -8.82}},
                      textString = "dGREF"),
                    Text(
                      origin={-52.9236,-92.2523},
                      extent={{-33.0764,16.2523},{16.9236,-5.74769}},
                      textString="vTRIP",
                      lineColor={0,0,0}),
                    Text(
                      origin={-54,20},
                      extent={{-33.8482,13.7194},{142.152,-52.2806}},
                      textString="%class",
                      lineColor={{0,0,0}})}),
      Diagram(coordinateSystem(extent = {{-160, -120}, {160, 120}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
end GenUnitAll;
