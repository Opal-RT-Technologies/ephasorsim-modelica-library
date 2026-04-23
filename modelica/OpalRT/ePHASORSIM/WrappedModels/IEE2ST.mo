within OpalRT.ePHASORSIM.WrappedModels;
model IEE2ST "Single-controller wrapper for IEE2ST Power System Stabilizer"
  extends OpalRT.ePHASORSIM.Wrappers.SingleStabilizerFMU;
  extends OpalRT.Electrical.Control.Stabilizer.IEE2ST;
end IEE2ST;
