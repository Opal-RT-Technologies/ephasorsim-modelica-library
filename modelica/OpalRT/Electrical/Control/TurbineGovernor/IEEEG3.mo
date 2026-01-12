within OpalRT.Electrical.Control.TurbineGovernor;
model IEEEG3
  extends OpalRT.Electrical.PartialModel.TurbineGovernor;
  parameter Integer IBUS = 100 "Located Bus No.";
  parameter String ID = "M1" "Machine Identifier";
  parameter Real TG = 1 "?(>0) (sec), gate servomotor time constant";
  parameter Real TP = 0.5 "(sec)";
  parameter Real Uo = 0.1 "(pu/sec)";
  parameter Real Uc = -0.2 "(<0)(pu/sec)";
  parameter Real PMAX = 1 "(pu on machine MVA rating)";
  parameter Real PMIN = 0 "(pu on machine MVA rating)";
  parameter Real Sigma = 0.4 "permanent speed droop coefficient";
  parameter Real Delta = 0.4 "transient speed droop coefficient";
  parameter Real TR = 0.2;
  parameter Real TW = 0;
  parameter Real a11 = 7 "(sec)";
  parameter Real a13 = 0.1;
  parameter Real a21 = 0;
  parameter Real a23 = 0.6 "(sec)";
  Modelica.Blocks.Math.Add3 add31(k2 = -1, k3 = -1) annotation(Placement(visible = true, transformation(origin = {-60, 60}, extent = {{-6.25, -6.25}, {6.25, 6.25}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain2(k = Sigma) annotation(Placement(visible = true, transformation(origin = {0, 20}, extent = {{-5, -5}, {5, 5}}, rotation = 180)));
  Modelica.Blocks.Continuous.TransferFunction transferfunction1(b = {B1_0, B0_0}, a = {A1_0, 1}, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = PMECH_0) annotation(Placement(visible = true, transformation(origin = {60, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1 annotation(Placement(visible = true, transformation(origin = {-60, 20}, extent = {{-5, -5}, {5, 5}}, rotation = 180)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunctionNonWindup.Integrator_NonWindupLimit non_windup_integrator1(VRMAX = PMAX, VRMIN = PMIN, y_init = PMECH_0 / a23, KI = 1) annotation(Placement(visible = true, transformation(origin = {20, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction transferfunction2(b = {KI_0_feed, 0}, a = {TR, 1}, initType = Modelica.Blocks.Types.Init.InitialOutput) annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{-5, -5}, {5, 5}}, rotation = 180)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunctionNonWindup.Lag_NonWindupLimit lag_non_windup_limit1(VRMAX = Uo, VRMIN = Uc, KI = KI_0_lag, TI = TP) annotation(Placement(visible = true, transformation(origin = {-20, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const1(k = GREF_0) annotation(Placement(visible = true, transformation(origin = {-136, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const2(k = 0) annotation(Placement(visible = true, transformation(origin = {68, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add2 annotation(Placement(visible = true, transformation(origin = {-100, 60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
protected
  parameter Real PMECH_0(fixed = false);
  parameter Real GREF_0(fixed = false);
  parameter Real B1_0(start = 1, fixed = false);
  parameter Real B0_0(start = 1, fixed = false);
  parameter Real A1_0(start = 1, fixed = false);
  parameter Real KI_0_feed(start = 1, fixed = false);
  parameter Real KI_0_lag(start = 1, fixed = false);
initial equation
  KI_0_lag = 1 / TG;
  KI_0_feed = Delta * TR;
  PMECH_0 = PMECH0;
  GREF_0 = PMECH_0 * Sigma / a23;
  B1_0 = TW * (a11 * a23 - a13 * a21);
  B0_0 = a23;
  A1_0 = a11 * TW;
equation
  connect(add31.y, lag_non_windup_limit1.u) annotation(Line(points = {{-53.125, 60}, {-31.614, 60}, {-31.614, 60}, {-31, 60}}, color = {0, 0, 127}));
  connect(lag_non_windup_limit1.y, non_windup_integrator1.u) annotation(Line(points = {{-9, 60}, {14.8649, 60}, {14.8649, 60}, {15, 60}}, color = {0, 0, 127}));
  connect(non_windup_integrator1.y, transferfunction2.u) annotation(Line(points = {{25, 60}, {38.6279, 60}, {38.6279, 0}, {6, 0}}, color = {0, 0, 127}));
  connect(transferfunction2.y, add1.u1) annotation(Line(points = {{-5.5, 0}, {-49.2558, 0}, {-49.2558, 17.3207}, {-54, 17.3207}, {-54, 17}}, color = {0, 0, 127}));
  connect(SLIP, add31.u2) annotation(Line(points = {{-102, 0}, {-77.4019, 0}, {-77.4019, 59.5399}, {-67.5, 59.5399}, {-67.5, 60}}, color = {0, 0, 127}));
  connect(add1.y, add31.u3) annotation(Line(points = {{-65.5, 20}, {-72.2598, 20}, {-72.2598, 54.3978}, {-67.5, 54.3978}, {-67.5, 55}}, color = {0, 0, 127}));
  connect(add2.y, add31.u1) annotation(Line(points={{-94.5,60},{-83.5476,60},{
          -83.5476,64.7815},{-67.5,64.7815},{-67.5,65}},                                                                                           color = {0, 0, 127}));
  connect(dGREF, add2.u1) annotation(Line(points={{-100,80},{-112.082,80},{
          -112.082,63.2391},{-106,63.2391},{-106,63}},                                                                                          color = {0, 0, 127}));
  connect(gain2.y, add1.u2) annotation(Line(points = {{-5.5, 20}, {-47.9026, 20}, {-47.9026, 22.7334}, {-54, 22.7334}, {-54, 23}}, color = {0, 0, 127}));
  connect(non_windup_integrator1.y, gain2.u) annotation(Line(points = {{25, 60}, {38.4303, 60}, {38.4303, 20.2977}, {6, 20.2977}, {6, 20}}, color = {0, 0, 127}));
  connect(transferfunction1.y, PMECH) annotation(Line(points = {{71, 60}, {90.9337, 60}, {90.9337, 0}, {104, 0}}, color = {0, 0, 127}));
  connect(non_windup_integrator1.y, transferfunction1.u) annotation(Line(points = {{25, 60}, {47.3613, 60}, {47.3613, 60}, {48, 60}}, color = {0, 0, 127}));
  connect(const1.y, add2.u2) annotation(Line(points={{-125,60},{-118.509,60},{
          -118.509,56.8123},{-106,56.8123},{-106,57}},                                                                                             color = {0, 0, 127}));
  connect(PMECH_LP, const2.y) annotation(Line(points = {{104, -60}, {79, -60}}, color = {0, 0, 127}));
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Documentation(info = "<html>

<p>
The block digaram of the model is shown below:
</p>
<img src=\"modelica://OpalRT/resource/Turbine-Governor/IEEEG3.png\"
alt=\"IEEEG3.png\"><br>
<p>
</html>"));
end IEEEG3;
