within OpalRT.ePHASORSIM.WrappedModels;
model EXPIC1 "Single-controller wrapper for IEEE EXPIC1 Excitation System"
  extends OpalRT.ePHASORSIM.Wrappers.SingleExciterFMU;
  extends OpalRT.Electrical.Control.Excitation.EXPIC1;
equation
  ECOMP = ETERM;
end EXPIC1;
