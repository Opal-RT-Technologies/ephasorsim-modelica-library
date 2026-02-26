within OpalRT.ePHASORSIM.WrappedModels;
block PVGU1_PVEU1_PANELU1_IRRADU1
  extends Wrappers.FMUTemplateInjection(
    redeclare ModelSets.PVGU1.PVGU1_PVEU1_PANELU1_IRRADU1 modelSet(
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
      Tw = Tw,
      Kpv = Kpv,
      Kiv = Kiv,
      Kpp = Kpp,
      Kip = Kip,
      Kf = Kf,
      Tf = Tf,
      QMX = QMX,
      QMN = QMN,
      IPMAX = IPMAX,
      TRV = TRV,
      dPMX = dPMX,
      dPMN = dPMN,
      T_POWER = T_POWER,
      KQi = KQi,
      VMINCL = VMINCL,
      VMAXCL = VMAXCL,
      KVi = KVi,
      Tv = Tv,
      Tp = Tp,
      ImaxTD = ImaxTD,
      Iphl = Iphl,
      Iqhl = Iqhl,
      PMX = PMX,
      Remote_bus = Remote_bus,
      PFAFLG = PFAFLG,
      VARFLG = VARFLG,
      PQFLAG = PQFLAG,
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
      In_Service_Flag = In_Service_Flag));

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
  // PVEU1 parameters
  parameter Real Tw = 0.15 "- V-regulator filter" annotation(Dialog(tab = "PVEU1 parameters"));
  parameter Real Kpv = 18 "- V-regulator proportional gain" annotation(Dialog(tab = "PVEU1 parameters"));
  parameter Real Kiv = 5 "- V-regulator integrator gain" annotation(Dialog(tab = "PVEU1 parameters"));
  parameter Real Kpp = 0.05 "- T-regulator proportional gain" annotation(Dialog(tab = "PVEU1 parameters"));
  parameter Real Kip = 0.1 "- T-regulator integrator gain" annotation(Dialog(tab = "PVEU1 parameters"));
  parameter Real Kf = 0 "- Rate feedback gain" annotation(Dialog(tab = "PVEU1 parameters"));
  parameter Real Tf = 0.08 "- Rate feedback time constant" annotation(Dialog(tab = "PVEU1 parameters"));
  parameter Real QMX = 0.47 "- V-regulator max limit" annotation(Dialog(tab = "PVEU1 parameters"));
  parameter Real QMN = -0.47 "- V-regulator min limit" annotation(Dialog(tab = "PVEU1 parameters"));
  parameter Real IPMAX = 1.1 "- Max active current limit" annotation(Dialog(tab = "PVEU1 parameters"));
  parameter Real TRV = 0 "- V-sensor" annotation(Dialog(tab = "PVEU1 parameters"));
  parameter Real dPMX = 0.5 "- Max limit in power PI controller (pu)" annotation(Dialog(tab = "PVEU1 parameters"));
  parameter Real dPMN = -0.5 "- Min limit in power PI controller (pu)" annotation(Dialog(tab = "PVEU1 parameters"));
  parameter Real T_POWER = 0.05 "- Power filter time constant" annotation(Dialog(tab = "PVEU1 parameters"));
  parameter Real KQi = 0.1 "- MVAR/Volt gain" annotation(Dialog(tab = "PVEU1 parameters"));
  parameter Real VMINCL = 0.9 "- Minimum voltage limit" annotation(Dialog(tab = "PVEU1 parameters"));
  parameter Real VMAXCL = 1.1 "- Maximum voltage limit" annotation(Dialog(tab = "PVEU1 parameters"));
  parameter Real KVi = 120 "- Volt/MVAR gain" annotation(Dialog(tab = "PVEU1 parameters"));
  parameter Real Tv = 0.05 "- Lag time constant in WindVar controller" annotation(Dialog(tab = "PVEU1 parameters"));
  parameter Real Tp = 0.05 "- Pelec filter in fast PF controller" annotation(Dialog(tab = "PVEU1 parameters"));
  parameter Real ImaxTD = 1.7 "- Converter current limit" annotation(Dialog(tab = "PVEU1 parameters"));
  parameter Real Iphl = 1.11 "- Hard active current limit" annotation(Dialog(tab = "PVEU1 parameters"));
  parameter Real Iqhl = 1.11 "- Hard reactive current limit" annotation(Dialog(tab = "PVEU1 parameters"));
  parameter Real PMX = 1.0 "- Max power From PV plant, MW" annotation(Dialog(tab = "PVEU1 parameters"));
  parameter Real Remote_bus = 0 "ICONM : Remote bus# for voltage control; 0 for local control" annotation(Dialog(tab = "PVEU1 parameters"));
  parameter Real PFAFLG = 0 "ICONM1 :=1 if PF fast control enabled" annotation(Dialog(tab = "PVEU1 parameters"));
  parameter Real VARFLG = 1 "ICONM2 :=1 if Qord is provided by WindVar" annotation(Dialog(tab = "PVEU1 parameters"));
  parameter Real PQFLAG = 0 "ICONM3 :=1 for P priority, =0 for Q priority" annotation(Dialog(tab = "PVEU1 parameters"));
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

end PVGU1_PVEU1_PANELU1_IRRADU1;
