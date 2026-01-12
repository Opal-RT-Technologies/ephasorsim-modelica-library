within OpalRT.ModelSets.Data.Governors.DEGOV1;
partial record DataDEGOV1
  extends OpalRT.ModelSets.Data.Governors.GovernorData;
  parameter Real M_tg "Feedback signal flag. 0: Throttle feedback, 1: Electrical power feedback" annotation(Dialog(tab = "DEGOV1"));
  parameter Real T1_tg "(sec)" annotation(Dialog(tab = "DEGOV1"));
  parameter Real T2_tg "(sec)" annotation(Dialog(tab = "DEGOV1"));
  parameter Real T3_tg "(sec)" annotation(Dialog(tab = "DEGOV1"));
  parameter Real K_tg annotation(Dialog(tab = "DEGOV1"));
  parameter Real T4_tg "(sec)" annotation(Dialog(tab = "DEGOV1"));
  parameter Real T5_tg "(sec)" annotation(Dialog(tab = "DEGOV1"));
  parameter Real T6_tg "(sec)" annotation(Dialog(tab = "DEGOV1"));
  parameter Real TD_tg "(0<= TD <= 12*DELT)(sec)" annotation(Dialog(tab = "DEGOV1"));
  parameter Real TMAX_tg annotation(Dialog(tab = "DEGOV1"));
  parameter Real TMIN_tg annotation(Dialog(tab = "DEGOV1"));
  parameter Real DROOP_tg annotation(Dialog(tab = "DEGOV1"));
  parameter Real TE_tg annotation(Dialog(tab = "DEGOV1"));
end DataDEGOV1;
