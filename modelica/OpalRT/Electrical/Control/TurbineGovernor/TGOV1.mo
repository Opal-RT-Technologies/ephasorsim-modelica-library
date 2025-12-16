within OpalRT.Electrical.Control.TurbineGovernor;
model TGOV1
  extends OpalRT.Electrical.PartialModel.TurbineGovernor;
  parameter Real R = 1;
  parameter Real T1 = 1 "(>0) (sec)";
  parameter Real VMAX = 1;
  parameter Real VMIN = 1;
  parameter Real T2 = 1;
  parameter Real T3 = 1 "(>0) (sec)";
  parameter Real Dt = 1;
  Modelica.Blocks.Math.Add add1(k2 = -1) annotation(Placement(visible = true, transformation(origin = {-70, 60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = 1 / R) annotation(Placement(visible = true, transformation(origin = {-40, 60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunctionNonWindup.Lag_NonWindupLimit lag_non_windup_limit1(TI = T1, VRMAX = VMAX, VRMIN = VMIN, y_init = P0) annotation(Placement(visible = true, transformation(origin = {-10, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.LeadLag lead_lag1(y_start = P0, TA = T2, TB = T3) annotation(Placement(visible = true, transformation(origin = {30, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add2(k2 = -1) annotation(Placement(visible = true, transformation(origin = {60, 60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain2(k = Dt) annotation(Placement(visible = true, transformation(origin = {-10, 30}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const2(k = P0 * R) annotation(Placement(visible = true, transformation(origin = {-127, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const1(k = 0) annotation(Placement(visible = true, transformation(origin = {65, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add3 annotation(Placement(visible = true, transformation(origin = {-100, 60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
protected
  parameter Real P0(fixed = false) "The initial values of Mech";
initial equation
  P0 = PMECH0;
equation
  connect(add2.y, PMECH) annotation(Line(points = {{65.5, 60}, {80.1083, 60}, {80.1083, 0}, {104, 0}}, color = {0, 0, 127}));
  connect(add1.u1, add3.y) annotation(Line(points={{-76,63},{-87.9177,63},{
          -87.9177,60.1542},{-94.5,60.1542},{-94.5,60}},                                                                                        color = {0, 0, 127}));
  connect(add3.u1, dGREF) annotation(Line(points={{-106,63},{-109.512,63},{
          -109.512,80},{-100,80}},                                                                                         color = {0, 0, 127}));
  connect(add1.u2, SLIP) annotation(Line(points = {{-76, 57}, {-83.3924, 57}, {-83.3924, 0}, {-102, 0}}, color = {0, 0, 127}));
  connect(SLIP, gain2.u) annotation(Line(points = {{-102, 0}, {-18.1326, 0}, {-18.1326, 30.0406}, {-16, 30.0406}, {-16, 30}}, color = {0, 0, 127}));
  connect(gain2.y, add2.u2) annotation(Line(points = {{-4.5, 30}, {53.0447, 30}, {53.0447, 57}, {54, 57}}, color = {0, 0, 127}));
  connect(add2.u1, lead_lag1.y) annotation(Line(points = {{54, 63}, {40.866, 63}, {40.866, 60}, {40, 60}}, color = {0, 0, 127}));
  connect(lead_lag1.u, lag_non_windup_limit1.y) annotation(Line(points = {{20, 60}, {1.35318, 60}, {1.35318, 60}, {1, 60}}, color = {0, 0, 127}));
  connect(lag_non_windup_limit1.u, gain1.y) annotation(Line(points = {{-21, 60}, {-34.6414, 60}, {-34.6414, 60}, {-34.5, 60}}, color = {0, 0, 127}));
  connect(gain1.u, add1.y) annotation(Line(points = {{-46, 60}, {-64.4114, 60}, {-64.4114, 60}, {-64.5, 60}}, color = {0, 0, 127}));
  connect(const2.y, add3.u2) annotation(Line(points={{-116,60},{-115.167,60},{
          -115.167,57},{-106,57}},                                                                                            color = {0, 0, 127}));
  connect(const1.y, PMECH_LP) annotation(Line(points = {{76, -60}, {104, -60}}, color = {0, 0, 127}));
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1})), Documentation(info = "<html>

<p>
In this model, GREF is VAR(L) in the picture.
</p>

<img src=\"modelica://OpalRT/resource/Turbine-Governor/TGOV1.png\"
alt=\"TGOV1.png\"><br>

</html>"));
end TGOV1;
