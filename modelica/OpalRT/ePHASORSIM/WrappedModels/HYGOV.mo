within OpalRT.ePHASORSIM.WrappedModels;
model HYGOV "Single-controller wrapper for HYGOV Turbine Governor"
  extends OpalRT.ePHASORSIM.Wrappers.SingleGovernorFMU;
  extends OpalRT.Electrical.Control.TurbineGovernor.HYGOV;
end HYGOV;
