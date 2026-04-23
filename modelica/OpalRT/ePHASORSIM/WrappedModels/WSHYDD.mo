within OpalRT.ePHASORSIM.WrappedModels;
model WSHYDD "Single-controller wrapper for WSHYDD Turbine Governor"
  extends OpalRT.ePHASORSIM.Wrappers.SingleGovernorFMU;
  extends OpalRT.Electrical.Control.TurbineGovernor.WSHYDD;
end WSHYDD;
