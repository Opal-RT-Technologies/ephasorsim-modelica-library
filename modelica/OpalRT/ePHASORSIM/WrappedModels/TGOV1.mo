within OpalRT.ePHASORSIM.WrappedModels;
model TGOV1 "Single-controller wrapper for TGOV1 Turbine Governor"
  extends OpalRT.ePHASORSIM.Wrappers.SingleGovernorFMU;
  extends OpalRT.Electrical.Control.TurbineGovernor.TGOV1;
end TGOV1;
