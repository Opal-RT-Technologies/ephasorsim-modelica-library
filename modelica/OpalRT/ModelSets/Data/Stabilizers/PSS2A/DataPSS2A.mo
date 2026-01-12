within OpalRT.ModelSets.Data.Stabilizers.PSS2A;
partial record DataPSS2A
  extends OpalRT.ModelSets.Data.Stabilizers.StabilizerData;
  parameter Real TW1 " >0" annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real TW2 "To bypass second washout, first signal: set Tw2 = 0" annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real T6 "To bypass first signal transducer: set T6 = 0" annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real TW3 " >0" annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real TW4 "To bypass second washout, second signal: set Tw4 = 0" annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real T7 "To bypass second signal transducer: set T7 = 0" annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real KS2 "T7/(2*H)" annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real KS3 annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real T8 annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real T9 " >0" annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real KS1 annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real T1 "To bypass first lead-lag: set T1 = T2 = 0" annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real T2 annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real T3 "To bypass first lead-lag: set T1 = T2 = 0" annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real T4 annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real VSTMAX annotation(Dialog(tab = "PSS2A Parameters"));
  parameter Real VSTMIN annotation(Dialog(tab = "PSS2A Parameters"));
  // ICONs
  parameter Real M0 "ICS1, first stabilizer input code" annotation(Dialog(tab = "PSS2A Parameters", group = "ICONs"));
  parameter Real M1 "REMBUS1, first remote bus number" annotation(Dialog(tab = "PSS2A Parameters", group = "ICONs"));
  parameter Real M2 "ICS2, second stabilizer input code" annotation(Dialog(tab = "PSS2A Parameters", group = "ICONs"));
  parameter Real M3 "REMBUS2, second remote bus number" annotation(Dialog(tab = "PSS2A Parameters", group = "ICONs"));
  parameter Real M4 "M, ramp tracking filter" annotation(Dialog(tab = "PSS2A Parameters", group = "ICONs"));
  parameter Real M5 "N, ramp tracking filter" annotation(Dialog(tab = "PSS2A Parameters", group = "ICONs"));
end DataPSS2A;
