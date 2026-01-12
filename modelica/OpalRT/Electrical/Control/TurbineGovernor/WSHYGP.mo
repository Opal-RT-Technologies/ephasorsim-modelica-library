within OpalRT.Electrical.Control.TurbineGovernor;
model WSHYGP
  extends OpalRT.Electrical.PartialModel.TurbineGovernor;
  parameter Integer IBUS = 100 "Located Bus No.";
  parameter String ID = "M1" "Machine Identifier";
  parameter Real db1 = 0;
  parameter Real err = 0;
  parameter Real Td = 1 "(sec)";
  parameter Real KI = 0.8;
  parameter Real Tf = 0.1 "(sec)";
  parameter Real KD = 0.8;
  parameter Real KP = 0.25;
  parameter Real R = 0.04;
  parameter Real Tt = 0.4;
  parameter Real KG = 2.0;
  parameter Real TP = 0.2 "(sec)";
  parameter Real VELopen = 0.007 "(>0)";
  parameter Real VELclose = 0.002 "(>0)";
  parameter Real PMAX = 1.0;
  parameter Real PMIN = 0;
  parameter Real db2 = 0;
  parameter Real GV1 = 0;
  parameter Real PGV1 = 0;
  parameter Real GV2 = 0.6;
  parameter Real PGV2 = 0.7;
  parameter Real GV3 = 0.7;
  parameter Real PGV3 = 0.82;
  parameter Real GV4 = 0.80;
  parameter Real PGV4 = 0.90;
  parameter Real GV5 = 0.90;
  parameter Real PGV5 = 0.95;
  parameter Real Aturb = -1;
  parameter Real Bturb = 0.5 "(>0)";
  parameter Real Tturb = 0.9 "(>0)(sec)";
  parameter Real TRATE = 900;
  Modelica.Blocks.Sources.Constant const(k = GREF_0) annotation(Placement(visible = true, transformation(origin = {-80, 60}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant1(k = 0) annotation(Placement(visible = true, transformation(origin = {80, -60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Nonlinear.DeadbandTyp2Hyst deadband1(db = db1, err = err) annotation(Placement(visible = true, transformation(origin = {-80, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.LeadLag leadlag1(TA = Aturb * Tturb, TB = Bturb * Tturb, K = 1, y_start = PGV0, initType = Modelica.Blocks.Types.Init.InitialOutput) annotation(Placement(visible = true, transformation(origin = {60, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain4(k = 1 / power_base_change) annotation(Placement(visible = true, transformation(origin = {80, -40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Nonlinear.PieceWiseLinear5 NGV(y1 = PGV1, y2 = PGV2, y3 = PGV3, y4 = PGV4, y5 = PGV5, u1 = GV1, u2 = GV2, u3 = GV3, u4 = GV4, u5 = GV5) annotation(Placement(visible = true, transformation(origin = {40, -40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Nonlinear.BacklashDeadband deadband2(db = db2) annotation(Placement(visible = true, transformation(origin = {20, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunctionNonWindup.Integrator_NonWindupLimit integrator_nonwinduplimit1(KI = KI0, VRMAX = PMAX, VRMIN = PMIN, y_init = GV0) annotation(Placement(visible = true, transformation(origin = {-20, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunctionNonWindup.Lag_NonWindupLimit lag_nonwinduplimit1(KI = KG, TI = TP, VRMAX = VELopen, VRMIN = -VELclose) annotation(Placement(visible = true, transformation(origin = {-60, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback feedback1 annotation(Placement(visible = true, transformation(origin = {-80, -40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add3 add31 annotation(Placement(visible = true, transformation(origin = {60, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = KP) annotation(Placement(visible = true, transformation(origin = {20, 60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator integrator1(k = KI, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = GV0) annotation(Placement(visible = true, transformation(origin = {20, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag lag1(T = Td) annotation(Placement(visible = true, transformation(origin = {-20, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add3 add32(k2 = -1, k3 = -1) annotation(Placement(visible = true, transformation(origin = {-40, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.SignalRouting.Multiplexer multiplexer1(n = 2, s = SW) annotation(Placement(visible = true, transformation(origin = {-20, 0}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain3(k = R) annotation(Placement(visible = true, transformation(origin = {-40, 0}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain5(k = power_base_change) annotation(Placement(visible = true, transformation(origin = {40, 0}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag lag2(T = Tt, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = PELEC_0) annotation(Placement(visible = true, transformation(origin = {20, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.TransferFunction1 transferfunction1(b = {KD, 0}, a = {Tf0, 1}) annotation(Placement(visible = true, transformation(origin = {20, 20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1 annotation(Placement(visible = true, transformation(origin = {-60, 80}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
protected
  parameter Real Tf0(start = 1, fixed = false);
  parameter Real KI0(start = 1, fixed = false);
  parameter Real PMECH_0(fixed = false);
  parameter Real PELEC_0(fixed = false);
  parameter Real PGV0(fixed = false);
  parameter Real GV0(fixed = false);
  parameter Real GREF_0(fixed = false);
  parameter Real SW(fixed = false);
  parameter Real power_base_change(fixed = false, start = 1);
initial algorithm
  Tf0 := Tf;
  KI0 := 1;
  power_base_change := if TRATE > 0 then MBASE / TRATE else 1;
  PGV0 := PMECH_0 * power_base_change;
  if PGV0 > PGV5 then
    GV0 := GV5;
  elseif PGV0 > PGV4 then
    GV0 := (PGV0 - PGV4) * (GV5 - GV4) / (PGV5 - PGV4) + GV4;
  elseif PGV0 > PGV3 then
    GV0 := (PGV0 - PGV3) * (GV4 - GV3) / (PGV4 - PGV3) + GV3;
  elseif PGV0 > PGV2 then
    GV0 := (PGV0 - PGV2) * (GV3 - GV2) / (PGV3 - PGV2) + GV2;
  elseif PGV0 > PGV1 then
    GV0 := (PGV0 - PGV1) * (GV2 - GV1) / (PGV2 - PGV1) + GV1;
  else
    GV0 := GV1;
  end if;
  SW := if Tt == 0 then 1 else 2;
  GREF_0 := if SW == 1 then R * GV0 else R * PELEC_0;
initial equation
  PMECH_0 = PMECH0;
  PELEC_0 = PELEC * power_base_change;
equation
  connect(transferfunction1.u, lag1.y) annotation(Line(points={{15,20},{
          -7.85908,20},{-7.85908,40.1084},{-10,40.1084},{-10,40}},                                                                                       color = {0, 0, 127}));
  connect(transferfunction1.y, add31.u3) annotation(Line(points={{25,20},{
          50.6775,20},{50.6775,36.0434},{54,36.0434},{54,36}},                                                                                           color = {0, 0, 127}));
  connect(add31.y, multiplexer1.u[1]) annotation(Line(points={{65.5,40},{
          71.6763,40},{71.6763,11.8497},{-12.1387,11.8497},{-12.1387,0},{-15,0},
          {-15,-0.25}},                                                                                                                                                           color = {0, 0, 127}));
  connect(lag2.y, multiplexer1.u[2]) annotation(Line(points={{10,0},{-15.0289,0},
          {-15.0289,0.25},{-15,0.25}},                                                                                                color = {0, 0, 127}));
  gain5.u = PELEC;
  connect(add32.y, lag1.u) annotation(Line(points={{-34.5,40},{-29.7688,40},{
          -29.7688,40},{-30,40}},                                                                                            color = {0, 0, 127}));
  connect(gain3.y, add32.u3) annotation(Line(points={{-45.5,0},{-50.289,0},{
          -50.289,35.8382},{-46,35.8382},{-46,36}},                                                                                             color = {0, 0, 127}));
  connect(gain5.y, lag2.u) annotation(Line(points = {{34.5, 0}, {30.6936, 0}, {30.6936, 0}, {30, 0}}, color = {0, 0, 127}));
  connect(add1.y, add32.u1) annotation(Line(points={{-54.5,80},{-50.3856,80},{
          -50.3856,43.9589},{-46,43.9589},{-46,44}},                                                                                               color = {0, 0, 127}));
  connect(dGREF, add1.u1) annotation(Line(points={{-100,80},{-90.7455,80},{
          -90.7455,83.0334},{-66,83.0334},{-66,83}},                                                                                          color = {0, 0, 127}));
  connect(deadband1.y, add32.u2) annotation(Line(points={{-70,40},{-46.5318,40},
          {-46.5318,40},{-46,40}},                                                                                               color = {0, 0, 127}));
  connect(multiplexer1.y, gain3.u) annotation(Line(points={{-25,0},{-33.4094,0},
          {-33.4094,0},{-34,0}},                                                                                                 color = {0, 0, 127}));
  connect(add31.y, feedback1.u1) annotation(Line(points={{65.5,40},{83.815,40},
          {83.815,-23.9884},{-91.9075,-23.9884},{-91.9075,-39.5954},{-84,
          -39.5954},{-84,-40}},                                                                                                                                                                   color = {0, 0, 127}));
  connect(PMECH, gain4.y) annotation(Line(points={{104,0},{90.7514,0},{90.7514,
          -40.4624},{85.5,-40.4624},{85.5,-40}},                                                                                            color = {0, 0, 127}));
  connect(gain1.u, lag1.y) annotation(Line(points = {{14, 60}, {-8.05017, 60}, {-8.05017, 39.6807}, {-10, 39.6807}, {-10, 40}}, color = {0, 0, 127}));
  connect(integrator1.u, lag1.y) annotation(Line(points = {{14, 40}, {-10.3307, 40}, {-10.3307, 40}, {-10, 40}}, color = {0, 0, 127}));
  connect(add31.u2, integrator1.y) annotation(Line(points = {{54, 40}, {29.8746, 40.0684}, {29.8746, 40.0684}, {25.5, 40}}, color = {0, 0, 127}));
  connect(add31.u1, gain1.y) annotation(Line(points = {{54, 44}, {51.0148, 44}, {51.0148, 60.2052}, {25.5, 60.2052}, {25.5, 60}}, color = {0, 0, 127}));
  connect(lag_nonwinduplimit1.u, feedback1.y) annotation(Line(points={{-71,-40},
          {-75.4846,-40},{-75.4846,-40},{-75.5,-40}},                                                                                             color = {0, 0, 127}));
  connect(feedback1.u2, deadband2.y) annotation(Line(points = {{-80, -44}, {-80.0456, -44}, {-80.0456, -59.9088}, {31.927, -59.9088}, {31.927, -39.6123}, {29.5, -39.6123}, {29.5, -39.5}}, color = {0, 0, 127}));
  connect(integrator_nonwinduplimit1.u, lag_nonwinduplimit1.y) annotation(Line(points={{-25,-40},
          {-48.8027,-40},{-48.8027,-40},{-49,-40}},                                                                                                                color = {0, 0, 127}));
  connect(deadband2.u, integrator_nonwinduplimit1.y) annotation(Line(points={{9.5,
          -39.5},{-15.2794,-39.5},{-15.2794,-40},{-15,-40}},                                                                                                 color = {0, 0, 127}));
  connect(NGV.u, deadband2.y) annotation(Line(points={{35,-40},{29.4185,-40},{
          29.4185,-39.5},{29.5,-39.5}},                                                                                       color = {0, 0, 127}));
  connect(leadlag1.u, NGV.y) annotation(Line(points={{50,-40},{44.9259,-40},{
          44.9259,-40},{45,-40}},                                                                                            color = {0, 0, 127}));
  connect(gain4.u, leadlag1.y) annotation(Line(points={{74,-40},{70.6956,-40},{
          70.6956,-40},{70,-40}},                                                                                              color = {0, 0, 127}));
  connect(PMECH_LP, constant1.y) annotation(Line(points={{104,-60},{85.9749,-60},
          {85.9749,-60},{85.5,-60}},                                                                                              color = {0, 0, 127}));
  connect(SLIP, deadband1.u) annotation(Line(points={{-102,0},{-110.148,0},{
          -110.148,39.6807},{-90,39.6807},{-90,40}},                                                                                             color = {0, 0, 127}));
  connect(const.y, add1.u2) annotation(Line(points={{-85.5,60},{-88.4319,60},{
          -88.4319,76.8638},{-66,76.8638},{-66,77}},                                                                                             color = {0, 0, 127}));
  annotation(Documentation(info = "<html>
<p>
1. The block diagram of the WECC GP Hydro Governor Plus Model is as shown below. </p>
<p>
2. The first deadband at input represents the Type 2 deadband with bowtie hysteresis and the second deadband at the governor output represents the mechanical backlash in the governor.
</p>
<p>
3. The N<sub>GV</sub> block represents the nonlinear gate/power relationship of the governor.
</p>
<img src=\"modelica://OpalRT/resource/Turbine-Governor/WSHYGP.png\"
alt=\"WSHYGP.png\"><br>

</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
end WSHYGP;
