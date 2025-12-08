within OpalRT.ModelSets.Data.Stabilizers.STAB4;
partial record DataSTAB4
  extends OpalRT.ModelSets.Data.Stabilizers.StabilizerData;
  parameter Real KX "(Gain)" annotation(Dialog(tab = "STAB4 Parameters"));
  parameter Real TT "Watt Transducer Time Constant" annotation(Dialog(tab = "STAB4 Parameters"));
  parameter Real TX1 "(> 0)" annotation(Dialog(tab = "STAB4 Parameters"));
  parameter Real TX2 "Reset Time Constant (> 0)" annotation(Dialog(tab = "STAB4 Parameters"));
  parameter Real Ta annotation(Dialog(tab = "STAB4 Parameters"));
  parameter Real Tb annotation(Dialog(tab = "STAB4 Parameters"));
  parameter Real Tc "(> 0)" annotation(Dialog(tab = "STAB4 Parameters"));
  parameter Real Td annotation(Dialog(tab = "STAB4 Parameters"));
  parameter Real Te annotation(Dialog(tab = "STAB4 Parameters"));
  parameter Real L1 "Low Limit" annotation(Dialog(tab = "STAB4 Parameters"));
  parameter Real L2 "High Limit" annotation(Dialog(tab = "STAB4 Parameters"));
end DataSTAB4;
