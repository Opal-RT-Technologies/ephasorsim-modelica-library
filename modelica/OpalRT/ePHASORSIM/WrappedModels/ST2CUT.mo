within OpalRT.ePHASORSIM.WrappedModels;
model ST2CUT "Single-controller wrapper for ST2CUT Power System Stabilizer"
  extends OpalRT.ePHASORSIM.Wrappers.SingleStabilizerFMU;
  extends OpalRT.Electrical.Control.Stabilizer.ST2CUT;
end ST2CUT;
