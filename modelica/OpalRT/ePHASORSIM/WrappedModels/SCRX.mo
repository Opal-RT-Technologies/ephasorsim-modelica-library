within OpalRT.ePHASORSIM.WrappedModels;
model SCRX "Single-controller wrapper for IEEE SCRX Excitation System"
  extends OpalRT.ePHASORSIM.Wrappers.SingleExciterFMU;
  extends OpalRT.Electrical.Control.Excitation.SCRX;
equation
  ECOMP = ETERM;
end SCRX;
