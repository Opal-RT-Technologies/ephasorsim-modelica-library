within OpalRT.ePHASORSIM.WrappedModels;
model IEEET3 "Single-controller wrapper for IEEE IEEET3 Excitation System"
  extends OpalRT.ePHASORSIM.Wrappers.SingleExciterFMU;
  extends OpalRT.Electrical.Control.Excitation.IEEET3;
equation
  ECOMP = ETERM;
end IEEET3;
