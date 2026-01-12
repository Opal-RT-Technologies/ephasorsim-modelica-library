within OpalRT.ModelSets.Data.Exciters.URST5T;
partial record DataURST5T
  extends OpalRT.ModelSets.Data.Exciters.ExciterData;
  parameter Real Tr_ex "(sec)" annotation(Dialog(tab = "URST5T Parameters"));
  parameter Real TC1_ex "(sec)" annotation(Dialog(tab = "URST5T Parameters"));
  parameter Real TB1_ex "(sec)" annotation(Dialog(tab = "URST5T Parameters"));
  parameter Real TC2_ex "(sec)" annotation(Dialog(tab = "URST5T Parameters"));
  parameter Real TB2_ex "(sec)" annotation(Dialog(tab = "URST5T Parameters"));
  parameter Real KR_ex annotation(Dialog(tab = "URST5T Parameters"));
  parameter Real VRMAX_ex annotation(Dialog(tab = "URST5T Parameters"));
  parameter Real VRMIN_ex annotation(Dialog(tab = "URST5T Parameters"));
  parameter Real T1_ex "(sec)" annotation(Dialog(tab = "URST5T Parameters"));
  parameter Real KC_ex annotation(Dialog(tab = "URST5T Parameters"));
end DataURST5T;
