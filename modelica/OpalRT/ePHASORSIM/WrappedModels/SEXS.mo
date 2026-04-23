within OpalRT.ePHASORSIM.WrappedModels;
model SEXS "Single-controller wrapper for IEEE SEXS Excitation System"
  extends OpalRT.ePHASORSIM.Wrappers.SingleExciterFMU;
  extends OpalRT.Electrical.Control.Excitation.SEXS;
equation
  ECOMP = ETERM;
end SEXS;
