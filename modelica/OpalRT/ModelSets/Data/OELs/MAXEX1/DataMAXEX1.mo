within OpalRT.ModelSets.Data.OELs.MAXEX1;
partial record DataMAXEX1
  extends OpalRT.ModelSets.Data.OELs.OELData;

  parameter Real EFDRATED "Rated field voltage (pu)" annotation(Dialog(tab="MAXEX1 Parameters"));
  parameter Real EFD1 "Threshold EFD #1 (pu)" annotation(Dialog(tab="MAXEX1 Parameters"));
  parameter Real TIME1 "Timer at EFD1 (s)" annotation(Dialog(tab="MAXEX1 Parameters"));
  parameter Real EFD2 "Threshold EFD #2 (pu)" annotation(Dialog(tab="MAXEX1 Parameters"));
  parameter Real TIME2 "Timer at EFD2 (s)" annotation(Dialog(tab="MAXEX1 Parameters"));
  parameter Real EFD3 "Threshold EFD #3 (pu)" annotation(Dialog(tab="MAXEX1 Parameters"));
  parameter Real TIME3 "Timer at EFD3 (s)" annotation(Dialog(tab="MAXEX1 Parameters"));
  parameter Real EFDDES "Desired EFD limit (pu)" annotation(Dialog(tab="MAXEX1 Parameters"));
  parameter Real KMX "Limiter gain (pu)" annotation(Dialog(tab="MAXEX1 Parameters"));
  parameter Real VLOW "Low voltage clamp (pu)" annotation(Dialog(tab="MAXEX1 Parameters"));
end DataMAXEX1;
