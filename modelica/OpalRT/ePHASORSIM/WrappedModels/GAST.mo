within OpalRT.ePHASORSIM.WrappedModels;
model GAST "Single-controller wrapper for GAST Turbine Governor"
  extends OpalRT.ePHASORSIM.Wrappers.SingleGovernorFMU;
  extends OpalRT.Electrical.Control.TurbineGovernor.GAST;
end GAST;
