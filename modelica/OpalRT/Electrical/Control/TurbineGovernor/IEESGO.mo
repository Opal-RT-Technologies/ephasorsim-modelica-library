within OpalRT.Electrical.Control.TurbineGovernor;
model IEESGO "IEEE Standard Model"
  extends OpalRT.Electrical.PartialModel.TurbineGovernor;
  parameter Real T1 = 1 "Controller Lag";
  parameter Real T2 = 1 "Controller Lead Compensation";
  parameter Real T3 = 1 "Governor Lag (> 0)";
  parameter Real T4 = 1 "Delay Due To Steam Inlet Volumes";
  parameter Real T5 = 1 "Reheater Delay";
  parameter Real T6 = 1 "Turbine pipe hood Delay";
  parameter Real K1 = 0.5 "1/Per Unit Regulation";
  parameter Real K2 = 0.5 "Fraction";
  parameter Real K3 = 0.5 "fraction";
  parameter Real PMAX = 1 "Upper Power Limit";
  parameter Real PMIN = -1 "Lower Power Limit";
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag lag3(T = T6, K = K3, y_start = PMECH_0 * K2 * K3) annotation(Placement(visible = true, transformation(origin = {40, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag lag2(T = T5, K = K2, y_start = PMECH_0 * K2) annotation(Placement(visible = true, transformation(origin = {10, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain2(k = 1 - K3) annotation(Placement(visible = true, transformation(origin = {47, 0}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = 1 - K2) annotation(Placement(visible = true, transformation(origin = {70, 50}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add3 add31 annotation(Placement(visible = true, transformation(origin = {83, 0}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag lag1(T = T4, y_start = PMECH_0) annotation(Placement(visible = true, transformation(origin = {40, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.SignalRouting.Multiplexer multiplexer1(n = 2, s = if T1 * T3 <> 0 then 1 else 2) annotation(Placement(visible = true, transformation(origin = {-40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction transferfunction1(b = {T20, 1}, a = if T1 * T3 <> 0 then {T10 * T30, T10 + T30, 1} else {1, 2, 1}, initType = Modelica.Blocks.Types.Init.InitialOutput) annotation(Placement(visible = true, transformation(origin = {-70, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.LeadLag lead_lag1(TA = T2, TB = if T1 <> 0 and T3 == 0 then T1 else T3) annotation(Placement(visible = true, transformation(origin = {-70, -30}, extent = {{-11.25, -11.25}, {11.25, 11.25}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1(k2 = -1) annotation(Placement(visible = true, transformation(origin = {-10, 50}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiter1(uMax = PMAX, uMin = PMIN) annotation(Placement(visible = true, transformation(origin = {10, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain3(k = K1) annotation(Placement(visible = true, transformation(origin = {-28, 32}, extent = {{-5, -5}, {5, 5}}, rotation = 90)));
  Modelica.Blocks.Sources.Constant const1(k = PMECH_0) annotation(Placement(visible = true, transformation(origin = {-136, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const2(k = 0) annotation(Placement(visible = true, transformation(origin = {71, -61}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add2 annotation(Placement(visible = true, transformation(origin = {-100, 60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
protected
  parameter Real T10(start = 1, fixed = false);
  parameter Real T20(start = 1, fixed = false);
  parameter Real T30(start = 1, fixed = false);
  parameter Real PMECH_0(fixed = false);
initial algorithm
  T10 := T1;
  T20 := T2;
  T30 := T3;
initial equation
  PMECH_0 = PMECH0;
equation
  connect(gain3.y, add1.u2) annotation(Line(points = {{-28, 37.5}, {-28, 47}, {-16, 47}}, color = {0, 0, 127}));
  connect(multiplexer1.y, gain3.u) annotation(Line(points = {{-30, 0}, {-28, 0}, {-28, 26}}, color = {0, 0, 127}));
  connect(add1.y, limiter1.u) annotation(Line(points = {{-4.5, 50}, {-1.60214, 50}, {-2, 50}, {-2, 50}}, color = {0, 0, 127}));
  connect(limiter1.y, lag1.u) annotation(Line(points = {{21, 50}, {30.1736, 50}, {30.1736, 50}, {30, 50}}, color = {0, 0, 127}));
  connect(add2.y, add1.u1) annotation(Line(points={{-94.5,60},{-28.0206,60},{
          -28.0206,52.9563},{-16,52.9563},{-16,53}},                                                                                              color = {0, 0, 127}));
  connect(dGREF, add2.u1) annotation(Line(points={{-100,80},{-113.625,80},{
          -113.625,62.7249},{-106,62.7249},{-106,63}},                                                                                          color = {0, 0, 127}));
  connect(add31.y, PMECH) annotation(Line(points = {{88.5, 0}, {104, 0}, {104, 4.44089e-16}}, color = {0, 0, 127}));
  connect(SLIP, transferfunction1.u) annotation(Line(points = {{-102, 0}, {-82, 0}}, color = {0, 0, 127}));
  connect(lead_lag1.u, transferfunction1.u) annotation(Line(points = {{-81.25, -30}, {-89.311, -30}, {-89.311, 0}, {-82, 0}}, color = {0, 0, 127}));
  connect(lead_lag1.y, multiplexer1.u[2]) annotation(Line(points = {{-58.75, -30}, {-50.9746, -30}, {-50.9746, 0.5}, {-50, 0.5}}, color = {0, 0, 127}));
  connect(transferfunction1.y, multiplexer1.u[1]) annotation(Line(points = {{-59, 0}, {-50.9746, 0}, {-50.9746, -0.5}, {-50, -0.5}}, color = {0, 0, 127}));
  connect(lag2.u, lag1.y) annotation(Line(points = {{-5.55112e-16, -30}, {-17.6235, -30}, {-17.6235, 32.7503}, {57.9439, 32.7503}, {57.9439, 50.1068}, {50, 50.1068}, {50, 50}}, color = {0, 0, 127}));
  connect(lag1.y, gain1.u) annotation(Line(points = {{50, 50}, {63.8184, 50}, {63.8184, 50}, {64, 50}}, color = {0, 0, 127}));
  connect(lag3.y, add31.u3) annotation(Line(points = {{50, -30}, {72.3738, -30}, {72.3738, -3.68491}, {77, -3.68491}, {77, -4}}, color = {0, 0, 127}));
  connect(gain2.y, add31.u2) annotation(Line(points = {{52.5, 0}, {77, 0}}, color = {0, 0, 127}));
  connect(gain1.y, add31.u1) annotation(Line(points = {{75.5, 50}, {79, 50}, {79, 20}, {73, 20}, {73, 4}, {77, 4}}, color = {0, 0, 127}));
  connect(gain2.u, lag2.y) annotation(Line(points = {{41, 0}, {24.5661, 0}, {24.5661, -30}, {20, -30}}, color = {0, 0, 127}));
  connect(lag2.y, lag3.u) annotation(Line(points = {{20, -30}, {29.3725, -30}, {29.3725, -30}, {30, -30}}, color = {0, 0, 127}));
  connect(const1.y, add2.u2) annotation(Line(points={{-125,60},{-118.509,60},{
          -118.509,56.5553},{-106,56.5553},{-106,57}},                                                                                             color = {0, 0, 127}));
  connect(PMECH_LP, const2.y) annotation(Line(points = {{104, -60}, {98, -60}, {98, -61}, {82, -61}}, color = {0, 0, 127}));
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1})), Documentation(info = "<html>


<img src=\"modelica://OpalRT/resource/Turbine-Governor/IEESGO.png\"
alt=\"IEESGO
.png\"><br>

</html>"));
end IEESGO;
