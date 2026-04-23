within OpalRT.ePHASORSIM.WrappedModels;
model ST7B "Single-controller wrapper for IEEE ST7B Excitation System"
  extends OpalRT.ePHASORSIM.Wrappers.SingleExciterFMU;
  extends OpalRT.Electrical.Control.Excitation.ST7B;
equation
  ECOMP = ETERM;
end ST7B;
