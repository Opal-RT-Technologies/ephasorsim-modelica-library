within OpalRT.ePHASORSIM.WrappedModels;
model STAB3 "Single-controller wrapper for STAB3 Power System Stabilizer"
  extends OpalRT.ePHASORSIM.Wrappers.SingleStabilizerFMU;
  extends OpalRT.Electrical.Control.Stabilizer.STAB3;
end STAB3;
