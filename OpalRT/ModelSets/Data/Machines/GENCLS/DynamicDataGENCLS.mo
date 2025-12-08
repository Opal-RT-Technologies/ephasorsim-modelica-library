within OpalRT.ModelSets.Data.Machines.GENCLS;
partial record DynamicDataGENCLS
  extends OpalRT.ModelSets.Data.Machines.MachineDynamicData;
  parameter Real ZSOURCE_RE "Machine source impedance" annotation(Dialog(tab = "GENCLS Parameters"));
  parameter Real ZSOURCE_IM "Machine source impedance" annotation(Dialog(tab = "GENCLS Parameters"));
  parameter Real H "Inertia constant" annotation(Dialog(tab = "GENCLS Parameters"));
  parameter Real D "Speed damping" annotation(Dialog(tab = "GENCLS Parameters"));
end DynamicDataGENCLS;
