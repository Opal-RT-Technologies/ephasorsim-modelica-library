within OpalRT.ePHASORSIM.WrappedModels;
model ST5B "Single-controller wrapper for IEEE ST5B Excitation System"
  extends OpalRT.ePHASORSIM.Wrappers.SingleExciterFMU;
  extends OpalRT.Electrical.Control.Excitation.ST5B;
equation
  ECOMP = ETERM;
end ST5B;
