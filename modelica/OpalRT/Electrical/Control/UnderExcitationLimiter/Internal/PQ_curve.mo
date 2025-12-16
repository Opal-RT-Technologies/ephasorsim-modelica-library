within OpalRT.Electrical.Control.UnderExcitationLimiter.Internal;
block PQ_curve "Piece-wise linear PQ curve, wrapper around pqCurveFunction"
  parameter Real[11] P_vector;
  parameter Real[11] Q_vector;
  parameter Real M2 = 0 " 0: MVAR curve interpreted as mirror image around MVAR axis; 1: MVAR is found by linear extrapolation";
  Modelica.Blocks.Interfaces.RealInput u annotation(Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput Q annotation(Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
protected
  parameter Real P_z(fixed = false);
initial algorithm
  P_z := Pz_calc(P_vector, Q_vector);
algorithm
  Q := pqCurveFunction(
    u,
    P_vector,
    Q_vector,
    M2,
    P_z);
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Rectangle(origin = {0.848656, 0.282885}, extent = {{-100.424, 99.0099}, {99.0099, -38.4724}}), Text(origin = {-3.11443, 55.869}, extent = {{-57.43, 26.17}, {57.43, -26.17}}, textString = "PQ curve"), Text(origin = {-27.2446, -10.1281}, extent = {{-57.43, 26.17}, {-43.5601, -7.78245}}, textString = "P"), Text(origin = {125.15, -6.81692}, extent = {{-61.1075, 24.7556}, {-43.56, -7.78}}, textString = "Q")}));
end PQ_curve;
