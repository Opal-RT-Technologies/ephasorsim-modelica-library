within OpalRT.Electrical.Control.TurbineGovernor;
model HYGOV
  extends OpalRT.Electrical.PartialModel.TurbineGovernor;
  parameter Integer IBUS = 100 "Located Bus No.";
  parameter String ID = "M1" "Machine Identifier";
  parameter Real R = 0.06 "Permanent Droop";
  parameter Real r = 0.4 "Temporary Droop";
  parameter Real Tr = 8 "(>0) Governor time constant";
  parameter Real Tf = 0.05 "(>0) Filter time constant";
  parameter Real Tg = 0.2 "(>0) Servo time constant";
  parameter Real VELM = 0.01 "Gate velocity limit";
  parameter Real GMAX = 0.601 "Maximum gate limit";
  parameter Real GMIN = 0 "Minimum gate limit";
  parameter Real TW = 1.2 "(>0) Water time constant";
  parameter Real At = 2.5 "Trubine gain";
  parameter Real Dturb = 0 "Turbine damping";
  parameter Real qNL = 0.5 "No power flow";
  Modelica.Blocks.Math.Gain gain1(k = R) annotation(Placement(visible = true, transformation(origin = {-30, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 180)));
  Modelica.Blocks.Math.Add add2(k2 = +1) annotation(Placement(visible = true, transformation(origin = {-70, 60}, extent = {{-5, -5}, {5, 5}}, rotation = 90)));
  Modelica.Blocks.Math.Gain gain2(k = Dturb) annotation(Placement(visible = true, transformation(origin = {20, 20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Product product1 annotation(Placement(visible = true, transformation(origin = {45, 25}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add3(k2 = +1, k1 = -1) annotation(Placement(visible = true, transformation(origin = {70, 0}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add4(k1 = -1) annotation(Placement(visible = true, transformation(origin = {-35, -35}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Product product2 annotation(Placement(visible = true, transformation(origin = {-55, -35}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator integrator1(k = 1 / TW, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = PMECH_0 / At + qNL) annotation(Placement(visible = true, transformation(origin = {-15, -35}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add5(k2 = -1) annotation(Placement(visible = true, transformation(origin = {5, -35}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Product product3 annotation(Placement(visible = true, transformation(origin = {25, -35}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain3(k = At) annotation(Placement(visible = true, transformation(origin = {45, -35}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 1) annotation(Placement(visible = true, transformation(origin = {-60, -50}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant1(k = qNL) annotation(Placement(visible = true, transformation(origin = {10, -50}, extent = {{-5, -5}, {5, 5}}, rotation = 180)));
  Modelica.Blocks.Math.Division division1 annotation(Placement(visible = true, transformation(origin = {-75, -35}, extent = {{-5, 5}, {5, -5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1(k2 = -1) annotation(Placement(visible = true, transformation(origin = {-60, 80}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunctionNonWindup.Integrator_NonWindupLimit non_windup_integrator1(KI = 1, VRMAX = GMAX, VRMIN = GMIN, y_init = GREF_0 / R) annotation(Placement(visible = true, transformation(origin = {20, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunctionWindup.PD_WindupLimit pd_non_windup_limit1(KP = 1 / (r * Tr), KD = 1 / r, MIN = -VELM, MAX = VELM) annotation(Placement(visible = true, transformation(origin = {-10, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder transferfunction2(T = Tf, initType = Modelica.Blocks.Types.Init.SteadyState) annotation(Placement(visible = true, transformation(origin = {-40, 80}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder transferfunction3(T = Tg, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = GREF_0 / R) annotation(Placement(visible = true, transformation(origin = {50, 80}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const1(k = GREF_0) annotation(Placement(visible = true, transformation(origin = {-116, 60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const2(k = 0) annotation(Placement(visible = true, transformation(origin = {74, -61}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add6(k2 = +1) annotation(Placement(visible = true, transformation(origin = {-80, 80}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
protected
  parameter Real PMECH_0(fixed = false);
protected
  parameter Real GREF_0 = (PMECH_0 / At + qNL) * R;
initial equation
  PMECH_0 = PMECH0;
equation
  connect(add1.u1, add6.y) annotation(Line(points={{-66,83},{-70.0214,83},{
          -70.0214,80.0724},{-74.5,80.0724},{-74.5,80}},                                                                                        color = {0, 0, 127}));
  connect(const1.y, add6.u2) annotation(Line(points={{-110.5,60},{-89.1182,60},
          {-89.1182,77.0571},{-86,77.0571},{-86,77}},                                                                                              color = {0, 0, 127}));
  connect(add6.u1, dGREF) annotation(Line(points={{-86,83},{-95.4838,83},{
          -95.4838,80},{-100,80}},                                                                                        color = {0, 0, 127}));
  connect(transferfunction3.y, division1.u2) annotation(Line(points = {{55.5, 80}, {60.1367, 80}, {60.1367, 33.4852}, {-16.8565, 33.4852}, {-16.8565, -14.5786}, {-84.9658, -14.5786}, {-84.9658, -31.8907}, {-81, -31.8907}, {-81, -32}}, color = {0, 0, 127}));
  connect(transferfunction3.y, product1.u1) annotation(Line(points = {{55.5, 80}, {60.1367, 80}, {60.1367, 33.4852}, {32.3462, 33.4852}, {32.3462, 28.0182}, {39, 28.0182}, {39, 28}}, color = {0, 0, 127}));
  connect(transferfunction3.u, non_windup_integrator1.y) annotation(Line(points = {{44, 80}, {24.8292, 80}, {24.8292, 80}, {25, 80}}, color = {0, 0, 127}));
  connect(transferfunction2.y, pd_non_windup_limit1.u) annotation(Line(points = {{-34.5, 80}, {-20.7289, 80}, {-20.7289, 80}, {-20, 80}}, color = {0, 0, 127}));
  connect(add1.y, transferfunction2.u) annotation(Line(points = {{-54.5, 80}, {-46.0137, 80}, {-46.0137, 80}, {-46, 80}}, color = {0, 0, 127}));
  connect(pd_non_windup_limit1.y, non_windup_integrator1.u) annotation(Line(points = {{5.55112e-16, 80}, {14.8984, 80}, {14.8984, 80}, {15, 80}}, color = {0, 0, 127}));
  connect(gain1.u, non_windup_integrator1.y) annotation(Line(points = {{-24, 40}, {35.6923, 40}, {35.6923, 80}, {25, 80}, {25, 80}}, color = {0, 0, 127}));
  connect(add2.y, add1.u2) annotation(Line(points = {{-70, 65.5}, {-70, 76.9752}, {-66, 76.9752}, {-66, 77}}, color = {0, 0, 127}));
  connect(integrator1.y, division1.u1) annotation(Line(points = {{-9.5, -35}, {-7.22348, -35}, {-7.22348, -60.4966}, {-84.8758, -60.4966}, {-84.8758, -38.149}, {-81, -38.149}, {-81, -38}}, color = {0, 0, 127}));
  connect(division1.y, product2.u2) annotation(Line(points = {{-69.5, -35}, {-66.5914, -35}, {-66.5914, -38.6005}, {-61, -38.6005}, {-61, -38}}, color = {0, 0, 127}));
  connect(division1.y, product2.u1) annotation(Line(points = {{-69.5, -35}, {-66.5914, -35}, {-66.5914, -32.2799}, {-61, -32.2799}, {-61, -32}}, color = {0, 0, 127}));
  connect(gain3.y, add3.u2) annotation(Line(points = {{50.5, -35}, {60.0451, -35}, {60.0451, -2.7088}, {64, -2.7088}, {64, -3}}, color = {0, 0, 127}));
  connect(product3.y, gain3.u) annotation(Line(points = {{30.5, -35}, {38.149, -35}, {38.149, -35}, {39, -35}}, color = {0, 0, 127}));
  connect(product2.y, product3.u1) annotation(Line(points = {{-49.5, -35}, {-45.8239, -35}, {-45.8239, -22.7991}, {13.9955, -22.7991}, {13.9955, -32.0542}, {19, -32.0542}, {19, -32}}, color = {0, 0, 127}));
  connect(add5.y, product3.u2) annotation(Line(points = {{10.5, -35}, {13.7698, -35}, {13.7698, -38.149}, {19, -38.149}, {19, -38}}, color = {0, 0, 127}));
  connect(constant1.y, add5.u2) annotation(Line(points = {{4.5, -50}, {-4.28894, -50}, {-4.28894, -37.6975}, {-1, -37.6975}, {-1, -38}}, color = {0, 0, 127}));
  connect(integrator1.y, add5.u1) annotation(Line(points = {{-9.5, -35}, {-7.22348, -35}, {-7.22348, -32.0542}, {-1, -32.0542}, {-1, -32}}, color = {0, 0, 127}));
  connect(integrator1.u, add4.y) annotation(Line(points = {{-21, -35}, {-30.0226, -35}, {-30.0226, -35}, {-29.5, -35}}, color = {0, 0, 127}));
  connect(const.y, add4.u2) annotation(Line(points = {{-54.5, -50}, {-44.921, -50}, {-44.921, -37.4718}, {-41, -37.4718}, {-41, -38}}, color = {0, 0, 127}));
  connect(product2.y, add4.u1) annotation(Line(points = {{-49.5, -35}, {-45.8239, -35}, {-45.8239, -31.6027}, {-41, -31.6027}, {-41, -32}}, color = {0, 0, 127}));
  connect(add3.y, PMECH) annotation(Line(points = {{75.5, 0}, {92.5508, 0}, {92.5508, 0}, {104, 0}}, color = {0, 0, 127}));
  connect(add3.u1, product1.y) annotation(Line(points = {{64, 3}, {59.8194, 3}, {59.8194, 25.2822}, {50.5643, 25.2822}, {50.5643, 25}, {50.5, 25}}, color = {0, 0, 127}));
  connect(gain2.y, product1.u2) annotation(Line(points = {{25.5, 20}, {29.3454, 20}, {29.3454, 21.6704}, {39, 21.6704}, {39, 22}}, color = {0, 0, 127}));
  connect(gain2.u, SLIP) annotation(Line(points = {{14, 20}, {-56, 20}, {-56, 0}, {-102, 0}}, color = {0, 0, 127}));
  connect(gain1.y, add2.u2) annotation(Line(points = {{-35.5, 40}, {-66.8172, 40}, {-66.8172, 54}, {-67, 54}}, color = {0, 0, 127}));
  connect(SLIP, add2.u1) annotation(Line(points = {{-102, 0}, {-72.912, 0}, {-72.912, 54}, {-73, 54}}, color = {0, 0, 127}));
  connect(PMECH_LP, const2.y) annotation(Line(points = {{104, -60}, {92, -60}, {92, -61}, {79.5, -61}}, color = {0, 0, 127}));
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1}), graphics={  Text(origin = {-32.6417, 86.1219}, lineColor = {255, 0, 0}, fillColor = {255, 0, 0}, extent = {{-0.448126, 0.566659}, {5.64, -6.21}}, textString = "e"), Text(origin = {32.8916, 88.3468}, lineColor = {255, 0, 0}, fillColor = {255, 0, 0}, extent = {{-1.12266, 0.565463}, {5.64, -6.21}}, textString = "c"), Text(origin = {64.7449, 71.4449}, lineColor = {255, 0, 0}, fillColor = {255, 0, 0}, extent = {{-3.38, 3.5}, {2.47973, -3.5012}}, textString = "g"), Text(origin = {-90.9943, -23.1559}, lineColor = {255, 0, 0}, fillColor = {255, 0, 0}, extent = {{0.457472, -0.337472}, {5.64, -6.21}}, textString = "g"), Text(origin = {-89.8, -41.15}, lineColor = {255, 0, 0}, fillColor = {255, 0, 0}, extent = {{0.00600451, -0.337472}, {5.64, -6.21}}, textString = "q"), Text(origin = {-66.9301, -24.1523}, lineColor = {255, 0, 0}, fillColor = {255, 0, 0}, extent = {{-1.79986, -0.111738}, {5.64, -6.21}}, textString = "q/g"), Text(origin = {-9.75485, -25.4389}, lineColor = {255, 0, 0}, fillColor = {255, 0, 0}, extent = {{0.00600451, -0.111738}, {5.64, -6.21}}, textString = "q"), Text(origin = {-49.12, -23.95}, lineColor = {255, 0, 0}, fillColor = {255, 0, 0}, extent = {{-1.57413, 0.113995}, {5.64, -6.21}}, textString = "h")}), Documentation(info = "<html>

<p>
In this model, R, r and Dturb are in pu on generator MVA base.
</p>

<img src=\"modelica://OpalRT/resource/Turbine-Governor/HYGOV.png\"
alt=\"HYGOV
.png\"><br>

</html>"));
end HYGOV;
