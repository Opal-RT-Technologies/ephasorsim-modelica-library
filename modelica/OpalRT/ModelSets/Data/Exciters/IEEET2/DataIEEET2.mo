within OpalRT.ModelSets.Data.Exciters.IEEET2;
partial record DataIEEET2
  extends OpalRT.ModelSets.Data.Exciters.ExciterData;
  parameter Real TR_ex "Regulator input filter time constant (sec)" annotation(Dialog(tab = "IEEET1 Parameters"));
  parameter Real KA_ex "Voltage regulator gain" annotation(Dialog(tab = "IEEET1 Parameters"));
  parameter Real TA_ex "Regulator time constant (sec)" annotation(Dialog(tab = "IEEET1 Parameters"));
  parameter Real VRMAX_ex "Maximum voltage regulator output" annotation(Dialog(tab = "IEEET1 Parameters"));
  parameter Real VRMIN_ex "Minimum voltage regulator output" annotation(Dialog(tab = "IEEET1 Parameters"));
  parameter Real KE_ex "Exciter constant related to self-excited field" annotation(Dialog(tab = "IEEET1 Parameters"));
  parameter Real TE_ex "Exciter time constant (sec)" annotation(Dialog(tab = "IEEET1 Parameters"));
  parameter Real KF_ex "Excitation control system stabilizer gain" annotation(Dialog(tab = "IEEET1 Parameters"));
  parameter Real TF1_ex "Excitation control system stabilizer time constant 1 (sec)" annotation(Dialog(tab = "IEEET1 Parameters"));
  parameter Real TF2_ex "Excitation control system stabilizer time constant 1 (sec)" annotation(Dialog(tab = "IEEET1 Parameters"));
  parameter Real E1_ex "Exciter saturation factor at the corresponding Vex" annotation(Dialog(tab = "IEEET1 Parameters"));
  parameter Real SE_E1_ex "Exciter voltage for the exciter saturation function" annotation(Dialog(tab = "IEEET1 Parameters"));
  parameter Real E2_ex "Exciter saturation factor at the corresponding Vex" annotation(Dialog(tab = "IEEET1 Parameters"));
  parameter Real SE_E2_ex "Exciter voltage for the exciter saturation function" annotation(Dialog(tab = "IEEET1 Parameters"));
end DataIEEET2;
