within OpalRT.ModelSets.Data.Stabilizers.STAB3;
partial record DataSTAB3
  extends OpalRT.ModelSets.Data.Stabilizers.StabilizerData;
  parameter Real Tt "Time constant (sec)" annotation(Dialog(tab = "STAB3 Parameters"));
  parameter Real Tx1 "First time constant (sec)" annotation(Dialog(tab = "STAB3 Parameters"));
  parameter Real Tx2 "Second time constant (sec)" annotation(Dialog(tab = "STAB3 Parameters"));
  parameter Real Kx "Gain (sec)" annotation(Dialog(tab = "STAB3 Parameters"));
  parameter Real VLIM "Voltage limit" annotation(Dialog(tab = "STAB3 Parameters"));
end DataSTAB3;
