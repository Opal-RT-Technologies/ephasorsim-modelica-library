within OpalRT.ePHASORSIM.WrappedModels;
model IEEEG3 "Single-controller wrapper for IEEEG3 Turbine Governor"
  extends OpalRT.ePHASORSIM.Wrappers.SingleGovernorFMU;
  extends OpalRT.Electrical.Control.TurbineGovernor.IEEEG3;
end IEEEG3;
