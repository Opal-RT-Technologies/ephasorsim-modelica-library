within OpalRT.Electrical.Control.Excitation.Internal;
block NegativeCurrentLogic "Negative Current Logic block"
  parameter Real rc_rfd "(rc/rfd)";
  Modelica.Blocks.Interfaces.RealOutput EFD annotation(Placement(visible = true, transformation(origin = {120, 0}, extent = {{-25, -25}, {25, 25}}, rotation = 0), iconTransformation(origin = {100, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput XADIFD annotation(Placement(visible = true, transformation(origin = {-115, -35}, extent = {{-25, -25}, {25, 25}}, rotation = 0), iconTransformation(origin = {-100, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput EX annotation(Placement(visible = true, transformation(origin = {-120, 40}, extent = {{-25, -25}, {25, 25}}, rotation = 0), iconTransformation(origin = {-100, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  EFD = if rc_rfd == 0 or XADIFD >= 0 then EX else EX - rc_rfd * XADIFD;
  annotation(Documentation(info = "<html>

<p>
    ref paper: F.P. de Mello, "
                              "
</p>
<p>
    based on the above paper, if exciter works with negative field current capability, EFD = EX; otherwise it works based on Figure-3 in the paper
    ? With or Without crowbar circuit
<p>
    based on PSSE documentation, if rc/rfd = 0 then exciter works with negative field current capability.
</p>

</html>"),
         Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Rectangle(origin = {0.113895, -0.113895}, extent = {{-99.6583, 99.6583}, {99.6583, -99.6583}}), Text(origin = {-6.72465, 15.7208}, extent = {{-40.89, 22.32}, {38.3843, -9.10815}}, textString = "Negative"), Text(origin = {-32.7393, 0.414784}, extent = {{-33.3687, 9.33524}, {90.0884, -15.7159}}, textString = "Current Logic"), Text(origin = {-68.4523, 55.9242}, extent = {{-20.1628, 19.2517}, {10.14, -8.09}}, textString = "EX"), Text(origin = {-64.6243, -59.1542}, extent = {{-20.16, 19.25}, {49.7755, -18.3406}}, textString = "XADIFD"), Text(origin = {74.3265, -68.0424}, extent = {{-25.1714, 24.717}, {10.14, -8.09}}, textString = "EFD")}));
end NegativeCurrentLogic;
