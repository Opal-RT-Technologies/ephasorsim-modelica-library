within OpalRT.ePHASORSIM.WrappedModels;
model URST5T "Single-controller wrapper for IEEE URST5T Excitation System"
  extends OpalRT.ePHASORSIM.Wrappers.SingleExciterFMU;
  extends OpalRT.Electrical.Control.Excitation.URST5T;
equation
  ECOMP = ETERM;
end URST5T;
