within OpalRT.ModelSets;
partial model InjectionVOTHSGVRef
  extends InjectionVOTHSG;
  input NonElectrical.Connector.InputInterfacePin dVREF annotation(Placement(
      visible = true,
      transformation(
        origin={-35,-7},
        extent={{-5,-5},{5,5}},
        rotation=0),
      iconTransformation(origin={-100,60},
      extent = {{-10, -10}, {10, 10}},
      rotation = 0)));
  annotation (Icon(graphics={
                  Text(
                    origin={-45.52,52.9023},
                    extent = {{-39.43, 24.94}, {20.1741, -8.82}},
                    textString = "dVREF")}));
end InjectionVOTHSGVRef;
