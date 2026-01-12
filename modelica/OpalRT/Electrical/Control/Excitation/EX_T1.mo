within OpalRT.Electrical.Control.Excitation;
model EX_T1
  parameter Integer IBUS "Located system bus";
  parameter String ID = "M1" "Machine Identifier";
  parameter Real KA;
  parameter Real TR;
  parameter Real Efd_min;
  parameter Real Efd_max;
  Modelica.Blocks.Nonlinear.Limiter limiter1(uMax = Efd_max, uMin = Efd_min) annotation(Placement(visible = true, transformation(origin = {60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add3 add32(k1 = -1) annotation(Placement(visible = true, transformation(origin = {-10, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag lag1(T = TR, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = ETERM_0) annotation(Placement(visible = true, transformation(origin = {-60, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = KA) annotation(Placement(visible = true, transformation(origin = {20, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput VREF0 annotation(Placement(visible = true, transformation(origin = {-100, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 180), iconTransformation(origin = {-100, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput VREF annotation(Placement(visible = true, transformation(origin = {-100, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput ECOMP annotation(Placement(visible = true, transformation(origin = {-100, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput VS annotation(Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput EFD annotation(Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput EFD0 annotation(Placement(visible = true, transformation(origin = {10, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {40, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Interfaces.RealInput ETERM0 annotation(Placement(visible = true, transformation(origin = {-30, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-40, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Constant const(k = VREF_0) annotation(Placement(transformation(extent = {{-133, -60}, {-113, -40}})));
protected
  parameter Real ETERM_0(fixed = false);
  parameter Real VREF_0(fixed = false);
initial equation
  ETERM_0 = ETERM0;
  VREF_0 = ETERM0 + EFD0 / KA;
equation
  connect(gain1.y, limiter1.u) annotation(Line(points = {{31, 0}, {49.0196, 0}, {49.0196, 0}, {48, 0}}, color = {0, 0, 127}));
  connect(add32.y, gain1.u) annotation(Line(points = {{1, 0}, {6.55773, 0}, {8, 0}, {8, 0}}, color = {0, 0, 127}));
  connect(VREF, add32.u3) annotation(Line(points = {{-100, -20}, {-34.2048, -20}, {-34.2048, -7.84314}, {-22, -7.84314}, {-22, -8}}, color = {0, 0, 127}));
  connect(VS, add32.u2) annotation(Line(points = {{-100, 0}, {-22.658, 0}, {-22.658, 0}, {-22, 0}}, color = {0, 0, 127}));
  connect(lag1.y, add32.u1) annotation(Line(points = {{-50, 20}, {-33.3333, 20}, {-33.3333, 7.62527}, {-22, 7.62527}, {-22, 8}}, color = {0, 0, 127}));
  connect(ECOMP, lag1.u) annotation(Line(points = {{-100, 20}, {-70.1525, 20}, {-70.1525, 20}, {-70, 20}}, color = {0, 0, 127}));
  connect(limiter1.y, EFD) annotation(Line(points = {{71, 0}, {94.1176, 0}, {94.1176, 0}, {100, 0}}, color = {0, 0, 127}));
  connect(const.y, VREF0) annotation(Line(points = {{-112, -50}, {-100, -50}}, color = {0, 0, 127}));
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1}), graphics={  Rectangle(origin = {-0.115741, 0}, extent = {{-99.8843, 100}, {99.8843, -100}}), Text(origin = {0, 1.16}, lineColor = {0, 0, 255}, extent = {{-62.73, 35.88}, {62.73, -35.88}}, textString = "EX_T1")}));
end EX_T1;
