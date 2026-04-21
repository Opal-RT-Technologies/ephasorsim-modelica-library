within OpalRT.ePHASORSIM.WrappedModels;
model IEEEST "Single-controller wrapper for IEEEST Power System Stabilizer"
  extends OpalRT.ePHASORSIM.Wrappers.SingleStabilizerFMU;
  extends OpalRT.Electrical.Control.Stabilizer.IEEEST;
end IEEEST;
