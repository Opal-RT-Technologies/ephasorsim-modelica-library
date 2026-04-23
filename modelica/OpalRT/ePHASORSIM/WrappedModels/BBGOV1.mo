within OpalRT.ePHASORSIM.WrappedModels;
model BBGOV1 "Single-controller wrapper for BBGOV1 Turbine Governor"
  extends OpalRT.ePHASORSIM.Wrappers.SingleGovernorFMU;
  extends OpalRT.Electrical.Control.TurbineGovernor.BBGOV1;
end BBGOV1;
