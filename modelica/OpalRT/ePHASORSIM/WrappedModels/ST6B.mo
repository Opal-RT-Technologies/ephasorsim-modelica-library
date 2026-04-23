within OpalRT.ePHASORSIM.WrappedModels;
model ST6B "Single-controller wrapper for IEEE ST6B Excitation System"
  extends OpalRT.ePHASORSIM.Wrappers.SingleExciterFMU;
  extends OpalRT.Electrical.Control.Excitation.ST6B;
equation
  ECOMP = ETERM;
end ST6B;
