within OpalRT.Electrical.Load;
block ConstantImpedance2
  parameter Integer IBUS = 100 "Located system bus";
  parameter String Device_id = "L1";
  parameter Real R;
  parameter Real X;
  OpalRT.NonElectrical.Connector.PwPin p annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-8.75, -8.75}, {8.75, 8.75}}, rotation = 0)));
equation
  p.vr = R * p.ir - X * p.ii;
  p.vi = X * p.ir + R * p.ii;
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}},
        preserveAspectRatio=false,
        initialScale=1)),                                                                                                                   Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}},
        preserveAspectRatio=false,
        initialScale=1),                                                                                                                                                                                                        graphics={                                                                                                                                                           Text(origin = {-55.0132, 36.6074}, extent = {{-38.33, 8.2}, {73.1249, -30.2651}}, textString = "R+jX"),
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
end ConstantImpedance2;
