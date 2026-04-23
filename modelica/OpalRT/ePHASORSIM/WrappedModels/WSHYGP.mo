within OpalRT.ePHASORSIM.WrappedModels;
model WSHYGP "Single-controller wrapper for WSHYGP Turbine Governor"
  extends OpalRT.ePHASORSIM.Wrappers.SingleGovernorFMU;
  extends OpalRT.Electrical.Control.TurbineGovernor.WSHYGP;
end WSHYGP;
