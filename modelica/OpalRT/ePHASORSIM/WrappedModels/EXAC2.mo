within OpalRT.ePHASORSIM.WrappedModels;
model EXAC2 "Single-controller wrapper for IEEE EXAC2 Excitation System"
  extends OpalRT.ePHASORSIM.Wrappers.SingleExciterFMU;
  extends OpalRT.Electrical.Control.Excitation.EXAC2;
equation
  ECOMP = ETERM;
end EXAC2;
