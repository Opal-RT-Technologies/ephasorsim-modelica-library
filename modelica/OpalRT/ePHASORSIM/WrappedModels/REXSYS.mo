within OpalRT.ePHASORSIM.WrappedModels;
model REXSYS "Single-controller wrapper for IEEE REXSYS Excitation System"
  extends OpalRT.ePHASORSIM.Wrappers.SingleExciterFMU;
  extends OpalRT.Electrical.Control.Excitation.REXSYS;
equation
  ECOMP = ETERM;
end REXSYS;
