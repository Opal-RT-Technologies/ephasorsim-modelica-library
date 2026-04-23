within OpalRT.ePHASORSIM.WrappedModels;
model PSS2A "Single-controller wrapper for PSS2A Power System Stabilizer"
  extends OpalRT.ePHASORSIM.Wrappers.SingleStabilizerFMU;
  extends OpalRT.Electrical.Control.Stabilizer.PSS2A;
end PSS2A;
