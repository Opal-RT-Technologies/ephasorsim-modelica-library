within OpalRT.ePHASORSIM.WrappedModels;
model WESGOV "Single-controller wrapper for WESGOV Turbine Governor"
  extends OpalRT.ePHASORSIM.Wrappers.SingleGovernorFMU;
  extends OpalRT.Electrical.Control.TurbineGovernor.WESGOV;
end WESGOV;
