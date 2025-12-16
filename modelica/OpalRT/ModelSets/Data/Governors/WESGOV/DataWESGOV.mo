within OpalRT.ModelSets.Data.Governors.WESGOV;
partial record DataWESGOV
  extends OpalRT.ModelSets.Data.Governors.GovernorData;
  parameter Real delTC_tg "(sec), delta_t sample for controls" annotation(Dialog(tab = "WESGOV Parameters"));
  parameter Real delTP_tg "(sec), delta_t sample for PE" annotation(Dialog(tab = "WESGOV Parameters"));
  parameter Real Droop_tg "Droop" annotation(Dialog(tab = "WESGOV Parameters"));
  parameter Real Kp_tg annotation(Dialog(tab = "WESGOV Parameters"));
  parameter Real TI_tg "(>0)(sec)" annotation(Dialog(tab = "WESGOV Parameters"));
  parameter Real T1_tg "(sec)" annotation(Dialog(tab = "WESGOV Parameters"));
  parameter Real T2_tg "(sec)" annotation(Dialog(tab = "WESGOV Parameters"));
  parameter Real ALIM_tg annotation(Dialog(tab = "WESGOV Parameters"));
  parameter Real Tpe_tg "(sec)" annotation(Dialog(tab = "WESGOV Parameters"));
  parameter Real DELTA_tg "(sec)" annotation(Dialog(tab = "WESGOV Parameters"));
end DataWESGOV;
