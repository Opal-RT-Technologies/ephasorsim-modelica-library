within OpalRT.Electrical.Control.Stabilizer;
model STAB4 "Power Sensitive Stabilizer"
  extends OpalRT.Electrical.PartialModel.Stabilizer;
  parameter Real KX = 1 "(Gain)";
  parameter Real TT = 1 "Watt Transducer Time Constant";
  parameter Real TX1 = 1 "(> 0)";
  parameter Real TX2 = 1 "Reset Time Constant (> 0)";
  parameter Real Ta = 1;
  parameter Real Tb = 1;
  parameter Real Tc = 1 "(> 0)";
  parameter Real Td = 1;
  parameter Real Te = 1;
  parameter Real L1 = -1 "Low Limit";
  parameter Real L2 = 1 "High Limit";
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag lag1(T = TT, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = PREF) annotation(Placement(visible = true, transformation(origin = {-30, 60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1(k1 = -1, k2 = +1) annotation(Placement(visible = true, transformation(origin = {-10, 60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction transferfunction2(a = {TX20, 1}, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = 0, b = {1, 0}) annotation(Placement(visible = true, transformation(origin = {10, 60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = KX) annotation(Placement(visible = true, transformation(origin = {30, 60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.LeadLag lead_lag1(TA = Ta, TB = TX1) annotation(Placement(visible = true, transformation(origin = {60, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.LeadLag lead_lag2(TA = Tb, TB = Tc) annotation(Placement(visible = true, transformation(origin = {-70, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag lag2(T = Td) annotation(Placement(visible = true, transformation(origin = {-40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag lag3(T = Te) annotation(Placement(visible = true, transformation(origin = {-10, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiter1(uMax = L2, uMin = L1) annotation(Placement(visible = true, transformation(origin = {30, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = PREF) annotation(Placement(visible = true, transformation(origin = {-80, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
protected
  parameter Modelica.Blocks.Types.Init initType = Modelica.Blocks.Types.Init.InitialOutput "Type of initialization (1: no init, 2: steady state, 3,4: initial output)";
  parameter Real y_start = 0 "Initial or guess value of output (= state)";
  parameter Real TX20(start = 1, fixed = false);
  parameter Real PREF(fixed = false);
  Real PELEC1;
initial algorithm
  TX20 := TX2;
initial equation
  PREF = PELEC1;
equation
  PELEC1 = VI[1] * VI[3] + VI[2] * VI[4];
  connect(const.y, add1.u1) annotation(Line(points = {{-69, 90}, {-55.8077, 90}, {-55.8077, 80.1068}, {-18.9586, 80.1068}, {-18.9586, 62.4833}, {-16, 62.4833}, {-16, 63}}, color = {0, 0, 127}));
  connect(limiter1.y, VOTHSG) annotation(Line(points = {{41, 0}, {93.6937, 0}, {93.6937, 0}, {100, 0}}, color = {0, 0, 127}));
  connect(lag3.y, limiter1.u) annotation(Line(points = {{1.49012e-07, 0}, {18.4685, 0}, {18.4685, 0}, {18, 0}}, color = {0, 0, 127}));
  connect(lag2.y, lag3.u) annotation(Line(points = {{-30, 0}, {-20.045, 0}, {-20.045, 0}, {-20, 0}}, color = {0, 0, 127}));
  connect(lead_lag2.y, lag2.u) annotation(Line(points = {{-60, 0}, {-49.7748, 0}, {-49.7748, 0}, {-50, 0}}, color = {0, 0, 127}));
  connect(lead_lag1.y, lead_lag2.u) annotation(Line(points = {{70, 60}, {78.1532, 60}, {78.1532, 31.3063}, {-89.1892, 31.3063}, {-89.1892, 0.225225}, {-80, 0.225225}, {-80, 0}}, color = {0, 0, 127}));
  connect(gain1.y, lead_lag1.u) annotation(Line(points = {{35.5, 60}, {49.7748, 60}, {49.7748, 60}, {50, 60}}, color = {0, 0, 127}));
  connect(add1.y, transferfunction2.u) annotation(Line(points = {{-4.5, 60}, {3.82883, 60}, {3.82883, 60}, {4, 60}}, color = {0, 0, 127}));
  connect(add1.u2, lag1.y) annotation(Line(points = {{-16, 57}, {-19.5946, 57}, {-19.5946, 59.6847}, {-25, 59.6847}, {-25, 60}}, color = {0, 0, 127}));
  connect(gain1.u, transferfunction2.y) annotation(Line(points = {{24, 60}, {15.3153, 60}, {15.3153, 60}, {15.5, 60}}, color = {0, 0, 127}));
  lag1.u = PELEC1;
  annotation(Documentation(info = "<html>

<p>
1- In this model, Pref is equal to initial value of PELEC.
</p>
<img src=\"modelica://OpalRT/resource/Stabilizer/STAB4.png\"


</html>"), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1}), graphics={  Text(origin = {-44.46, 63.96}, lineColor = {255, 0, 0}, extent = {{-5.21, 3.87}, {5.21, -3.87}}, textString = "PELEC"), Text(origin = {-46.2043, 85.17}, lineColor = {255, 0, 0}, extent = {{-4.94298, 1.73382}, {5.21, -3.87}}, textString = "PREF")}), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1})));
end STAB4;
