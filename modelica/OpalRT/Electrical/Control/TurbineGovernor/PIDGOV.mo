within OpalRT.Electrical.Control.TurbineGovernor;
model PIDGOV "Hydro Turbine-Governor"
  extends OpalRT.Electrical.PartialModel.TurbineGovernor;
  parameter Real Rperm = 0.05 "permanent drop, pu";
  parameter Real Treg = 0.03 "(sec) speed detector time constant";
  parameter Real Kp = 6 "proportional gain, pu/sec";
  parameter Real Ki = 30 "reset gain, pu/sec";
  parameter Real Kd = 0.01 "derivative gain, pu";
  parameter Real Ta = 0.04 "(sec) > 0 controller time constant";
  parameter Real Tb = 0.5 "(sec) > 0 gate servo time constant";
  parameter Real Dturb = 0.01 "turbine damping factor, pu";
  parameter Real G0 = 0.3 "gate opening at speed no load, pu";
  parameter Real G1 = 0.5 "intermediate gate opening, pu";
  parameter Real P1 = 0.6 "power at gate opening G1, pu";
  parameter Real G2 = 0.7 "intermediate gate opening, pu";
  parameter Real P2 = 0.8 "power at gate opening G2, pu";
  parameter Real P3 = 1 "power at full opened gate, pu";
  parameter Real Gmax = 0.95 "maximum gate opening, pu";
  parameter Real Gmin = 0 "minimum gate opening, pu";
  parameter Real Atw = 1.1 "> 0 factor multiplying Tw, pu";
  parameter Real Tw = 0.4 "(sec) > 0 water inertia time constant";
  parameter Real Velmax = 0.2 "minimum gate opening velocity, pu/sec";
  parameter Real Velmin = -0.2 "< 0 minimum gate closing velocity, pu/sec";
  parameter Real M = 0 "Feedback signal flag. 0: Electrical power feedback, 1: Gate position";
  parameter Real Tz(fixed = false);
  parameter Real Ta0(fixed = false, start = 1);
  parameter Real PMECH_0(fixed = false);
  parameter Real G_init(fixed = false);
  parameter Real y0(fixed = false);
  parameter Real GREF_0(fixed = false);
  Modelica.Blocks.Math.Feedback feedback1 annotation(Placement(visible = true, transformation(origin = {-60, 60}, extent = {{-5, -5}, {5, 5}}, rotation = -90)));
  Modelica.Blocks.Math.Feedback feedback2 annotation(Placement(visible = true, transformation(origin = {-20, 80}, extent = {{5, -5}, {-5, 5}}, rotation = 360)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag lag1(K = Rperm, T = Treg, y_start = y0) annotation(Placement(visible = true, transformation(origin = {-40, 80}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.SignalRouting.Multiplexer multiplexer1(s = M + 1, n = 2) annotation(Placement(visible = true, transformation(origin = {-10, 70}, extent = {{5, -5}, {-5, 5}}, rotation = 360)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.PI_Regulator pi_regulator1(KI = Ki, KP = Kp, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = G_init) annotation(Placement(visible = true, transformation(origin = {-40, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag lag2(K = 1, T = Ta, y_start = G_init) annotation(Placement(visible = true, transformation(origin = {-10, 50}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction transferfunction1(b = {1, 0}, a = {Ta0, 1}, initType = Modelica.Blocks.Types.Init.InitialOutput) annotation(Placement(visible = true, transformation(origin = {-10, 30}, extent = {{5, -5}, {-5, 5}}, rotation = 180)));
  Modelica.Blocks.Math.Gain gain1(k = Kd) annotation(Placement(visible = true, transformation(origin = {-30, 30}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1 annotation(Placement(visible = true, transformation(origin = {20, 50}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag lag3(K = 1, T = Ta, y_start = G_init) annotation(Placement(visible = true, transformation(origin = {40, 50}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback feedback3 annotation(Placement(visible = true, transformation(origin = {-70, -10}, extent = {{-5, -5}, {5, 5}}, rotation = 360)));
  Modelica.Blocks.Math.Gain gain2(k = 1 / Tb) annotation(Placement(visible = true, transformation(origin = {-50, -10}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiter1(uMax = Velmax, uMin = Velmin) annotation(Placement(visible = true, transformation(origin = {-30, -10}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunctionNonWindup.Integrator_NonWindupLimit non_windup_integrator1(VRMAX = Gmax, VRMIN = Gmin, y_init = G_init) annotation(Placement(visible = true, transformation(origin = {-10, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.LeadLag lead_lag1(TA = -Tz, TB = Tz / 2, y_start = PMECH_0) annotation(Placement(visible = true, transformation(origin = {40, -10}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback feedback4 annotation(Placement(visible = true, transformation(origin = {60, -10}, extent = {{-5, -5}, {5, 5}}, rotation = 360)));
  Modelica.Blocks.Math.Gain gain3(k = Dturb) annotation(Placement(visible = true, transformation(origin = {-20, -40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Nonlinear.PieceWiseLinear4 piecewise_linear_41(y1 = 0, y2 = P1, y3 = P2, y4 = P3, u1 = G0, u2 = G1, u3 = G2, u4 = 1) annotation(Placement(visible = true, transformation(origin = {20, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const1(k = GREF_0) annotation(Placement(visible = true, transformation(origin = {-136, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const2(k = 0) annotation(Placement(visible = true, transformation(origin = {73, -61}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add2 annotation(Placement(visible = true, transformation(origin = {-70, 90}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
initial algorithm
  Ta0 := Ta;
  Tz := Atw * Tw;
  PMECH_0 := PMECH0;
  if PMECH_0 > P3 then
    G_init := 1;
  elseif PMECH_0 > P2 then
    G_init := (1 - G2) / (P3 - P2) * (PMECH_0 - P2) + G2;
  elseif PMECH_0 > P1 then
    G_init := (G2 - G1) / (P2 - P1) * (PMECH_0 - P1) + G1;
  elseif PMECH_0 > 0 then
    G_init := (G1 - G0) / P1 * PMECH_0 + G0;
  else
    G_init := 0;
  end if;
  y0 := if Ki == 0 then G_init / Kp else 0;
  GREF_0 := if M == 1 then y0 / Rperm + G_init else y0 / Rperm + PELEC;
equation
  connect(piecewise_linear_41.u, non_windup_integrator1.y) annotation(Line(points = {{10, -10}, {-4.84848, -10}, {-4.84848, -10}, {-5, -10}}, color = {0, 0, 127}));
  connect(piecewise_linear_41.y, lead_lag1.u) annotation(Line(points = {{30, -10}, {34.9495, -10}, {34.9495, -10}, {35, -10}}, color = {0, 0, 127}));
  connect(non_windup_integrator1.y, multiplexer1.u[2]) annotation(Line(points = {{-5, -10}, {2.0202, -10}, {2.0202, 14.5455}, {57.9798, 14.5455}, {57.9798, 70}, {25, 70}, {25, 70.25}, {-5, 70.25}}, color = {0, 0, 127}));
  connect(feedback4.y, PMECH) annotation(Line(points = {{64.5, -10}, {91.9192, -10}, {91.9192, 0}, {104, 0}}, color = {0, 0, 127}));
  connect(gain3.y, feedback4.u2) annotation(Line(points = {{-14.5, -40}, {60.202, -40}, {60.202, -14}, {60, -14}}, color = {0, 0, 127}));
  connect(gain3.u, SLIP) annotation(Line(points = {{-26, -40}, {-90.9091, -40}, {-90.9091, 0}, {-102, 0}}, color = {0, 0, 127}));
  connect(lead_lag1.y, feedback4.u1) annotation(Line(points = {{45, -10}, {55.7576, -10}, {55.7576, -10}, {56, -10}}, color = {0, 0, 127}));
  connect(non_windup_integrator1.y, feedback3.u2) annotation(Line(points = {{-5, -10}, {2.0202, -10}, {2.0202, -22.6263}, {-70.101, -22.6263}, {-70.101, -14}, {-70, -14}}, color = {0, 0, 127}));
  connect(lag3.y, feedback3.u1) annotation(Line(points = {{45, 50}, {52.1212, 50}, {52.1212, 18.1818}, {-83.6364, 18.1818}, {-83.6364, -10.303}, {-74, -10.303}, {-74, -10}}, color = {0, 0, 127}));
  connect(gain2.u, feedback3.y) annotation(Line(points = {{-56, -10}, {-65.6566, -10}, {-65.6566, -10}, {-65.5, -10}}, color = {0, 0, 127}));
  connect(gain2.y, limiter1.u) annotation(Line(points = {{-44.5, -10}, {-36.1616, -10}, {-36.1616, -10}, {-36, -10}}, color = {0, 0, 127}));
  connect(non_windup_integrator1.u, limiter1.y) annotation(Line(points = {{-15, -10}, {-24.6465, -10}, {-24.6465, -10}, {-24.5, -10}}, color = {0, 0, 127}));
  connect(add1.y, lag3.u) annotation(Line(points = {{25.5, 50}, {34.5455, 50}, {34.5455, 50}, {35, 50}}, color = {0, 0, 127}));
  connect(transferfunction1.y, add1.u2) annotation(Line(points = {{-4.5, 30}, {13.9394, 30}, {13.9394, 47}, {14, 47}}, color = {0, 0, 127}));
  connect(lag2.y, add1.u1) annotation(Line(points = {{-5, 50}, {0, 50}, {0, 53.3333}, {14, 53.3333}, {14, 53}}, color = {0, 0, 127}));
  connect(gain1.u, feedback1.y) annotation(Line(points = {{-36, 30}, {-59.596, 30}, {-59.596, 55.5}, {-60, 55.5}}, color = {0, 0, 127}));
  connect(pi_regulator1.y, lag2.u) annotation(Line(points = {{-30, 50}, {-15.3535, 50}, {-15.3535, 50}, {-15, 50}}, color = {0, 0, 127}));
  connect(gain1.y, transferfunction1.u) annotation(Line(points = {{-24.5, 30}, {-16.5657, 30}, {-16.5657, 30}, {-16, 30}}, color = {0, 0, 127}));
  connect(pi_regulator1.u, feedback1.y) annotation(Line(points = {{-50, 50}, {-59.596, 50}, {-59.596, 55.5}, {-60, 55.5}}, color = {0, 0, 127}));
  multiplexer1.u[1] = PELEC;
  connect(multiplexer1.y, feedback2.u2) annotation(Line(points = {{-15, 70}, {-20, 70}, {-20, 76}, {-20, 76}}, color = {0, 0, 127}));
  connect(add2.y, feedback2.u1) annotation(Line(points={{-64.5,90},{-8.74036,90},
          {-8.74036,79.9486},{-16,79.9486},{-16,80}},                                                                                                  color = {0, 0, 127}));
  connect(dGREF, add2.u2) annotation(Line(points={{-100,80},{-83.8046,80},{
          -83.8046,86.6324},{-76,86.6324},{-76,87}},                                                                                            color = {0, 0, 127}));
  connect(lag1.u, feedback2.y) annotation(Line(points = {{-35, 80}, {-24.8485, 80}, {-24.8485, 80}, {-24.5, 80}}, color = {0, 0, 127}));
  connect(lag1.y, feedback1.u1) annotation(Line(points = {{-45, 80}, {-60.404, 80}, {-60.404, 64}, {-60, 64}}, color = {0, 0, 127}));
  connect(feedback1.u2, SLIP) annotation(Line(points = {{-64, 60}, {-64, 68.596}, {-102, 68.596}, {-102, 0}}, color = {0, 0, 127}));
  connect(const1.y, add2.u1) annotation(Line(points={{-125,60},{-113.368,60},{
          -113.368,92.8021},{-76,92.8021},{-76,93}},                                                                                               color = {0, 0, 127}));
  connect(PMECH_LP, const2.y) annotation(Line(points = {{104, -60}, {95, -60}, {95, -61}, {84, -61}}, color = {0, 0, 127}));
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1})), Documentation(info = "<html>

<p>
The block digaram of the model is shown below:
</p>
<img src=\"modelica://OpalRT/resource/Turbine-Governor/PIDGOV.png\"
alt=\"IEEEG2.png\"><br>
<p>
</html>"));
end PIDGOV;
