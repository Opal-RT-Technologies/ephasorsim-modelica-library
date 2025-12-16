within OpalRT.Electrical.Load;
block ConstantImpedanceVariable
  parameter Integer IBUS = 100 "Located system bus";
  parameter String Device_id = "L1";
  parameter Real V = 1.03 "Voltage magnitude at connected bus, p.u.";
  parameter Real SB = 1000 "base power, MVA";
  OpalRT.NonElectrical.Connector.PwPin p annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 20}, extent = {{-8.75, -8.75}, {8.75, 8.75}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput P annotation(Placement(visible = true, transformation(origin = {-100, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Q annotation(Placement(visible = true, transformation(origin = {-100, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Real P_pu;
  Real Q_pu;
  Real K;
  Real R;
  Real X;
equation
  P_pu = P / SB;
  Q_pu = Q / SB;
  K = V ^ 2 / (P_pu ^ 2 + Q_pu ^ 2);
  R = K * P_pu;
  X = K * Q_pu;
  p.vr = -(R * p.ir - X * p.ii);
  p.vi = -(X * p.ir + R * p.ii);
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), experiment(StartTime = 0, StopTime = 100, Tolerance = 0.01, Interval = 0.01), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Line(origin = {-29.14, 20.289}, points = {{-62.1138, 0.256739}, {56.8599, 0.282886}}, thickness = 5, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 20), Text(origin = {-62.2389, 56.9581}, extent = {{-38.33, 8.2}, {73.12, -30.27}}, textString = "P+jQ"), Rectangle(origin = {0.267738, -0.133869}, extent = {{-99.8661, 99.4645}, {99.8661, -99.4645}}), Text(origin = {-135.952, -3.91}, extent = {{51.7855, 4.60565}, {73.12, -30.27}}, textString = "P"), Text(origin = {-136.233, -64.53}, extent = {{51.79, 4.61}, {71.5796, -26.6756}}, textString = "Q")}));
end ConstantImpedanceVariable;
