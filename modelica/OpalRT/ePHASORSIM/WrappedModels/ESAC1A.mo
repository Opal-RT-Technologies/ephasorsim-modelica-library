within OpalRT.ePHASORSIM.WrappedModels;
model ESAC1A "Single-controller wrapper for IEEE ESAC1A Excitation System"
  extends OpalRT.ePHASORSIM.Wrappers.SingleExciterFMU;
  extends OpalRT.Electrical.Control.Excitation.ESAC1A;
equation
  ECOMP = ETERM;
end ESAC1A;
