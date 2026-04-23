within OpalRT.ePHASORSIM.WrappedModels;
model ESAC2A "Single-controller wrapper for IEEE ESAC2A Excitation System"
  extends OpalRT.ePHASORSIM.Wrappers.SingleExciterFMU;
  extends OpalRT.Electrical.Control.Excitation.ESAC2A;
equation
  ECOMP = ETERM;
end ESAC2A;
