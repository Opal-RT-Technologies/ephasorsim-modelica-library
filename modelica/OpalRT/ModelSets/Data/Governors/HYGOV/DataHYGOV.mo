within OpalRT.ModelSets.Data.Governors.HYGOV;
partial record DataHYGOV
  extends OpalRT.ModelSets.Data.Governors.GovernorData;
  parameter Real R_tg "Permanent Droop" annotation(Dialog(tab = "HYGOV Parameters"));
  parameter Real r_tg "Temporary Droop" annotation(Dialog(tab = "HYGOV Parameters"));
  parameter Real Tr_tg "(>0) Governor time constant" annotation(Dialog(tab = "HYGOV Parameters"));
  parameter Real Tf_tg "(>0) Filter time constant" annotation(Dialog(tab = "HYGOV Parameters"));
  parameter Real Tg_tg "(>0) Servo time constant" annotation(Dialog(tab = "HYGOV Parameters"));
  parameter Real VELM_tg "Gate velocity limit" annotation(Dialog(tab = "HYGOV Parameters"));
  parameter Real GMAX_tg "Maximum gate limit" annotation(Dialog(tab = "HYGOV Parameters"));
  parameter Real GMIN_tg "Minimum gate limit" annotation(Dialog(tab = "HYGOV Parameters"));
  parameter Real TW_tg "(>0) Water time constant" annotation(Dialog(tab = "HYGOV Parameters"));
  parameter Real At_tg "Trubine gain" annotation(Dialog(tab = "HYGOV Parameters"));
  parameter Real Dturb_tg "Turbine damping" annotation(Dialog(tab = "HYGOV Parameters"));
  parameter Real qNL_tg "No power flow" annotation(Dialog(tab = "HYGOV Parameters"));
end DataHYGOV;
