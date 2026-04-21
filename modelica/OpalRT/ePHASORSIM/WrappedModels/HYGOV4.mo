within OpalRT.ePHASORSIM.WrappedModels;
model HYGOV4 "Single-controller wrapper for HYGOV4 Turbine Governor"
  extends OpalRT.ePHASORSIM.Wrappers.SingleGovernorFMU;
  extends OpalRT.Electrical.Control.TurbineGovernor.HYGOV4;
end HYGOV4;
