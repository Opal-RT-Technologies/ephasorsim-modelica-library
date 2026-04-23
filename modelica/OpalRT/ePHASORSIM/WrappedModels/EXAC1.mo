within OpalRT.ePHASORSIM.WrappedModels;
model EXAC1 "Single-controller wrapper for IEEE EXAC1 Excitation System"
  extends OpalRT.ePHASORSIM.Wrappers.SingleExciterFMU;
  extends OpalRT.Electrical.Control.Excitation.EXAC1;
equation
  ECOMP = ETERM;
end EXAC1;
