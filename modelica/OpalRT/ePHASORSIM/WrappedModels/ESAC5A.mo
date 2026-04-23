within OpalRT.ePHASORSIM.WrappedModels;
model ESAC5A "Single-controller wrapper for IEEE ESAC5A Excitation System"
  extends OpalRT.ePHASORSIM.Wrappers.SingleExciterFMU;
  extends OpalRT.Electrical.Control.Excitation.ESAC5A;
equation
  ECOMP = ETERM;
end ESAC5A;
