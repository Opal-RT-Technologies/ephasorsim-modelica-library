within OpalRT.ePHASORSIM.WrappedModels;
model EXDC2 "Single-controller wrapper for IEEE EXDC2 Excitation System"
  extends OpalRT.ePHASORSIM.Wrappers.SingleExciterFMU;
  extends OpalRT.Electrical.Control.Excitation.EXDC2;
equation
  ECOMP = ETERM;
end EXDC2;
