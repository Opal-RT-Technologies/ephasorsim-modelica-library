within OpalRT.ePHASORSIM.WrappedModels;
model EXST2 "Single-controller wrapper for IEEE EXST2 Excitation System"
  extends OpalRT.ePHASORSIM.Wrappers.SingleExciterFMU;
  extends OpalRT.Electrical.Control.Excitation.EXST2;
equation
  ECOMP = ETERM;
end EXST2;
