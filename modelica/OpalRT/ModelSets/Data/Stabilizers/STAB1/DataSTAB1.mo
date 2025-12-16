within OpalRT.ModelSets.Data.Stabilizers.STAB1;
partial record DataSTAB1
  extends OpalRT.ModelSets.Data.Stabilizers.StabilizerData;
  parameter Real K_T "Gain (sec^-1)" annotation(Dialog(tab = "STAB1 Parameters"));
  parameter Real T "Time constant (sec)" annotation(Dialog(tab = "STAB1 Parameters"));
  parameter Real T1_T3 annotation(Dialog(tab = "STAB1 Parameters"));
  parameter Real T3 "Time constant (sec)" annotation(Dialog(tab = "STAB1 Parameters"));
  parameter Real T2_T4 annotation(Dialog(tab = "STAB1 Parameters"));
  parameter Real T4 "Time constant (sec)" annotation(Dialog(tab = "STAB1 Parameters"));
  parameter Real HLIM "High limit" annotation(Dialog(tab = "STAB1 Parameters"));
end DataSTAB1;
