within OpalRT.ePHASORSIM.WrappedModels;
model IEEEX1 "Single-controller wrapper for IEEE IEEEX1 Excitation System"
  extends OpalRT.ePHASORSIM.Wrappers.SingleExciterFMU;
  extends OpalRT.Electrical.Control.Excitation.IEEEX1;
equation
  ECOMP = ETERM;
end IEEEX1;
