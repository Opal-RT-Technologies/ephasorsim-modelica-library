within OpalRT.ModelSets;
partial model GenUnitExcGov
  "Core GenUnit model with Excitation System and Turbine Governor models"
  extends GenUnitExc;
  // === External connectors ===
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
  // === Replaceable core components ===
  replaceable Electrical.PartialModel.TurbineGovernor turbineGovernor
    annotation (Placement(transformation(extent={{-18,-68},{18,-32}})));
equation
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
  annotation (Icon(
                graphics={
                  Text(
                    origin={-45.52,-67.0977},
                    extent = {{-39.43, 24.94}, {20.1741, -8.82}},
                    textString = "dGREF")}));
end GenUnitExcGov;
