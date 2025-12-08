within OpalRT.ModelSets;
partial model InjectionPRef "Core Injection model with dPref input"
  extends InjectionCore;
  // === External connectors ===
  input NonElectrical.Connector.InputInterfacePin dPref annotation(Placement(visible = true, transformation(origin={-100,0}, extent={{-6,-6},{6,6}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
end InjectionPRef;
