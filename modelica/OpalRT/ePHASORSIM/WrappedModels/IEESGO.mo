within OpalRT.ePHASORSIM.WrappedModels;
model IEESGO "Single-controller wrapper for IEESGO Turbine Governor"
  extends OpalRT.ePHASORSIM.Wrappers.SingleGovernorFMU;
  extends OpalRT.Electrical.Control.TurbineGovernor.IEESGO;
end IEESGO;
