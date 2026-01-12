within OpalRT.Electrical.Control.Stabilizer.Common;
block RampTrackFilter "OM1.13 compatible ramptracking filter block"
  parameter Integer M = 1;
  parameter Integer N = 1;
  parameter Real T8;
  parameter Real T9;
  parameter Modelica.Blocks.Types.Init initType;
  parameter Real y_start;
  Modelica.Blocks.Interfaces.RealInput u annotation(Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  function transferFunctionCoefficientGenerator "OM1.13 compatible transferfunction coefficient generation function"
    import comb = OpalRT.NonElectrical.Math.Auxiliary.combination;
    input Integer n;
    input Integer m;
    input Real x;
    output Real coef[m + 1];
  algorithm
    coef := zeros(m + 1);
    for i in 0:n loop
      coef[i + m - n + 1] := comb(n, i) * x ^ (n - i);
    end for;
    annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
  end transferFunctionCoefficientGenerator;

  OpalRT.NonElectrical.Math.Continuous.TransferFunction.TransferFunction8 transfer_function1(b = b, a = a, y_start = y_start) annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
protected
  parameter Real T80(start = 1, fixed = false);
  parameter Real T90(start = 1, fixed = false);
  parameter Real b[9](each start = 0.1, each fixed = false);
  parameter Real a[9](each start = 0.1, each fixed = false);
initial algorithm
  assert(M * N <= 8, "M*N can not be greater than 8");
  T80 := T8;
  T90 := T9;
  b := transferFunctionCoefficientGenerator(if M <> 0 then N else 0, 8, T80);
  a := transferFunctionCoefficientGenerator(M * N, 8, T90);
equation
  connect(transfer_function1.y, y) annotation(Line(points = {{10, 0}, {92.4262, 0}, {92.4262, 0}, {100, 0}}, color = {0, 0, 127}));
  connect(u, transfer_function1.u) annotation(Line(points = {{-100, 0}, {-11.0398, 0}, {-11.0398, 0}, {-10, 0}}, color = {0, 0, 127}));
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Rectangle(origin = {-0.0571738, -0.179749}, extent = {{-100, 100.199}, {100, -100.199}}), Line(origin = {-64.5936, 17.5421}, points = {{5.77342, 21.8954}, {-4.90196, 22.1133}, {-4.90196, -62.4183}, {4.0305, -62.4183}, {5.55555, -62.4183}}, thickness = 2), Line(origin = {-4.79, -1.96}, points = {{-53.5948, 0}, {53.5948, 0}}, thickness = 2), Text(origin = {4.63059, 12.3955}, extent = {{-48.9137, 13.6215}, {26.9093, -15.8001}}, textString = "1+sT8"), Text(origin = {5.28641, -21.2901}, extent = {{-48.91, 13.62}, {29.7422, -18.4144}}, textString = "(1+sT9)"), Text(origin = {66.4665, -18.9371}, extent = {{-48.91, 13.62}, {-3.80895, -3.16383}}, textString = "M"), Text(origin = {94.0892, 39.6208}, extent = {{-48.91, 13.62}, {-3.81, -3.16}}, textString = "N"), Line(origin = {53.0099, -23.0243}, rotation = 180, points = {{5.99128, 22.1133}, {-4.90196, 22.1133}, {-4.90196, -62.4183}, {4.0305, -62.4183}, {5.55555, -62.4183}}, thickness = 2)}));
end RampTrackFilter;
