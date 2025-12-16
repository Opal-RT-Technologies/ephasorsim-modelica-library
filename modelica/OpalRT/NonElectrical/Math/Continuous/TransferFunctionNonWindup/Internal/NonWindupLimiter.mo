within OpalRT.NonElectrical.Math.Continuous.TransferFunctionNonWindup.Internal;
function NonWindupLimiter
  input Real state;
  input Real gain;
  input Real u;
  input Real ULim;
  input Real LLim;
  output Real deriv;
algorithm
  deriv := 0;
  if state < ULim and state > LLim or state >= ULim and gain * u < 0 or state <= LLim and gain * u > 0 then
    deriv := gain * u;
  end if;
end NonWindupLimiter;
