within OpalRT.ModelSets.Data.UELs.UEL2;
partial record DataUEL2
  extends OpalRT.ModelSets.Data.UELs.UELData;

  parameter Real TUV "(s) voltage filter time constant" annotation(Dialog(tab="UEL2 Parameters"));
  parameter Real TUP "(s) real power filter time constant" annotation(Dialog(tab="UEL2 Parameters"));
  parameter Real TUQ "(s) reactive power filter time constant" annotation(Dialog(tab="UEL2 Parameters"));
  parameter Real KUI "(pu) UEL integral gain" annotation(Dialog(tab="UEL2 Parameters"));
  parameter Real KUL "(pu) UEL proportional gain" annotation(Dialog(tab="UEL2 Parameters"));
  parameter Real VUIMAX "(pu) UEL integrator output maximum limit" annotation(Dialog(tab="UEL2 Parameters"));
  parameter Real VUIMIN "(pu) UEL integrator output minimum limit" annotation(Dialog(tab="UEL2 Parameters"));
  parameter Real KUF "(pu) UEL exciter stabilizer gain" annotation(Dialog(tab="UEL2 Parameters"));
  parameter Real KFB "(pu)" annotation(Dialog(tab="UEL2 Parameters"));
  parameter Real TUL "(s)" annotation(Dialog(tab="UEL2 Parameters"));
  parameter Real TU1 "UEL lead time constant (s)" annotation(Dialog(tab="UEL2 Parameters"));
  parameter Real TU2 "UEL lag time constant (s)" annotation(Dialog(tab="UEL2 Parameters"));
  parameter Real TU3 "UEL lead time constant (s)" annotation(Dialog(tab="UEL2 Parameters"));
  parameter Real TU4 "UEL lag time constant (s)" annotation(Dialog(tab="UEL2 Parameters"));

  // PQ boundary curve (P0..P10, Q0..Q10) on generator MVA base
  parameter Real P0;
  parameter Real Q0;
  parameter Real P1;
  parameter Real Q1;
  parameter Real P2;
  parameter Real Q2;
  parameter Real P3;
  parameter Real Q3;
  parameter Real P4;
  parameter Real Q4;
  parameter Real P5;
  parameter Real Q5;
  parameter Real P6;
  parameter Real Q6;
  parameter Real P7;
  parameter Real Q7;
  parameter Real P8;
  parameter Real Q8;
  parameter Real P9;
  parameter Real Q9;
  parameter Real P10;
  parameter Real Q10;

  parameter Real VULMAX "(pu) UEL output maximum limit" annotation(Dialog(tab="UEL2 Parameters"));
  parameter Real VULMIN "(pu) UEL output minimum limit" annotation(Dialog(tab="UEL2 Parameters"));
  parameter Real M0 "k1 exponent in function F1" annotation(Dialog(tab="UEL2 Parameters"));
  parameter Real M1 "k2 exponent in function F2" annotation(Dialog(tab="UEL2 Parameters"));
  parameter Real M2 "0: mirror image around MVAR axis; 1: linear extrapolation" annotation(Dialog(tab="UEL2 Parameters"));
end DataUEL2;
