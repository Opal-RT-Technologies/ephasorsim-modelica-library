within OpalRT.ePHASORSIM.WrappedModels;
model ESST4B "Single-controller wrapper for IEEE ESST4B Excitation System"
  extends OpalRT.ePHASORSIM.Wrappers.SingleExciterFMU;
  extends OpalRT.Electrical.Control.Excitation.ESST4B;
equation
  ECOMP = ETERM;
end ESST4B;
