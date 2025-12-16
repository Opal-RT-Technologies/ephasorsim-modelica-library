within OpalRT.ModelSets;
partial model GenUnitExc "GenUnit model with Excitation System model"
  extends GenUnitCore;
  // === External connectors ===
  input NonElectrical.Connector.InputInterfacePin dVREF annotation(Placement(
      visible = true,
      transformation(
        origin={-35,-7},
        extent={{-5,-5},{5,5}},
        rotation=0),
      iconTransformation(origin={-100,60},
      extent = {{-10, -10}, {10, 10}},
      rotation = 0)));
  // === Replaceable core components ===
  replaceable Electrical.PartialModel.Exciter exciter
    annotation (Placement(transformation(extent={{-18,-8},{18,28}})));
equation
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
    annotation (Placement(transformation(extent={{-154,66},{-146,74}})),
              Icon(
                graphics={
                  Text(
                    origin={-45.52,52.9023},
                    extent = {{-39.43, 24.94}, {20.1741, -8.82}},
                    textString = "dVREF")}));
end GenUnitExc;
