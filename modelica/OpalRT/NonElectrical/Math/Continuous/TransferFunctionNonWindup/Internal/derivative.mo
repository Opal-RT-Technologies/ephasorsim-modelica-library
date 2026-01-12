within OpalRT.NonElectrical.Math.Continuous.TransferFunctionNonWindup.Internal;
function derivative
  input Real u;
  input Real x;
  input Real MAX;
  input Real MIN;
  input Real KP;
  input Real KI;
  output Real der_x;
protected
  Real yh;
algorithm
  yh := KP * u + x;
  der_x := if yh > MIN and yh < MAX then KI * u else 0;
end derivative;
