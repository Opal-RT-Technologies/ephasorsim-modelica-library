within OpalRT.Electrical.Control.TurbineGovernor;
model HYGOV4 "NYPA Hydro turbine governor model"
  extends OpalRT.Electrical.PartialModel.TurbineGovernor;
  parameter Integer IBUS = 100 "Located Bus No.";
  parameter String ID = "M1" "Machine Identifier";
  parameter Real db = 0.06 "Hysteresis deadband";
  parameter Real R = 0.06 "Permanent Droop";
  parameter Real r = 0.4 "Temporary Droop";
  parameter Real Tr = 8 "(>0) Dashpot time constant";
  parameter Real Tf = 0.05 "(>0) Pilot valve time constant";
  parameter Real Tg = 0.2 "(>0) Actuator time const";
  parameter Real Uopen = 0.1 "Rate of gate Opening";
  parameter Real Uclose = -0.1 "(<0) Rate of gate clsoing";
  parameter Real GMAX = 0.8 "Maximum gate position";
  parameter Real GMIN = 0 "Minimum gate position";
  parameter Real TW = 1.2 "(>0) Water time constant";
  parameter Real Dturb = 0 "Turbine damping";
  parameter Real G0 = 0;
  parameter Real G1 = 0.2;
  parameter Real G2 = 0.4;
  parameter Real G3 = 0.6;
  parameter Real G4 = 1.0;
  parameter Real Q0 = 0;
  parameter Real Q1 = 0.2;
  parameter Real Q2 = 0.4;
  parameter Real Q3 = 0.6;
  parameter Real Q4 = 1.0;
  parameter Real F0 = 0;
  parameter Real F1 = 0.1;
  parameter Real F2 = 0.2;
  parameter Real F3 = 0.3;
  parameter Real F4 = 0.4;
  parameter Real F5 = 0.5;
  parameter Real F6 = 0.6;
  parameter Real F7 = 0.7;
  parameter Real F8 = 0.8;
  parameter Real F9 = 1.0;
  parameter Real P0 = 0;
  parameter Real P1 = 0.1;
  parameter Real P2 = 0.2;
  parameter Real P3 = 0.3;
  parameter Real P4 = 0.4;
  parameter Real P5 = 0.5;
  parameter Real P6 = 0.6;
  parameter Real P7 = 0.7;
  parameter Real P8 = 0.8;
  parameter Real P9 = 1.0;
  Modelica.Blocks.Math.Add add4(k1 = -1) annotation(Placement(visible = true, transformation(origin = {-35, -35}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Product product2 annotation(Placement(visible = true, transformation(origin = {-55, -35}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 1) annotation(Placement(visible = true, transformation(origin = {-60, -50}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Division division1 annotation(Placement(visible = true, transformation(origin = {-75, -35}, extent = {{-5, 5}, {5, -5}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const2(k = 0) annotation(Placement(visible = true, transformation(origin = {74, -61}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add3(k2 = +1, k1 = -1) annotation(Placement(visible = true, transformation(origin = {82, 0}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Product product1 annotation(Placement(visible = true, transformation(origin = {60, 2}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.WashOutFilter washoutfilter1(TW = Tr) annotation(Placement(visible = true, transformation(origin = {-34, 28}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator integrator1(k = 1 / TW, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = F_0) annotation(Placement(visible = true, transformation(origin = {-19, -35}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Nonlinear.PieceWiseLinear10 piecewiselinear101(y1 = P0, y2 = P1, y3 = P2, y4 = P3, y5 = P4, y6 = P5, y7 = P6, y8 = P7, y9 = P8, y10 = P9, u1 = F0, u2 = F1, u3 = F2, u4 = F3, u5 = F4, u6 = F5, u7 = F6, u8 = F7, u9 = F8, u10 = F9) annotation(Placement(visible = true, transformation(origin = {16, -35}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Product product3 annotation(Placement(visible = true, transformation(origin = {46, -34}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add2(k2 = +1) annotation(Placement(visible = true, transformation(origin = {-70, 60}, extent = {{-5.5, -5.5}, {5.5, 5.5}}, rotation = 90)));
  Modelica.Blocks.Math.Gain gain1(k = r) annotation(Placement(visible = true, transformation(origin = {8, 26}, extent = {{6, -6}, {-6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain3(k = R) annotation(Placement(visible = true, transformation(origin = {-4, 48}, extent = {{6, -6}, {-6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Add3 add31(k2 = -1, k3 = -1) annotation(Placement(visible = true, transformation(origin = {-66, 80}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder firstorder1(T = Tf0, initType = Modelica.Blocks.Types.Init.InitialOutput) annotation(Placement(visible = true, transformation(origin = {-48, 80}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const1(k = GREF_0) annotation(Placement(visible = true, transformation(origin = {-120, 60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain2(k = Dturb) annotation(Placement(visible = true, transformation(origin = {20, 0}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Nonlinear.PieceWiseLinear5 piecewiselinear51(y1 = Q0, y2 = Q1, y3 = Q2, y4 = Q3, y5 = Q4, u1 = G0, u2 = G1, u3 = G2, u4 = G3, u5 = G4) annotation(Placement(visible = true, transformation(origin = {78, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunctionNonWindup.Integrator_NonWindupLimit non_windup_integrator1(KI = 1, VRMAX = GMAX, VRMIN = GMIN, y_init = G_0) annotation(Placement(visible = true, transformation(origin = {40, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiter1(uMax = Uopen, uMin = Uclose) annotation(Placement(visible = true, transformation(origin = {20, 80}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain4(k = 1 / Tg) annotation(Placement(visible = true, transformation(origin = {0, 80}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Nonlinear.BacklashDeadband backlashdeadband1(db = db / 2) annotation(Placement(visible = true, transformation(origin = {-24, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1 annotation(Placement(visible = true, transformation(origin = {-100, 60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
protected
  parameter Real PMECH_0(fixed = false);
  parameter Real GREF_0(fixed = false);
  parameter Real P_0(fixed = false);
  parameter Real F_0(fixed = false);
  parameter Real Q_0(fixed = false);
  parameter Real G_0(fixed = false);
  parameter Real Tf0(fixed = false, start = 1);
initial algorithm
  Tf0 := Tf;
  P_0 := PMECH_0;
  if P_0 > P9 then
    F_0 := F9;
  elseif P_0 > P8 then
    F_0 := (P_0 - P8) * (F9 - F8) / (P9 - P8) + F8;
  elseif P_0 > P7 then
    F_0 := (P_0 - P7) * (F8 - F7) / (P8 - P7) + F7;
  elseif P_0 > P6 then
    F_0 := (P_0 - P6) * (F7 - F6) / (P7 - P6) + F6;
  elseif P_0 > P5 then
    F_0 := (P_0 - P5) * (F6 - F5) / (P6 - P5) + F5;
  elseif P_0 > P4 then
    F_0 := (P_0 - P4) * (F5 - F4) / (P5 - P4) + F4;
  elseif P_0 > P3 then
    F_0 := (P_0 - P3) * (F4 - F3) / (P4 - P3) + F3;
  elseif P_0 > P2 then
    F_0 := (P_0 - P2) * (F3 - F2) / (P3 - P2) + F2;
  elseif P_0 > P1 then
    F_0 := (P_0 - P1) * (F2 - F1) / (P2 - P1) + F1;
  elseif P_0 > P0 then
    F_0 := (P_0 - P0) * (F1 - F0) / (P1 - P0) + F0;
  else
    F_0 := F0;
  end if;
  Q_0 := F_0;
  if Q_0 > Q4 then
    G_0 := G4;
  elseif Q_0 > Q3 then
    G_0 := (Q_0 - Q3) * (G4 - G3) / (Q4 - Q3) + G3;
  elseif Q_0 > Q2 then
    G_0 := (Q_0 - Q2) * (G3 - G2) / (Q3 - Q2) + G2;
  elseif Q_0 > Q1 then
    G_0 := (Q_0 - Q1) * (G2 - G1) / (Q2 - Q1) + G1;
  elseif Q_0 > Q0 then
    G_0 := (Q_0 - Q0) * (G1 - G0) / (Q1 - Q0) + G0;
  else
    G_0 := G0;
  end if;
  GREF_0 := R * G_0;
initial equation
  PMECH_0 = PMECH0;
equation
  connect(backlashdeadband1.y, gain4.u) annotation(Line(points={{-14.5,80.5},{
          -6.72566,80.5},{-6.72566,80},{-6,80}},                                                                                            color = {0, 0, 127}));
  connect(firstorder1.y, backlashdeadband1.u) annotation(Line(points={{-42.5,80},
          {-35.0442,80},{-35.0442,80.5},{-34.5,80.5}},                                                                                        color = {0, 0, 127}));
  connect(add31.u2, SLIP) annotation(Line(points={{-73.2,80},{-89.5575,80},{
          -89.5575,-1.06195},{-102,-1.06195},{-102,0}},                                                                                             color = {0, 0, 127}));
  connect(gain4.y, limiter1.u) annotation(Line(points={{5.5,80},{14.1593,80},{
          14.1593,80},{14,80}},                                                                                           color = {0, 0, 127}));
  connect(limiter1.y, non_windup_integrator1.u) annotation(Line(points={{25.5,80},
          {35.7522,80},{35.7522,80},{35,80}},                                                                                               color = {0, 0, 127}));
  connect(non_windup_integrator1.y, piecewiselinear51.u) annotation(Line(points={{45,80},
          {67.6106,80},{67.6106,80},{68,80}},                                                                                              color = {0, 0, 127}));
  connect(product1.u1, piecewiselinear51.u) annotation(Line(points={{54,5},{
          50.2347,5},{50.2347,47.8873},{59.6244,47.8873},{59.6244,79.3427},{68,
          79.3427},{68,80}},                                                                                                                                                                      color = {0, 0, 127}));
  connect(gain3.u, piecewiselinear51.u) annotation(Line(points={{3.2,48},{
          59.6244,48},{59.6244,79.8122},{68,79.8122},{68,80}},                                                                                           color = {0, 0, 127}));
  connect(gain1.u, piecewiselinear51.u) annotation(Line(points={{15.2,26},{
          59.6244,26},{59.6244,79.8122},{68,79.8122},{68,80}},                                                                                            color = {0, 0, 127}));
  connect(piecewiselinear51.y, division1.u2) annotation(Line(points={{88,80},{
          94.3662,80},{94.3662,14.554},{-88.2629,14.554},{-88.2629,-32.3944},{
          -81,-32.3944},{-81,-32}},                                                                                                                                                                       color = {0, 0, 127}));
  connect(gain2.y, product1.u2) annotation(Line(points = {{25.5, 0}, {44.2777, 0}, {54, -1}, {54, -1}}, color = {0, 0, 127}));
  connect(gain2.u, SLIP) annotation(Line(points = {{14, 0}, {-94.1839, 0}, {-94.1839, 0}, {-102, 0}}, color = {0, 0, 127}));
  connect(add1.u2, const1.y) annotation(Line(points={{-106,57},{-111.825,57},{
          -111.825,56.8123},{-114.5,56.8123},{-114.5,60}},                                                                                           color = {0, 0, 127}));
  connect(add31.y, firstorder1.u) annotation(Line(points={{-59.4,80},{-53.9906,
          80},{-53.9906,80},{-54,80}},                                                                                              color = {0, 0, 127}));
  connect(add3.y, PMECH) annotation(Line(points={{87.5,0},{97.7679,0},{97.7679,
          5.55112e-16},{104,5.55112e-16}},                                                                               color = {0, 0, 127}));
  connect(product1.y, add3.u1) annotation(Line(points={{65.5,2},{68.1978,2},{
          68.1978,3.46317},{76,3.46317},{76,3}},                                                                                               color = {0, 0, 127}));
  connect(add2.y, add31.u3) annotation(Line(points={{-70,66.05},{-70,69.2634},{
          -77.7881,69.2634},{-77.7881,75.1241},{-73.2,75.1241},{-73.2,75.2}},                                                                                            color = {0, 0, 127}));
  connect(add1.y, add31.u1) annotation(Line(points={{-94.5,60},{-83.8046,60},{
          -83.8046,84.5758},{-73.2,84.5758},{-73.2,84.8}},                                                                                         color = {0, 0, 127}));
  connect(dGREF, add1.u1) annotation(Line(points={{-100,80},{-110.54,80},{
          -110.54,63.2391},{-106,63.2391},{-106,63}},                                                                                         color = {0, 0, 127}));
  connect(gain3.y, add2.u2) annotation(Line(points={{-10.6,48},{-65.8002,48},{
          -65.8002,53.4},{-66.7,53.4}},                                                                                       color = {0, 0, 127}));
  connect(gain1.y, washoutfilter1.u) annotation(Line(points={{1.4,26},{-18.9142,
          26},{-18.9142,27.7053},{-24,27.7053},{-24,28}},                                                                                                 color = {0, 0, 127}));
  connect(washoutfilter1.y, add2.u1) annotation(Line(points={{-44,28},{-72.7265,
          28},{-72.7265,53.4},{-73.3,53.4}},                                                                                         color = {0, 0, 127}));
  connect(const2.y, PMECH_LP) annotation(Line(points={{79.5,-61},{97.6526,-61},
          {97.6526,-60},{104,-60}},                                                                                             color = {0, 0, 127}));
  connect(product3.y, add3.u2) annotation(Line(points={{51.5,-34},{68.6726,-34},
          {68.6726,-3.18584},{76,-3.18584},{76,-3}},                                                                                                  color = {0, 0, 127}));
  connect(product3.u1, product2.y) annotation(Line(points={{40,-31},{34.3363,
          -31},{34.3363,-15.9292},{-45.6637,-15.9292},{-45.6637,-35.3982},{
          -49.5,-35.3982},{-49.5,-35}},                                                                                                                                                               color = {0, 0, 127}));
  connect(piecewiselinear101.y, product3.u2) annotation(Line(points={{26,-35},{
          30.0885,-35},{30.0885,-37.1681},{40,-37.1681},{40,-37}},                                                                                              color = {0, 0, 127}));
  connect(integrator1.y, piecewiselinear101.u) annotation(Line(points = {{-13.5, -35}, {-2.83186, -35}, {-3.53982, -34.3363}, {2, -35}, {6, -35}}, color = {0, 0, 127}));
  connect(integrator1.y, division1.u1) annotation(Line(points={{-13.5,-35},{
          -9.20354,-35},{-9.20354,-60.177},{-89.2035,-60.177},{-89.2035,
          -37.8761},{-81,-37.8761},{-81,-38}},                                                                                                                                                     color = {0, 0, 127}));
  connect(integrator1.u, add4.y) annotation(Line(points = {{-25, -35}, {-30.0226, -35}, {-30.0226, -35}, {-29.5, -35}}, color = {0, 0, 127}));
  connect(division1.y, product2.u2) annotation(Line(points = {{-69.5, -35}, {-66.5914, -35}, {-66.5914, -38.6005}, {-61, -38.6005}, {-61, -38}}, color = {0, 0, 127}));
  connect(division1.y, product2.u1) annotation(Line(points = {{-69.5, -35}, {-66.5914, -35}, {-66.5914, -32.2799}, {-61, -32.2799}, {-61, -32}}, color = {0, 0, 127}));
  connect(const.y, add4.u2) annotation(Line(points = {{-54.5, -50}, {-44.921, -50}, {-44.921, -37.4718}, {-41, -37.4718}, {-41, -38}}, color = {0, 0, 127}));
  connect(product2.y, add4.u1) annotation(Line(points = {{-49.5, -35}, {-45.8239, -35}, {-45.8239, -31.6027}, {-41, -31.6027}, {-41, -32}}, color = {0, 0, 127}));
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1})), Documentation(info = "<html>
<p>
1. The block diagram of the NYPA Hydro Governor is shown below. </p>
<p>
2. The hysteresis block represents the mechanical backlash in the governor and modeled by Backlashdeadband block.(<b>Note</b>: The dead band range is halved to comply with PSSE data format in NYPA DYR files).   
</p>
<p>
3. The GATE-FLOW block represents the the governor nonlinear gate/flow relationship with a five-piece nonlinear function.   
</p>
<p>
4. The FLOW-Pmss block represents the the governor nonlinear  relationship between turbine flow and mechanical power with a ten-piece nonlinear function.
</p>
<p> <img src=\"modelica://OpalRT/resource/Turbine-Governor/HYGOV4.png\"
alt=\"HYGOV4
.png\"><br>

</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Text(origin = {78.5334, 66.4797}, extent = {{-10.73, 6.97}, {10.73, -6.97}}, textString = "GATE-FLOW"), Text(origin = {16.3868, -48.0202}, extent = {{-14.12, 5.84}, {14.12, -5.84}}, textString = "FLOW-Pmss"), Text(origin = {56.634, 82.8363}, lineColor = {255, 0, 0}, fillColor = {255, 0, 0}, extent = {{-6.72991, 5.66}, {2.48212, -2.12018}}, textString = "c"), Text(origin = {93.4471, 52.9218}, lineColor = {255, 0, 0}, extent = {{-7.43, 6.9}, {1.4123, -3.00619}}, textString = "g"), Text(origin = {-82.8278, -64.2522}, lineColor = {255, 0, 0}, extent = {{-7.43, 4.78}, {6.36805, -4.07204}}, textString = "q"), Text(origin = {-61.7682, -28.669}, lineColor = {255, 0, 0}, extent = {{-6.9, 6.02}, {0.882301, -2.83416}}, textString = "q/g"), Text(origin = {-15.5748, -12.7399}, lineColor = {255, 0, 0}, extent = {{-6.02, 3.19}, {6.02, -3.19}}, textString = "h"), Text(origin = {-39.2002, 85.209}, lineColor = {255, 0, 0}, extent = {{-7.28, 4.46}, {7.28, -4.46}}, textString = "e")}));
end HYGOV4;
