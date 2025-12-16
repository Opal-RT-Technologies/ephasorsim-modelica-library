within OpalRT.Electrical.Control.OverExcitationLimiter.Common;
block TimeCurrentGraph
  parameter Real EFD1;
  parameter Real TIME1;
  parameter Real EFD2;
  parameter Real TIME2;
  parameter Real EFD3;
  parameter Real TIME3;
  parameter Real EFDRATED;
  Modelica.Blocks.Interfaces.RealInput EFD annotation(Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Real EFDPU;
  Modelica.Blocks.Interfaces.RealOutput TOP annotation(Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.BooleanOutput enable(start = false) annotation(Placement(visible = true, transformation(origin = {100, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  EFDPU = EFD / EFDRATED;
  if EFDPU > EFD1 then
    if EFDPU > EFD3 then
      TOP = TIME3;
    elseif EFDPU <= EFD3 and EFDPU > EFD2 then
      TOP = (TIME2 - TIME3) / (EFD2 - EFD3) * (EFDPU - EFD3) + TIME3;
    elseif EFDPU <= EFD2 and EFDPU > EFD1 then
      TOP = (TIME1 - TIME2) / (EFD1 - EFD2) * (EFDPU - EFD2) + TIME2;
    else
      TOP = TIME1;
    end if;
    enable = true;
  else
    TOP = -1;
    enable = false;
  end if;
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Line(origin = {12.6733, 1.38614}, points = {{-71.6832, 86.9307}, {-71.6832, -34.6535}, {69.703, -34.6535}}), Line(origin = {11.7821, 28.3165}, points = {{-59.698, 47.3231}, {-59.698, 19.6004}, {-25.2426, -22.7759}, {30.599, -42.1818}, {60.302, -42.1818}}), Text(origin = {-10.3005, -48.315}, extent = {{7.92535, 16.235}, {43.9558, -7.52208}}, textString = "EFD"), Text(origin = {-105.548, 60.7965}, extent = {{7.93, 16.23}, {43.96, -7.52}}, textString = "TIME"), Text(origin = {37.4206, 39.8941}, extent = {{7.93, 16.23}, {43.96, -7.52}}, textString = "TOP"), Text(origin = {-97.2277, -82.9598}, extent = {{7.93, 16.23}, {43.96, -7.52}}, textString = "EFD"), Rectangle(origin = {0.594059, 0.19802}, extent = {{-99.604, 99.604}, {99.604, -99.604}}), Text(origin = {63.33, -82}, extent = {{-19.59, 9.34}, {19.59, -9.34}}, textString = "enable")}));
end TimeCurrentGraph;
