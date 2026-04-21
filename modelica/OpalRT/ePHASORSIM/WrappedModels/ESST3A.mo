within OpalRT.ePHASORSIM.WrappedModels;
model ESST3A "Single-controller wrapper for IEEE ESST3A Excitation System"
  extends OpalRT.ePHASORSIM.Wrappers.SingleExciterFMU;
  extends OpalRT.Electrical.Control.Excitation.ESST3A;
equation
  ECOMP = ETERM;
end ESST3A;
