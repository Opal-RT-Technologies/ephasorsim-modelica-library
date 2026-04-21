within OpalRT.ePHASORSIM.WrappedModels;
model GGOV1 "Single-controller wrapper for GGOV1 Turbine Governor"
  extends OpalRT.ePHASORSIM.Wrappers.SingleGovernorFMU;
  extends OpalRT.Electrical.Control.TurbineGovernor.GGOV1;
end GGOV1;
