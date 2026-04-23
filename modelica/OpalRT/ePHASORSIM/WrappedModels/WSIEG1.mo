within OpalRT.ePHASORSIM.WrappedModels;
model WSIEG1 "Single-controller wrapper for WSIEG1 Turbine Governor"
  extends OpalRT.ePHASORSIM.Wrappers.SingleGovernorFMU;
  extends OpalRT.Electrical.Control.TurbineGovernor.WSIEG1;
end WSIEG1;
