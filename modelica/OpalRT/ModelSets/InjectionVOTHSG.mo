within OpalRT.ModelSets;
partial model InjectionVOTHSG "Core Injection model"
  extends InjectionCore;

  // === External connectors ===
  input NonElectrical.Connector.InputInterfacePin VOTHSG annotation (Placement(
      visible=true,
      transformation(
        origin={-47,-29},
        extent={{-5,-5},{5,5}},
        rotation=0),
      iconTransformation(
        origin={-100,-60},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  annotation (Icon(
                graphics={
                  Text(
                    origin={-45.52,-67.0977},
                    extent = {{-39.43, 24.94}, {20.1741, -8.82}},
                    textString="VOTHSG",
                    lineColor={0,0,0})}));
end InjectionVOTHSG;
