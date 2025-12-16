within OpalRT.Electrical.Control.Excitation.Common;
function compoundedTransformerFunctionXY
  input Real Vre;
  input Real Vimg;
  input Real Ire;
  input Real Iimg;
  input Real XL;
  input Real KPmag;
  input Real KPang;
  input Real KI;
  output Real VE;
protected
  Real KPang_rad;
  Real VE_r;
  Real VE_i;
algorithm
  KPang_rad := KPang / 180 * Modelica.Constants.pi;
  VE_r := KPmag * (Vre * cos(KPang_rad) - Vimg * sin(KPang_rad)) - XL * KPmag * (Ire * sin(KPang_rad) + Iimg * cos(KPang_rad)) - KI * Iimg;
  VE_i := KPmag * (Vre * sin(KPang_rad) + Vimg * cos(KPang_rad)) + XL * KPmag * (Ire * cos(KPang_rad) - Iimg * sin(KPang_rad)) + KI * Ire;
  VE := (VE_r ^ 2 + VE_i ^ 2) ^ 0.5;
end compoundedTransformerFunctionXY;
