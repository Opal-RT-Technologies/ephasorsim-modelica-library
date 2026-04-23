within OpalRT.ePHASORSIM.WrappedModels;
model ESDC1A "Single-controller wrapper for IEEE ESDC1A Excitation System"
  extends OpalRT.ePHASORSIM.Wrappers.SingleExciterFMU;
  extends OpalRT.Electrical.Control.Excitation.ESDC1A;
equation
  ECOMP = ETERM;
end ESDC1A;
