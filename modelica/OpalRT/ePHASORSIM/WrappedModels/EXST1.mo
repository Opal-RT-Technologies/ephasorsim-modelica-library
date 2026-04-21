within OpalRT.ePHASORSIM.WrappedModels;
model EXST1 "Single-controller wrapper for IEEE EXST1 Excitation System"
  extends OpalRT.ePHASORSIM.Wrappers.SingleExciterFMU;
  extends OpalRT.Electrical.Control.Excitation.EXST1;
equation
  ECOMP = ETERM;
end EXST1;
