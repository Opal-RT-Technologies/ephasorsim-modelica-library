within OpalRT.ePHASORSIM.WrappedModels;
model PSS3B "Single-controller wrapper for PSS3B Power System Stabilizer"
  extends OpalRT.ePHASORSIM.Wrappers.SingleStabilizerFMU;
  extends OpalRT.Electrical.Control.Stabilizer.PSS3B;
end PSS3B;
