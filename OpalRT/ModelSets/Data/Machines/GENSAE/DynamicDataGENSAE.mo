within OpalRT.ModelSets.Data.Machines.GENSAE;
partial record DynamicDataGENSAE
  extends OpalRT.ModelSets.Data.Machines.MachineDynamicData;
  parameter Real ZSOURCE_RE "Machine source impedence" annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real Tdo_p "d-axis transient time constant" annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real Tdo_s "d-axis sub-transient time constant, s" annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real Tqo_s "d-axis sub-transient time constant, s" annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real H "Inertia constant" annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real D "Speed damping" annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real Xd "d-axis reactance, p.u." annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real Xq "q-axis reactance, p.u." annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real Xd_p "d-axis transient reactance, p.u." annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real Xd_s "d-axis sub-transient reactance, p.u." annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real Xl "Reactance due to the leakage flux which does not cross the air gap, p.u." annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real S1 "saturation function value for 1 p.u. input" annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real S12 "saturation function value for 1.2 p.u. input" annotation(Dialog(tab = "GENSAL Parameters"));
end DynamicDataGENSAE;
