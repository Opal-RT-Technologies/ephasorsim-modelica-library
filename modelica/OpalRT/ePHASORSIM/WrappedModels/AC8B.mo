within OpalRT.ePHASORSIM.WrappedModels;
model AC8B "Single-controller wrapper for IEEE AC8B Excitation System"
  extends OpalRT.ePHASORSIM.Wrappers.SingleExciterFMU;
  extends OpalRT.Electrical.Control.Excitation.AC8B;
equation
  ECOMP = ETERM;
end AC8B;
