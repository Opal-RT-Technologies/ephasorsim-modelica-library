within OpalRT.ModelSets.Data.Exciters.IEEET3;
partial record DataIEEET3
  extends OpalRT.ModelSets.Data.Exciters.ExciterData;
  parameter Real TR_ex "(sec) regulator input filter time constant" annotation(Dialog(tab = "IEEET3 Parameters"));
  parameter Real KA_ex "(pu) voltage regulator gain" annotation(Dialog(tab = "IEEET3 Parameters"));
  parameter Real TA_ex "(sec) regulator time constant" annotation(Dialog(tab = "IEEET3 Parameters"));
  parameter Real VRMAX_ex "(pu) Voltage regulator output maximum limit" annotation(Dialog(tab = "IEEET3 Parameters"));
  parameter Real VRMIN_ex "(pu) Voltage regulator output minimum limit" annotation(Dialog(tab = "IEEET3 Parameters"));
  parameter Real TE_ex "Exciter time constant, integration rate associated with exciter control (>0) (sec)" annotation(Dialog(tab = "IEEET3 Parameters"));
  parameter Real KF_ex "Excitation control system stabilizer gains" annotation(Dialog(tab = "IEEET3 Parameters"));
  parameter Real TF_ex "Excitation control system stabilizer time constant (sec)" annotation(Dialog(tab = "IEEET3 Parameters"));
  parameter Real KP_ex "Potential circuit gain coefficient" annotation(Dialog(tab = "IEEET3 Parameters"));
  parameter Real KI_ex "Potential circuit gain coefficient" annotation(Dialog(tab = "IEEET3 Parameters"));
  parameter Real VBMAX_ex "(pu) regulator output maximum limit" annotation(Dialog(tab = "IEEET3 Parameters"));
  parameter Real KE_ex "Exciter constant related to self-excited field" annotation(Dialog(tab = "IEEET3 Parameters"));
end DataIEEET3;
