within OpalRT.ModelSets.Data.Exciters.EXST1;
partial record DataEXST1
  extends OpalRT.ModelSets.Data.Exciters.ExciterData;
  parameter Real TR_ex annotation(Dialog(tab = "EXST1 Parameters"));
  parameter Real VIMAX_ex annotation(Dialog(tab = "EXST1 Parameters"));
  parameter Real VIMIN_ex annotation(Dialog(tab = "EXST1 Parameters"));
  parameter Real TC_ex annotation(Dialog(tab = "EXST1 Parameters"));
  parameter Real TB_ex annotation(Dialog(tab = "EXST1 Parameters"));
  parameter Real KA_ex annotation(Dialog(tab = "EXST1 Parameters"));
  parameter Real TA_ex annotation(Dialog(tab = "EXST1 Parameters"));
  parameter Real VRMAX_ex annotation(Dialog(tab = "EXST1 Parameters"));
  parameter Real VRMIN_ex annotation(Dialog(tab = "EXST1 Parameters"));
  parameter Real KC_ex annotation(Dialog(tab = "EXST1 Parameters"));
  parameter Real KF_ex annotation(Dialog(tab = "EXST1 Parameters"));
  parameter Real TF_ex annotation(Dialog(tab = "EXST1 Parameters"));
end DataEXST1;
