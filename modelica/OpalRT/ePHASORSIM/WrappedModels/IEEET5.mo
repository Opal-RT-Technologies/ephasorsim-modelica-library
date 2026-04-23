within OpalRT.ePHASORSIM.WrappedModels;
model IEEET5 "Single-controller wrapper for IEEE IEEET5 Excitation System"
  extends OpalRT.ePHASORSIM.Wrappers.SingleExciterFMU;
  extends OpalRT.Electrical.Control.Excitation.IEEET5;
equation
  ECOMP = ETERM;
end IEEET5;
