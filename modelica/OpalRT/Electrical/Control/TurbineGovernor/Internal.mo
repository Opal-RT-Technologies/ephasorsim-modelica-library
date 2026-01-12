within OpalRT.Electrical.Control.TurbineGovernor;
package Internal
  extends Modelica.Icons.InternalPackage;
  block Actuator
    parameter Real K = 1;
    parameter Real T4 = 1;
    parameter Real T5 = 1;
    parameter Real T6 = 1;
    parameter Real TMAX = 1;
    parameter Real TMIN = -1;
    parameter Real y_init = 0;
    Modelica.Blocks.Interfaces.RealInput u annotation(Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Nonlinear.Limiter limiter1(uMax = TMAX, uMin = TMIN, strict = false) annotation(Placement(visible = true, transformation(origin = {60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Gain gain1(k = K) annotation(Placement(visible = true, transformation(origin = {-60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.Integrator integrator1(initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = y_init, k = 1) annotation(Placement(visible = true, transformation(origin = {-20, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    OpalRT.NonElectrical.Math.Continuous.TransferFunction.TransferFunction2 transferfunction21(b = {T4, 1}, a = {T5 * T6, T5 + T6, 1}, y_start = y_init) annotation(Placement(visible = true, transformation(origin = {20, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    gain1.u = if transferfunction21.y < TMAX and transferfunction21.y > TMIN or transferfunction21.y >= TMAX and u < 0 or transferfunction21.y <= TMIN and u > 0 then u else 0;
    connect(limiter1.u, transferfunction21.y) annotation(Line(points = {{48, 0}, {30.6273, 0}, {30.6273, 0}, {30.6273, 0}}, color = {0, 0, 127}));
    connect(transferfunction21.u, integrator1.y) annotation(Line(points = {{10, 0}, {-9.5941, 0}, {-9.5941, 0}, {-9.5941, 0}}, color = {0, 0, 127}));
    connect(integrator1.u, gain1.y) annotation(Line(points = {{-32, 0}, {-49.0775, 0}, {-49.0775, -1.10701}, {-49.0775, -1.10701}}, color = {0, 0, 127}));
    connect(y, limiter1.y) annotation(Line(points = {{100, 0}, {71.2177, 0}, {71.2177, -0.738007}, {71.2177, -0.738007}}, color = {0, 0, 127}));
    annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Rectangle(origin = {0.433839, 0}, extent = {{-99.7831, 100.217}, {99.7831, -100.217}}), Text(origin = {4.34232, 4.55937}, extent = {{-73.75, 27.55}, {73.75, -27.55}}, textString = "Actuator")}));
  end Actuator;

block Alimit "Limits Maximum change to ALIM, time-step dependent."
  parameter Real ALIM = 1 "Maximum Change";
  parameter Real DELT = 0.01 "Simulation time-step";
  parameter Real Period = 0.01 "Sampling period";
  Modelica.Blocks.Interfaces.RealInput u annotation(Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-15, -15}, {15, 15}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(visible = true, transformation(origin = {100, 0}, extent = {{-15, -15}, {15, 15}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    OpalRT.Electrical.Control.TurbineGovernor.Internal.SampleHold samplehold(
        Period=Period, DELT=DELT) annotation (Placement(visible=true,
          transformation(
          origin={-40,0},
          extent={{-10,-10},{10,10}},
          rotation=0)));
  Modelica.Blocks.Nonlinear.SlewRateLimiter slewratelimiter(Rising = ALIM / Period, Td = Period) annotation(Placement(visible = true, transformation(origin = {40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  protected
  parameter Real factor(fixed = false);
  parameter Real ALIM_(fixed = false);
  Real x;
initial equation
  factor = if ALIM < 0.18 then 3 elseif ALIM < 0.23 then 4
  elseif ALIM < 0.28 then 5
  elseif ALIM < 0.33 then 6
  elseif ALIM < 0.38 then 7 else 8;
  ALIM_ = (ALIM / 0.01 + factor) * DELT;
  x = u;
algorithm
  when {samplehold.t > 0, samplehold.zerocrossing1.y} then
  x := if u - x > ALIM_ then x + ALIM_ elseif u - x < (-ALIM_) then x - ALIM_ else u;
  end when;
equation
  y = if Period < 0.0125 then slewratelimiter.y else x;
  connect(samplehold.y, slewratelimiter.u) annotation(Line(points = {{-30, 0}, {26.6223, 0}, {26.6223, 0.332779}, {26.6223, 0.332779}}, color = {0, 0, 127}));
  connect(samplehold.u, u) annotation(Line(points = {{-50, 0}, {-88.0759, 0}, {-88.0759, -0.542005}, {-88.0759, -0.542005}}, color = {0, 0, 127}));
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Rectangle(origin = {0.22805, 0}, extent = {{-100.114, 99.886}, {100.114, -99.886}}), Text(origin = {-21.1285, -15.3973}, extent = {{-70.039, 57.794}, {14, -6.4}}, textString = "A"), Text(origin = {50.9062, -39.006}, extent = {{-77.0851, 52.103}, {14, -6.4}}, textString = "LIMIT")}), experiment(StartTime = 0, StopTime = 30, Tolerance = 1e-06, Interval = 0.003));
end Alimit;

  block ActuatorB
    parameter Real Tact = 1;
    parameter Real ropen = 1;
    parameter Real rclose = -1;
    parameter Real y_start = 1;
    Modelica.Blocks.Interfaces.RealInput u annotation(Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add add1(k2 = -1) annotation(Placement(visible = true, transformation(origin = {-50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Gain gain1(k = 1 / Tact) annotation(Placement(visible = true, transformation(origin = {-20, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Nonlinear.Limiter limiter1(uMax = ropen, uMin = rclose) annotation(Placement(visible = true, transformation(origin = {10, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.Integrator integrator1(initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = y_start) annotation(Placement(visible = true, transformation(origin = {40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(integrator1.y, add1.u2) annotation(Line(points = {{51, 0}, {60.8931, 0}, {60.8931, -22.4628}, {-68.2003, -22.4628}, {-68.2003, -5.95399}, {-62, -5.95399}, {-62, -6}}, color = {0, 0, 127}));
    connect(integrator1.y, y) annotation(Line(points = {{51, 0}, {94.1813, 0}, {94.1813, 0}, {100, 0}}, color = {0, 0, 127}));
    connect(limiter1.y, integrator1.u) annotation(Line(points = {{21, 0}, {26.4953, 0}, {26.4953, 0}, {28, 0}}, color = {0, 0, 127}));
    connect(gain1.y, limiter1.u) annotation(Line(points = {{-9, 0}, {-3.2747, 0}, {-3.2747, 0}, {-2, 0}}, color = {0, 0, 127}));
    connect(add1.y, gain1.u) annotation(Line(points = {{-39, 0}, {-31.9621, 0}, {-31.9621, 0}, {-32, 0}}, color = {0, 0, 127}));
    connect(u, add1.u1) annotation(Line(points = {{-100, 0}, {-86.3329, 0}, {-86.3329, 5.95399}, {-73.3424, 6}, {-62, 6}}, color = {0, 0, 127}));
    annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1}), graphics={  Text(origin = {-7.17445, 10.69}, extent = {{-50.47, 9.61}, {57.7772, -24.7656}}, textString = "Actuator"), Rectangle(origin = {0, -0.811908}, extent = {{-99.8647, 52.774}, {99.8647, -52.774}})}));
  end ActuatorB;

  block Boiler
    Modelica.Blocks.Math.Add add2(k1 = +1, k2 = -1) annotation(Placement(visible = true, transformation(origin = {-6, 12}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    Modelica.Blocks.Math.Add add3(k1 = +1, k2 = -1) annotation(Placement(visible = true, transformation(origin = {70, 10}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    Modelica.Blocks.Math.Add add4(k1 = -1, k2 = +1) annotation(Placement(visible = true, transformation(origin = {44, -12}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    Modelica.Blocks.Math.Product product1 annotation(Placement(visible = true, transformation(origin = {62, -14}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    Modelica.Blocks.Math.Gain gain3(k = K9) annotation(Placement(visible = true, transformation(origin = {28, -4}, extent = {{-5, -5}, {5, 5}}, rotation = 360)));
    Modelica.Blocks.Sources.Constant const(k = C1) annotation(Placement(visible = true, transformation(origin = {26, -18}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    Modelica.Blocks.Math.Product product2 annotation(Placement(visible = true, transformation(origin = {-62, -30}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    Modelica.Blocks.Continuous.Integrator integrator1(k = 1 / CB, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = PD0) annotation(Placement(visible = true, transformation(origin = {12, 12}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    parameter Real K9 = 0.01;
    parameter Real CB = 0.01;
    parameter Real C1 = 0.01;
    parameter Real PD0;
    Modelica.Blocks.Interfaces.RealInput fuel annotation(Placement(transformation(rotation = 0, extent = {{-108, 50}, {-88, 70}}), iconTransformation(extent = {{-108, 50}, {-88, 70}})));
    Modelica.Blocks.Interfaces.RealInput ms annotation(Placement(transformation(rotation = 0, extent = {{-108, -70}, {-88, -50}}), iconTransformation(extent = {{-108, -70}, {-88, -50}})));
    Modelica.Blocks.Interfaces.RealOutput PT annotation(Placement(transformation(rotation = 0, extent = {{92, -10}, {112, 10}}), iconTransformation(extent = {{92, -10}, {112, 10}})));
  equation
    connect(integrator1.y, add3.u1) annotation(Line(points = {{18.6, 12}, {63.1808, 12}, {63.1808, 13}, {64, 13}}, color = {0, 0, 127}));
    connect(integrator1.y, gain3.u) annotation(Line(points = {{18.6, 12}, {21.7865, 12}, {21.7865, -4}, {22, -4}}, color = {0, 0, 127}));
    connect(add2.y, integrator1.u) annotation(Line(points = {{-0.5, 12}, {4.13943, 12}, {4.13943, 12}, {4.8, 12}}, color = {0, 0, 127}));
    connect(product2.y, product1.u2) annotation(Line(points = {{-56.5, -30}, {55.1198, -30}, {55.1198, -17}, {56, -17}}, color = {0, 0, 127}));
    connect(product1.y, add3.u2) annotation(Line(points = {{67.5, -14}, {69.9346, -14}, {69.9346, -1.96078}, {63.3987, -1.96078}, {63.3987, 7}, {64, 7}}, color = {0, 0, 127}));
    connect(add4.y, product1.u1) annotation(Line(points = {{49.5, -12}, {55.7734, -12}, {55.7734, -11}, {56, -11}}, color = {0, 0, 127}));
    connect(const.y, add4.u2) annotation(Line(points = {{31.5, -18}, {37.9085, -18}, {37.9085, -15}, {38, -15}}, color = {0, 0, 127}));
    connect(gain3.y, add4.u1) annotation(Line(points = {{33.5, -4}, {37.6906, -4}, {37.6906, -9}, {38, -9}}, color = {0, 0, 127}));
    connect(fuel, add2.u1) annotation(Line(points = {{-98, 60}, {-42.6362, 60}, {-42.6362, 15}, {-12, 15}}, color = {0, 0, 127}));
    connect(ms, add2.u2) annotation(Line(points = {{-98, -60}, {-76, -60}, {-76, 10}, {-12, 10}, {-12, 9}}, color = {0, 0, 127}));
    connect(PT, add3.y) annotation(Line(points = {{102, 0}, {88, 0}, {88, 10}, {75.5, 10}}, color = {0, 0, 127}));
    connect(ms, product2.u1) annotation(Line(points = {{-98, -60}, {-76, -60}, {-76, -26}, {-68, -26}, {-68, -27}}, color = {0, 0, 127}));
    connect(ms, product2.u2) annotation(Line(points = {{-98, -60}, {-76, -60}, {-76, -34}, {-68, -34}, {-68, -33}}, color = {0, 0, 127}));
    annotation(Diagram(graphics = {Text(origin = {25.5589, 15.0988}, lineColor = {255, 170, 0}, extent = {{-3.37562, 2.9363}, {1.85057, -2.9363}}, textString = "PD"), Text(origin = {81.5111, 14.4063}, lineColor = {255, 170, 0}, extent = {{-3.37562, 2.9363}, {1.85, -2.94}}, textString = "PT")}), Icon(graphics={  Rectangle(extent = {{-100, 100}, {100, -100}}, lineColor = {28, 108, 200}), Text(extent = {{-36, 26}, {34, -16}}, lineColor = {28, 108, 200}, textString = "%name"), Text(extent = {{-84, -50}, {-60, -68}}, lineColor = {28, 108, 200}, textString = "ms"), Text(extent = {{-84, 70}, {-60, 52}}, lineColor = {28, 108, 200}, textString = "fuel"), Text(extent = {{62, 10}, {86, -8}}, lineColor = {28, 108, 200}, textString = "PT")}));
  end Boiler;

  block CombustionSystem
    parameter Real T "sec";
    parameter Real ECR "sec";
    parameter Real K3;
    parameter Real K6;
    parameter Real a "(> 0) valve positioner";
    parameter Real b "(> 0) valve positioner, sec.";
    parameter Real c "valve positioner";
    parameter Real Tf "(> 0), sec";
    parameter Real Kf;
    parameter Real y_init_fuel_system;
    parameter Real y_init_valve_position;
    Modelica.Blocks.Interfaces.RealInput u annotation(Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Gain gain1(k = Kf) annotation(Placement(visible = true, transformation(origin = {-20, 20}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
    Modelica.Blocks.Math.Add3 add31(k3 = -1) annotation(Placement(visible = true, transformation(origin = {-40, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant const(k = K6) annotation(Placement(visible = true, transformation(origin = {-85, 75}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    Modelica.Blocks.Math.Gain gain2(k = K3) annotation(Placement(visible = true, transformation(origin = {-80, -20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    OpalRT.Electrical.Control.TurbineGovernor.Internal.ValvePositioner
      valve_positioner1(
      y_start=y_init_valve_position,
      a=a,
      b=b,
      c=c) annotation (Placement(visible=true, transformation(
          origin={0,40},
          extent={{-10,-10},{10,10}},
          rotation=0)));
    Modelica.Blocks.Continuous.FirstOrder FuelSystem(T = Tf, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = y_init_fuel_system) annotation(Placement(visible = true, transformation(origin = {40, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    OpalRT.NonElectrical.Math.Continuous.TransferFunction.TransferFunction2 transferfunction21(b = {T_p1ECR, -T_p2ECR, 1}, a = {T_p1ECR, T_p2ECR, 1}, y_start = y_init_fuel_system) annotation(Placement(visible = true, transformation(origin = {60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    OpalRT.NonElectrical.Math.Continuous.TransferFunction.TransferFunction2 transferfunction22(b = {T_p1, -T_p2, 1}, a = {T_p1, T_p2, 1}, y_start = (c / a + Kf) * y_init_fuel_system - K6) annotation(Placement(visible = true, transformation(origin = {-40, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  protected
    parameter Real T_p1ECR(fixed = false);
    parameter Real T_p2ECR(fixed = false);
    parameter Real T_p1(fixed = false);
    parameter Real T_p2(fixed = false);
  initial equation
    T_p1ECR = if ECR <> 0 then ECR ^ 2 / 12 else 0;
    T_p2ECR = if ECR <> 0 then ECR / 2 else 0;
    T_p1 = if T <> 0 then T ^ 2 / 12 else 0;
    T_p2 = if T <> 0 then T / 2 else 0;
  equation
    connect(transferfunction22.y, add31.u2) annotation(Line(points = {{-30, -20}, {-9.38967, -20}, {-9.38967, 8.92019}, {-73.7089, 8.92019}, {-73.7089, 39.4366}, {-53.9906, 39.4366}, {-53.9906, 39.4366}}, color = {0, 0, 127}));
    connect(gain2.y, transferfunction22.u) annotation(Line(points = {{-74.5, -20}, {-51.1737, -20}, {-51.1737, -19.7183}, {-51.1737, -19.7183}}, color = {0, 0, 127}));
    connect(transferfunction21.u, FuelSystem.y) annotation(Line(points = {{50, 0}, {37.0892, 0}, {37.0892, 16.4319}, {76.0563, 16.4319}, {76.0563, 39.9061}, {51.1737, 39.9061}, {51.1737, 39.9061}}, color = {0, 0, 127}));
    connect(transferfunction21.y, y) annotation(Line(points = {{70, 0}, {92.9577, 0}, {92.9577, 1.87793}, {92.9577, 1.87793}}, color = {0, 0, 127}));
    connect(FuelSystem.y, gain1.u) annotation(Line(points = {{51, 40}, {67.2566, 40}, {67.2566, 19.823}, {-13.0973, 19.823}, {-13.0973, 19.823}}, color = {0, 0, 127}));
    connect(valve_positioner1.y, FuelSystem.u) annotation(Line(points = {{10, 40}, {26.9576, 40}, {26.9576, 40}, {28, 40}}, color = {0, 0, 127}));
    connect(add31.y, valve_positioner1.u) annotation(Line(points = {{-29, 40}, {-10.7062, 40}, {-10.7062, 40}, {-10, 40}}, color = {0, 0, 127}));
    connect(u, gain2.u) annotation(Line(points = {{-100, 0}, {-89.5216, 0}, {-89.5216, -20.2733}, {-86, -20.2733}, {-86, -20}}, color = {0, 0, 127}));
    connect(gain1.y, add31.u3) annotation(Line(points = {{-25.5, 20}, {-60.82, 20}, {-60.82, 31.8907}, {-52, 31.8907}, {-52, 32}}, color = {0, 0, 127}));
    connect(const.y, add31.u1) annotation(Line(points = {{-79.5, 75}, {-61.0478, 75}, {-61.0478, 48.2916}, {-52, 48.2916}, {-52, 48}}, color = {0, 0, 127}));
    annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Rectangle(origin = {-1.48064, 2.2779}, extent = {{-96.9248, 94.3052}, {96.9248, -94.3052}}), Text(origin = {3.08, 13.9}, extent = {{-66.17, 29.84}, {66.17, -29.84}}, textString = "Fuel")}));
  end CombustionSystem;

  block CoordinatedController
    parameter Real K12 = 0.01;
    parameter Real K13 = 0.01;
    parameter Real K14 = 0.01;
    parameter Real RMAX = 0.01;
    parameter Real RMIN = 0.01;
    parameter Real LMAX = 0.01;
    parameter Real LMIN = 0.01;
    parameter Real C2 = 0.01;
    parameter Real C3 = 0.01;
    parameter Real B = 0.01;
    parameter Real TMW = 0.01;
    parameter Real KL = 0.01;
    parameter Real KMW = 0.01;
    parameter Real DPE = 0.01;
    parameter Real PSP = 0.01;
    parameter Real PO0;
    parameter Real C2_v0;
    parameter Real C3_v0;
    parameter Real Des_MW0;
    parameter Real PSP0;
    Real C2_v;
    Real C3_v;
    Modelica.Blocks.Math.Add add1(k1 = +1, k2 = -1) annotation(Placement(visible = true, transformation(origin = {-56, 0}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    Modelica.Blocks.Math.Gain gain2(k = K13) annotation(Placement(visible = true, transformation(origin = {-54, 20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    Modelica.Blocks.Math.Add add2(k1 = +1, k2 = +1) annotation(Placement(visible = true, transformation(origin = {-32, 30}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    Modelica.Blocks.Math.Product product1 annotation(Placement(visible = true, transformation(origin = {-6, 44}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    Modelica.Blocks.Math.Gain gain3(k = K12) annotation(Placement(visible = true, transformation(origin = {12, 44}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    Modelica.Blocks.Math.Add add3(k1 = +1, k2 = +1) annotation(Placement(visible = true, transformation(origin = {30, 48}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    Modelica.Blocks.Math.Product product2 annotation(Placement(visible = true, transformation(origin = {50, 52}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    Modelica.Blocks.Math.Add add4(k1 = -1, k2 = +1) annotation(Placement(visible = true, transformation(origin = {64, 18}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
    Modelica.Blocks.Math.Gain gain1(k = B) annotation(Placement(visible = true, transformation(origin = {-80, 0}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    OpalRT.NonElectrical.Math.Continuous.TransferFunctionNonWindup.Integrator_NonWindupLimit non_windup_integrator1(VRMAX = LMAX, VRMIN = LMIN, y_init = PO0) annotation(Placement(visible = true, transformation(origin = {-20, -33}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    Modelica.Blocks.Nonlinear.Limiter limiter1(uMax = RMAX, uMin = RMIN) annotation(Placement(visible = true, transformation(origin = {2, -33}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
    Modelica.Blocks.Math.Gain gain4(k = K14) annotation(Placement(visible = true, transformation(origin = {20, -33}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
    Modelica.Blocks.Math.Add3 add32(k2 = -1, k3 = -1) annotation(Placement(visible = true, transformation(origin = {40, -33}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
    Modelica.Blocks.Math.Gain gain5(k = KL) annotation(Placement(visible = true, transformation(origin = {-16, -60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput Dem_MW annotation(Placement(visible = true, transformation(origin = {-100, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-94, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput Des_MW annotation(Placement(visible = true, transformation(origin = {100, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 180), iconTransformation(origin = {102, 76}, extent = {{10, -10}, {-10, 10}}, rotation = 180)));
    Modelica.Blocks.Interfaces.RealOutput PO annotation(Placement(visible = true, transformation(origin = {-100, -34}, extent = {{-10, -10}, {10, 10}}, rotation = 180), iconTransformation(origin = {100, -84}, extent = {{10, -10}, {-10, 10}}, rotation = 180)));
    OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag lag1(K = 1, T = TMW, initType = Modelica.Blocks.Types.Init.SteadyState) annotation(Placement(visible = true, transformation(origin = {80, -34}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
    Modelica.Blocks.Math.Gain gain6(k = KMW) annotation(Placement(visible = true, transformation(origin = {64, -34}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
    Modelica.Blocks.Nonlinear.DeadZone deadzone1(uMax = DPE) annotation(Placement(visible = true, transformation(origin = {-58, 88}, extent = {{-5.5, -5.5}, {5.5, 5.5}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput P_SP annotation(Placement(visible = true, transformation(origin = {100, 28}, extent = {{10, -10}, {-10, 10}}, rotation = 180), iconTransformation(origin = {100, -12}, extent = {{10, -10}, {-10, 10}}, rotation = 180)));
    Modelica.Blocks.Interfaces.RealInput Df annotation(Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-96, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput PELEC annotation(Placement(visible = true, transformation(origin = {100, -34}, extent = {{10, -10}, {-10, 10}}, rotation = 0), iconTransformation(origin = {-96, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput PE annotation(Placement(visible = true, transformation(origin = {-100, 86}, extent = {{-10, -10}, {10, 10}}, rotation = 360), iconTransformation(origin = {-96, 84}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(PE, deadzone1.u) annotation(Line(points = {{-100, 86}, {-65.3595, 86}, {-65.3595, 88}, {-64.6, 88}}, color = {0, 0, 127}));
    C2_v = C2_v0;
    C3_v = C3_v0;
    C2_v = add3.u1;
    C3_v = add2.u1;
    connect(deadzone1.y, product2.u1) annotation(Line(points = {{-51.95, 88}, {31.0655, 88}, {31.0655, 88.0616}, {37.9974, 88.0616}, {37.9974, 54.9422}, {44, 54.9422}, {44, 55}}, color = {0, 0, 127}));
    connect(PELEC, lag1.u) annotation(Line(points = {{100, -34}, {85.2896, -34}, {85.2896, -34}, {85, -34}}, color = {0, 0, 127}));
    connect(lag1.y, gain6.u) annotation(Line(points = {{75, -34}, {70.7128, -34}, {70.7128, -34}, {70, -34}}, color = {0, 0, 127}));
    connect(gain6.y, add32.u2) annotation(Line(points = {{58.5, -34}, {46.8317, -34}, {46.8317, -33}, {46, -33}}, color = {0, 0, 127}));
    connect(add4.y, add32.u1) annotation(Line(points = {{58.5, 18}, {56.4462, 18}, {56.4462, -29.0047}, {46, -29.0047}, {46, -29}}, color = {0, 0, 127}));
    connect(gain5.y, add32.u3) annotation(Line(points = {{-10.5, -60}, {56.9672, -60}, {56.9672, -36.994}, {46, -36.994}, {46, -37}}, color = {0, 0, 127}));
    connect(PO, gain5.u) annotation(Line(points = {{-100, -34}, {-93.6138, -34}, {-93.6138, -60.4408}, {-22, -60.4408}, {-22, -60}}, color = {0, 0, 127}));
    connect(non_windup_integrator1.y, PO) annotation(Line(points = {{-25, -33}, {-92.2244, -33}, {-92.2244, -34}, {-100, -34}}, color = {0, 0, 127}));
    connect(add32.y, gain4.u) annotation(Line(points = {{34.5, -33}, {26.6724, -33}, {26.6724, -33}, {26, -33}}, color = {0, 0, 127}));
    connect(gain4.y, limiter1.u) annotation(Line(points = {{14.5, -33}, {8.68403, -33}, {8.68403, -33}, {8, -33}}, color = {0, 0, 127}));
    connect(limiter1.y, non_windup_integrator1.u) annotation(Line(points = {{-3.5, -33}, {-14.4217, -33}, {-14.4217, -33}, {-15, -33}}, color = {0, 0, 127}));
    connect(PO, product1.u1) annotation(Line(points = {{-100, -34}, {-109.94, -34}, {-109.94, 47.2411}, {-12, 47.2411}, {-12, 47}}, color = {0, 0, 127}));
    connect(gain1.y, add1.u2) annotation(Line(points = {{-74.5, 0}, {-71.3827, 0}, {-71.3827, -3.29993}, {-62, -3.29993}, {-62, -3}}, color = {0, 0, 127}));
    connect(Df, gain1.u) annotation(Line(points = {{-100, 0}, {-86.1456, 0}, {-86.1456, 0}, {-86, 0}}, color = {0, 0, 127}));
    connect(Des_MW, add4.u2) annotation(Line(points = {{100, 0}, {93.9736, 0}, {93.9736, 14.7318}, {70, 14.7318}, {70, 15}}, color = {0, 0, 127}));
    connect(product2.y, add4.u1) annotation(Line(points = {{55.5, 52}, {78.6215, 52}, {78.6215, 20.7796}, {70, 20.7796}, {70, 21}}, color = {0, 0, 127}));
    connect(add3.y, product2.u2) annotation(Line(points = {{35.5, 48}, {43.5938, 48}, {43.5938, 49}, {44, 49}}, color = {0, 0, 127}));
    connect(add1.y, Des_MW) annotation(Line(points = {{-50.5, 0}, {95.0033, 0}, {95.0033, 5.55112e-16}, {100, 5.55112e-16}}, color = {0, 0, 127}));
    connect(gain3.y, add3.u2) annotation(Line(points = {{17.5, 44}, {23.7473, 44}, {23.7473, 45}, {24, 45}}, color = {0, 0, 127}));
    connect(product1.y, gain3.u) annotation(Line(points = {{-0.5, 44}, {5.44662, 44}, {5.44662, 44}, {6, 44}}, color = {0, 0, 127}));
    connect(add2.y, product1.u2) annotation(Line(points = {{-26.5, 30}, {-17.3681, 30}, {-17.3681, 40.8149}, {-12, 40.8149}, {-12, 41}}, color = {0, 0, 127}));
    connect(add2.y, P_SP) annotation(Line(points = {{-26.5, 30}, {91.0675, 30}, {91.0675, 28}, {100, 28}}, color = {0, 0, 127}));
    connect(gain2.y, add2.u2) annotation(Line(points = {{-48.5, 20}, {-44.6623, 20}, {-44.6623, 27.0153}, {-38, 27.0153}, {-38, 27}}, color = {0, 0, 127}));
    connect(Dem_MW, gain2.u) annotation(Line(points = {{-100, 20}, {-60.3019, 20}, {-60.3019, 20}, {-60, 20}}, color = {0, 0, 127}));
    connect(Dem_MW, add1.u1) annotation(Line(points = {{-100, 20}, {-70.6116, 20}, {-70.6116, 2.91783}, {-62, 2.91783}, {-62, 3}}, color = {0, 0, 127}));
    annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics = {Text(origin = {19.0667, 52.1741}, lineColor = {255, 85, 127}, extent = {{-3.38, 2.07}, {3.38, -2.07}}, textString = "C2"), Text(origin = {-42.8514, 33.3943}, lineColor = {255, 85, 127}, extent = {{-3.38, 2.07}, {3.38, -2.07}}, textString = "C3"), Text(origin = {-21.98, 32.9127}, lineColor = {255, 85, 127}, extent = {{-3.38, 2.07}, {3.38, -2.07}}, textString = "PSP")}), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Rectangle(origin = {0.326797, -0.217865}, extent = {{-98.5839, 99.3464}, {98.5839, -99.3464}}), Text(origin = {-26.5707, -10.5983}, extent = {{-55.99, 30.28}, {53.1578, -15.2473}}, textString = "Coordinated
Controller", lineColor = {0, 0, 0}), Text(origin = {47.46, 79.06}, extent = {{-21.35, 9.76}, {38.67, -13.66}}, textString = "Des MW"), Text(origin = {-59.1821, 49.768}, extent = {{-21.35, 9.76}, {38.67, -13.66}}, textString = "Demand MW"), Text(origin = {-75.7846, 86.604}, extent = {{-21.35, 9.76}, {38.67, -13.66}}, textString = "PE"), Text(origin = {-62.6126, -56.0808}, extent = {{-21.35, 9.76}, {38.67, -13.66}}, textString = "PELEC"), Text(origin = {-60.7897, -84.2116}, extent = {{-21.35, 9.76}, {38.67, -13.66}}, textString = "D_freq"), Text(origin = {74.5781, -80.81}, extent = {{-21.35, 9.76}, {4.02948, -13.8779}}, textString = "PO"), Text(origin = {56.3123, -11.859}, extent = {{-21.35, 9.76}, {38.67, -13.66}}, textString = "PSP")}));
  end CoordinatedController;

  block FuelDynamic
    Modelica.Blocks.Math.Gain gain1(k = K11) annotation(Placement(visible = true, transformation(origin = {-84, 0}, extent = {{-5, -5}, {5, 5}}, rotation = 360)));
    Modelica.Blocks.Math.Gain gain2(k = K10) annotation(Placement(visible = true, transformation(origin = {-84, -30}, extent = {{-5, -5}, {5, 5}}, rotation = 360)));
    Modelica.Blocks.Math.Add3 add31 annotation(Placement(visible = true, transformation(origin = {-64, 0}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    parameter Real K10 = 0.01;
    parameter Real K11 = 0.01;
    parameter Real TF = 0.01;
    parameter Real TW = 0.01;
    parameter Real TD = 0.01;
    parameter Real ms0;
    Modelica.Blocks.Interfaces.RealInput presure_control annotation(Placement(transformation(rotation = 0, extent = {{-112, 70}, {-92, 90}}), iconTransformation(extent = {{-112, 70}, {-92, 90}})));
    Modelica.Blocks.Interfaces.RealOutput fuel annotation(Placement(transformation(rotation = 0, extent = {{88, -10}, {108, 10}}), iconTransformation(extent = {{88, -10}, {108, 10}})));
    Modelica.Blocks.Interfaces.RealInput Des_MW annotation(Placement(transformation(rotation = 0, extent = {{-112, -10}, {-92, 10}}), iconTransformation(extent = {{-112, -10}, {-92, 10}})));
    Modelica.Blocks.Interfaces.RealInput ms annotation(Placement(transformation(rotation = 0, extent = {{-112, -90}, {-92, -70}}), iconTransformation(extent = {{-112, -90}, {-92, -70}})));
    Modelica.Blocks.Nonlinear.FixedDelay fixeddelay1(delayTime = TD) annotation(Placement(visible = true, transformation(origin = {26, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Nonlinear.FixedDelay fixeddelay2(delayTime = TD) annotation(Placement(visible = true, transformation(origin = {28, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    NonElectrical.SignalRouting.Multiplexer multiplexer1(n = 2, s = if TF0 == 0 and TW0 == 0 then 1 else 2) annotation(Placement(visible = true, transformation(origin = {60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    NonElectrical.Math.Continuous.TransferFunction.Lag lag_TW(T = TW0, y_start = ms0) annotation(Placement(visible = true, transformation(origin = {-2, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    NonElectrical.Math.Continuous.TransferFunction.Lag lag_TF(T = TF0, y_start = ms0) annotation(Placement(visible = true, transformation(origin = {-32, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  protected
    parameter Real TF0(fixed = false);
    parameter Real TW0(fixed = false);
  initial algorithm
    TF0 := TF;
    TW0 := TW;
  equation
    connect(gain2.y, add31.u3) annotation(Line(points = {{-78.5, -30}, {-74.5418, -30}, {-74.5418, -4}, {-70, -4}}, color = {0, 0, 127}));
    connect(gain1.y, add31.u2) annotation(Line(points = {{-78.5, 0}, {-70, 0}}, color = {0, 0, 127}));
    connect(presure_control, add31.u1) annotation(Line(points = {{-102, 80}, {-76, 80}, {-76, 4}, {-70, 4}}, color = {0, 0, 127}));
    connect(Des_MW, gain1.u) annotation(Line(points = {{-102, 0}, {-90, 0}}, color = {0, 0, 127}));
    connect(ms, gain2.u) annotation(Line(points = {{-102, -80}, {-96, -80}, {-96, -30}, {-90, -30}}, color = {0, 0, 127}));
    connect(lag_TW.y, fixeddelay2.u) annotation(Line(points = {{8, -20}, {16, -20}}, color = {0, 0, 127}));
    connect(lag_TF.y, lag_TW.u) annotation(Line(points = {{-22, -20}, {-12, -20}}, color = {0, 0, 127}));
    connect(fixeddelay2.y, multiplexer1.u[2]) annotation(Line(points = {{39, -20}, {44, -20}, {44, 0.5}, {50, 0.5}}, color = {0, 0, 127}));
    connect(fixeddelay1.y, multiplexer1.u[1]) annotation(Line(points = {{37, 12}, {44, 12}, {44, 0}, {48, 0}, {48, -0.5}, {50, -0.5}}, color = {0, 0, 127}));
    connect(lag_TF.u, add31.y) annotation(Line(points = {{-42, -20}, {-50, -20}, {-50, 0}, {-58.5, 0}}, color = {0, 0, 127}));
    connect(fixeddelay1.u, add31.y) annotation(Line(points = {{14, 12}, {-50, 12}, {-50, 0}, {-58.5, 0}}, color = {0, 0, 127}));
    connect(multiplexer1.y, fuel) annotation(Line(points = {{70, 0}, {98, 0}}, color = {0, 0, 127}));
    annotation(Icon(graphics={  Rectangle(extent = {{-100, 100}, {100, -100}}, lineColor = {28, 108, 200}), Text(extent = {{-36, 26}, {44, -14}}, lineColor = {28, 108, 200}, textString = "%name"), Text(extent = {{-88, 90}, {-20, 72}}, lineColor = {28, 108, 200}, textString = "Presure Control"), Text(extent = {{-90, 8}, {-48, -6}}, lineColor = {28, 108, 200}, textString = "Des_MW"), Text(extent = {{-92, -68}, {-64, -88}}, lineColor = {28, 108, 200}, textString = "ms"), Text(extent = {{70, 12}, {84, -8}}, lineColor = {28, 108, 200}, textString = "fuel")}));
  end FuelDynamic;

block SampleHold "Sample and Hold block, simulation time-step dependent."
  final constant Real pi = 2 * Modelica.Math.asin(1.0);
  parameter Real Period = 0.1;
  parameter Real DELT = 0.01;
  Modelica.Blocks.Interfaces.RealInput u annotation(Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.ZeroCrossing zerocrossing1 annotation(Placement(visible = true, transformation(origin = {80, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Derivative derivative1(initType = Modelica.Blocks.Types.Init.SteadyState) annotation(Placement(visible = true, transformation(origin = {-60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  protected
  parameter Real factor(fixed = false);
  parameter Real SamplingPeriod(fixed = false);
  Real t "time";
  Real y_sampled;
  Boolean SET;
initial equation
  factor = if Period < 0.03 then 0 elseif Period < 0.08 then 1
  elseif Period < 0.13 then 2
  elseif Period < 0.18 then 3
  elseif Period < 0.23 then 4 else 5;
  SamplingPeriod = (Period / 0.01 + factor) * DELT;
  y_sampled = u;
  t = 0;
equation
  connect(u, derivative1.u) annotation(Line(points = {{-100, 0}, {-72.9204, 0}, {-72.9204, -0.707965}, {-72.9204, -0.707965}}, color = {0, 0, 127}));
  SET = abs(derivative1.y) > 0;
  der(t) = if SET then 1 else 0;
  zerocrossing1.enable = true;
  zerocrossing1.u = sin(pi * t / SamplingPeriod);
  when {t > 0, zerocrossing1.y} then
    y_sampled = u;
  end when;
  when not SET then
    reinit(t, 0);
  end when;
  y = if Period < 0.0125 then u else y_sampled;
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Text(origin = {4.23, 27}, extent = {{-54.93, 31.69}, {54.93, -31.69}}, textString = "Sample"), Text(origin = {16.7186, -26.2348}, extent = {{-54.93, 31.69}, {34.2727, -13.8496}}, textString = "Hold"), Text(origin = {51.74, -78.07}, extent = {{-11.7375, 12.9107}, {34.27, -13.85}}, textString = "PSS/e"), Rectangle(origin = {-0.469484, -0.234742}, extent = {{-100, 100.235}, {100, -100.235}})}));
end SampleHold;

  block SpeedGovernor
    parameter Real X;
    parameter Real Y;
    parameter Real Z;
    parameter Real W;
    parameter Real MIN;
    parameter Real MAX;
    parameter Real y_start;
    OpalRT.NonElectrical.Math.Continuous.TransferFunctionWindup.PI_WindupLimit pi_non_windup_limit1(KI = W / Y, KP = W * X / Y, MAX = MAX, MIN = MIN, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = y_start) annotation(Placement(visible = true, transformation(origin = {-20, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    OpalRT.NonElectrical.Math.Continuous.TransferFunctionNonWindup.LeadLag_NonWindupLimit leadlag_non_windup_limit1(T1 = X, T2 = if Z <> 0 then Y / Z else 1, K = if Z <> 0 then W / Z else 1, MIN = MIN, MAX = MAX, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = y_start) annotation(Placement(visible = true, transformation(origin = {-20, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput u annotation(Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    y = if Z <> 0 then leadlag_non_windup_limit1.y else pi_non_windup_limit1.y;
    connect(u, leadlag_non_windup_limit1.u) annotation(Line(points = {{-100, 0}, {-57.631, 0}, {-57.631, 20.0456}, {-30.9795, 20.0456}, {-30.9795, 20.0456}}, color = {0, 0, 127}));
    connect(u, pi_non_windup_limit1.u) annotation(Line(points = {{-100, 0}, {-71.5262, 0}, {-71.5262, 59.4533}, {-30.0683, 59.4533}, {-30.0683, 59.4533}}, color = {0, 0, 127}));
    annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Rectangle(origin = {-7.63098, 32.4601}, extent = {{-86.4465, 37.016}, {102.392, -97.836}}), Text(origin = {-30.7509, -8.77321}, extent = {{-32.35, 23.58}, {91.5755, -3.76223}}, textString = "Speed_Governor")}));
  end SpeedGovernor;

  block TurbineF1
    parameter Real TR;
    parameter Real af1;
    parameter Real bf1;
    Modelica.Blocks.Interfaces.RealInput dw annotation(Placement(visible = true, transformation(origin = {-80, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput wf1 annotation(Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(visible = true, transformation(origin = {100, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    y = TR - af1 * (1 - wf1) - bf1 * dw;
    annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Rectangle(origin = {-1.62382, 7.17185}, extent = {{-97.429, 91.6103}, {97.429, -91.6103}}), Text(origin = {-2.85, 15.72}, extent = {{-48.41, 31.89}, {48.41, -31.89}}, textString = "f1"), Text(origin = {-77.33, 66.4}, extent = {{14.24, -9}, {-14.24, 9}}, textString = "dw"), Text(origin = {-81.32, 8.2}, extent = {{13.21, -10.02}, {-13.21, 10.02}}, textString = "Wf1")}));
  end TurbineF1;

  block TurbineF2
    parameter Real af2;
    parameter Real bf2;
    parameter Real cf2;
    Modelica.Blocks.Interfaces.RealInput wf2 annotation(Placement(visible = true, transformation(origin = {-100, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput dw annotation(Placement(visible = true, transformation(origin = {-100, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    y = af2 + bf2 * wf2 - cf2 * dw;
    annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Rectangle(origin = {0.113895, 1.48064}, extent = {{-94.8747, 95.5581}, {94.8747, -95.5581}}), Text(extent = {{-40.55, 38.27}, {-40.55, 38.27}}, textString = "f2", fontSize = 10), Text(origin = {3.63683, 3.539}, extent = {{39.18, -28.36}, {-39.18, 28.36}}, textString = "f2"), Text(origin = {-79.38, 44.53}, extent = {{13.78, -4.9}, {-13.78, 4.9}}, textString = "Wf2"), Text(origin = {-80.07, -17.08}, extent = {{13.55, -4.78}, {-13.55, 4.78}}, textString = "dw")}));
  end TurbineF2;

  block TurbineGovernor
    parameter Real K = 20;
    parameter Real T1 = 0.5 "(sec)";
    parameter Real T2 = 1 "(sec)";
    parameter Real T3 = 1 "(>0)(sec)";
    parameter Real Uo = 0.1 "(pu/sec)";
    parameter Real Uc = -0.2 "(<0)(pu/sec)";
    parameter Real VMAX = 1 "(pu on machine MVA rating)";
    parameter Real VMIN = 0 "(pu on machine MVA rating)";
    parameter Real T4 = 0.4 "(sec)";
    parameter Real K1 = 0.2;
    parameter Real K2 = 0;
    parameter Real T5 = 7 "(sec)";
    parameter Real K3 = 0.1;
    parameter Real K4 = 0;
    parameter Real T6 = 0.6 "(sec)";
    parameter Real K5 = 0.2;
    parameter Real K6 = 0;
    parameter Real T7 = 0.3 "(sec)";
    parameter Real K7 = 0.1;
    parameter Real K8 = 0;
    parameter Real PT0;
    parameter Real ms0;
    parameter Real PO0;
    Modelica.Blocks.Interfaces.RealOutput PMECH_LP annotation(Placement(visible = true, transformation(origin = {108, -44}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput ms annotation(Placement(visible = true, transformation(origin = {-104, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 180), iconTransformation(origin = {72, -98}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
    Modelica.Blocks.Math.Add3 add31(k2 = -1, k3 = -1) annotation(Placement(visible = true, transformation(origin = {-110, 0}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    Modelica.Blocks.Math.Gain gain1(k = 1 / T3) annotation(Placement(visible = true, transformation(origin = {-90, 0}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    OpalRT.NonElectrical.Math.Continuous.TransferFunctionNonWindup.Integrator_NonWindupLimit non_windup_integrator1(VRMAX = VMAX, VRMIN = VMIN, y_init = PO0, KI = 1) annotation(Placement(visible = true, transformation(origin = {-50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    OpalRT.NonElectrical.Math.Continuous.TransferFunction.LeadLag transferfunction1(TA = T2, TB = T1, K = K, initType = Modelica.Blocks.Types.Init.SteadyState) annotation(Placement(visible = true, transformation(origin = {-140, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Nonlinear.Limiter limiter1(uMax = Uo, uMin = Uc) annotation(Placement(visible = true, transformation(origin = {-70, 0}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    Modelica.Blocks.Math.Gain gain2(k = K1) annotation(Placement(visible = true, transformation(origin = {14, 30}, extent = {{-5, -5}, {5, 5}}, rotation = 90)));
    Modelica.Blocks.Math.Gain gain3(k = K2) annotation(Placement(visible = true, transformation(origin = {14, -30}, extent = {{-5, -5}, {5, 5}}, rotation = -90)));
    Modelica.Blocks.Math.Gain gain4(k = K3) annotation(Placement(visible = true, transformation(origin = {34, 30}, extent = {{-5, -5}, {5, 5}}, rotation = 90)));
    Modelica.Blocks.Math.Gain gain5(k = K4) annotation(Placement(visible = true, transformation(origin = {34, -30}, extent = {{-5, -5}, {5, 5}}, rotation = -90)));
    Modelica.Blocks.Math.Gain gain6(k = K5) annotation(Placement(visible = true, transformation(origin = {54, 30}, extent = {{-5, -5}, {5, 5}}, rotation = 90)));
    Modelica.Blocks.Math.Gain gain7(k = K6) annotation(Placement(visible = true, transformation(origin = {54, -30}, extent = {{-5, -5}, {5, 5}}, rotation = -90)));
    Modelica.Blocks.Math.Gain gain8(k = K7) annotation(Placement(visible = true, transformation(origin = {74, 30}, extent = {{-5, -5}, {5, 5}}, rotation = 90)));
    Modelica.Blocks.Math.Gain gain9(k = K8) annotation(Placement(visible = true, transformation(origin = {74, -30}, extent = {{-5, -5}, {5, 5}}, rotation = -90)));
    OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag lag1(T = T5, y_start = ms0) annotation(Placement(visible = true, transformation(origin = {24, 0}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag transferfunction4(T = T6, y_start = ms0) annotation(Placement(visible = true, transformation(origin = {44, 0}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag transferfunction5(T = T7, y_start = ms0) annotation(Placement(visible = true, transformation(origin = {64, 0}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    Modelica.Blocks.Math.Product product1 annotation(Placement(visible = true, transformation(origin = {-16, 0}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag transferfunction2(T = T4, y_start = ms0) annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    Modelica.Blocks.Math.Add add1 annotation(Placement(visible = true, transformation(origin = {42, 56}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    Modelica.Blocks.Math.Add add2 annotation(Placement(visible = true, transformation(origin = {62, 54}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    Modelica.Blocks.Math.Add add3 annotation(Placement(visible = true, transformation(origin = {84, 50}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    Modelica.Blocks.Math.Add add4 annotation(Placement(visible = true, transformation(origin = {42, -52}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    Modelica.Blocks.Math.Add add5 annotation(Placement(visible = true, transformation(origin = {62, -48}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    Modelica.Blocks.Math.Add add6 annotation(Placement(visible = true, transformation(origin = {84, -44}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput SLIP annotation(Placement(visible = true, transformation(origin = {-170, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-98, 86}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput PT annotation(Placement(visible = true, transformation(origin = {-102, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-96, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput PO annotation(Placement(visible = true, transformation(origin = {-170, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-98, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput PMECH_HP annotation(Placement(visible = true, transformation(origin = {108, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {102, 76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(PO, add31.u1) annotation(Line(points = {{-170, 36}, {-124.619, 36}, {-124.619, 3.92157}, {-116, 3.92157}, {-116, 4}}, color = {0, 0, 127}));
    connect(PT, product1.u2) annotation(Line(points = {{-102, -42}, {-35.7298, -42}, {-35.7298, -2.83224}, {-22, -2.83224}, {-22, -3}}, color = {0, 0, 127}));
    connect(add6.y, PMECH_LP) annotation(Line(points = {{89.5, -44}, {99.6927, -44}, {99.6927, -44}, {108, -44}}, color = {0, 0, 127}));
    connect(gain9.y, add6.u1) annotation(Line(points = {{74, -35.5}, {74, -40.8149}, {78, -40.8149}, {78, -41}}, color = {0, 0, 127}));
    connect(add5.y, add6.u2) annotation(Line(points = {{67.5, -48}, {77.2879, -48}, {77.2879, -47}, {78, -47}}, color = {0, 0, 127}));
    connect(add4.y, add5.u2) annotation(Line(points = {{47.5, -52}, {55.5778, -52}, {55.5778, -51}, {56, -51}}, color = {0, 0, 127}));
    connect(gain7.y, add5.u1) annotation(Line(points = {{54, -35.5}, {54, -45.5043}, {56, -45.5043}, {56, -45}}, color = {0, 0, 127}));
    connect(gain3.y, add4.u2) annotation(Line(points = {{14, -35.5}, {14, -55.2304}, {36, -55.2304}, {36, -55}}, color = {0, 0, 127}));
    connect(gain5.y, add4.u1) annotation(Line(points = {{34, -35.5}, {34, -49.3253}, {36, -49.3253}, {36, -49}}, color = {0, 0, 127}));
    connect(PMECH_HP, add3.y) annotation(Line(points = {{108, 50}, {89.7929, 50}, {89.7929, 50}, {89.5, 50}}, color = {0, 0, 127}));
    connect(gain8.y, add3.u2) annotation(Line(points = {{74, 35.5}, {74, 46.6767}, {78, 46.6767}, {78, 47}}, color = {0, 0, 127}));
    connect(add2.y, add3.u1) annotation(Line(points = {{67.5, 54}, {77.536, 54}, {77.536, 53}, {78, 53}}, color = {0, 0, 127}));
    connect(gain6.y, add2.u2) annotation(Line(points = {{54, 35.5}, {54, 50.3984}, {56, 50.3984}, {56, 51}}, color = {0, 0, 127}));
    connect(add1.y, add2.u1) annotation(Line(points = {{47.5, 56}, {55.2056, 56}, {55.2056, 57}, {56, 57}}, color = {0, 0, 127}));
    connect(gain2.y, add1.u1) annotation(Line(points = {{14, 35.5}, {14, 58.4621}, {36, 58.4621}, {36, 59}}, color = {0, 0, 127}));
    connect(gain4.y, add1.u2) annotation(Line(points = {{34, 35.5}, {34, 53.0346}, {36, 53.0346}, {36, 53}}, color = {0, 0, 127}));
    connect(transferfunction5.y, gain9.u) annotation(Line(points = {{69, 0}, {74.1244, 0}, {74.1244, -24}, {74, -24}}, color = {0, 0, 127}));
    connect(transferfunction5.y, gain8.u) annotation(Line(points = {{69, 0}, {74.1244, 0}, {74.1244, 24}, {74, 24}}, color = {0, 0, 127}));
    connect(transferfunction4.y, gain7.u) annotation(Line(points = {{49, 0}, {53.965, 0}, {53.965, -24}, {54, -24}}, color = {0, 0, 127}));
    connect(transferfunction4.y, gain6.u) annotation(Line(points = {{49, 0}, {53.965, 0}, {53.965, 24}, {54, 24}}, color = {0, 0, 127}));
    connect(lag1.y, gain5.u) annotation(Line(points = {{29, 0}, {33.9608, 0}, {33.9608, -24}, {34, -24}}, color = {0, 0, 127}));
    connect(lag1.y, gain4.u) annotation(Line(points = {{29, 0}, {33.9608, 0}, {33.9608, 24}, {34, 24}}, color = {0, 0, 127}));
    connect(transferfunction2.y, gain3.u) annotation(Line(points = {{5, 0}, {13.9565, 0}, {13.9565, -24}, {14, -24}}, color = {0, 0, 127}));
    connect(transferfunction2.y, gain2.u) annotation(Line(points = {{5, 0}, {13.9565, 0}, {13.9565, 24}, {14, 24}}, color = {0, 0, 127}));
    connect(transferfunction2.y, ms) annotation(Line(points = {{5, 0}, {6.97824, 0}, {6.97824, 40.4738}, {-104, 40.4738}, {-104, 40}}, color = {0, 0, 127}));
    connect(transferfunction2.y, lag1.u) annotation(Line(points = {{5, 0}, {18.6086, 0}, {18.6086, 0}, {19, 0}}, color = {0, 0, 127}));
    connect(product1.y, transferfunction2.u) annotation(Line(points = {{-10.5, 0}, {-7.13331, 0}, {-5, 0}, {-5, 0}}, color = {0, 0, 127}));
    connect(transferfunction4.y, transferfunction5.u) annotation(Line(points = {{49, 0}, {59.0824, 0}, {59.0824, 0}, {59, 0}}, color = {0, 0, 127}));
    connect(lag1.y, transferfunction4.u) annotation(Line(points = {{29, 0}, {38.9231, 0}, {38.9231, 0}, {39, 0}}, color = {0, 0, 127}));
    connect(non_windup_integrator1.y, product1.u1) annotation(Line(points = {{-45, 0}, {-40.0871, 0}, {-40.0871, 3.05011}, {-22, 3.05011}, {-22, 3}}, color = {0, 0, 127}));
    connect(limiter1.y, non_windup_integrator1.u) annotation(Line(points = {{-64.5, 0}, {-55.3377, 0}, {-55.3377, 0}, {-55, 0}}, color = {0, 0, 127}));
    connect(gain1.y, limiter1.u) annotation(Line(points = {{-84.5, 0}, {-77.1242, 0}, {-77.1242, 0}, {-76, 0}}, color = {0, 0, 127}));
    connect(transferfunction1.y, add31.u2) annotation(Line(points = {{-130, 0}, {-117.456, 0}, {-117.456, 0}, {-116, 0}}, color = {0, 0, 127}));
    connect(SLIP, transferfunction1.u) annotation(Line(points = {{-170, 0}, {-150.474, 0}, {-150.474, 0}, {-150, 0}}, color = {0, 0, 127}));
    connect(non_windup_integrator1.y, add31.u3) annotation(Line(points = {{-45, 0}, {-40, 0}, {-40, -24}, {-121.846, -24}, {-121.846, -4}, {-116, -4}, {-116, -4}}, color = {0, 0, 127}));
    connect(add31.y, gain1.u) annotation(Line(points = {{-104.5, 0}, {-97.0655, 0}, {-97.0655, 0}, {-96, 0}}, color = {0, 0, 127}));
    annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Rectangle(origin = {1.85185, -3.37691}, extent = {{-100.109, 100.327}, {96.841, -95.5338}}), Text(origin = {-1.66057, 13.5101}, extent = {{-49.24, 22.98}, {49.24, -22.98}}, textString = "Turbine
Governor", lineColor = {0, 0, 0}), Text(origin = {-66.6642, 86.1616}, extent = {{-16.78, 5.99}, {10.2441, -10.783}}, textString = "SLIP"), Text(origin = {-67.5799, 60.8475}, extent = {{-16.78, 5.99}, {10.24, -10.78}}, textString = "PT"), Text(origin = {-68.2329, 0.714073}, extent = {{-16.78, 5.99}, {10.24, -10.78}}, textString = "PO"), Text(origin = {79.0005, -78.6234}, extent = {{-20.4834, 11.8717}, {6.97, -6.42}}, textString = "ms"), Text(origin = {80.7493, -49.4336}, extent = {{-45.32, 24.29}, {6.97, -6.42}}, textString = "PMECH_LP"), Text(origin = {76.3483, 66.6461}, extent = {{-45.32, 24.29}, {6.97, -6.42}}, textString = "PMECH_HP")}));
  end TurbineGovernor;

  block ValvePositioner
    parameter Real a = 1;
    parameter Real b = 1;
    parameter Real c = 1;
    parameter Real y_start = 0;
    OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag lag1(K = if c <> 0 then a / c else 1, T = if c <> 0 then b / c else 1, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = y_start) annotation(Placement(visible = true, transformation(origin = {-20, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.Integrator integrator1(k = a / b, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = y_start) annotation(Placement(visible = true, transformation(origin = {-20, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput u annotation(Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    y = if c <> 0 then lag1.y else integrator1.y;
    connect(u, integrator1.u) annotation(Line(points = {{-100, 0}, {-77.4487, 0}, {-77.4487, -19.8178}, {-32.8018, -19.8178}, {-32.8018, -19.8178}}, color = {0, 0, 127}));
    connect(u, lag1.u) annotation(Line(points = {{-100, 0}, {-77.4487, 0}, {-77.4487, 40.0911}, {-30.5239, 40.0911}, {-30.5239, 40.0911}}, color = {0, 0, 127}));
    annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Rectangle(origin = {-0.797267, -8.99772}, extent = {{-97.3804, 70.5011}, {97.3804, -70.5011}}), Text(origin = {-30.8668, -13.5571}, extent = {{-48.18, 32.23}, {108.544, -3.52841}}, textString = "Valve_positioner")}));
  end ValvePositioner;
end Internal;
