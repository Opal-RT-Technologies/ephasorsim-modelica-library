within OpalRT.Electrical.Auxiliary.Events;
block FaultPower "Transitory short-circuit on a node. Shunt impedance connected only during a specified interval of time 2014/03/10"
  OpalRT.NonElectrical.Connector.PwPin p annotation(Placement(transformation(extent = {{-80, 0}, {-60, 20}}), iconTransformation(extent = {{-80, 0}, {-60, 20}})));
  parameter Real P_fault "Active Power fault (MW)";
  parameter Real Q_fault "Reactive Power fault (MVar)";
  parameter Real SB "Network Base Power (MVA)";
  parameter Real t1 "Start time of the fault";
  parameter Real t2 "End time of the fault";
  parameter Real G(fixed = false);
  parameter Real B(fixed = false);
initial equation
  G = P_fault / SB;
  B = -Q_fault / SB;
equation
  p.ii = if time <= t1 then 0 else if time <= t2 then -(G * p.vi - B * p.vr) else 0;
  p.ir = if time <= t1 then 0 else if time <= t2 then -(G * p.vr + B * p.vi) else 0;
  annotation(Icon(graphics={  Rectangle(extent = {{-60, 60}, {40, -40}}, lineColor = {0, 0, 255}), Rectangle(extent = {{-40, 40}, {0, 20}}, lineColor = {0, 0, 0}, fillColor = {95, 95, 95},
            fillPattern =                                                                                                                                                                                  FillPattern.Solid), Line(points = {{0, 30}, {14, 30}, {14, -10}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points = {{2, -10}, {26, -10}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points = {{4, -14}, {24, -14}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points = {{8, -18}, {22, -18}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points = {{10, -22}, {18, -22}}, color = {0, 0, 255}, smooth = Smooth.None), Rectangle(extent = {{-50, 32}, {-40, 28}}, lineColor = {0, 0, 0}, fillColor = {0, 0, 0},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid), Line(points = {{-24, 48}, {-16, 30}, {-30, 30}, {-18, 8}}, color = {255, 0, 0}, smooth = Smooth.None, thickness = 0.5), Line(points = {{-24, 10}, {-18, 8}, {-18, 14}}, color = {255, 0, 0}, smooth = Smooth.None)}), Diagram(graphics), experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.001));
end FaultPower;
