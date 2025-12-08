within OpalRT.ModelSets.Data.UELs.UEL1;
partial record DataUEL1
  extends OpalRT.ModelSets.Data.UELs.UELData;

  parameter Real KUR "UEL radius setting (pu)" annotation(Dialog(tab="UEL1 Parameters"));
  parameter Real KUC "(pu) UEL center setting (pu)" annotation(Dialog(tab="UEL1 Parameters"));
  parameter Real KUF "(pu) UEL exciter stabilizer gain" annotation(Dialog(tab="UEL1 Parameters"));
  parameter Real VURMAX "UEL max limit for radius phasor magnitude (pu)" annotation(Dialog(tab="UEL1 Parameters"));
  parameter Real VUCMAX "UEL max limit for operating point phasor magnitude (pu)" annotation(Dialog(tab="UEL1 Parameters"));
  parameter Real KUI "UEL integral gain (pu)" annotation(Dialog(tab="UEL1 Parameters"));
  parameter Real KUL "UEL proportional gain (pu)" annotation(Dialog(tab="UEL1 Parameters"));
  parameter Real VUIMAX "UEL integrator output maximum (pu)" annotation(Dialog(tab="UEL1 Parameters"));
  parameter Real VUIMIN "UEL integrator output minimum (pu)" annotation(Dialog(tab="UEL1 Parameters"));
  parameter Real TU1 "UEL lead time constant (s)" annotation(Dialog(tab="UEL1 Parameters"));
  parameter Real TU2 "UEL lag time constant (s)" annotation(Dialog(tab="UEL1 Parameters"));
  parameter Real TU3 "UEL lead time constant (s)" annotation(Dialog(tab="UEL1 Parameters"));
  parameter Real TU4 "UEL lag time constant (s)" annotation(Dialog(tab="UEL1 Parameters"));
  parameter Real VULMAX "UEL output maximum limit (pu)" annotation(Dialog(tab="UEL1 Parameters"));
  parameter Real VULMIN "UEL output minimum limit (pu)" annotation(Dialog(tab="UEL1 Parameters"));
end DataUEL1;
