within OpalRT.Electrical.Control.Excitation.Common;
function compoundedTransformerFunction
  input Real Vmag;
  input Real Vang;
  input Real Imag;
  input Real Iang;
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
  VE_r := KPmag * Vmag * (cos(KPang_rad) * cos(Vang) - sin(KPang_rad) * sin(Vang)) - XL * KPmag * Imag * (sin(KPang_rad) * cos(Iang) + cos(KPang_rad) * sin(Iang)) - KI * Imag * sin(Iang);
  VE_i := KPmag * Vmag * (sin(KPang_rad) * cos(Vang) + cos(KPang_rad) * sin(Vang)) + XL * KPmag * Imag * (cos(KPang_rad) * cos(Iang) - sin(KPang_rad) * sin(Iang)) + KI * Imag * cos(Iang);
  VE := (VE_r ^ 2 + VE_i ^ 2) ^ 0.5;
end compoundedTransformerFunction;
