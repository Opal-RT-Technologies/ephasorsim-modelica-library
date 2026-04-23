within OpalRT.ePHASORSIM.WrappedModels;
model ESST1A "Single-controller wrapper for IEEE ESST1A Excitation System"
  extends OpalRT.ePHASORSIM.Wrappers.SingleExciterFMU;
  extends OpalRT.Electrical.Control.Excitation.ESST1A;
equation
  ECOMP = ETERM;
end ESST1A;
