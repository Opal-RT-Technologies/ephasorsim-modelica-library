within OpalRT.ePHASORSIM.WrappedModels;
block CDC6TA
  extends Wrappers.FMUTemplateTwoPowerPinControl(
    redeclare ModelSets.HVDC.CDC6TA modelSet(
      partType = partType,
      RDC = RDC,
      DELTI = DELTI,
      NBR = NBR,
      RCR = RCR,
      XCR = XCR,
      EBASR = EBASR,
      TRR = TRR,
      TAPR = TAPR,
      NBI = NBI,
      RCI = RCI,
      XCI = XCI,
      EBASI = EBASI,
      TRI = TRI,
      TAPI = TAPI,
      ALFDY = ALFDY,
      GAMDY = GAMDY,
      C0 = C0,
      SB = SB,
      GAMMX = GAMMX,
      GAMMN = GAMMN,
      Vmag_rec = Vmag_rec,
      Vang_rec = Vang_rec,
      Vmag_inv = Vmag_inv,
      Vang_inv = Vang_inv,
      SETVL = SETVL,
      MDC = MDC,
      Tidc = Tidc,
      Tvdc = Tvdc,
      C1 = C1,
      C2 = C2,
      C3 = C3,
      V1 = V1,
      V2 = V2,
      V3 = V3,
      RCOMP = RCOMP,
      VSCHED = VSCHED,
      TVRDC = TVRDC));
  parameter Real partType = 1;
  parameter Real RDC = 1 "The DC line resistance in ohms";
  parameter Real DELTI = 0.25 "Margin entred in per unit of desired power or current";
  parameter Real NBR = 1 "Number of bridges in series";
  parameter Real RCR = 0 "Commutating transformer resistance per bridge in ohms";
  parameter Real XCR = 0.57 "Commutating transformer reactance per bridge in ohms";
  parameter Real EBASR = 230 "Primary base ac voltage in kV";
  parameter Real TRR = 1 "Transformer ratio";
  parameter Real TAPR = 1 "Tap setting";
  parameter Real NBI = 1 "Number of bridges in series";
  parameter Real RCI = 0 "Commutating transformer resistance per bridge in ohms";
  parameter Real XCI = 0.57 "Commutating transformer reactance per bridge in ohms";
  parameter Real EBASI = 230 "Primary base ac voltage in kV";
  parameter Real TRI = 1 "Transformer ratio";
  parameter Real TAPI = 1 "Tap setting";
  parameter Real ALFDY = 0 "Minimum alpha for dynamics (degrees)" annotation(Dialog(tab = "Dynamic parameters"));
  parameter Real GAMDY = 0 "Minimum gamma for dynamics (degrees)" annotation(Dialog(tab = "Dynamic parameters"));
  parameter Real C0 = 20 "Minimum current demand (amps)" annotation(Dialog(tab = "Dynamic parameters"));
  parameter Real SB = 100 "Network base Power (MVA)";
  parameter Real GAMMX = 90 "Nominal maximum firing angle in degrees";
  parameter Real GAMMN = 0 "Nominal minimum firing angle in degrees";
  parameter Real Vmag_rec = 1 "rectifier side injecting active power" annotation(Dialog(tab = "Power Flow"));
  parameter Real Vang_rec = -7.8102 "rectifier side injecting reactive power" annotation(Dialog(tab = "Power Flow"));
  parameter Real Vmag_inv = 1 "inverter side injecting active power" annotation(Dialog(tab = "Power Flow"));
  parameter Real Vang_inv = -24.0517 "inverter side injecting reactive power" annotation(Dialog(tab = "Power Flow"));
  parameter Real SETVL = 800 "Current ( amps ) or power (MW) demand";
  parameter Real MDC = 2 "Control mode: 1 for power, 2 for current";
  parameter Real Tidc = 0.05 "Dc current transducer time constant (sec)" annotation(Dialog(tab = "Dynamic parameters"));
  parameter Real Tvdc = 0.05 "Dc voltage transducer time constant (sec)" annotation(Dialog(tab = "Dynamic parameters"));
  parameter Real C1 = 1000 "Current limit point 1 (amps)" annotation(Dialog(tab = "Dynamic parameters"));
  parameter Real C2 = 1000 "Current limit point 2 (amps)" annotation(Dialog(tab = "Dynamic parameters"));
  parameter Real C3 = 1000 "Current limit point 3 (amps)" annotation(Dialog(tab = "Dynamic parameters"));
  parameter Real V1 = 300 "Voltage limit point 1 (kV)" annotation(Dialog(tab = "Dynamic parameters"));
  parameter Real V2 = 400 "Voltage limit point 2 (kV)" annotation(Dialog(tab = "Dynamic parameters"));
  parameter Real V3 = 500 "Voltage limit point 3 (kV)" annotation(Dialog(tab = "Dynamic parameters"));
  parameter Real RCOMP = 0 "Compounding resistance in ohms" annotation(Dialog(tab = "Dynamic parameters"));
  parameter Real VSCHED = 124.2 "Scheduled compunded dc voltage" annotation(Dialog(tab = "Dynamic parameters"));
  parameter Real TVRDC = 1 "rectifier dc voltage transducer time constant (sec)" annotation(Dialog(tab = "Dynamic parameters"));
end CDC6TA;
