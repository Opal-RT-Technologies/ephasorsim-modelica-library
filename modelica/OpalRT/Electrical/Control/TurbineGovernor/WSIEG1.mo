within OpalRT.Electrical.Control.TurbineGovernor;
model WSIEG1
  extends OpalRT.Electrical.PartialModel.TurbineGovernor;
  parameter Integer IBUS = 100 "Located Bus No.";
  parameter String ID = "M1" "Machine Identifier";
  parameter Real K = 20;
  parameter Real T1 = 0.5 "(sec)";
  parameter Real T2 = 1 "(sec)";
  parameter Real T3 = 1 "(>0)(sec)";
  parameter Real Uo = 0.1 "(pu/sec)";
  parameter Real Uc = -0.2 "(<0)(pu/sec)";
  parameter Real PMAX = 1 "(pu on machine MVA rating)";
  parameter Real PMIN = 0 "(pu on machine MVA rating)";
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
  parameter Real db1 = 0;
  parameter Real err = 0;
  parameter Real db2 = 0;
  parameter Real GV1 = 0;
  parameter Real PGV1 = 0;
  parameter Real GV2 = 99;
  parameter Real PGV2 = 99;
  parameter Real GV3 = 0;
  parameter Real PGV3 = 0;
  parameter Real GV4 = 0;
  parameter Real PGV4 = 0;
  parameter Real GV5 = 0;
  parameter Real PGV5 = 0;
  parameter Real IBLOCK = 0;
  parameter Real JBUS = 0 "Bus Identifier (NOT USED)";
  parameter Real M = 0 "Machine Identifier (NOT USED)";
  Modelica.Blocks.Math.Add3 add31(k2 = -1, k3 = -1) annotation(Placement(visible = true, transformation(origin = {-92, 17}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = 1 / T3) annotation(Placement(visible = true, transformation(origin = {-77, 17}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunctionNonWindup.Integrator_NonWindupLimit non_windup_integrator1(VRMAX = PMAX_1, VRMIN = PMIN_1, y_init = GREF_0, KI = KI0) annotation(Placement(visible = true, transformation(origin = {-43, 17}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain2(k = K1) annotation(Placement(visible = true, transformation(origin = {-10, 30}, extent = {{-5, -5}, {5, 5}}, rotation = 90)));
  Modelica.Blocks.Math.Gain gain3(k = K2) annotation(Placement(visible = true, transformation(origin = {-10, -30}, extent = {{-5, -5}, {5, 5}}, rotation = -90)));
  Modelica.Blocks.Math.Gain gain4(k = K3) annotation(Placement(visible = true, transformation(origin = {10, 30}, extent = {{-5, -5}, {5, 5}}, rotation = 90)));
  Modelica.Blocks.Math.Gain gain5(k = K4) annotation(Placement(visible = true, transformation(origin = {10, -30}, extent = {{-5, -5}, {5, 5}}, rotation = -90)));
  Modelica.Blocks.Math.Gain gain6(k = K5) annotation(Placement(visible = true, transformation(origin = {30, 30}, extent = {{-5, -5}, {5, 5}}, rotation = 90)));
  Modelica.Blocks.Math.Gain gain7(k = K6) annotation(Placement(visible = true, transformation(origin = {30, -30}, extent = {{-5, -5}, {5, 5}}, rotation = -90)));
  Modelica.Blocks.Math.Gain gain8(k = K7) annotation(Placement(visible = true, transformation(origin = {50, 30}, extent = {{-5, -5}, {5, 5}}, rotation = 90)));
  Modelica.Blocks.Math.Gain gain9(k = K8) annotation(Placement(visible = true, transformation(origin = {50, -30}, extent = {{-5, -5}, {5, 5}}, rotation = -90)));
  Modelica.Blocks.Math.Add add1 annotation(Placement(visible = true, transformation(origin = {25, 55}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add2 annotation(Placement(visible = true, transformation(origin = {45, 55}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add3 annotation(Placement(visible = true, transformation(origin = {65, 55}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add4 annotation(Placement(visible = true, transformation(origin = {20, -50}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add5 annotation(Placement(visible = true, transformation(origin = {40, -50}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add6 annotation(Placement(visible = true, transformation(origin = {60, -50}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.LeadLag transferfunction1(TA = T2, TB = T1, K = K, initType = Modelica.Blocks.Types.Init.SteadyState) annotation(Placement(visible = true, transformation(origin = {-139, 17}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag transferfunction2(T = T4, y_start = PGV_0) annotation(Placement(visible = true, transformation(origin = {-20, 0}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag lag1(T = T5, y_start = PGV_0) annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag transferfunction4(T = T6, y_start = PGV_0) annotation(Placement(visible = true, transformation(origin = {20, 0}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag transferfunction5(T = T7, y_start = PGV_0) annotation(Placement(visible = true, transformation(origin = {40, 0}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiter1(uMax = Uo, uMin = Uc) annotation(Placement(visible = true, transformation(origin = {-63, 17}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const1(k = GREF_0) annotation(Placement(visible = true, transformation(origin = {-67, 60}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Nonlinear.PieceWiseLinear5 ngvpiecewiselinear51(y1 = PGV1, y2 = PGV2, y3 = PGV3, y4 = PGV4, y5 = PGV5, u1 = GV1, u2 = GV2, u3 = GV3, u4 = GV4, u5 = GV5) annotation(Placement(visible = true, transformation(origin = {-40, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Nonlinear.DeadbandTyp2Hyst dbType2(db = db1, err = err) annotation(Placement(visible = true, transformation(origin = {-170, 20}, extent = {{-7.5, -7.5}, {7.5, 7.5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Nonlinear.BacklashDeadband dbBacklash(db = db2) annotation(Placement(visible = true, transformation(origin = {-70, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add7 annotation(Placement(visible = true, transformation(origin = {-110, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
protected
  parameter Real KI0(start = 1, fixed = false);
  parameter Real PMECH_0(fixed = false);
  parameter Real PGV_0 = PMECH_0 / (K1 + K3 + K5 + K7);
  parameter Real GREF_0(fixed = false);
  parameter Real PMAX_1(fixed = false);
  parameter Real PMIN_1(fixed = false);
initial algorithm
  KI0 := 1;
  if PGV_0 > PGV5 then
    GREF_0 := GV5;
  elseif PGV_0 > PGV4 then
    GREF_0 := (PGV_0 - PGV4) * (GV5 - GV4) / (PGV5 - PGV4) + GV4;
  elseif PGV_0 > PGV3 then
    GREF_0 := (PGV_0 - PGV3) * (GV4 - GV3) / (PGV4 - PGV3) + GV3;
  elseif PGV_0 > PGV2 then
    GREF_0 := (PGV_0 - PGV2) * (GV3 - GV2) / (PGV3 - PGV2) + GV2;
  elseif PGV_0 > PGV1 then
    GREF_0 := (PGV_0 - PGV1) * (GV2 - GV1) / (PGV2 - PGV1) + GV1;
  else
    GREF_0 := GV1;
  end if;
  if IBLOCK == 0 then
    PMAX_1 := PMAX;
    PMIN_1 := PMIN;
  elseif IBLOCK == 1 then
    PMAX_1 := PMAX;
    PMIN_1 := if PMIN <> 0 then PMIN else GREF_0;
  elseif IBLOCK == 2 then
    PMAX_1 := if PMAX <> 0 then PMAX else GREF_0;
    PMIN_1 := PMIN;
  else
    PMAX_1 := if PMAX <> 0 then PMAX else GREF_0;
    PMIN_1 := if PMIN <> 0 then PMIN else GREF_0;
  end if;
initial equation
  PMECH_0 = PMECH0;
equation
  connect(add31.u3, dbBacklash.y) annotation(Line(points={{-98,13},{-102.981,13},
          {-102.981,8.67209},{-55.8266,8.67209},{-55.8266,-10.0271},{-60.5,
          -10.0271},{-60.5,-9.5}},                                                                                                                                                                  color = {0, 0, 127}));
  connect(non_windup_integrator1.y, dbBacklash.u) annotation(Line(points={{-38,17},
          {-33.8753,17},{-33.8753,6.23306},{-85.9079,6.23306},{-85.9079,
          -8.94309},{-80.5,-8.94309},{-80.5,-9.5}},                                                                                                                                                                 color = {0, 0, 127}));
  connect(ngvpiecewiselinear51.u, dbBacklash.y) annotation(Line(points={{-50,-10},
          {-60.4336,-10},{-60.4336,-9.5},{-60.5,-9.5}},                                                                                             color = {0, 0, 127}));
  connect(SLIP, dbType2.u) annotation(Line(points={{-102,0},{-184.282,0},{
          -184.282,20.0542},{-177.5,20.0542},{-177.5,20}},                                                                                     color = {0, 0, 127}));
  connect(transferfunction1.u, dbType2.y) annotation(Line(points={{-149,17},{
          -157.182,17},{-157.182,20.0542},{-162.5,20.0542},{-162.5,20}},                                                                                        color = {0, 0, 127}));
  connect(transferfunction2.u, ngvpiecewiselinear51.y) annotation(Line(points={{-25,0},
          {-27.6423,0},{-27.6423,-10.0271},{-30,-10.0271},{-30,-10}},                                                                                                        color = {0, 0, 127}));
  connect(limiter1.y, non_windup_integrator1.u) annotation(Line(points = {{-57.5, 17}, {-48, 17}}, color = {0, 0, 127}));
  connect(gain1.y, limiter1.u) annotation(Line(points = {{-71.5, 17}, {-69, 17}}, color = {0, 0, 127}));
  connect(add7.y, add31.u1) annotation(Line(points={{-104.5,40},{-103.342,40},{
          -103.342,21.0797},{-98,21.0797},{-98,21}},                                                                                                color = {0, 0, 127}));
  connect(dGREF, add7.u2) annotation(Line(points={{-100,80},{-130.591,80},{
          -130.591,36.7609},{-116,36.7609},{-116,37}},                                                                                        color = {0, 0, 127}));
  connect(gain7.u, transferfunction4.y) annotation(Line(points = {{30, -24}, {30, -0.270636}, {25, -0.270636}, {25, 0}}, color = {0, 0, 127}));
  connect(gain6.u, transferfunction4.y) annotation(Line(points = {{30, 24}, {30, 0}, {25, 0}, {25, 0}}, color = {0, 0, 127}));
  connect(transferfunction5.y, gain9.u) annotation(Line(points = {{45, 0}, {49.797, 0}, {49.797, -24}, {50, -24}}, color = {0, 0, 127}));
  connect(transferfunction5.y, gain8.u) annotation(Line(points = {{45, 0}, {49.797, 0}, {49.797, 24}, {50, 24}}, color = {0, 0, 127}));
  connect(transferfunction4.y, transferfunction5.u) annotation(Line(points = {{25, 0}, {34.912, 0}, {34.912, 0}, {35, 0}}, color = {0, 0, 127}));
  connect(transferfunction4.u, lag1.y) annotation(Line(points = {{15, 0}, {5.14208, 0}, {5.14208, 0}, {5, 0}}, color = {0, 0, 127}));
  connect(lag1.y, gain5.u) annotation(Line(points = {{5, 0}, {10.0135, 0}, {10.0135, -24}, {10, -24}}, color = {0, 0, 127}));
  connect(lag1.y, gain4.u) annotation(Line(points = {{5, 0}, {10.0135, 0}, {10.0135, 24}, {10, 24}}, color = {0, 0, 127}));
  connect(lag1.u, transferfunction2.y) annotation(Line(points = {{-5, 0}, {-15.6969, 0}, {-15.6969, 0}, {-15, 0}}, color = {0, 0, 127}));
  connect(gain3.u, transferfunction2.y) annotation(Line(points = {{-10, -24}, {-10, 0}, {-15, 0}, {-15, 0}}, color = {0, 0, 127}));
  connect(gain2.u, transferfunction2.y) annotation(Line(points = {{-10, 24}, {-10, 0}, {-14.885, 0}, {-14.885, 0}, {-15, 0}}, color = {0, 0, 127}));
  connect(transferfunction1.y, add31.u2) annotation(Line(points = {{-129, 17}, {-98, 17}}, color = {0, 0, 127}));
  connect(add6.u1, gain9.y) annotation(Line(points = {{54, -47}, {50.3386, -47}, {50.3386, -35.5}, {50, -35.5}}, color = {0, 0, 127}));
  connect(add5.u1, gain7.y) annotation(Line(points = {{34, -47}, {30.0226, -47}, {30.0226, -35.5}, {30, -35.5}}, color = {0, 0, 127}));
  connect(add4.u1, gain5.y) annotation(Line(points = {{14, -47}, {10.158, -47}, {10.158, -35.4402}, {10, -35.4402}, {10, -35.5}}, color = {0, 0, 127}));
  connect(gain8.y, add3.u2) annotation(Line(points = {{50, 35.5}, {50, 46.7269}, {53.2731, 46.7269}, {53.2731, 51.693}, {59, 51.693}, {59, 52}}, color = {0, 0, 127}));
  connect(gain6.y, add2.u2) annotation(Line(points = {{30, 35.5}, {30, 46.0497}, {32.7314, 46.0497}, {32.7314, 52.1445}, {39, 52.1445}, {39, 52}}, color = {0, 0, 127}));
  connect(gain4.y, add1.u2) annotation(Line(points = {{10, 35.5}, {10, 51.9187}, {19, 51.9187}, {19, 52}}, color = {0, 0, 127}));
  connect(add6.y, PMECH_LP) annotation(Line(points = {{65.5, -50}, {77.4266, -50}, {77.4266, -40.1806}, {104, -40.1806}, {104, -60}}, color = {0, 0, 127}));
  connect(add5.y, add6.u2) annotation(Line(points = {{45.5, -50}, {46.9526, -50}, {46.9526, -53.0474}, {54, -53.0474}, {54, -53}}, color = {0, 0, 127}));
  connect(add4.y, add5.u2) annotation(Line(points = {{25.5, -50}, {27.088, -50}, {27.088, -52.8217}, {34, -52.8217}, {34, -53}}, color = {0, 0, 127}));
  connect(gain3.y, add4.u2) annotation(Line(points = {{-10, -35.5}, {-10, -52.3702}, {14, -52.3702}, {14, -53}}, color = {0, 0, 127}));
  connect(add3.y, PMECH) annotation(Line(points = {{70.5, 55}, {79, 55}, {79, 0}, {104, 0}, {104, 5.55112e-16}}, color = {0, 0, 127}));
  connect(add2.y, add3.u1) annotation(Line(points = {{50.5, 55}, {53.0474, 55}, {53.0474, 58.0135}, {59, 58.0135}, {59, 58}}, color = {0, 0, 127}));
  connect(add1.y, add2.u1) annotation(Line(points = {{30.5, 55}, {32.2799, 55}, {32.2799, 58.2393}, {39, 58.2393}, {39, 58}}, color = {0, 0, 127}));
  connect(gain2.y, add1.u1) annotation(Line(points = {{-10, 35.5}, {-10, 58.0135}, {19, 58.0135}, {19, 58}}, color = {0, 0, 127}));
  connect(add31.y, gain1.u) annotation(Line(points = {{-86.5, 17}, {-83, 17}}, color = {0, 0, 127}));
  connect(const1.y, add7.u1) annotation(Line(points={{-78,60},{-121.337,60},{
          -121.337,42.6735},{-116,42.6735},{-116,43}},                                                                                            color = {0, 0, 127}));
  annotation(Documentation(info = "<html>
<p>
1. The block diagram of the WECC Modified IEEE Type 1 Speed-Governor Model is as shown below. </p>
<p>
2. The first deadband at input represents the Type 2 deadband with bowtie hysteresis and the second deadband at the governor output represents the mechanical backlash in the governor.
</p>
<p>
3. The N<sub>GV</sub> block represents the nonlinear gate/power relationship of the governor.
</p>
<p>
4. The branch related to the Low Pressure Unit (PMECH<sub>LP</sub>) is not implemented in this model.
</p>
<img src=\"modelica://OpalRT/resource/Turbine-Governor/WSIEG1.png\"
alt=\"WSIEG1.png\"><br>

</html>"), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1})));
end WSIEG1;
