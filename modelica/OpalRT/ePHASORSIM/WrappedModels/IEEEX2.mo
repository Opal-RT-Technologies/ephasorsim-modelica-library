within OpalRT.ePHASORSIM.WrappedModels;
model IEEEX2 "Single-controller wrapper for IEEE IEEEX2 Excitation System"
  extends OpalRT.ePHASORSIM.Wrappers.SingleExciterFMU;
  extends OpalRT.Electrical.Control.Excitation.IEEEX2;
equation
  ECOMP = ETERM;
end IEEEX2;
