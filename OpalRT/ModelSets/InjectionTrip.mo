within OpalRT.ModelSets;
partial model InjectionTrip "Core Injection model with Trip Input"
  extends InjectionCore;
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
  annotation (Icon(
                graphics={
                  Text(
                    origin={-7.68,79.6},
                    extent = {{-11.77, 11.87}, {29.09, -11.2}},
                    textString = "TRIP")}));
end InjectionTrip;
