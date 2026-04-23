within OpalRT.ePHASORSIM.WrappedModels;
model EXAC1A "Single-controller wrapper for IEEE EXAC1A Excitation System"
  extends OpalRT.ePHASORSIM.Wrappers.SingleExciterFMU;
  extends OpalRT.Electrical.Control.Excitation.EXAC1A;
equation
  ECOMP = ETERM;
end EXAC1A;
