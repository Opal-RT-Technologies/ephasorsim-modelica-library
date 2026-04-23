within OpalRT.ePHASORSIM.WrappedModels;
model STAB1 "Single-controller wrapper for STAB1 Power System Stabilizer"
  extends OpalRT.ePHASORSIM.Wrappers.SingleStabilizerFMU;
  extends OpalRT.Electrical.Control.Stabilizer.STAB1;
end STAB1;
