within OpalRT.Electrical.Control.Excitation;
model SCRX "Bus Fed or Solid Fed Static Exciter"
  extends OpalRT.Electrical.PartialModel.Exciter(dVREF(start = 0));
  parameter Integer IBUS = 100 "Located Bus No.";
  parameter String ID = "M1" "Machine Identifier";
  parameter Real TA_TB = 0.1 "TA/TB";
  parameter Real TB = 10 "(>0) (sec)";
  parameter Real K = 200;
  parameter Real TE = 0.05 "(sec)";
  parameter Real EMIN = -3.2 "(pu on EFD base)";
  parameter Real EMAX = 4 "(pu on EFD base)";
  parameter Real CSWITCH = 1 "0 for bus fed, 1 for solid fed";
  parameter Real rc_rfd = 0 "rc/rfd, 0 with negative field current capability (EX=EFD)";
  Modelica.Blocks.Math.Add3 add31 annotation(Placement(visible = true, transformation(origin = {-70, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add3 add32(k1 = -1) annotation(Placement(visible = true, transformation(origin = {-50, 80}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunctionNonWindup.Lag_NonWindupLimit Lag_Non_Windup_Limit1(KI = K, TI = TE, VRMAX = EMAX, VRMIN = EMIN, y_init = y01) annotation(Placement(visible = true, transformation(origin = {0, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 1) annotation(Placement(visible = true, transformation(origin = {30, 70}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Product product1 annotation(Placement(visible = true, transformation(origin = {80, 50}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));

  OpalRT.Electrical.Control.Excitation.Internal.NegativeCurrentLogic
    negative_current_logic1(rc_rfd=rc_rfd) annotation (Placement(visible=true,
        transformation(
        origin={30,10},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.LeadLag leadlag1(TA = TA, TB = TB, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = y02) annotation(Placement(visible = true, transformation(origin = {-30, 80}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const1(k = 0) annotation(Placement(visible = true, transformation(origin = {75, 80}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const2(k = VREF_0) annotation(Placement(visible = true, transformation(origin = {-114, 44}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1 annotation(Placement(visible = true, transformation(origin = {-70, 70}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression Ecomp(y = ETERM) annotation(Placement(visible = true, transformation(origin = {-83, 84}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
protected
  parameter Real TA(fixed = false);
  parameter Real y01(fixed = false);
  parameter Real y02(fixed = false);
  parameter Real VREF_0(fixed = false);
  parameter Real ETERM_0(fixed = false);
  parameter Real EFD_0(fixed = false);
  parameter Real CSWITCHI(fixed = false);
initial equation
  CSWITCHI = integer(CSWITCH);
  TA = TA_TB * TB;
  y01 = if CSWITCHI == 1 then EFD_0 else EFD_0 / ETERM_0;
  y02 = if CSWITCHI == 1 then EFD_0 / K else EFD_0 / ETERM_0 / K;
  VREF_0 = if CSWITCHI == 1 then EFD_0 / K + ETERM_0 else EFD_0 / ETERM_0 / K + ETERM_0;
  ETERM_0 = ETERM0;
  EFD_0 = EFD0;
  VUEL0 = 0;
  VOEL0 = 0;
equation
  connect(leadlag1.y, Lag_Non_Windup_Limit1.u) annotation(Line(points = {{-25, 80}, {-11.0535, 80}, {-11.0535, 80}, {-11, 80}}, color = {0, 0, 127}));
  connect(add32.y, leadlag1.u) annotation(Line(points = {{-44.5, 80}, {-35.5786, 80}, {-35.5786, 80}, {-35, 80}}, color = {0, 0, 127}));
  connect(negative_current_logic1.EFD, EFD) annotation(Line(points = {{40, 4}, {77.3392, 4}, {77.3392, 0.648547}, {100, 0.648547}, {100, 0}}, color = {0, 0, 127}));
  connect(negative_current_logic1.EX, product1.y) annotation(Line(points = {{20, 16}, {14.5923, 16}, {14.5923, 34.373}, {89.6616, 34.373}, {89.6616, 50.2624}, {85.5, 50.2624}, {85.5, 50}}, color = {0, 0, 127}));
  connect(XADIFD, negative_current_logic1.XADIFD) annotation(Line(points = {{-100, -64}, {-35.9944, -64}, {-35.9944, 4.21555}, {20, 4.21555}, {20, 4}}, color = {0, 0, 127}));
  connect(Lag_Non_Windup_Limit1.y, product1.u2) annotation(Line(points = {{11, 80}, {19.1344, 80}, {19.1344, 46.697}, {54, 47}, {74, 47}}, color = {0, 0, 127}));
  product1.u1 = if CSWITCH == 0 then ETERM else const.y;
  connect(Ecomp.y, add32.u1) annotation(Line(points = {{-72, 84}, {-56, 84}}, color = {0, 0, 127}));
  connect(add1.y, add32.u2) annotation(Line(points={{-64.5,70},{-62.7249,70},{
          -62.7249,69.9229},{-56,69.9229},{-56,80}},                                                                                             color = {0, 0, 127}));
  connect(add1.u1, dVREF) annotation(Line(points={{-76,73},{-96.401,73},{
          -96.401,58},{-100,58}},                                                                                      color = {0, 0, 127}));
  connect(add31.y, add32.u3) annotation(Line(points = {{-64.5, 40}, {-60.5923, 40}, {-60.5923, 76.082}, {-56, 76.082}, {-56, 76}}, color = {0, 0, 127}));
  connect(const1.y, VF) annotation(Line(points = {{80.5, 80}, {100, 80}}, color = {0, 0, 127}));
  connect(VUEL, add31.u1) annotation(Line(points = {{-100, 20}, {-87, 20}, {-87, 44}, {-76, 44}}, color = {0, 0, 127}));
  connect(VOEL, add31.u2) annotation(Line(points = {{-100, -8}, {-84, -8}, {-84, 40}, {-76, 40}}, color = {0, 0, 127}));
  connect(VOTHSG, add31.u3) annotation(Line(points = {{-100, -36}, {-80, -36}, {-80, 36}, {-76, 36}}, color = {0, 0, 127}));
  connect(add1.u2, const2.y) annotation(Line(points={{-76,67},{-88.6889,67},{
          -88.6889,43.9589},{-108.5,43.9589},{-108.5,44}},                                                                                        color = {0, 0, 127}));
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1})), Documentation(info = "<html>

<p>
Depending on the Value of CSWITCH, transfer function blocks are initialized. For initialization of the blocks in steady state, initial value of transfer functions with limiter must be within the limits. In this way:
</p>

<ul>
<li> if CSWITCH = 1, EMIN&ltEFD(0)&ltEMAX.</li>
<li> if CSWITCH = 0, EMIN&ltEFD(0)/ETERM(0)&ltEMAX.</li>
</ul>

Currently For CSWITCH = 0, SCRX exciter does not work properly.
<img src=\"modelica://OpalRT/resource/Excitation/SCRX.png\"
alt=\"SCRX.png\"><br>


</html>"));
end SCRX;
