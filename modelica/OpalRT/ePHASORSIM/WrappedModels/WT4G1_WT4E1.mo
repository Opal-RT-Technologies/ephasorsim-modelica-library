within OpalRT.ePHASORSIM.WrappedModels;
block WT4G1_WT4E1
  extends Wrappers.FMUTemplateInjectionPRef(
    redeclare ModelSets.WT4G1.WT4G1_WT4E1 modelSet(
      partType = partType,
      SB=SB,
      fn=fn,
      Vt_abs=Vt_abs,
      Vt_ang=Vt_ang,
      P_gen=P_gen,
      Q_gen=Q_gen,
      TIQCmd=TIQCmd,
      TIPCmd=TIPCmd,
      VLVPL1=VLVPL1,
      VLVPL2=VLVPL2,
      GLVPL=GLVPL,
      VHVRCR=VHVRCR,
      CURHVRCR=CURHVRCR,
      RIp_LVPL=RIp_LVPL,
      T_LVPL=T_LVPL,
      ZSOURCE_RE = ZSOURCE_RE,
      Positive_sequence = Positive_sequence,
      Vbase = Vbase,
      Sbase_network = Sbase_network,
      Tfv = Tfv,
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
      Remote_bus = Remote_bus,
      PFAFLG = PFAFLG,
      VARFLG = VARFLG,
      PQFLAG = PQFLAG));

  parameter Real partType = 1;
  constant Real pi = Modelica.Constants.pi;
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
  // parameters required for initialization
  parameter Real Tfv = 0.15 "- V-regulator filter" annotation(Dialog(tab = "Dynamic parameters"));
  parameter Real Kpv = 18 "- V-regulator proportional gain" annotation(Dialog(tab = "Dynamic parameters"));
  parameter Real Kiv = 5 "- V-regulator integrator gain" annotation(Dialog(tab = "Dynamic parameters"));
  parameter Real Kpp = 0.05 "- T-regulator proportional gain" annotation(Dialog(tab = "Dynamic parameters"));
  parameter Real Kip = 0.1 "- T-regulator integrator gain" annotation(Dialog(tab = "Dynamic parameters"));
  parameter Real Kf = 0 "- Rate feedback gain" annotation(Dialog(tab = "Dynamic parameters"));
  parameter Real Tf = 0.08 "- Rate feedback time constant" annotation(Dialog(tab = "Dynamic parameters"));
  parameter Real QMX = 0.47 "- V-regulator max limit" annotation(Dialog(tab = "Dynamic parameters"));
  parameter Real QMN = -0.47 "- V-regulator min limit" annotation(Dialog(tab = "Dynamic parameters"));
  parameter Real IPMAX = 1.1 "- Max active current limit" annotation(Dialog(tab = "Dynamic parameters"));
  parameter Real TRV = 0 "- V-sensor" annotation(Dialog(tab = "Dynamic parameters"));
  parameter Real dPMX = 0.5 "- Max limit in power PI controller (pu)" annotation(Dialog(tab = "Dynamic parameters"));
  parameter Real dPMN = -0.5 "- Min limit in power PI controller (pu)" annotation(Dialog(tab = "Dynamic parameters"));
  parameter Real T_POWER = 0.05 "- Power filter time constant" annotation(Dialog(tab = "Dynamic parameters"));
  parameter Real KQi = 0.1 "- MVAR/Volt gain" annotation(Dialog(tab = "Dynamic parameters"));
  parameter Real VMINCL = 0.9 annotation(Dialog(tab = "Dynamic parameters"));
  parameter Real VMAXCL = 1.1 annotation(Dialog(tab = "Dynamic parameters"));
  parameter Real KVi = 120 "- Volt/MVAR gain" annotation(Dialog(tab = "Dynamic parameters"));
  parameter Real Tv = 0.05 "- Lag time constant in WindVar controller" annotation(Dialog(tab = "Dynamic parameters"));
  parameter Real Tp = 0.05 "- Pelec filter in fast PF controller" annotation(Dialog(tab = "Dynamic parameters"));
  parameter Real ImaxTD = 1.7 "- Converter current limit" annotation(Dialog(tab = "Dynamic parameters"));
  parameter Real Iphl = 1.11 "- Hard active current limit" annotation(Dialog(tab = "Dynamic parameters"));
  parameter Real Iqhl = 1.11 "- Hard reactive current limit" annotation(Dialog(tab = "Dynamic parameters"));
  // ICONs
  parameter Real Remote_bus = 0 "ICONM : # for voltage control; 0 for local control" annotation(Dialog(tab = "ICONs"));
  parameter Real PFAFLG = 0 "ICONM1 :=1 if PF fast control enabled" annotation(Dialog(tab = "ICONs"));
  parameter Real VARFLG = 1 "ICONM2 :=1 if Qord is provided by WindVar" annotation(Dialog(tab = "ICONs"));
  parameter Real PQFLAG = 0 "ICONM3 :=1 for P priority, =0 for Q priority" annotation(Dialog(tab = "ICONs"));
end WT4G1_WT4E1;
