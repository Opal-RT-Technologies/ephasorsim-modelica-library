within OpalRT.Electrical.Control.Stabilizer;
model STAB1
  extends OpalRT.Electrical.PartialModel.Stabilizer;
  parameter Real K_T = 0.01 "sec^-1";
  parameter Real T = 0.01 "sec";
  parameter Real T1_T3 = 0.01;
  parameter Real T3 = 0.01 "sec";
  parameter Real T2_T4 = 0.01;
  parameter Real T4 = 0.01 "sec";
  parameter Real HLIM = 0.01 "high limit";
  Modelica.Blocks.Nonlinear.Limiter limiter1(uMax = HLIM) annotation(Placement(visible = true, transformation(origin = {68, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.LeadLag lead_lag2(TA = T2_T4 * T4, TB = T4) annotation(Placement(visible = true, transformation(origin = {40, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.LeadLag lead_lag1(TA = T1_T3 * T3, TB = T3) annotation(Placement(visible = true, transformation(origin = {10, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction transferfunction1(b = {1, 0}, a = {T0, 1}, initType = Modelica.Blocks.Types.Init.InitialOutput) annotation(Placement(visible = true, transformation(origin = {-32, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = K_T * T) annotation(Placement(visible = true, transformation(origin = {-10, 60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
protected
  parameter Real T0(start = 1, fixed = false);
initial algorithm
  T0 := T;
equation
  connect(transferfunction1.y, gain1.u) annotation(Line(points = {{-21, 60}, {-16.6287, 60}, {-16, 59.4533}, {-16, 60}}, color = {0, 0, 127}));
  connect(gain1.y, lead_lag1.u) annotation(Line(points = {{-4.5, 60}, {-0.22779, 60}, {-0.22779, 60}, {0, 60}}, color = {0, 0, 127}));
  connect(limiter1.y, VOTHSG) annotation(Line(points = {{79, 20}, {92.0273, 20}, {92.0273, 0}, {100, 0}}, color = {0, 0, 127}));
  connect(lead_lag2.y, limiter1.u) annotation(Line(points = {{50, 60}, {54.6697, 60}, {54.6697, 20}, {56, 20}}, color = {0, 0, 127}));
  connect(lead_lag1.y, lead_lag2.u) annotation(Line(points = {{20, 60}, {29.385, 60}, {29.385, 60}, {30, 60}}, color = {0, 0, 127}));
  connect(PSS_AUX[1], transferfunction1.u) annotation(Line(points={{-100,-5},{
          -71.9794,-5},{-71.9794,0},{-44,0},{-44,60}},                                                                                        color = {0, 0, 127}));
  annotation(Documentation(info = "<html>

<p>
Speed Sensitive Stabilizing Model
</p>
<img src=\"modelica://OpalRT/resource/Stabilizer/STAB1.png\"


</html>"), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1})));
end STAB1;
