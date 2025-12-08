within OpalRT.ModelSets.Data.General;
partial record PlantGeneralData
  extends Modelica.Icons.Record;
  parameter Integer IBUS "Located system bus" annotation(Dialog(tab = "General"));
  parameter String M_ID "Machine Identifier" annotation(Dialog(tab = "General"));
  parameter Real P_gen "Bus Active Power, MW" annotation(Dialog(tab = "General"));
  parameter Real Q_gen "Bus Reactive Power, MVAR" annotation(Dialog(tab = "General"));
  parameter Real Vt_abs "Bus Voltage Magnitude, p.u." annotation(Dialog(tab = "General"));
  parameter Real Vt_ang "Bus Voltage Angle, deg." annotation(Dialog(tab = "General"));
  parameter Real SB "Machine Base Power, MVA" annotation(Dialog(tab = "General"));
  parameter Real fn "Nominal frequency" annotation(Dialog(tab = "General"));
end PlantGeneralData;
