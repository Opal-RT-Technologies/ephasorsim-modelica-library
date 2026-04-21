within OpalRT.ePHASORSIM.WrappedModels;
model STAB4 "Single-controller wrapper for STAB4 Power System Stabilizer"
  extends OpalRT.ePHASORSIM.Wrappers.SingleStabilizerFMU;
  extends OpalRT.Electrical.Control.Stabilizer.STAB4;
end STAB4;
