within OpalRT.ModelSets.Data.Governors.IEEEG2;
partial record DataIEEEG2
  extends OpalRT.ModelSets.Data.Governors.GovernorData;
  parameter String ID "Machine Identifier" annotation(Dialog(tab = "IEEEG2"));
  parameter Real K_tg "K" annotation(Dialog(tab = "IEEEG2"));
  parameter Real T1_tg "T1" annotation(Dialog(tab = "IEEEG2"));
  parameter Real T2_tg "T2" annotation(Dialog(tab = "IEEEG2"));
  parameter Real T3_tg "T3(>0)" annotation(Dialog(tab = "IEEEG2"));
  parameter Real PMAX_tg "PMAX (pu on machine MVA rating)" annotation(Dialog(tab = "IEEEG2"));
  parameter Real PMIN_tg "PMIN (pu on machine MVA rating)" annotation(Dialog(tab = "IEEEG2"));
  parameter Real T4_tg "T3(>0)" annotation(Dialog(tab = "IEEEG2"));
end DataIEEEG2;
