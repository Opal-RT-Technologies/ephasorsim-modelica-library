within OpalRT.ePHASORSIM.WrappedModels;
model ESAC3A "Single-controller wrapper for IEEE ESAC3A Excitation System"
  extends OpalRT.ePHASORSIM.Wrappers.SingleExciterFMU;
  extends OpalRT.Electrical.Control.Excitation.ESAC3A;
equation
  ECOMP = ETERM;
end ESAC3A;
