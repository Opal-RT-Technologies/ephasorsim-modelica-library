within OpalRT.ePHASORSIM.WrappedModels;
model IEEEG1 "Single-controller wrapper for IEEEG1 Turbine Governor"
  extends OpalRT.ePHASORSIM.Wrappers.SingleGovernorFMU;
  extends OpalRT.Electrical.Control.TurbineGovernor.IEEEG1;
end IEEEG1;
