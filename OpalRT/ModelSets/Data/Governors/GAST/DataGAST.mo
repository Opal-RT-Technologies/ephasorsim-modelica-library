within OpalRT.ModelSets.Data.Governors.GAST;
partial record DataGAST
  extends OpalRT.ModelSets.Data.Governors.GovernorData;
  parameter Real R_tg "Speed droop" annotation(Dialog(tab = "GAST Parameters"));
  parameter Real T1_tg "(>0) (sec)" annotation(Dialog(tab = "GAST Parameters"));
  parameter Real T2_tg "(>0) (sec)" annotation(Dialog(tab = "GAST Parameters"));
  parameter Real T3_tg "(>0) (sec)" annotation(Dialog(tab = "GAST Parameters"));
  parameter Real AT_tg "Ambient temperature load limit" annotation(Dialog(tab = "GAST Parameters"));
  parameter Real KT_tg annotation(Dialog(tab = "GAST Parameters"));
  parameter Real VMAX_tg annotation(Dialog(tab = "GAST Parameters"));
  parameter Real VMIN_tg annotation(Dialog(tab = "GAST Parameters"));
  parameter Real DTURB_tg annotation(Dialog(tab = "GAST Parameters"));
end DataGAST;
