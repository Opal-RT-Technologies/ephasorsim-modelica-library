within OpalRT.ModelSets.Data.Governors.IEESGO;
partial record DataIEESGO
  extends OpalRT.ModelSets.Data.Governors.GovernorData;
  parameter Real T1_tg "Controller Lag" annotation(Dialog(tab = "IEESGO Parameters"));
  parameter Real T2_tg "Controller Lead Compensation" annotation(Dialog(tab = "IEESGO Parameters"));
  parameter Real T3_tg "Governor Lag (> 0)" annotation(Dialog(tab = "IEESGO Parameters"));
  parameter Real T4_tg "Delay Due To Steam Inlet Volumes" annotation(Dialog(tab = "IEESGO Parameters"));
  parameter Real T5_tg "Reheater Delay" annotation(Dialog(tab = "IEESGO Parameters"));
  parameter Real T6_tg "Turbine pipe hood Delay" annotation(Dialog(tab = "IEESGO Parameters"));
  parameter Real K1_tg "1/Per Unit Regulation" annotation(Dialog(tab = "IEESGO Parameters"));
  parameter Real K2_tg "Fraction" annotation(Dialog(tab = "IEESGO Parameters"));
  parameter Real K3_tg "Fraction" annotation(Dialog(tab = "IEESGO Parameters"));
  parameter Real PMAX_tg "Upper Power Limit" annotation(Dialog(tab = "IEESGO Parameters"));
  parameter Real PMIN_tg "Lower Power Limit" annotation(Dialog(tab = "IEESGO Parameters"));
end DataIEESGO;
