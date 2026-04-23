within OpalRT.ePHASORSIM.WrappedModels;
model ESAC6A "Single-controller wrapper for IEEE ESAC6A Excitation System"
  extends OpalRT.ePHASORSIM.Wrappers.SingleExciterFMU;
  extends OpalRT.Electrical.Control.Excitation.ESAC6A;
equation
  ECOMP = ETERM;
end ESAC6A;
