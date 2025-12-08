within OpalRT.ePHASORSIM.WrappedModels;
block PVGU1_PVEU1_PANELU1_IRRADU1_OLD
  parameter Real partType = 1;
  // system parameters
  parameter Integer IBUS = 100 "Located system bus" annotation(Dialog(tab = "PVGU1 parameters"));
  parameter String ID = "M1" "Machine Identifier";
  parameter Real SB = 1000 "Machine base power (MVA)";
  parameter Real fn = 60 "FReqnuency(HZ)";
  parameter Real Vt_abs = 1.03 "initial voltage in p.u.";
  parameter Real Vt_ang = -10.6 "initial bus anglein degree";
  parameter Real P_gen = 600 "initial P in Mvar.";
  parameter Real Q_gen = 93.6 "initial Q in Mvar.";
  // PVGU1 parameters
  parameter Real TIQCmd = 0.02 "Converter time constant for IQcmd, second" annotation(Dialog(tab = "PVGU1 parameters"));
  parameter Real TIPCmd = 0.02 " Converter time constant for IPcmd, second" annotation(Dialog(tab = "PVGU1 parameters"));
  parameter Real VLVPL1 = 0.4 "Low Voltage power Logic (LVPL), voltage 1 (pu)" annotation(Dialog(tab = "PVGU1 parameters"));
  parameter Real VLVPL2 = 0.9 "LVPL voltage 2 (pu)" annotation(Dialog(tab = "PVGU1 parameters"));
  parameter Real GLVPL = 1.11 "LVPL gain" annotation(Dialog(tab = "PVGU1 parameters"));
  parameter Real VHVRCR = 1.2 "High Voltage reactive Current (HVRC) logic,voltage (pu)" annotation(Dialog(tab = "PVGU1 parameters"));
  parameter Real CURHVRCR = 2.0 "HVRC logic, current (pu)" annotation(Dialog(tab = "PVGU1 parameters"));
  parameter Real RIp_LVPL = 2.0 "Rate of active current change" annotation(Dialog(tab = "PVGU1 parameters"));
  parameter Real T_LVPL = 0.02 "Voltage sensor for LVPL, second" annotation(Dialog(tab = "PVGU1 parameters"));
  parameter Real ZSOURCE_RE = 0 "Machine source impedence" annotation(Dialog(tab = "PVGU1 parameters"));
  //
  parameter Real Positive_sequence = 1 "1: positive sequence, 0: Unbalanced 3-phase" annotation(Dialog(tab = "3-phase network parameters"));
  parameter Real Vbase = 1 "Base Voltage of connected bus, used for 3-phase network" annotation(Dialog(tab = "3-phase network parameters"));
  parameter Real Sbase_network = 1 "Network base power, used for 3-phase network" annotation(Dialog(tab = "3-phase network parameters"));
  // PANELU1 parameters
  parameter Real PDCMAX200 = 10 "maximum power of panel at an irradiance of 200 W/m2, pu on PDCMAX1000" annotation(Dialog(tab = "PANELU1 parameters"));
  parameter Real PDCMAX400 = 10 "maximum power of panel at an irradiance of 400 W/m2, pu on PDCMAX1000" annotation(Dialog(tab = "PANELU1 parameters"));
  parameter Real PDCMAX600 = 10 "maximum power of panel at an irradiance of 600 W/m2, pu on PDCMAX1000" annotation(Dialog(tab = "PANELU1 parameters"));
  parameter Real PDCMAX800 = 10 "maximum power of panel at an irradiance of 800 W/m2, pu on PDCMAX1000" annotation(Dialog(tab = "PANELU1 parameters"));
  parameter Real PDCMAX1000 = 10 "maximum power of panel at an irradiance of 1000 W/m2, pu on PDCMAX1000" annotation(Dialog(tab = "PANELU1 parameters"));
  //IRRADU1 parameters
  parameter Real TIME1 = 1 "Time of first data point, sec" annotation(Dialog(tab = "IRRADU1 parameters"));
  parameter Real IRRADIANCE1 = 100 "Irradiance at first data point, W/m2" annotation(Dialog(tab = "IRRADU1 parameters"));
  parameter Real TIME2 = 2 "Time of first data point, sec" annotation(Dialog(tab = "IRRADU1 parameters"));
  parameter Real IRRADIANCE2 = 100 "Irradiance at first data point, W/m2" annotation(Dialog(tab = "IRRADU1 parameters"));
  parameter Real TIME3 = 3 "Time of first data point, sec" annotation(Dialog(tab = "IRRADU1 parameters"));
  parameter Real IRRADIANCE3 = 100 "Irradiance at first data point, W/m2" annotation(Dialog(tab = "IRRADU1 parameters"));
  parameter Real TIME4 = 4 "Time of first data point, sec" annotation(Dialog(tab = "IRRADU1 parameters"));
  parameter Real IRRADIANCE4 = 100 "Irradiance at first data point, W/m2" annotation(Dialog(tab = "IRRADU1 parameters"));
  parameter Real TIME5 = 5 "Time of first data point, sec" annotation(Dialog(tab = "IRRADU1 parameters"));
  parameter Real IRRADIANCE5 = 100 "Irradiance at first data point, W/m2" annotation(Dialog(tab = "IRRADU1 parameters"));
  parameter Real TIME6 = 6 "Time of first data point, sec" annotation(Dialog(tab = "IRRADU1 parameters"));
  parameter Real IRRADIANCE6 = 100 "Irradiance at first data point, W/m2" annotation(Dialog(tab = "IRRADU1 parameters"));
  parameter Real TIME7 = 7 "Time of first data point, sec" annotation(Dialog(tab = "IRRADU1 parameters"));
  parameter Real IRRADIANCE7 = 100 "Irradiance at first data point, W/m2" annotation(Dialog(tab = "IRRADU1 parameters"));
  parameter Real TIME8 = 8 "Time of first data point, sec" annotation(Dialog(tab = "IRRADU1 parameters"));
  parameter Real IRRADIANCE8 = 100 "Irradiance at first data point, W/m2" annotation(Dialog(tab = "IRRADU1 parameters"));
  parameter Real TIME9 = 9 "Time of first data point, sec" annotation(Dialog(tab = "IRRADU1 parameters"));
  parameter Real IRRADIANCE9 = 100 "Irradiance at first data point, W/m2" annotation(Dialog(tab = "IRRADU1 parameters"));
  parameter Real TIME10 = 10 "Time of first data point, sec" annotation(Dialog(tab = "IRRADU1 parameters"));
  parameter Real IRRADIANCE10 = 100 "Irradiance at first data point, W/m2" annotation(Dialog(tab = "IRRADU1 parameters"));
  parameter Real In_Service_Flag = 1 "In Service Flag, 1: model is in-service, 0: model is OFF" annotation(Dialog(tab = "IRRADU1 parameters"));

  OpalRT.NonElectrical.SignalRouting.PIN2INOUT bus0_PIN2INOUT
    annotation (Placement(transformation(extent={{52,-42},{72,-22}})));
  OpalRT.NonElectrical.Connector.InputInterfacePin bus0_vr
    annotation (Placement(transformation(extent={{-106,34},{-94,46}})));
  OpalRT.NonElectrical.Connector.InputInterfacePin bus0_vi
    annotation (Placement(transformation(extent={{-106,-46},{-94,-34}})));
  OpalRT.NonElectrical.Connector.OutputInterfacePin bus0_ir
    annotation (Placement(transformation(extent={{94,34},{106,46}})));
  OpalRT.NonElectrical.Connector.OutputInterfacePin bus0_ii
    annotation (Placement(transformation(extent={{94,-46},{106,-34}})));

  ModelSets.Old.PVGU1_PVEU1_PANELU1_IRRADU1_OLD modelSet(
      partType = partType,
      IBUS = IBUS,
      SB = SB,
      fn = fn,
      Vt_abs = Vt_abs,
      Vt_ang = Vt_ang,
      P_gen = P_gen,
      Q_gen = Q_gen,
      TIQCmd = TIQCmd,
      TIPCmd = TIPCmd,
      VLVPL1 = VLVPL1,
      VLVPL2 = VLVPL2,
      GLVPL = GLVPL,
      VHVRCR = VHVRCR,
      CURHVRCR = CURHVRCR,
      RIp_LVPL = RIp_LVPL,
      T_LVPL = T_LVPL,
      ZSOURCE_RE = ZSOURCE_RE,
      Positive_sequence = Positive_sequence,
      Vbase = Vbase,
      Sbase_network = Sbase_network,
      PDCMAX200 = PDCMAX200,
      PDCMAX400 = PDCMAX400,
      PDCMAX600 = PDCMAX600,
      PDCMAX800 = PDCMAX800,
      PDCMAX1000 = PDCMAX1000,
      TIME1 = TIME1,
      IRRADIANCE1 = IRRADIANCE1,
      TIME2 = TIME2,
      IRRADIANCE2 = IRRADIANCE2,
      TIME3 = TIME3,
      IRRADIANCE3 = IRRADIANCE3,
      TIME4 = TIME4,
      IRRADIANCE4 = IRRADIANCE4,
      TIME5 = TIME5,
      IRRADIANCE5 = IRRADIANCE5,
      TIME6 = TIME6,
      IRRADIANCE6 = IRRADIANCE6,
      TIME7 = TIME7,
      IRRADIANCE7 = IRRADIANCE7,
      TIME8 = TIME8,
      IRRADIANCE8 = IRRADIANCE8,
      TIME9 = TIME9,
      IRRADIANCE9 = IRRADIANCE9,
      TIME10 = TIME10,
      IRRADIANCE10 = IRRADIANCE10,
      In_Service_Flag = In_Service_Flag)
    annotation (Placement(transformation(extent={{-18,2},{18,38}})));
equation
  connect(bus0_PIN2INOUT.vr, bus0_vr) annotation (Line(points={{52,-24.2},{-6,-24.2},
          {-6,-24},{-80,-24},{-80,40},{-100,40}}, color={0,0,127}));
  connect(bus0_PIN2INOUT.vi, bus0_vi) annotation (Line(points={{51.8,-31.8},{-40,
          -31.8},{-40,-40},{-100,-40}}, color={0,0,127}));
  connect(bus0_PIN2INOUT.ir, bus0_ir) annotation (Line(points={{72.2,-27.6},{80,
          -27.6},{80,40},{100,40}}, color={0,0,127}));
  connect(bus0_PIN2INOUT.ii, bus0_ii) annotation (Line(points={{72.2,-36},{80,-36},
          {80,-40},{100,-40}}, color={0,0,127}));

  connect(modelSet.bus0, bus0_PIN2INOUT.p) annotation (Line(points={{18,12.8},{40,
          12.8},{40,-40},{52,-40}},    color={0,0,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end PVGU1_PVEU1_PANELU1_IRRADU1_OLD;
