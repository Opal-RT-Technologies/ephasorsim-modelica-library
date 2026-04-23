within OpalRT.ePHASORSIM.WrappedModels;
model WEHGOV "Single-controller wrapper for WEHGOV Turbine Governor"
  extends OpalRT.ePHASORSIM.Wrappers.SingleGovernorFMU;
  extends OpalRT.Electrical.Control.TurbineGovernor.WEHGOV;
end WEHGOV;
