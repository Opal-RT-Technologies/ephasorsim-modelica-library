within OpalRT.Electrical.Load;
block ConstantImpedance
  parameter Integer IBUS = 100 "Located system bus";
  parameter String Device_id = "L1";
  parameter Real P = 1100 "Active Load, MW";
  parameter Real Q = 342.702 "Reactive Load, MVAR";
  parameter Real V = 1.03 "Voltage magnitude at connected bus, p.u.";
  parameter Real SB = 1000 "base power, MVA";
  OpalRT.NonElectrical.Connector.PwPin p annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-8.75, -8.75}, {8.75, 8.75}}, rotation = 0)));
protected
  parameter Real P_pu = P / SB;
  parameter Real Q_pu = Q / SB;
  parameter Real K = V ^ 2 / (P_pu ^ 2 + Q_pu ^ 2);
  parameter Real R = K * P_pu;
  parameter Real X = K * Q_pu;
equation
  p.vr = -(R * p.ir - X * p.ii);
  p.vi = -(X * p.ir + R * p.ii);
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), experiment(StartTime = 0, StopTime = 100, Tolerance = 0.01, Interval = 0.01), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={                                                                                                                                                           Text(origin = {-55.01, 36.61}, extent = {{-38.33, 8.2}, {73.12, -30.27}}, textString = "P+jQ"), Text(origin={
              -57.3459,-22.557},                                                                                                                                                                                                        extent = {{-38.33, 8.2}, {63.3639, -27.1891}}, textString = "Const. Z"),
        Polygon(
          points={{0,20},{0,-20},{30,0},{0,20}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Solid,
          fillColor={0,0,0}),
        Polygon(
          points={{0,20},{0,-20},{30,0},{0,20}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Solid,
          fillColor={0,0,0}),
        Rectangle(
          extent={{-92,4},{0,-4}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid)}));
end ConstantImpedance;
