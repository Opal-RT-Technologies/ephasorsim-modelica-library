within OpalRT.ePHASORSIM.WrappedModels;
model DEGOV1 "Single-controller wrapper for DEGOV1 Turbine Governor"
  extends OpalRT.ePHASORSIM.Wrappers.SingleGovernorFMU;
  extends OpalRT.Electrical.Control.TurbineGovernor.DEGOV1;
end DEGOV1;
