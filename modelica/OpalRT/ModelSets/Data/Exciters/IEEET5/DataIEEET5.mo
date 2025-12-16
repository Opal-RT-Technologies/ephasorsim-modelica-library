within OpalRT.ModelSets.Data.Exciters.IEEET5;
partial record DataIEEET5
  extends OpalRT.ModelSets.Data.Exciters.ExciterData;
  parameter Real TRH_ex "(sec)" annotation(Dialog(tab = "IEEET5"));
  parameter Real KV_ex annotation(Dialog(tab = "IEEET5"));
  parameter Real VRMAX_ex "or zero" annotation(Dialog(tab = "IEEET5"));
  parameter Real VRMIN_ex annotation(Dialog(tab = "IEEET5"));
  parameter Real KE_ex "or zero" annotation(Dialog(tab = "IEEET5"));
  parameter Real TE_ex "(>0) (sec)" annotation(Dialog(tab = "IEEET5"));
  parameter Real E1_ex annotation(Dialog(tab = "IEEET5"));
  parameter Real SE_E1_ex annotation(Dialog(tab = "IEEET5"));
  parameter Real E2_ex annotation(Dialog(tab = "IEEET5"));
  parameter Real SE_E2_ex annotation(Dialog(tab = "IEEET5"));
end DataIEEET5;
