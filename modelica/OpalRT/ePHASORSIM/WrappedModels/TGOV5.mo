within OpalRT.ePHASORSIM.WrappedModels;
model TGOV5 "Single-controller wrapper for TGOV5 Turbine Governor"
  extends OpalRT.ePHASORSIM.Wrappers.SingleGovernorFMU;
  extends OpalRT.Electrical.Control.TurbineGovernor.TGOV5;
end TGOV5;
