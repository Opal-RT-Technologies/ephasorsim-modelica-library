within OpalRT.ModelSets.Data.Governors.IEEEG3;
partial record DataIEEEG3
  extends OpalRT.ModelSets.Data.Governors.GovernorData;
  parameter Real TG_tg "?(>0) (sec), gate servomotor time constant";
  parameter Real TP_tg "(sec)";
  parameter Real Uo_tg "(pu/sec)";
  parameter Real Uc_tg "(<0)(pu/sec)";
  parameter Real PMAX_tg "(pu on machine MVA rating)";
  parameter Real PMIN_tg "(pu on machine MVA rating)";
  parameter Real Sigma_tg "permanent speed droop coefficient";
  parameter Real Delta_tg "transient speed droop coefficient";
  parameter Real TR_tg "";
  parameter Real TW_tg "";
  parameter Real a11_tg "(sec)";
  parameter Real a13_tg "";
  parameter Real a21_tg "";
  parameter Real a23_tg "(sec)";
end DataIEEEG3;
