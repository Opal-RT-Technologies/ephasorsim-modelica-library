within OpalRT.ePHASORSIM.WrappedModels;
model GAST2A "Single-controller wrapper for GAST2A Turbine Governor"
  extends OpalRT.ePHASORSIM.Wrappers.SingleGovernorFMU;
  extends OpalRT.Electrical.Control.TurbineGovernor.GAST2A;
end GAST2A;
