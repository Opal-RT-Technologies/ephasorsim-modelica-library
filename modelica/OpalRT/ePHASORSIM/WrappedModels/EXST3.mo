within OpalRT.ePHASORSIM.WrappedModels;
model EXST3 "Single-controller wrapper for IEEE EXST3 Excitation System"
  extends OpalRT.ePHASORSIM.Wrappers.SingleExciterFMU;
  extends OpalRT.Electrical.Control.Excitation.EXST3;
equation
  ECOMP = ETERM;
end EXST3;
