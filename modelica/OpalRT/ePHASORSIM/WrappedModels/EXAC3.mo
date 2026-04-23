within OpalRT.ePHASORSIM.WrappedModels;
model EXAC3 "Single-controller wrapper for IEEE EXAC3 Excitation System"
  extends OpalRT.ePHASORSIM.Wrappers.SingleExciterFMU;
  extends OpalRT.Electrical.Control.Excitation.EXAC3;
equation
  ECOMP = ETERM;
end EXAC3;
