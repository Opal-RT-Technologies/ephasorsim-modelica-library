within OpalRT.Electrical.Auxiliary.Events;
block BranchTrip
  parameter Real t0 = 1 "tripping time (sec.)";
  OpalRT.NonElectrical.Connector.PwPin p annotation(Placement(visible = true, transformation(origin = {-80, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.Connector.PwPin n annotation(Placement(visible = true, transformation(origin = {80, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  if time < t0 then
    p.vr = n.vr;
    p.vi = n.vi;
    p.ir + n.ir = 0;
    p.ii + n.ii = 0;
  else
    p.ir = 0;
    n.ir = 0;
    p.ii = 0;
    n.ii = 0;
  end if;
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Rectangle(origin = {-1.13895, 26.082}, extent = {{-94.533, 43.3941}, {95.4442, -91.6856}}), Text(origin = {14.7441, -9.67458}, extent = {{-89.4883, 51.1642}, {48.41, -24.72}}, textString = "Branch Trip")}));
end BranchTrip;
