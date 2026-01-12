within OpalRT.Electrical.Renewable.WindTurbineGenerator.WT4;
model WT4E1 "Electrical control models for Type 4 wind generator"
  parameter Real ETERM0(fixed = false) "Initial terminal voltage from power flow, p.u.";
  parameter Real PELEC0 = 1 "Initial active power from power flow, p.u.";
  parameter Real QELEC0 = 0.1 "Initial reactive power from power flow, p.u.";
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
  parameter Real Remote_bus = 0 "ICONM : # for voltage control; 0 for local control" annotation(Dialog(tab = "ICONs"));
  parameter Real PFAFLG = 0 "ICONM1 :=1 if PF fast control enabled" annotation(Dialog(tab = "ICONs"));
  parameter Real VARFLG = 1 "ICONM2 :=1 if Qord is provided by WindVar" annotation(Dialog(tab = "ICONs"));
  parameter Real PQFLAG = 0 "ICONM3 :=1 for P priority, =0 for Q priority" annotation(Dialog(tab = "ICONs"));

  Modelica.Blocks.Interfaces.RealOutput WIPCMD annotation(Placement(visible = true, transformation(origin = {100, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput WIQCMD annotation(Placement(visible = true, transformation(origin = {100, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput ETERM annotation(Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput PELEC annotation(Placement(visible = true, transformation(origin = {-100, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Vmag_REMOTE annotation(Placement(visible = true, transformation(origin = {-100, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput WIPCMD0 annotation(Placement(visible = true, transformation(origin = {20, 100}, extent = {{-10, -10}, {10, 10}}, rotation = -90), iconTransformation(origin = {40, 100}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealInput WIQCMD0 annotation(Placement(visible = true, transformation(origin = {-40, 100}, extent = {{-10, -10}, {10, 10}}, rotation = -90), iconTransformation(origin = {-20, 100}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  OpalRT.NonElectrical.SignalRouting.Multiplexer multiplexer1(s = if Remote_bus == 0 then 1 else 2, n = 2) annotation(Placement(visible = true, transformation(origin = {-70, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.Electrical.Renewable.WindTurbineGenerator.WT4.Internal.CurrentControlLogic
    ccl1(
    QMX=QMX,
    ImaxTD=ImaxTD,
    Iphl=Iphl,
    Iqhl=Iqhl,
    PQFLAG=PQFLAG) annotation (Placement(visible=true, transformation(
        origin={-10,-10},
        extent={{-20,-20},{20,20}},
        rotation=0)));
  OpalRT.Electrical.Renewable.WindTurbineGenerator.WT4.Internal.PControl
    pcontrol1(
    Kpp=Kpp,
    Kip=Kip,
    Kf=Kf,
    Tf=Tf,
    dPMX=dPMX,
    dPMN=dPMN,
    T_POWER=T_POWER,
    PELEC0=PELEC0,
    WIP0=WIP0,
    ETERM0=ETERM0) annotation (Placement(visible=true, transformation(
        origin={-20,-70},
        extent={{-20,-20},{20,20}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealInput QELEC annotation(Placement(visible = true, transformation(origin = {-100, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Pref annotation(Placement(visible = true, transformation(origin = {-70, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-10, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Interfaces.RealOutput Pref0 annotation(Placement(visible = true, transformation(origin = {-70, -80}, extent = {{10, -10}, {-10, 10}}, rotation = 0), iconTransformation(origin = {30, -100}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  OpalRT.Electrical.Renewable.WindTurbineGenerator.WT4.Internal.QControl
    qcontrol1(
    Tfv=Tfv,
    Kpv=Kpv,
    Kiv=Kiv,
    QMX=QMX,
    QMN=QMN,
    TRV=TRV,
    KQi=KQi,
    VMINCL=VMINCL,
    VMAXCL=VMAXCL,
    KVi=KVi,
    Tv=Tv,
    Tp=Tp,
    PFAFLG=PFAFLG,
    VARFLG=VARFLG,
    ETERM0=ETERM0,
    PELEC0=PELEC0,
    QELEC0=QELEC0,
    WIQ0=WIQ0,
    VARL=ETERM0) annotation (Placement(visible=true, transformation(
        origin={-20,50},
        extent={{-15,-15},{15,15}},
        rotation=0)));
protected
  parameter Real WIQ0(fixed = false);
  parameter Real WIP0(fixed = false);
initial equation
  WIP0 = WIPCMD0;
  WIQ0 = WIQCMD0;
equation
  connect(ccl1.IQMAX, qcontrol1.IQMAX) annotation(Line(points = {{-10, 10}, {-10.2506, 10}, {-11, 35}, {-11, 35}}, color = {0, 0, 127}));
  connect(ccl1.IQMIN, qcontrol1.IQMIN) annotation(Line(points = {{-22, 10}, {-20.7289, 10}, {-20, 35}, {-20, 35}}, color = {0, 0, 127}));
  connect(multiplexer1.y, qcontrol1.Vmag_REMOTE) annotation(Line(points = {{-60, 10}, {-56.9476, 10}, {-56.9476, 57.1754}, {-40.7745, 62}, {-35, 62}}, color = {0, 0, 127}));
  connect(qcontrol1.ETERM, ETERM) annotation(Line(points = {{-35, 54.5}, {-54.8975, 54.5}, {-54.8975, -0.683371}, {-100, -0.683371}, {-100, 0}}, color = {0, 0, 127}));
  connect(qcontrol1.PELEC, PELEC) annotation(Line(points = {{-35, 47}, {-52.6196, 47}, {-52.6196, -60.3645}, {-100, -60.3645}, {-100, -60}}, color = {0, 0, 127}));
  connect(QELEC, qcontrol1.QELEC) annotation(Line(points = {{-100, -30}, {-47.3804, -30}, {-47.3804, 32.8018}, {-40.5467, 38}, {-35, 38}}, color = {0, 0, 127}));
  connect(qcontrol1.WIQCMD, ccl1.WIQCMD) annotation(Line(points = {{-5, 50}, {2.73349, 50}, {2.73349, 10}, {2, 10}}, color = {0, 0, 127}));
  connect(WIQCMD, qcontrol1.WIQCMD) annotation(Line(points = {{100, 60}, {48.9749, 60}, {48.9749, 44.8747}, {-9.79499, 50}, {-5, 50}}, color = {0, 0, 127}));
  connect(Pref0, pcontrol1.Pref0) annotation(Line(points = {{-70, -80}, {-44.9294, -80}, {-44.9294, -59.8203}, {-40, -59.8203}, {-40, -60}}, color = {0, 0, 127}));
  connect(Pref, pcontrol1.Pref) annotation(Line(points = {{-70, -50}, {-43.6457, -50}, {-43.6457, -55.9692}, {-38, -55.9692}, {-38, -56}}, color = {0, 0, 127}));
  connect(pcontrol1.ETERM, ccl1.ETERM) annotation(Line(points = {{-40, -70}, {-46.2131, -70}, {-46.2131, -20.2824}, {-30, -20.2824}, {-30, -20}}, color = {0, 0, 127}));
  connect(WIPCMD, pcontrol1.WIPCMD) annotation(Line(points = {{100, -40}, {54.2141, -40}, {54.2141, -82.4601}, {0, -82.4601}, {0, -82}}, color = {0, 0, 127}));
  connect(pcontrol1.WIPCMD, ccl1.WIPCMD) annotation(Line(points = {{1.11022e-15, -82}, {2.50569, -82}, {2.50569, -30}, {2, -30}}, color = {0, 0, 127}));
  connect(ccl1.IPMAX, pcontrol1.IPMAX) annotation(Line(points = {{-18, -30}, {-19.8178, -30}, {-19.8178, -52}, {-20, -52}}, color = {0, 0, 127}));
  connect(pcontrol1.PELEC, PELEC) annotation(Line(points = {{-40, -82}, {-52.8474, -82}, {-52.8474, -61.7312}, {-100, -61.7312}, {-100, -60}}, color = {0, 0, 127}));
  connect(ccl1.ETERM, ETERM) annotation(Line(points = {{-30, -20}, {-55.1253, -20}, {-55.1253, -1.59453}, {-100, -1.59453}, {-100, 0}}, color = {0, 0, 127}));
  connect(Vmag_REMOTE, multiplexer1.u[2]) annotation(Line(points = {{-100, 20}, {-80.1822, 20}, {-80.1822, 10.5}, {-80, 10.5}}, color = {0, 0, 127}));
  connect(ETERM, multiplexer1.u[1]) annotation(Line(points = {{-100, 0}, {-80.41, 0}, {-80.41, 9.5}, {-80, 9.5}}, color = {0, 0, 127}));
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1})), Documentation(info = "<html>

<p>
WT4E Electrical Control Module
</p>
<p>
<b>NOTE 1</b>: Variable limits of non-windup integrator for state K+7 are assumed fixed and they are equal to the initialization value
</p>
<p>
<b>NOTE 2</b>: Values for QMX and QMN limits should be large enough to match the results of PSSe.
</p>
<img src=\"modelica://OpalRT/resource/Electrical/Wind_Turbine/WT4/WT4E1.png\"


</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1}), graphics={  Rectangle(origin = {0.22779, 0.113895}, extent = {{-99.7722, 99.6583}, {99.7722, -99.6583}}), Text(origin = {-70.6169, 80.9771}, extent = {{-16.4, 9.91}, {16.4, -9.91}}, textString = "ETERM"), Text(origin = {-75.4215, 65.6964}, extent = {{-11.6164, -26.9921}, {58.9968, -42.0285}}, textString = "Vmag_REMOTE"), Text(origin = {-79.7748, 15.3278}, extent = {{-11.62, -26.99}, {30.754, -41.3466}}, textString = "PELEC"), Text(origin = {-79.8, -44.38}, extent = {{-11.62, -26.99}, {30.75, -41.35}}, textString = "QELEC"), Text(origin = {53.66, -6.82}, extent = {{-11.62, -26.99}, {30.75, -41.35}}, textString = "WIPCMD"), Text(origin = {55, 64.46}, extent = {{-11.62, -26.99}, {30.75, -41.35}}, textString = "WIQCMD"), Text(origin = {-30.4414, 118.198}, extent = {{-11.62, -26.99}, {37.3559, -46.817}}, textString = "WIQCMD0"), Text(origin = {31.0344, 117.49}, extent = {{-11.62, -26.99}, {34.3946, -44.9946}}, textString = "WIPCMD0"), Text(origin = {-43.1207, 50.6084}, extent = {{-11.62, -26.99}, {122.55, -78.7076}}, textString = "WT4E1"), Text(origin = {-13.0572, -46.9644}, extent = {{-11.62, -26.99}, {17.913, -43.1472}}, textString = "Pref"), Text(origin = {26.72, -45.44}, extent = {{-11.62, -26.99}, {17.91, -43.15}}, textString = "Pref0")}));
end WT4E1;
