within OpalRT.Electrical.Control.TurbineGovernor;
model GAST2A
  extends OpalRT.Electrical.PartialModel.TurbineGovernor(SLIP(start = 0));
  parameter Integer IBUS = 100 "Located Bus No.";
  parameter String ID = "M1" "Machine Identifier";
  parameter Real W = 25 "governor gain (1/droop) (on turbine rating)";
  parameter Real X = 1e-7 "governor lead time constant, sec.";
  parameter Real Y = 0.05 "(> 0) governor lag time constant, sec.";
  parameter Real Z = 1 "governor mode: 1 Droop, 0 ISO";
  parameter Real ETD = 0.04 "sec";
  parameter Real TCD = 0.2 "sec";
  parameter Real TRATE = 1000;
  parameter Real T = 0.031 "sec";
  parameter Real MAX = 1.5 "Maximum limit on turbine rating, p.u.";
  parameter Real MIN = -0.13 "Minimum limit on turbine rating, p.u.";
  parameter Real ECR = 0.01 "sec";
  parameter Real K3 = 0.9;
  parameter Real a = 1 "(> 0) valve positioner";
  parameter Real b = 1 "(> 0) valve positioner, sec.";
  parameter Real c = 1 "valve positioner";
  parameter Real Tf = 0.5 "(> 0), sec";
  parameter Real Kf = 0;
  parameter Real K5 = 0.2;
  parameter Real K4 = 0.8;
  parameter Real T3 = 15 "(> 0), sec";
  parameter Real T4 = 2.5 "(> 0), sec";
  parameter Real Tt = 300 "(> 0)";
  parameter Real T5 = 0.031 "(> 0), sec";
  parameter Real af1 = 700;
  parameter Real bf1 = 550;
  parameter Real af2 = -0.64;
  parameter Real bf2 = 1.36;
  parameter Real cf2 = 1;
  parameter Real TR = 750 "Rated temperature";
  parameter Real K6 = 0.25 "Minimum fuel flow, p.u.";
  parameter Real TC = 900 "Temperature control";

  Boolean cond1;
  OpalRT.NonElectrical.Math.Continuous.TransferFunctionWindup.PI_WindupLimit Temp_Control(KI = 1 / Tt, KP = T5 / Tt, MAX = MAX, MIN = -Modelica.Constants.inf, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = if TC - (K4 + K5) * f10 < 0 and X0 / K3 < MAX then X0 / K3 else MAX) annotation(Placement(visible = true, transformation(origin = {-120, 100}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Min Speed_Control annotation(Placement(visible = true, transformation(origin = {-80, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant1(k = TC) annotation(Placement(visible = true, transformation(origin = {-80, 140}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add2(k2 = -1) annotation(Placement(visible = true, transformation(origin = {-80, 100}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  OpalRT.Electrical.Control.TurbineGovernor.Internal.TurbineF1 f11(
    TR=TR,
    af1=af1,
    bf1=bf1) annotation (Placement(visible=true, transformation(
        origin={60,100},
        extent={{10,-10},{-10,10}},
        rotation=0)));
  Modelica.Blocks.Math.Product product2 annotation(Placement(visible = true, transformation(origin = {40, 20}, extent = {{6.25, -6.25}, {-6.25, 6.25}}, rotation = 180)));
  OpalRT.Electrical.Control.TurbineGovernor.Internal.CombustionSystem fuel1(
    K3=K3,
    T=T,
    K6=K6,
    a=a,
    b=b,
    c=c,
    Tf=Tf,
    Kf=Kf,
    ECR=ECR,
    y_init_fuel_system=Wf20,
    y_init_valve_position=Wf20) annotation (Placement(visible=true,
        transformation(
        origin={80,20},
        extent={{-12.5,-12.5},{12.5,12.5}},
        rotation=0)));
  Modelica.Blocks.Math.Add add3(k2 = -1) annotation(Placement(visible = true, transformation(origin = {-160, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.Electrical.Control.TurbineGovernor.Internal.TurbineF2 f21(
    af2=af2,
    bf2=bf2,
    cf2=cf2) annotation (Placement(visible=true, transformation(
        origin={120,-40},
        extent={{10,-10},{-10,10}},
        rotation=0)));
  Modelica.Blocks.Math.Product product1 annotation(Placement(visible = true, transformation(origin = {79, -39}, extent = {{6.25, -6.25}, {-6.25, 6.25}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 1) annotation(Placement(visible = true, transformation(origin = {-80, -120}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1 annotation(Placement(visible = true, transformation(origin = {-20, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  OpalRT.Electrical.Control.TurbineGovernor.Internal.SpeedGovernor
    speed_governor1(
    y_start=X0/K3,
    X=X,
    Y=Y,
    Z=Z,
    W=W,
    MIN=MIN,
    MAX=MAX) annotation (Placement(visible=true, transformation(
        origin={-120,20},
        extent={{-15,-15},{15,15}},
        rotation=0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag Gas_Turbine_Dyn(y_start = Wf20, initType = Modelica.Blocks.Types.Init.InitialOutput, T = TCD) annotation(Placement(visible = true, transformation(origin = {160, -20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder Thermocouple(T = T4, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = (K4 + K5) * f10) annotation(Placement(visible = true, transformation(origin = {-30, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag lag1(y_start = K5 * f10, initType = Modelica.Blocks.Types.Init.InitialOutput, T = T3, K = K5) annotation(Placement(visible = true, transformation(origin = {30, 100}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain2(k = K4) annotation(Placement(visible = true, transformation(origin = {30, 70}, extent = {{5, 5}, {-5, -5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add4(k2 = +1) annotation(Placement(visible = true, transformation(origin = {0, 90}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const1(k = GREF_0) annotation(Placement(visible = true, transformation(origin = {-67, 60}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const2(k = 0) annotation(Placement(visible = true, transformation(origin = {122, -60}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.TransferFunction2 transferfunction21(b = {T_p1TD, -T_p2TD, 1}, a = {T_p1TD, T_p2TD, 1}, y_start = Wf20) annotation(Placement(visible = true, transformation(origin = {130, 60}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = 1 / power_base_change) annotation(Placement(visible = true, transformation(origin = {60, -40}, extent = {{5, 5}, {-5, -5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add5 annotation(Placement(visible = true, transformation(origin = {-120, 60}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
protected
  parameter Real f10 = TR - af1 * (1 - Wf10);
  parameter Real Wf10 = Wf20;
  parameter Real X0 = (c / a + Kf) * Wf20 - K6;
  parameter Real Wf20 = (f20 - af2) / bf2;
  parameter Real f20 = power_base_change * PMECH_0;
  parameter Real GREF_0 = if Z <> 0 and W <> 0 then Z * X0 / W / K3 else 0;
  parameter Real PMECH_0(fixed = false);
  parameter Real T_p1TD(fixed = false);
  parameter Real T_p2TD(fixed = false);
  parameter Real power_base_change(fixed = false, start = 1);
initial equation
  PMECH_0 = PMECH0;
  T_p1TD = if ETD <> 0 then ETD ^ 2 / 12 else 0;
  T_p2TD = if ETD <> 0 then ETD / 2 else 0;
  power_base_change = if TRATE > 0 then MBASE / TRATE else 1;
equation
  connect(gain1.y, PMECH) annotation(Line(points = {{54.5, -40}, {29.2174, -40}, {29.2174, 0}, {104, 0}}, color = {0, 0, 127}));
  connect(product1.y, gain1.u) annotation(Line(points = {{72.125, -39}, {66, -40}}, color = {0, 0, 127}));
  connect(transferfunction21.y, f11.wf1) annotation(Line(points={{120,60},{
          84.047,60},{84.047,99.9612},{70,99.9612},{70,100}},                                                                                           color = {0, 0, 127}));
  connect(transferfunction21.u, fuel1.y) annotation(Line(points={{140,60},{
          179.035,60},{179.035,19.8928},{92.5,19.8928},{92.5,20}},                                                                                        color = {0, 0, 127}));
  connect(add4.y, Thermocouple.u) annotation(Line(points = {{-5.5, 90}, {-17.2048, 90}, {-17.2048, 90}, {-18, 90}}, color = {0, 0, 127}));
  connect(lag1.y, add4.u1) annotation(Line(points = {{20, 100}, {13.6204, 100}, {13.6204, 93.1925}, {6, 93.1925}, {6, 93}}, color = {0, 0, 127}));
  connect(gain2.y, add4.u2) annotation(Line(points = {{24.5, 70}, {13.262, 70}, {13.262, 86.3823}, {6, 86.3823}, {6, 87}}, color = {0, 0, 127}));
  connect(gain2.u, f11.y) annotation(Line(points = {{36, 70}, {46.9547, 70}, {46.9547, 102.153}, {50, 102.153}, {50, 102}}, color = {0, 0, 127}));
  connect(f11.y, lag1.u) annotation(Line(points = {{50, 102}, {46.9547, 102}, {46.9547, 99.6443}, {40, 99.6443}, {40, 100}}, color = {0, 0, 127}));
  connect(Thermocouple.y, add2.u2) annotation(Line(points = {{-41, 90}, {-58.0728, 90}, {-58.0728, 93.7821}, {-68, 93.7821}, {-68, 94}}, color = {0, 0, 127}));
  connect(Gas_Turbine_Dyn.y, f21.wf2) annotation(Line(points = {{150, -20}, {142.369, -20}, {142.369, -36.4465}, {130, -36.4465}, {130, -36}}, color = {0, 0, 127}));
  connect(fuel1.y, Gas_Turbine_Dyn.u) annotation(Line(points = {{92.5, 20}, {178.815, 20}, {178.815, -19.59}, {170, -19.59}, {170, -20}}, color = {0, 0, 127}));
  connect(speed_governor1.y, Speed_Control.u2) annotation(Line(points = {{-105, 20}, {-102.733, 20}, {-102.733, 14.123}, {-92, 14.123}, {-92, 14}}, color = {0, 0, 127}));
  connect(add3.y, speed_governor1.u) annotation(Line(points = {{-149, 20}, {-133.485, 20}, {-133.485, 19.8178}, {-135, 19.8178}, {-135, 20}}, color = {0, 0, 127}));
  connect(const.y, add1.u2) annotation(Line(points = {{-69, -120}, {-54.702, -120}, {-54.702, -105.911}, {-32, -105.911}, {-32, -106}}, color = {0, 0, 127}));
  connect(SLIP, add1.u1) annotation(Line(points = {{-102, 0}, {-102, -94.6772}, {-32, -94.6772}, {-32, -94}}, color = {0, 0, 127}));
  connect(add1.y, product1.u2) annotation(Line(points = {{-9, -100}, {87, -100}, {87, -63.7067}, {86.5, -63.7067}, {86.5, -42.75}}, color = {0, 0, 127}));
  connect(product2.u1, add1.y) annotation(Line(points = {{32.5, 16.25}, {22.6111, 16.25}, {22.6111, -99.963}, {-9, -99.963}, {-9, -100}}, color = {0, 0, 127}));
  connect(f21.y, product1.u1) annotation(Line(points = {{110, -40}, {101.607, -40}, {101.607, -35}, {87, -35}, {87, -35.25}, {86.5, -35.25}}, color = {0, 0, 127}));
  connect(SLIP, f21.dw) annotation(Line(points = {{-102, 0}, {-102, -94.6685}, {-135.185, -94.6685}, {-135.185, -152.885}, {141.29, -152.885}, {141.29, -41.9026}, {130, -41.9026}, {130, -42}}, color = {0, 0, 127}));
  connect(SLIP, add3.u2) annotation(Line(points = {{-102, 0}, {-102, -94.5836}, {-194.437, -94.5836}, {-194.437, 14.1626}, {-172, 14.1626}, {-172, 14}}, color = {0, 0, 127}));
  connect(add5.y, add3.u1) annotation(Line(points={{-125.5,60},{-194.344,60},{
          -194.344,25.7069},{-172,25.7069},{-172,26}},                                                                                             color = {0, 0, 127}));
  connect(dGREF, add5.u1) annotation(Line(points={{-100,80},{-107.455,80},{
          -107.455,62.7249},{-114,62.7249},{-114,63}},                                                                                          color = {0, 0, 127}));
  connect(product2.y, fuel1.u) annotation(Line(points = {{46.875, 20}, {67.2458, 20}, {67.2458, 20}, {67.5, 20}}, color = {0, 0, 127}));
  connect(Speed_Control.y, product2.u2) annotation(Line(points = {{-69, 20}, {4.10265, 20}, {4.10265, 23.6941}, {32.5, 23.6941}, {32.5, 23.75}}, color = {0, 0, 127}));
  connect(SLIP, f11.dw) annotation(Line(points = {{-102, 0}, {-102, -94.5836}, {-135.26, -94.5836}, {-135.26, -152.991}, {193.668, -152.991}, {193.668, 105.617}, {70, 105.617}, {70, 106}}, color = {0, 0, 127}));
  connect(constant1.y, add2.u1) annotation(Line(points = {{-69, 140}, {-53.608, 140}, {-53.608, 106.021}, {-68, 106.021}, {-68, 106}}, color = {0, 0, 127}));
  connect(add2.y, Temp_Control.u) annotation(Line(points = {{-91, 100}, {-109.141, 100}, {-109.141, 100}, {-110, 100}}, color = {0, 0, 127}));
  connect(Temp_Control.y, Speed_Control.u1) annotation(Line(points = {{-130, 100}, {-141.749, 100}, {-141.749, 36.4755}, {-103.213, 36.4755}, {-103.213, 25.9656}, {-92, 25.9656}, {-92, 26}}, color = {0, 0, 127}));
  cond1 = Temp_Control.u <= 0;
  when edge(cond1) then
    reinit(Temp_Control.integrator1.y, speed_governor1.y);
  end when;
  connect(const1.y, add5.u2) annotation(Line(points={{-78,60},{-94.8586,60},{
          -94.8586,57.0694},{-114,57.0694},{-114,57}},                                                                                            color = {0, 0, 127}));
  connect(const2.y, PMECH_LP) annotation(Line(points = {{111, -60}, {104, -60}}, color = {0, 0, 127}));
  annotation(experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.01), Documentation(info = "<html>

<p>
1. In this model, when temperature control input changes from positive to negative,
temperature control output is set to output of speed governor.
</p>
<p>
2. All delay blocks are approximated by a second order Pade transfer function, which does not work when delay < 2* Step Time. If delay = 0 then the Pade transfer Function is bypassed.
</p>
<img src=\"modelica://OpalRT/resource/Turbine-Governor/GAST2A.png\"
alt=\"GAST2A.png\"><br>

</html>"), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1})));
end GAST2A;
