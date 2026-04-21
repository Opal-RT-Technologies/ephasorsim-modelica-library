within OpalRT.ePHASORSIM.WrappedModels;
model EXAC4 "Single-controller wrapper for IEEE EXAC4 Excitation System"
  extends OpalRT.ePHASORSIM.Wrappers.SingleExciterFMU;
  extends OpalRT.Electrical.Control.Excitation.EXAC4;
equation
  ECOMP = ETERM;
end EXAC4;
