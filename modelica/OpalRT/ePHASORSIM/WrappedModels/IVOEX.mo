within OpalRT.ePHASORSIM.WrappedModels;
model IVOEX "Single-controller wrapper for IEEE IVOEX Excitation System"
  extends OpalRT.ePHASORSIM.Wrappers.SingleExciterFMU;
  extends OpalRT.Electrical.Control.Excitation.IVOEX;
equation
  ECOMP = ETERM;
end IVOEX;
