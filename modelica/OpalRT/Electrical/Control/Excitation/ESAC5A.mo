within OpalRT.Electrical.Control.Excitation;
model ESAC5A
  extends OpalRT.Electrical.PartialModel.Exciter;
  parameter Integer IBUS = 100 "Located Bus No.";
  parameter String ID = "M1" "Machine Identifier";
  parameter Real TR = 0.02 "(sec)";
  parameter Real KA = 100;
  parameter Real TA = 0.5 "(sec)";
  parameter Real VRMAX = 9 "or zero";
  parameter Real VRMIN = -5;
  parameter Real KE = 0.5 "or zero";
  parameter Real TE = 0.08 "(sec)";
  parameter Real KF = 0.2;
  parameter Real TF1 = 1.2 "(>0) (sec)";
  parameter Real TF2 = 2 "(>0) (sec)";
  parameter Real TF3 = 2 "(>0) (sec)";
  parameter Real E1 = 4;
  parameter Real SE_E1 = 0.4;
  parameter Real E2 = 5;
  parameter Real SE_E2 = 0.5;
  import sat_q = OpalRT.NonElectrical.Math.Nonlinear.computeSaturationQuadratic;
  Modelica.Blocks.Math.Add3 add31 annotation(Placement(visible = true, transformation(origin = {-60, -60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1(k1 = -1) annotation(Placement(visible = true, transformation(origin = {-60, 0}, extent = {{-5, -5}, {5, 5}}, rotation = 90)));
  Modelica.Blocks.Math.Add3 add32(k3 = -1) annotation(Placement(visible = true, transformation(origin = {-65, 65}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunctionNonWindup.Lag_NonWindupLimit lag_non_windup_limit1(KI = KA, TI = TA, VRMAX = VRMAX_1, VRMIN = VRMIN_1, y_init = (SE0 + KE_1) * EFD_0) annotation(Placement(visible = true, transformation(origin = {-40, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add3 annotation(Placement(visible = true, transformation(origin = {40, 40}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = KE_1) annotation(Placement(visible = true, transformation(origin = {60, 60}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunctionNonWindup.Integrator_NonWindupLimit non_windup_integrator1(VRMAX = Modelica.Constants.inf, VRMIN = 0, KI = 1 / TE, y_init = EFD_0) annotation(Placement(visible = true, transformation(origin = {40, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add2(k2 = -1) annotation(Placement(visible = true, transformation(origin = {20, 80}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  NonElectrical.Math.Nonlinear.SaturationQuadratic saturation1(E1 = E1, E2 = E2, SE_E1 = SE_E1, SE_E2 = SE_E2) annotation(Placement(visible = true, transformation(origin = {72, 20}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag lag1(T = TR, initType = Modelica.Blocks.Types.Init.SteadyState, y_start = 0) annotation(Placement(visible = true, transformation(origin = {-80, -20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));

  OpalRT.Electrical.Control.Excitation.Internal.ExciterStabilizingBlock tf1(
    TF1=TF1,
    TF2=TF2,
    TF3=TF3,
    KF=KF) annotation (Placement(visible=true, transformation(
        origin={-40,40},
        extent={{10,-10},{-10,10}},
        rotation=0)));
  Modelica.Blocks.Math.Product product annotation(Placement(transformation(extent = {{60, 18}, {50, 28}})));
  Modelica.Blocks.Sources.Constant const(k = VREF_0) annotation(Placement(transformation(extent = {{-134, 34}, {-114, 54}})));
  Modelica.Blocks.Math.Add add4 annotation(Placement(visible = true, transformation(origin = {-100, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression Ecomp(y = ETERM) annotation(Placement(visible = true, transformation(origin = {-117, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
protected
  parameter Modelica.Blocks.Types.Init initType = Modelica.Blocks.Types.Init.InitialOutput "Type of initialization (1: no init, 2: steady state, 3,4: initial output)";
  parameter Real VRMAX_1(fixed = false);
  parameter Real VRMIN_1(fixed = false);
  parameter Real KE_1(fixed = false);
  parameter Real EFD_0(fixed = false);
  parameter Real ECOMP_0(fixed = false);
  parameter Real VREF_0(fixed = false);
  parameter Real SE0(fixed = false);
initial equation
  EFD_0 = EFD0;
  ECOMP_0 = ETERM0;
  SE0 = sat_q(EFD_0, E1, E2, SE_E1, SE_E2);
  VRMAX_1 = if VRMAX <> 0 then VRMAX elseif KE <= 0 then SE_E2 * E2 else (SE_E2 + KE) * E2;
  VRMIN_1 = if VRMAX <> 0 then VRMIN else -VRMAX_1;
  KE_1 = if KE <> 0 then KE else VRMAX_1 / (10 * EFD_0) - SE0;
  VREF_0 = (SE0 + KE_1) * EFD_0 / KA + ECOMP_0;
  VUEL0 = 0;
  VOEL0 = 0;
equation
  connect(add32.u1, add4.y) annotation(Line(points={{-71,69},{-83.8343,69},{-83.8343,
          39.9409},{-94.5,39.9409},{-94.5,40}},                                                                                                  color = {0, 0, 127}));
  connect(dVREF, add4.u1) annotation(Line(points={{-100,58},{-108.573,58},{-108.573,
          42.8699},{-106,42.8699},{-106,43}},                                                                                                   color = {0, 0, 127}));
  connect(const.y, add4.u2) annotation(Line(points={{-113,44},{-110.204,44},{-110.204,
          37.0452},{-106,37.0452},{-106,37}},                                                                                                     color = {0, 0, 127}));
  connect(tf1.y, VF) annotation(Line(points = {{-50, 40}, {-57.7084, 40}, {-57.7084, 94.4055}, {100, 94.4055}, {100, 80}}, color = {0, 0, 127}));
  connect(tf1.u, lag_non_windup_limit1.y) annotation(Line(points = {{-30, 40}, {-8.21566, 40}, {-8.21566, 80.1027}, {-29, 80.1027}, {-29, 80}}, color = {0, 0, 127}));
  connect(tf1.y, add32.u3) annotation(Line(points = {{-50, 40}, {-76.5083, 40}, {-76.5083, 60.3338}, {-71, 60.3338}, {-71, 61}}, color = {0, 0, 127}));
  connect(lag1.y, add1.u1) annotation(Line(points = {{-75, -20}, {-62.963, -20}, {-62.963, -6}, {-63, -6}}, color = {0, 0, 127}));
  connect(Ecomp.y, lag1.u) annotation(Line(points = {{-106, -20}, {-84, -20}}, color = {0, 0, 127}));
  connect(saturation1.u, EFD) annotation(Line(points = {{77, 20}, {83.9368, 20}, {83.9368, 19.9368}, {100, 19.9368}, {100, 0}}, color = {0, 0, 127}));
  connect(add3.y, add2.u2) annotation(Line(points = {{34.5, 40}, {7.65139, 40}, {7.65139, 77.1179}, {14, 77.1179}, {14, 77}}, color = {0, 0, 127}));
  connect(lag_non_windup_limit1.y, add2.u1) annotation(Line(points = {{-29, 80}, {-7.85274, 80}, {-7.85274, 83.1585}, {14, 83.1585}, {14, 83}}, color = {0, 0, 127}));
  connect(add2.y, non_windup_integrator1.u) annotation(Line(points = {{25.5, 80}, {34.8339, 80}, {34.8339, 80}, {35, 80}}, color = {0, 0, 127}));
  connect(non_windup_integrator1.y, EFD) annotation(Line(points = {{45, 80}, {80.018, 80}, {80.018, 0}, {100, 0}}, color = {0, 0, 127}));
  connect(gain1.u, EFD) annotation(Line(points = {{66, 60}, {83.9368, 60}, {83.9368, 59.9368}, {100, 59.9368}, {100, 0}}, color = {0, 0, 127}));
  connect(gain1.y, add3.u1) annotation(Line(points = {{54.5, 60}, {51.7475, 60}, {51.7475, 42.6867}, {46, 42.6867}, {46, 43}}, color = {0, 0, 127}));
  connect(add32.y, lag_non_windup_limit1.u) annotation(Line(points = {{-59.5, 65}, {-56.3786, 65}, {-56.3786, 80.3396}, {-51, 80.3396}, {-51, 80}}, color = {0, 0, 127}));
  connect(add1.y, add32.u2) annotation(Line(points = {{-60, 5.5}, {-60, 36.0421}, {-80.9707, 36.0421}, {-80.9707, 65.2381}, {-71, 65.2381}, {-71, 65}}, color = {0, 0, 127}));
  connect(add31.y, add1.u2) annotation(Line(points = {{-54.5, -60}, {-50.9421, -60}, {-50.9421, -19.3298}, {-56.9827, -19.3298}, {-56.9827, -6}, {-57, -6}}, color = {0, 0, 127}));
  connect(VUEL, add31.u3) annotation(Line(points = {{-100, 20}, {-89.1908, 20}, {-89.1908, -64.1407}, {-66, -64.1407}, {-66, -64}}, color = {0, 0, 127}));
  connect(VOTHSG, add31.u1) annotation(Line(points = {{-100, -36}, {-79.567, -36}, {-79.567, -56.2923}, {-66, -56.2923}, {-66, -56}}, color = {0, 0, 127}));
  connect(add31.u2, VOEL) annotation(Line(points = {{-66, -60}, {-90.9932, -60}, {-90.9932, -8}, {-100, -8}}, color = {0, 0, 127}));
  connect(product.u2, saturation1.y) annotation(Line(points = {{61, 20}, {67, 20}, {67, 20}}, color = {0, 0, 127}));
  connect(product.u1, EFD) annotation(Line(points = {{61, 26}, {76, 26}, {76, 25.9368}, {100, 25.9368}, {100, 0}}, color = {0, 0, 127}));
  connect(add3.u2, product.y) annotation(Line(points = {{46, 37}, {48, 37}, {48, 23}, {49.5, 23}}, color = {0, 0, 127}));
  annotation(Documentation(info = "<html>

<p>
1- In this model, VS = VOTHSG+VUEL+VOEL
</p>
<p>
2- In this model, if TF2 = 0, then sTF3=0
</p>
<img src=\"modelica://OpalRT/resource/Excitation/ESAC5A.png\"
alt=\"ESAC5A.png\"><br>

</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = false, initialScale = 0.1, grid = {2, 2})));
end ESAC5A;
