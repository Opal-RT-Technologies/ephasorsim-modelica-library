within OpalRT.ePHASORSIM.WrappedModels;
model IEEET2 "Single-controller wrapper for IEEE IEEET2 Excitation System"
  extends OpalRT.ePHASORSIM.Wrappers.SingleExciterFMU;
  extends OpalRT.Electrical.Control.Excitation.IEEET2;
equation
  ECOMP = ETERM;
end IEEET2;
