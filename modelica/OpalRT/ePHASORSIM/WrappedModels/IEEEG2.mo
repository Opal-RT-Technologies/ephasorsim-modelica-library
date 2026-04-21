within OpalRT.ePHASORSIM.WrappedModels;
model IEEEG2 "Single-controller wrapper for IEEEG2 Turbine Governor"
  extends OpalRT.ePHASORSIM.Wrappers.SingleGovernorFMU;
  extends OpalRT.Electrical.Control.TurbineGovernor.IEEEG2;
end IEEEG2;
