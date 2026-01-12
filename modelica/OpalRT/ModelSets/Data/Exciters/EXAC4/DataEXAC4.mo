within OpalRT.ModelSets.Data.Exciters.EXAC4;
partial record DataEXAC4
  extends OpalRT.ModelSets.Data.Exciters.ExciterData;
  parameter Real TR_ex annotation(Dialog(tab = "EXAC4 Parameters"));
  parameter Real VIMAX_ex annotation(Dialog(tab = "EXAC4 Parameters"));
  parameter Real VIMIN_ex annotation(Dialog(tab = "EXAC4 Parameters"));
  parameter Real TC_ex annotation(Dialog(tab = "EXAC4 Parameters"));
  parameter Real TB_ex "sec" annotation(Dialog(tab = "EXAC4 Parameters"));
  parameter Real KA_ex annotation(Dialog(tab = "EXAC4 Parameters"));
  parameter Real TA_ex annotation(Dialog(tab = "EXAC4 Parameters"));
  parameter Real VRMAX_ex annotation(Dialog(tab = "EXAC4 Parameters"));
  parameter Real VRMIN_ex annotation(Dialog(tab = "EXAC4 Parameters"));
  parameter Real KC_ex annotation(Dialog(tab = "EXAC4 Parameters"));
end DataEXAC4;
