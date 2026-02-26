within OpalRT.ModelSets.PVGU1;
partial model PVGU1_PVEU1Base
  extends PVGU1Base;

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
  parameter Real PMX = 1 "Max power from PV plant, MW" annotation(Dialog(tab = "PVEU1 parameters"));
  // ICONs
  parameter Real Remote_bus = 0 "ICONM : Remote bus # for voltage control; 0 for local control" annotation(Dialog(tab = "PVEU1 parameters"));
  parameter Real PFAFLG = 0 "ICONM1 :=1 if PF fast control enabled" annotation(Dialog(tab = "PVEU1 parameters"));
  parameter Real VARFLG = 1 "ICONM2 :=1 if Qord is provided by WindVar" annotation(Dialog(tab = "PVEU1 parameters"));
  parameter Real PQFLAG = 0 "ICONM3 :=1 for P priority, =0 for Q priority" annotation(Dialog(tab = "PVEU1 parameters"));
  OpalRT.Electrical.Renewable.PhotoVoltaic.PVEU1 pveu1(ETERM0 = Vt_abs, Tfv = Tw, Kpv = Kpv, Kiv = Kiv, Kpp = Kpp, Kip = Kip, Kf = Kf, Tf = Tf, QMX = QMX, QMN = QMN, IPMAX = IPMAX, TRV = TRV, dPMX = dPMX, dPMN = dPMN, T_POWER = T_POWER, KQi = KQi, VMINCL = VMINCL, VMAXCL = VMAXCL, KVi = KVi, Tv = Tv, Tp = Tp, ImaxTD = ImaxTD, Iphl = Iphl, Iqhl = Iqhl, PMX = PMX, Remote_bus = Remote_bus, PFAFLG = PFAFLG, VARFLG = VARFLG, PQFLAG = PQFLAG, PELEC0 = P_gen0, QELEC0 = Q_gen0) annotation(Placement(visible = true, transformation(origin = {-40, 40}, extent = {{-18.75, -18.75}, {18.75, 18.75}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 1) annotation(Placement(visible = true, transformation(origin = {-80, 60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
protected
  parameter Real P_gen0(fixed = false) "The initial values of P";
  parameter Real Q_gen0(fixed = false) "The initial values of Q";
initial equation
  P_gen0 = P_gen / SB;
  Q_gen0 = Q_gen / SB;
equation
  connect(const.y, pveu1.Vmag_REMOTE) annotation(Line(points = {{-74.5, 60}, {-70.0947, 60}, {-70.0947, 47.3613}, {-70.0947, 47.3613}, {-70.0947, 45.1962}, {-58.75, 45.1962}, {-58.75, 45.625}}, color = {0, 0, 127}));
  connect(pvgu1.QELEC, pveu1.QELEC) annotation(Line(points = {{35, -6}, {55.2097, -6}, {55.2097, 96.3464}, {-94.9932, 96.3464}, {-94.9932, 24.0866}, {-59.2693, 24.0866}, {-59.2693, 25}, {-58.75, 25}}, color = {0, 0, 127}));
  connect(pvgu1.PELEC, pveu1.PELEC) annotation(Line(points = {{35, 0}, {49.5264, 0}, {49.5264, 91.475}, {-87.9567, 91.475}, {-87.9567, 35.9946}, {-60.0812, 35.9946}, {-60.0812, 36.25}, {-58.75, 36.25}}, color = {0, 0, 127}));
  connect(pvgu1.VTt, pveu1.ETERM) annotation(Line(points = {{26, 15}, {25.9811, 15}, {25.9811, 75.7781}, {-66.5765, 75.7781}, {-66.5765, 55.4804}, {-59.2693, 55.4804}, {-59.2693, 55}, {-58.75, 55}}, color = {0, 0, 127}));
  connect(pveu1.WIPCMD0, pvgu1.Ipcmd00) annotation(Line(points = {{-32.5, 58.75}, {-31.935, 58.75}, {-31.935, 68.4709}, {19.7564, 68.4709}, {19.7564, 15}, {20, 15}}, color = {0, 0, 127}));
  connect(pvgu1.Iqcmd00, pveu1.WIQCMD0) annotation(Line(points = {{11, 15}, {11, 14.3166}, {11, 65.3759}, {-44.4191, 65.3759}, {-44.4191, 58.75}, {-43.75, 58.75}}, color = {0, 0, 127}));
  connect(pveu1.WIPCMD, pvgu1.IPCMD) annotation(Line(points = {{-21.25,32.5},{
          -12.4183,32.5},{-12.4183,-2.83224},{5,-2.83224},{5,-3}}, color = {0, 0, 127}));
  connect(pveu1.WIQCMD, pvgu1.IQCMD) annotation(Line(points = {{-21.25, 45.625}, {-6.08485, 45.625}, {-6.08485, 5.35592}, {4.6213, 5.35592}, {4.6213, 6}, {5, 6}}, color = {0, 0, 127}));
end PVGU1_PVEU1Base;
