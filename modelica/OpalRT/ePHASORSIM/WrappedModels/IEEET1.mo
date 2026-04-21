within OpalRT.ePHASORSIM.WrappedModels;
model IEEET1 "Single-controller wrapper for IEEE IEEET1 Excitation System"
  extends OpalRT.ePHASORSIM.Wrappers.SingleExciterFMU;
  extends OpalRT.Electrical.Control.Excitation.IEEET1;
equation
  ECOMP = ETERM;
end IEEET1;
