within OpalRT.ModelSets.Data.Exciters.SEXS;
partial record DataSEXS
  extends OpalRT.ModelSets.Data.Exciters.ExciterData;
  parameter Real TA_TB_ex "TA/TB" annotation(Dialog(tab = "SEXS Parameters"));
  parameter Real TB_ex "(>0) (sec)" annotation(Dialog(tab = "SEXS Parameters"));
  parameter Real K_ex annotation(Dialog(tab = "SEXS Parameters"));
  parameter Real TE_ex "(sec)" annotation(Dialog(tab = "SEXS Parameters"));
  parameter Real EMIN_ex "(pu on EFD base)" annotation(Dialog(tab = "SEXS Parameters"));
  parameter Real EMAX_ex "(pu on EFD base)" annotation(Dialog(tab = "SEXS Parameters"));
end DataSEXS;
