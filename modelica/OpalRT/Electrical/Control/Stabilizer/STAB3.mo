within OpalRT.Electrical.Control.Stabilizer;
model STAB3
  extends OpalRT.Electrical.PartialModel.Stabilizer;
  parameter Integer IBUS = 100 "Located Bus No.";
  parameter String ID = "M1" "Machine Identifier";
  parameter Real Tt = 0 "(sec)";
  parameter Real Tx1 = 0.04 "(sec)";
  parameter Real Tx2 = 1 "(sec)";
  parameter Real Kx = 1 "(sec)";
  parameter Real VLIM = 0.05;
  Modelica.Blocks.Math.Add add1(k1 = -1) annotation(Placement(visible = true, transformation(origin = {-20, 60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiter1(uMax = VLIM) annotation(Placement(visible = true, transformation(origin = {60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = Kx) annotation(Placement(visible = true, transformation(origin = {60, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag lag1(T = Tt, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = PREF) annotation(Placement(visible = true, transformation(origin = {-60, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = PREF) annotation(Placement(visible = true, transformation(origin = {-80, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag lag2(T = Tx1, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = 0) annotation(Placement(visible = true, transformation(origin = {16, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction transferfunction1(b = {-1, 0}, a = {Tx20, 1}, initType = Modelica.Blocks.Types.Init.InitialOutput) annotation(Placement(visible = true, transformation(origin = {22, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
protected
  parameter Real PREF(fixed = false);
  parameter Real Tx20(start = 1, fixed = false);
  Real PELEC1;
initial equation
  PREF = PELEC1;
  Tx20 = Tx2;
equation
  PELEC1 = VI[1] * VI[3] + VI[2] * VI[4];
  connect(gain1.y, transferfunction1.u) annotation(Line(points = {{71, 60}, {77.4487, 60}, {77.4487, 33.713}, {-1.59453, 33.713}, {-1.59453, 0}, {10, 0}, {10, 0}}, color = {0, 0, 127}));
  connect(transferfunction1.y, limiter1.u) annotation(Line(points = {{33, 0}, {46.9248, 0}, {46.9248, 0}, {48, 0}}, color = {0, 0, 127}));
  connect(lag2.y, gain1.u) annotation(Line(points = {{26, 60}, {47.6082, 60}, {47.6082, 60}, {48, 60}}, color = {0, 0, 127}));
  connect(add1.y, lag2.u) annotation(Line(points = {{-14.5, 60}, {5.69476, 60}, {5.69476, 60}, {6, 60}}, color = {0, 0, 127}));
  connect(const.y, add1.u1) annotation(Line(points = {{-69, 80}, {-49.3992, 80}, {-49.3992, 63.5514}, {-26, 63.5514}, {-26, 63}}, color = {0, 0, 127}));
  lag1.u = PELEC1;
  connect(lag1.y, add1.u2) annotation(Line(points = {{-50, 40}, {-38.9978, 40}, {-38.9978, 56.8627}, {-26, 56.8627}, {-26, 57}}, color = {0, 0, 127}));
  connect(limiter1.y, VOTHSG) annotation(Line(points = {{71, 0}, {90.6606, 0}, {90.6606, 0}, {100, 0}}, color = {0, 0, 127}));
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Documentation(info = "<html>

<p>
1- In this model, Pref is equal to initial value of PELEC.
</p>
<img src=\"modelica://OpalRT/resource/Stabilizer/STAB3.png\"


</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
end STAB3;
