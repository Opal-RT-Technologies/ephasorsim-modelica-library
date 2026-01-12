within OpalRT.Electrical.Control.TurbineGovernor;
model TGOV3
  extends OpalRT.Electrical.PartialModel.TurbineGovernor;
  parameter Integer IBUS = 100 "Located Bus No.";
  parameter String ID = "M1" "Machine Identifier";
  parameter Real K = 20;
  parameter Real T1 = 0.5 "(sec)";
  parameter Real T2 = 1 "(sec)";
  parameter Real T3 = 1 "(>0)(sec)";
  parameter Real Uo = 0.1 "(pu/sec)";
  parameter Real Uc = -0.2 "(<0)(pu/sec)";
  parameter Real PMAX = 1 "(pu on machine MVA rating)";
  parameter Real PMIN = 0 "(pu on machine MVA rating)";
  parameter Real T4 = 0.4 "(sec)";
  parameter Real K1 = 0.2;
  parameter Real T5 = 7 "(>0)(sec)";
  parameter Real K2 = 0;
  parameter Real T6 = 0.6 "(>0)(sec)";
  parameter Real K3 = 0.1;
  parameter Real TA = 0 "(sec)";
  parameter Real TB = 0.2 "(sec)";
  parameter Real TC = 0 "(sec)";
  parameter Real PRMAX = 0.3 "(pu)";
  Modelica.Blocks.Sources.Constant const1(k = GREF_0) annotation(Placement(visible = true, transformation(origin = {-67, 60}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = 1 / T3) annotation(Placement(visible = true, transformation(origin = {-80, 30}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add3 add31(k2 = -1, k3 = -1) annotation(Placement(visible = true, transformation(origin = {-100, 30}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiter1(uMax = Uo, uMin = Uc) annotation(Placement(visible = true, transformation(origin = {-60, 30}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunctionNonWindup.Integrator_NonWindupLimit non_windup_integrator1(VRMAX = PMAX, VRMIN = PMIN, y_init = GREF_0, KI = KI0) annotation(Placement(visible = true, transformation(origin = {-40, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain2(k = K1) annotation(Placement(visible = true, transformation(origin = {-10, 60}, extent = {{-5, -5}, {5, 5}}, rotation = 90)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag transferfunction2(T = T4, y_start = GREF_0) annotation(Placement(visible = true, transformation(origin = {-20, 30}, extent = {{-7.5, -7.5}, {7.5, 7.5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.LeadLag transferfunction1(TA = T2, TB = T1, K = K, initType = Modelica.Blocks.Types.Init.SteadyState) annotation(Placement(visible = true, transformation(origin = {-140, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 0) annotation(Placement(visible = true, transformation(origin = {70, -60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunctionNonWindup.Integrator_NonWindupLimit non_windup_integrator2(VRMAX = PRMAX, VRMIN = -ModelicaServices.Machine.inf, y_init = GREF_0, KI = KI5_0) annotation(Placement(visible = true, transformation(origin = {20, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1(k2 = -1) annotation(Placement(visible = true, transformation(origin = {0, 30}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.Electrical.Control.TurbineGovernor.Common.FlowValvePosition flowvalveposition1 annotation(Placement(visible = true, transformation(origin = {60, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag transferfunction3(T = T6, y_start = GREF_0) annotation(Placement(visible = true, transformation(origin = {90, 30}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain6(k = K2) annotation(Placement(visible = true, transformation(origin = {80, 60}, extent = {{-5, -5}, {5, 5}}, rotation = 90)));
  Modelica.Blocks.Math.Gain gain8(k = K3) annotation(Placement(visible = true, transformation(origin = {100, 60}, extent = {{-5, -5}, {5, 5}}, rotation = 90)));
  Modelica.Blocks.Math.Add add2 annotation(Placement(visible = true, transformation(origin = {90, 80}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add3 annotation(Placement(visible = true, transformation(origin = {110, 80}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  input OpalRT.NonElectrical.Connector.InputInterfacePin vTrig annotation(Placement(visible = true, transformation(origin = {-100, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.Electrical.Control.TurbineGovernor.Common.FastValving v(TA = TA, TB = TB, TC = TC) annotation(Placement(visible = true, transformation(origin = {40, 20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add4 annotation(Placement(visible = true, transformation(origin = {-120, 50}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
protected
  parameter Real KI0(start = 1, fixed = false);
  parameter Real KI5_0(start = 1, fixed = false);
  parameter Real PMECH_0(fixed = false);
  parameter Real GREF_0 = PMECH_0 / (K1 + K2 + K3);
initial algorithm
  KI0 := 1;
  KI5_0 := 1 / T5;
initial equation
  PMECH_0 = PMECH0;
equation
  connect(v.TI, vTrig) annotation(Line(points={{35,20},{28.2782,20},{28.2782,
          -40.5929},{-100,-40.5929},{-100,-40}},                                                                                          color = {0, 0, 127}));
  connect(flowvalveposition1.y, add1.u2) annotation(Line(points={{70,30},{
          75.3388,30},{75.3388,8.40729},{-9.21409,8.40729},{-9.21409,26.5583},{
          -6,26.5583},{-6,27}},                                                                                                                                                                      color = {0, 0, 127}));
  connect(flowvalveposition1.v, v.y) annotation(Line(points={{50,24},{46.9783,
          24},{46.9783,19.8404},{45,19.8404},{45,20}},                                                                                               color = {0, 0, 127}));
  connect(add4.y, add31.u1) annotation(Line(points={{-114.5,50},{-110.54,50},{
          -110.54,34.1902},{-106,34.1902},{-106,34}},                                                                                           color = {0, 0, 127}));
  connect(dGREF, add4.u2) annotation(Line(points={{-100,80},{-140.36,80},{
          -140.36,46.7866},{-126,46.7866},{-126,47}},                                                                                         color = {0, 0, 127}));
  connect(flowvalveposition1.u, non_windup_integrator2.y) annotation(Line(points={{50,30},
          {25.4743,30},{25.4743,30},{25,30}},                                                                                                         color = {0, 0, 127}));
  connect(transferfunction3.u, flowvalveposition1.y) annotation(Line(points={{85,30},
          {69.9187,30},{69.9187,30},{70,30}},                                                                                                    color = {0, 0, 127}));
  connect(gain6.u, flowvalveposition1.y) annotation(Line(points={{80,54},{80,
          29.8103},{70,29.8103},{70,30}},                                                                                            color = {0, 0, 127}));
  connect(gain8.u, transferfunction3.y) annotation(Line(points={{100,54},{100,
          29.8103},{95,29.8103},{95,30}},                                                                                           color = {0, 0, 127}));
  connect(add3.y, PMECH) annotation(Line(points = {{115.5, 80}, {117.073, 80}, {117.073, 0}, {104, 0}, {104, 0}}, color = {0, 0, 127}));
  connect(add3.u2, gain8.y) annotation(Line(points = {{104, 77}, {100.217, 77}, {100.217, 65.5827}, {100, 65.5827}, {100, 65.5}}, color = {0, 0, 127}));
  connect(add2.y, add3.u1) annotation(Line(points = {{95.5, 80}, {99.8436, 80}, {99.8436, 83.1761}, {104, 83.1761}, {104, 83}}, color = {0, 0, 127}));
  connect(add2.u2, gain6.y) annotation(Line(points = {{84, 77}, {79.6748, 77}, {79.6748, 65.5}, {80, 65.5}}, color = {0, 0, 127}));
  connect(add2.u1, gain2.y) annotation(Line(points = {{84, 83}, {-10.0271, 83}, {-10.0271, 65.5}, {-10, 65.5}}, color = {0, 0, 127}));
  connect(add1.y, non_windup_integrator2.u) annotation(Line(points={{5.5,30},{
          14.9051,30},{14.9051,30},{15,30}},                                                                                             color = {0, 0, 127}));
  connect(add1.u1, transferfunction2.y) annotation(Line(points={{-6,33},{
          -10.2981,33},{-10.2981,30.0813},{-12.5,30.0813},{-12.5,30}},                                                                                      color = {0, 0, 127}));
  connect(transferfunction2.y, gain2.u) annotation(Line(points={{-12.5,30},{
          -10.2981,30},{-10.2981,54},{-10,54}},                                                                                           color = {0, 0, 127}));
  connect(const.y, PMECH_LP) annotation(Line(points={{75.5,-60},{95.9225,-60},{
          95.9225,-60},{104,-60}},                                                                                             color = {0, 0, 127}));
  connect(non_windup_integrator1.y, add31.u3) annotation(Line(points={{-35,30},
          {-31.7073,30},{-31.7073,16.2602},{-110.569,16.2602},{-110.569,25.7453},
          {-106,25.7453},{-106,26}},                                                                                                                                                                         color = {0, 0, 127}));
  connect(non_windup_integrator1.y, transferfunction2.u) annotation(Line(points={{-35,30},
          {-27.3713,30},{-27.3713,30},{-27.5,30}},                                                                                                       color = {0, 0, 127}));
  connect(limiter1.y, non_windup_integrator1.u) annotation(Line(points={{-54.5,
          30},{-44.9864,30},{-44.9864,30},{-45,30}},                                                                                              color = {0, 0, 127}));
  connect(gain1.y, limiter1.u) annotation(Line(points={{-74.5,30},{-66.6667,30},
          {-66.6667,30},{-66,30}},                                                                                               color = {0, 0, 127}));
  connect(add31.y, gain1.u) annotation(Line(points={{-94.5,30},{-86.4499,30},{
          -86.4499,30},{-86,30}},                                                                                             color = {0, 0, 127}));
  connect(transferfunction1.y, add31.u2) annotation(Line(points={{-130,30},{
          -105.962,30},{-105.962,30},{-106,30}},                                                                                          color = {0, 0, 127}));
  connect(SLIP, transferfunction1.u) annotation(Line(points={{-102,0},{-162.602,
          0},{-162.602,30.0813},{-150,30.0813},{-150,30}},                                                                                             color = {0, 0, 127}));
  connect(const1.y, add4.u1) annotation(Line(points={{-78,60},{-130.334,60},{
          -130.334,52.9563},{-126,52.9563},{-126,53}},                                                                                            color = {0, 0, 127}));
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1})), Documentation(info = "<html>

<p>
1. In this model, governor gain K = 1/R, P<sub>MAX</sub> and P<sub>MIN</sub> are in pu on generator MVA base.
</p>
<p>
2. The TIME to initiate (TI) for the fast valving block (V) must be provided by the user. For this model, it is done by triggering the block V using unity step/pulse signal input at the desired time TI. (Corresponding Pin: vTrig)
</p>

<img src=\"modelica://OpalRT/resource/Turbine-Governor/TGOV3.png\"
alt=\"TGOV3.png\"><br>

</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1}), graphics={  Text(origin = {-68.896, 29.9466}, extent = {{-17.99, 7.33}, {18.7612, -9.38656}}, textString = "VTrig")}));
end TGOV3;
