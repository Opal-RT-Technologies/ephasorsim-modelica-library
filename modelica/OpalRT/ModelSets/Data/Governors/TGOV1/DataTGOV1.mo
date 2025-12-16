within OpalRT.ModelSets.Data.Governors.TGOV1;
partial record DataTGOV1
  extends OpalRT.ModelSets.Data.Governors.GovernorData;
  parameter Real R_tg annotation(Dialog(tab = "TGOV1 Parameters"));
  parameter Real T1_tg "(>0) (sec)" annotation(Dialog(tab = "TGOV1 Parameters"));
  parameter Real VMAX_tg annotation(Dialog(tab = "TGOV1 Parameters"));
  parameter Real VMIN_tg annotation(Dialog(tab = "TGOV1 Parameters"));
  parameter Real T2_tg annotation(Dialog(tab = "TGOV1 Parameters"));
  parameter Real T3_tg "(>0) (sec)" annotation(Dialog(tab = "TGOV1 Parameters"));
  parameter Real Dt_tg annotation(Dialog(tab = "TGOV1 Parameters"));
end DataTGOV1;
