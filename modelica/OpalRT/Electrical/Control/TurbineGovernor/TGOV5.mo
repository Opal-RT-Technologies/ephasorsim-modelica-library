within OpalRT.Electrical.Control.TurbineGovernor;
model TGOV5
  extends OpalRT.Electrical.PartialModel.TurbineGovernor;
  parameter Real JBUS = 0 "located system bus" annotation(Dialog(tab = "General"));
  parameter Real M = 0 "Second machine identifier" annotation(Dialog(tab = "General"));
  parameter Real K = 20 annotation(Dialog(tab = "GOV"));
  parameter Real T1 = 0.5 "(sec)" annotation(Dialog(tab = "GOV"));
  parameter Real T2 = 1 "(sec)" annotation(Dialog(tab = "GOV"));
  parameter Real T3 = 1 "(>0)(sec)" annotation(Dialog(tab = "GOV"));
  parameter Real Uo = 0.1 "(pu/sec)" annotation(Dialog(tab = "GOV"));
  parameter Real Uc = -0.2 "(<0)(pu/sec)" annotation(Dialog(tab = "GOV"));
  parameter Real VMAX = 1 "(pu on machine MVA rating)" annotation(Dialog(tab = "GOV"));
  parameter Real VMIN = 0 "(pu on machine MVA rating)" annotation(Dialog(tab = "GOV"));
  parameter Real T4 = 0.4 "(sec)" annotation(Dialog(tab = "GOV"));
  parameter Real K1 = 0.2 annotation(Dialog(tab = "GOV"));
  parameter Real K2 = 0 annotation(Dialog(tab = "GOV"));
  parameter Real T5 = 7 "(sec)" annotation(Dialog(tab = "GOV"));
  parameter Real K3 = 0.1 annotation(Dialog(tab = "GOV"));
  parameter Real K4 = 0 annotation(Dialog(tab = "GOV"));
  parameter Real T6 = 0.6 "(sec)" annotation(Dialog(tab = "GOV"));
  parameter Real K5 = 0.2 annotation(Dialog(tab = "GOV"));
  parameter Real K6 = 0 annotation(Dialog(tab = "GOV"));
  parameter Real T7 = 0.3 "(sec)" annotation(Dialog(tab = "GOV"));
  parameter Real K7 = 0.1 annotation(Dialog(tab = "GOV"));
  parameter Real K8 = 0 annotation(Dialog(tab = "GOV"));
  parameter Real K9 = 0.01 annotation(Dialog(tab = "BOILER"));
  parameter Real K10 = 0.01 annotation(Dialog(tab = "BOILER"));
  parameter Real K11 = 0.01 annotation(Dialog(tab = "BOILER"));
  parameter Real K12 = 0.01 annotation(Dialog(tab = "LoadReferenceControl"));
  parameter Real K13 = 0.01 annotation(Dialog(tab = "LoadReferenceControl"));
  parameter Real K14 = 0.01 annotation(Dialog(tab = "LoadReferenceControl"));
  parameter Real RMAX = 0.01 annotation(Dialog(tab = "LoadReferenceControl"));
  parameter Real RMIN = 0.01 annotation(Dialog(tab = "LoadReferenceControl"));
  parameter Real LMAX = 0.01 annotation(Dialog(tab = "LoadReferenceControl"));
  parameter Real LMIN = 0.01 annotation(Dialog(tab = "LoadReferenceControl"));
  parameter Real C1 = 0.01 annotation(Dialog(tab = "BOILER"));
  parameter Real C2 = 0.01 annotation(Dialog(tab = "LoadReferenceControl"));
  parameter Real C3 = 0.01 annotation(Dialog(tab = "LoadReferenceControl"));
  parameter Real B = 0.01 annotation(Dialog(tab = "LoadReferenceControl"));
  parameter Real CB = 0.01 "(>0)(sec)" annotation(Dialog(tab = "BOILER"));
  parameter Real KI = 0.01 annotation(Dialog(tab = "BOILER"));
  parameter Real TI = 0.01 "(sec)" annotation(Dialog(tab = "BOILER"));
  parameter Real TR = 0.01 "(sec)" annotation(Dialog(tab = "BOILER"));
  parameter Real TR1 = 0.01 "(sec)" annotation(Dialog(tab = "BOILER"));
  parameter Real CMAX = 0.01 annotation(Dialog(tab = "BOILER"));
  parameter Real CMIN = 0.01 annotation(Dialog(tab = "BOILER"));
  parameter Real TD = 0.01 "(sec)" annotation(Dialog(tab = "BOILER"));
  parameter Real TF = 0.01 "(sec)" annotation(Dialog(tab = "BOILER"));
  parameter Real TW = 0.01 "(sec)" annotation(Dialog(tab = "BOILER"));
  parameter Real PSP = 0.01 "initial(>0)" annotation(Dialog(tab = "BOILER"));
  parameter Real TMW = 0.01 "(sec)" annotation(Dialog(tab = "LoadReferenceControl"));
  parameter Real KL = 0.01 "0.0 or 1.0" annotation(Dialog(tab = "LoadReferenceControl"));
  parameter Real KMW = 0.01 "0.0 or 1.0" annotation(Dialog(tab = "LoadReferenceControl"));
  parameter Real DPE = 0.01 "pu pressure" annotation(Dialog(tab = "LoadReferenceControl"));

  OpalRT.Electrical.Control.TurbineGovernor.Internal.TurbineGovernor gov1(
    PT0=PT0,
    ms0=ms0,
    PO0=PO0,
    K=K,
    T1=T1,
    T2=T2,
    T3=T3,
    Uo=Uo,
    Uc=Uc,
    VMAX=VMAX,
    VMIN=VMIN,
    T4=T4,
    K1=K1,
    K2=K2,
    T5=T5,
    K3=K3,
    K4=K4,
    T6=T6,
    K5=K5,
    K6=K6,
    T7=T7,
    K7=K7,
    K8=K8) annotation (Placement(visible=true, transformation(
        origin={-6.25,61.75},
        extent={{-20.25,-20.25},{20.25,20.25}},
        rotation=0)));
  OpalRT.Electrical.Control.TurbineGovernor.Internal.CoordinatedController
    lrctrl1(
    PO0=PO0,
    C2_v0=C2_v0,
    C3_v0=C3_v0,
    Des_MW0=Des_MW0,
    PSP0=PSP0,
    K12=K12,
    K13=K13,
    K14=K14,
    RMAX=RMAX,
    RMIN=RMIN,
    LMAX=LMAX,
    LMIN=LMIN,
    C2=C2,
    C3=C3,
    B=B,
    TMW=TMW,
    KL=KL,
    KMW=KMW,
    DPE=DPE,
    PSP=PSP) annotation (Placement(visible=true, transformation(
        origin={-2,2},
        extent={{-20.75,-20.75},{20.75,20.75}},
        rotation=0)));
  Modelica.Blocks.Math.Gain gain3(k = 1 / Modelica.Constants.pi / 2) annotation(Placement(visible = true, transformation(origin = {-66, -66}, extent = {{5, -5}, {-5, 5}}, rotation = 180)));
  Modelica.Blocks.Sources.Constant const2(k = Des_MW0) annotation(Placement(visible = true, transformation(origin = {-147, 61}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1(k1 = -1) annotation(Placement(visible = true, transformation(origin = {34, -4}, extent = {{-5, 5}, {5, -5}}, rotation = 0)));
  NonElectrical.Math.Continuous.TransferFunctionWindup.PID_WindupLimit drum_pressure_controller(KP = KI * (TI + TR - TR1), KI = KI, KD = KI * (TI - TR1) * (TR - TR1), TD = TR1, MIN = CMIN, MAX = CMAX, y_start = cntrl0) annotation(Placement(visible = true, transformation(origin = {54, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Internal.Boiler boiler(
    K9=K9,
    CB=CB,
    C1=C1,
    PD0=PD0) annotation (Placement(transformation(
        rotation=-90,
        extent={{-10,10},{10,-10}},
        origin={-46,-10})));
  Internal.FuelDynamic fuelDynamic(
    K10=K10,
    K11=K11,
    TF=TF,
    TW=TW,
    TD=TD,
    ms0=ms0) annotation (Placement(transformation(rotation=0, extent={{72,34},{
            92,14}})));
  Modelica.Blocks.Math.Add add2 annotation(Placement(visible = true, transformation(origin = {-100, 60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
protected
  parameter Real ms0(fixed = false);
  parameter Real PO0(fixed = false);
  parameter Real PT0(fixed = false);
  parameter Real PSP0(fixed = false);
  parameter Real PD0(fixed = false);
  parameter Real Dem_MW0(fixed = false);
  parameter Real Des_MW0(fixed = false);
  parameter Real C2_v0(fixed = false);
  parameter Real C3_v0(fixed = false);
  parameter Real PMECH_0(fixed = false);
  parameter Real cntrl0(fixed = false);
initial equation
  PMECH_0 = PMECH0;
  ms0 = PMECH_0 / (K1 + K3 + K5 + K7);
  PO0 = ms0 / PT0;
  PSP0 = PSP;
  PT0 = PSP0;
  PD0 = (PT0 + C1 * ms0 ^ 2.0) / (1.0 + K9 * ms0 ^ 2.0);
  Dem_MW0 = if KMW == 1.0 then PELEC else if KL == 1.0 then PO0 else 0.0;
  Des_MW0 = Dem_MW0;
  cntrl0 = (1 - K10) * ms0 - K11 * Des_MW0;
  C2_v0 = if C2 < 0.0 then PELEC else C2;
  C3_v0 = if K13 == 0.0 then PSP0 else if K13 <> 0 and K14 <> 0 then PSP0 - K13 * Dem_MW0 else C3;
equation
  connect(add2.y, lrctrl1.Dem_MW) annotation(Line(points={{-94.5,60},{-82.7763,
          60},{-82.7763,11.8252},{-21.505,11.8252},{-21.505,11.96}},                                                                                     color = {0, 0, 127}));
  connect(dGREF, add2.u1) annotation(Line(points={{-100,80},{-117.738,80},{
          -117.738,62.7249},{-106,62.7249},{-106,63}},                                                                                          color = {0, 0, 127}));
  lrctrl1.PELEC = PELEC;
  connect(lrctrl1.PO, gov1.PO) annotation(Line(points = {{18.75, -15.43}, {24, -15.43}, {24, -36}, {-76, -36}, {-76, 62}, {-26.095, 62}, {-26.095, 61.345}}, color = {0, 0, 127}));
  connect(SLIP, gov1.SLIP) annotation(Line(points = {{-102, 0}, {-130, 0}, {-130, 90}, {-78, 90}, {-78, 79.165}, {-26.095, 79.165}}, color = {0, 0, 127}));
  connect(gov1.PMECH_LP, PMECH_LP) annotation(Line(points = {{14, 53.65}, {62, 53.65}, {62, 54}, {122, 54}, {122, -60}, {104, -60}}, color = {0, 0, 127}));
  connect(gov1.PMECH_HP, PMECH) annotation(Line(points = {{14.405, 77.14}, {14, 77.14}, {14, 78}, {112, 78}, {112, 0}, {104, 0}}, color = {0, 0, 127}));
  connect(gain3.u, SLIP) annotation(Line(points = {{-72, -66}, {-130, -66}, {-130, 0}, {-102, 0}}, color = {0, 0, 127}));
  connect(gain3.y, lrctrl1.Df) annotation(Line(points = {{-60.5, -66}, {-26, -66}, {-26, -16.675}, {-21.92, -16.675}}, color = {0, 0, 127}));
  connect(const2.y, add2.u2) annotation(Line(points={{-136,61},{-123.393,61},{
          -123.393,57.0694},{-106,57.0694},{-106,57}},                                                                                           color = {0, 0, 127}));
  connect(gov1.ms, boiler.ms) annotation(Line(points = {{8.33, 41.905}, {8.33, 32}, {-40, 32}, {-40, -0.2}}, color = {0, 0, 127}));
  connect(fuelDynamic.ms, boiler.ms) annotation(Line(points = {{71.8, 32}, {-40, 32}, {-40, -0.2}}, color = {0, 0, 127}));
  connect(fuelDynamic.Des_MW, lrctrl1.Des_MW) annotation(Line(points = {{71.8, 24}, {24, 24}, {24, 18}, {22, 18}, {22, 17.77}, {19.165, 17.77}}, color = {0, 0, 127}));
  connect(fuelDynamic.fuel, boiler.fuel) annotation(Line(points = {{91.8, 24}, {96, 24}, {96, 38}, {-52, 38}, {-52, -0.2}}, color = {0, 0, 127}));
  connect(add1.u1, boiler.PT) annotation(Line(points = {{28, -7}, {28, -28}, {-46, -28}, {-46, -20.2}}, color = {0, 0, 127}));
  connect(add1.u2, lrctrl1.P_SP) annotation(Line(points = {{28, -1}, {28, -0.49}, {18.75, -0.49}}, color = {0, 0, 127}));
  connect(drum_pressure_controller.u, add1.y) annotation(Line(points = {{44, -4}, {39.5, -4}}, color = {0, 0, 127}));
  connect(drum_pressure_controller.y, fuelDynamic.presure_control) annotation(Line(points = {{64, -4}, {68, -4}, {68, 16}, {71.8, 16}}, color = {0, 0, 127}));
  connect(gov1.PT, boiler.PT) annotation(Line(points = {{-25.69, 73.9}, {-64, 73.9}, {-64, -28}, {-46, -28}, {-46, -20.2}}, color = {0, 0, 127}));
  connect(lrctrl1.PE, fuelDynamic.presure_control) annotation(Line(points = {{-21.92, 19.43}, {-30, 19.43}, {-30, 30}, {68, 30}, {68, 16}, {71.8, 16}}, color = {0, 0, 127}));
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Text(origin = {-64.1048, -167.952}, lineColor = {255, 170, 0}, extent = {{-5.99, 6.64}, {0.54281, 1.4173}}, textString = "PE")}), Documentation(info = "<html>

<p>
In this model, there are two identifiers: the located system bus, JBUS and machine identifier, M.
</p>
<p>
Since there is no machine connected to the PMECH_LP, these two parameters are considered as Real with zero value.
</p>
<p>
In future, these two parameteres should be modified as Integer and String, respectively.
</p>

<img src=\"modelica://OpalRT/resource/Turbine-Governor/TGOV5.png\"
alt=\"TGOV5.png\"><br>

</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
end TGOV5;
