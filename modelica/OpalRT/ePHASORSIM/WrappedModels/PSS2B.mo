within OpalRT.ePHASORSIM.WrappedModels;
model PSS2B "Single-controller wrapper for PSS2B Power System Stabilizer"
  extends OpalRT.ePHASORSIM.Wrappers.SingleStabilizerFMU;
  extends OpalRT.Electrical.Control.Stabilizer.PSS2B;
end PSS2B;
