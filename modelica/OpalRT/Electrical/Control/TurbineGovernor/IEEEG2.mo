within OpalRT.Electrical.Control.TurbineGovernor;
model IEEEG2
  extends OpalRT.Electrical.PartialModel.TurbineGovernor;
  parameter Integer IBUS = 100 "Located Bus No.";
  parameter String ID = "M1" "Machine Identifier";
  parameter Real K = 20 "K";
  parameter Real T1 = 20 "T1";
  parameter Real T2 = 20 "T2";
  parameter Real T3 = 20 "T3(>0)";
  parameter Real PMAX = 20 "PMAX (pu on machine MVA rating)";
  parameter Real PMIN = 20 "PMIN (pu on machine MVA rating)";
  parameter Real T4 = 20 "T3(>0)";
  Modelica.Blocks.Math.Add add1(k2 = -1) annotation(Placement(visible = true, transformation(origin = {-20, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiter1(uMax = PMAX, uMin = PMIN) annotation(Placement(visible = true, transformation(origin = {20, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.TransferFunction1 transfer_function12(b = {-1 * T4, 1}, a = {0.5 * T4, 1}, y_start = P0) annotation(Placement(visible = true, transformation(origin = {60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.TransferFunction2 transfer_function21(b = {K * T2, K}, a = {T1 * T3, T1 + T3, 1}) annotation(Placement(visible = true, transformation(origin = {-60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const1(k = P0) annotation(Placement(visible = true, transformation(origin = {-136, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const2(k = 0) annotation(Placement(visible = true, transformation(origin = {70, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add2 annotation(Placement(visible = true, transformation(origin = {-100, 60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
protected
  parameter Real P0(fixed = false) "The initial values of Mech";
initial equation
  P0 = PMECH0;
equation
  connect(transfer_function21.u, SLIP) annotation(Line(points = {{-70, 0}, {-91.344, 0}, {-91.344, 0}, {-102, 0}}, color = {0, 0, 127}));
  connect(transfer_function21.y, add1.u2) annotation(Line(points = {{-50, 0}, {-43.7358, 0}, {-43.7358, -6.37813}, {-32, -6.37813}, {-32, -6}}, color = {0, 0, 127}));
  connect(transfer_function12.y, PMECH) annotation(Line(points = {{70, 0}, {90.4328, 0}, {90.4328, 0}, {104, 0}}, color = {0, 0, 127}));
  connect(transfer_function12.u, limiter1.y) annotation(Line(points = {{50, 0}, {31.6629, 0}, {31.6629, 0}, {31, 0}}, color = {0, 0, 127}));
  connect(add2.y, add1.u1) annotation(Line(points={{-94.5,60},{-43.7018,60},{
          -43.7018,5.9126},{-32,5.9126},{-32,6}},                                                                                              color = {0, 0, 127}));
  connect(dGREF, add2.u1) annotation(Line(points={{-100,80},{-111.825,80},{
          -111.825,62.982},{-106,62.982},{-106,63}},                                                                                         color = {0, 0, 127}));
  connect(limiter1.u, add1.y) annotation(Line(points = {{8, 0}, {-10.6383, 0}, {-10.6383, 0}, {-9, 0}}, color = {0, 0, 127}));
  connect(const1.y, add2.u2) annotation(Line(points={{-125,60},{-116.452,60},{
          -116.452,57.0694},{-106,57.0694},{-106,57}},                                                                                             color = {0, 0, 127}));
  connect(const2.y, PMECH_LP) annotation(Line(points = {{81, -60}, {104, -60}}, color = {0, 0, 127}));
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Documentation(info = "<html>

<p>
In this model, P0 is the input reference, intialized to be equal to PMECH at t = 0.
</p>
<p>
The block digaram of the model is shown below:
</p>
<img src=\"modelica://OpalRT/resource/Turbine-Governor/IEEEG2.png\"
alt=\"IEEEG2.png\"><br>
<p>
</html>"));
end IEEEG2;
