within OpalRT.ePHASORSIM.WrappedModels;
model AC7B "Single-controller wrapper for IEEE AC7B Excitation System"
  extends OpalRT.ePHASORSIM.Wrappers.SingleExciterFMU;
  extends OpalRT.Electrical.Control.Excitation.AC7B;
equation
  ECOMP = ETERM;
end AC7B;
