within OpalRT.ModelSets.Data.Exciters.SCRX;
partial record DataSCRX
  extends OpalRT.ModelSets.Data.Exciters.ExciterData;
  parameter Real TA_TB_ex "TA/TB" annotation(Dialog(tab = "SCRX Parameters"));
  parameter Real TB_ex "(>0) (sec)" annotation(Dialog(tab = "SCRX Parameters"));
  parameter Real K_ex annotation(Dialog(tab = "SCRX Parameters"));
  parameter Real TE_ex "(sec)" annotation(Dialog(tab = "SCRX Parameters"));
  parameter Real EMIN_ex "(pu on EFD base)" annotation(Dialog(tab = "SCRX Parameters"));
  parameter Real EMAX_ex "(pu on EFD base)" annotation(Dialog(tab = "SCRX Parameters"));
  parameter Real CSWITCH_ex "0 for bus fed, 1 for solid fed" annotation(Dialog(tab = "SCRX Parameters"));
  parameter Real rc_rfd_ex "rc/rfd, 0 with negative field current capability (EX=EFD)" annotation(Dialog(tab = "SCRX Parameters"));
end DataSCRX;
