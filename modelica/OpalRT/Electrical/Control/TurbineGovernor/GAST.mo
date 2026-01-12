within OpalRT.Electrical.Control.TurbineGovernor;
model GAST
  extends OpalRT.Electrical.PartialModel.TurbineGovernor(SLIP(start = 0), PMECH(start = PMECH_0));
  parameter Integer IBUS = 100 "Located Bus No.";
  parameter String ID = "M1" "Machine Identifier";
  parameter Real R = 0.047 "Speed droop";
  parameter Real T1 = 0.4 "(>0) (sec)";
  parameter Real T2 = 0.1 "(>0) (sec)";
  parameter Real T3 = 3 "(>0) (sec)";
  parameter Real AT = 0.85 "Ambient temperature load limit";
  parameter Real KT = 2;
  parameter Real VMAX = 0.85;
  parameter Real VMIN = 0;
  parameter Real DTURB = 0;
  OpalRT.NonElectrical.Math.Continuous.TransferFunctionNonWindup.Lag_NonWindupLimit Lag_Non_Windup_Limit1(KI = 1, TI = T1, VRMAX = VMAX, VRMIN = -VMIN, y_init = PMECH_0) annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder firstorder1(T = T2, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = PMECH_0) annotation(Placement(visible = true, transformation(origin = {40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Min min1 annotation(Placement(visible = true, transformation(origin = {-40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder firstorder2(T = T3, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = PMECH_0) annotation(Placement(visible = true, transformation(origin = {40, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Math.Add add1(k1 = +1, k2 = -1) annotation(Placement(visible = true, transformation(origin = {0, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Math.Gain gain1(k = KT) annotation(Placement(visible = true, transformation(origin = {-40, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Math.Add add2 annotation(Placement(visible = true, transformation(origin = {-80, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Math.Add add3(k1 = -1) annotation(Placement(visible = true, transformation(origin = {-80, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain2(k = 1 / R) annotation(Placement(visible = true, transformation(origin = {-122, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain3(k = DTURB) annotation(Placement(visible = true, transformation(origin = {0, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add4(k1 = -1) annotation(Placement(visible = true, transformation(origin = {80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = AT) annotation(Placement(visible = true, transformation(origin = {40, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Sources.Constant const1(k = PMECH_0) annotation(Placement(visible = true, transformation(origin = {-136, 60}, extent = {{10, -10}, {-10, 10}}, rotation = 180)));
  Modelica.Blocks.Sources.Constant const2(k = 0) annotation(Placement(visible = true, transformation(origin = {134, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Math.Add add5 annotation(Placement(visible = true, transformation(origin = {-100, 60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
protected
  parameter Real PMECH_0(fixed = false);
initial equation
  PMECH_0 = PMECH0;
equation
  connect(firstorder2.u, firstorder1.y) annotation(Line(points = {{52, -40}, {59.2179, -40}, {59.2179, 0}, {51, 0}, {51, 0}}, color = {0, 0, 127}));
  connect(add5.y, add3.u2) annotation(Line(points={{-94.5,60},{-91.2596,60},{
          -91.2596,49.8715},{-106.427,49.8715},{-106.427,13.6247},{-92,13.6247},
          {-92,14}},                                                                                                                                                                        color = {0, 0, 127}));
  connect(dGREF, add5.u1) annotation(Line(points={{-100,80},{-115.424,80},{
          -115.424,62.7249},{-106,62.7249},{-106,63}},                                                                                          color = {0, 0, 127}));
  connect(add3.u1, gain2.y) annotation(Line(points = {{-92, 26}, {-111, 26}}, color = {0, 0, 127}));
  connect(min1.u1, add3.y) annotation(Line(points = {{-52, 6}, {-60, 6}, {-60, 20}, {-69, 20}, {-69, 20}}, color = {0, 0, 127}));
  connect(add2.y, min1.u2) annotation(Line(points = {{-91, -40}, {-94.7692, -40}, {-94.7692, -6.76923}, {-52, -6.76923}, {-52, -6}}, color = {0, 0, 127}));
  connect(const.y, add2.u1) annotation(Line(points = {{29, -80}, {-57.5385, -80}, {-57.5385, -46.1538}, {-68, -46.1538}, {-68, -46}}, color = {0, 0, 127}));
  connect(const.y, add1.u1) annotation(Line(points = {{29, -80}, {20, -80}, {20, -46.4615}, {12, -46.4615}, {12, -46}}, color = {0, 0, 127}));
  connect(gain1.y, add2.u2) annotation(Line(points = {{-51, -40}, {-55.0769, -40}, {-55.0769, -34.1538}, {-68, -34.1538}, {-68, -34}}, color = {0, 0, 127}));
  connect(add1.y, gain1.u) annotation(Line(points = {{-11, -40}, {-26.4615, -40}, {-26.4615, -40}, {-28, -40}}, color = {0, 0, 127}));
  connect(firstorder2.y, add1.u2) annotation(Line(points = {{29, -40}, {21.8462, -40}, {21.8462, -34.4615}, {12, -34.4615}, {12, -34}}, color = {0, 0, 127}));
  connect(add4.y, PMECH) annotation(Line(points = {{91, 0}, {104, 0}}, color = {0, 0, 127}));
  connect(Lag_Non_Windup_Limit1.u, min1.y) annotation(Line(points = {{-11, 0}, {-28.3077, 0}, {-28.3077, 0}, {-29, 0}}, color = {0, 0, 127}));
  connect(firstorder1.u, Lag_Non_Windup_Limit1.y) annotation(Line(points = {{28, 0}, {10.7692, 0}, {10.7692, 0}, {11, 0}}, color = {0, 0, 127}));
  connect(firstorder1.y, add4.u2) annotation(Line(points = {{51, 0}, {59.0769, 0}, {59.0769, -6.76923}, {68, -6.76923}, {68, -6}}, color = {0, 0, 127}));
  connect(add4.u1, gain3.y) annotation(Line(points = {{68, 6}, {60.6154, 6}, {60.6154, 79.6923}, {11, 79.6923}, {11, 80}}, color = {0, 0, 127}));
  connect(SLIP, gain3.u) annotation(Line(points = {{-102, 0}, {-152, 0}, {-152, 92}, {-40, 92}, {-40, 80}, {-12, 80}}, color = {0, 0, 127}));
  connect(SLIP, gain2.u) annotation(Line(points = {{-102, 0}, {-141.692, 0}, {-141.692, 26}, {-134, 26}}, color = {0, 0, 127}));
  connect(const1.y, add5.u2) annotation(Line(points={{-125,60},{-115.681,60},{
          -115.681,56.5553},{-106,56.5553},{-106,57}},                                                                                             color = {0, 0, 127}));
  connect(PMECH_LP, const2.y) annotation(Line(points = {{104, -60}, {123, -60}}, color = {0, 0, 127}));
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), experiment(StartTime = 0, StopTime = 5, Tolerance = 1e-06, Interval = 0.01), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Documentation(info = "<html>

<p>
In this model, AT (Load Limit) is the ambient temperature load limit.
</p>

<img src=\"modelica://OpalRT/resource/Turbine-Governor/GAST.png\"
alt=\"GAST.png\"><br>

</html>"));
end GAST;
