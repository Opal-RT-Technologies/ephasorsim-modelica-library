within OpalRT.ePHASORSIM.WrappedModels;
model PIDGOV "Single-controller wrapper for PIDGOV Turbine Governor"
  extends OpalRT.ePHASORSIM.Wrappers.SingleGovernorFMU;
  extends OpalRT.Electrical.Control.TurbineGovernor.PIDGOV;
end PIDGOV;
