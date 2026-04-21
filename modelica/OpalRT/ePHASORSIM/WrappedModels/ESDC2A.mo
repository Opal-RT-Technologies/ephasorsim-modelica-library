within OpalRT.ePHASORSIM.WrappedModels;
model ESDC2A "Single-controller wrapper for IEEE ESDC2A Excitation System"
  extends OpalRT.ePHASORSIM.Wrappers.SingleExciterFMU;
  extends OpalRT.Electrical.Control.Excitation.ESDC2A;
equation
  ECOMP = ETERM;
end ESDC2A;
