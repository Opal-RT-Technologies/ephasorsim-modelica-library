within OpalRT.ModelSets.Data.Exciters.EXST2;
partial record DataEXST2
  extends OpalRT.ModelSets.Data.Exciters.ExciterData;
  parameter Real TR_ex "(sec)" annotation(Dialog(tab = "EXST2 Parameters"));
  parameter Real KA_ex annotation(Dialog(tab = "EXST2 Parameters"));
  parameter Real TA_ex "(sec)" annotation(Dialog(tab = "EXST2 Parameters"));
  parameter Real VRMAX_ex "or zero" annotation(Dialog(tab = "EXST2 Parameters"));
  parameter Real VRMIN_ex annotation(Dialog(tab = "EXST2 Parameters"));
  parameter Real KE_ex annotation(Dialog(tab = "EXST2 Parameters"));
  parameter Real TE_ex "(sec)" annotation(Dialog(tab = "EXST2 Parameters"));
  parameter Real KF_ex annotation(Dialog(tab = "EXST2 Parameters"));
  parameter Real TF_ex "(sec)" annotation(Dialog(tab = "EXST2 Parameters"));
  parameter Real KP_ex annotation(Dialog(tab = "EXST2 Parameters"));
  parameter Real KI_ex "or zero" annotation(Dialog(tab = "EXST2 Parameters"));
  parameter Real KC_ex annotation(Dialog(tab = "EXST2 Parameters"));
  parameter Real EFDMAX_ex annotation(Dialog(tab = "EXST2 Parameters"));
end DataEXST2;
