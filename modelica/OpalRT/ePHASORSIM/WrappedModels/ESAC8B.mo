within OpalRT.ePHASORSIM.WrappedModels;
model ESAC8B "Single-controller wrapper for IEEE ESAC8B Excitation System"
  extends OpalRT.ePHASORSIM.Wrappers.SingleExciterFMU;
  extends OpalRT.Electrical.Control.Excitation.ESAC8B;
equation
  ECOMP = ETERM;
end ESAC8B;
