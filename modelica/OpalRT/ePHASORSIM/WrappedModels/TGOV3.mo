within OpalRT.ePHASORSIM.WrappedModels;
model TGOV3 "Single-controller wrapper for TGOV3 Turbine Governor"
  extends OpalRT.ePHASORSIM.Wrappers.SingleGovernorFMU;
  extends OpalRT.Electrical.Control.TurbineGovernor.TGOV3;
end TGOV3;
