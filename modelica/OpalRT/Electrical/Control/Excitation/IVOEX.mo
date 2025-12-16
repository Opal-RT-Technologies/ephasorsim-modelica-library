within OpalRT.Electrical.Control.Excitation;
model IVOEX
  extends OpalRT.Electrical.PartialModel.Exciter;
  parameter Integer IBUS = 100 "Located system bus";
  parameter String ID = "M1" "Machine Identifier";
  parameter Real K1 = 10;
  parameter Real A1 = 0.1;
  parameter Real A2 = 0.1;
  parameter Real T1 = 0.01;
  parameter Real T2 = 0.11;
  parameter Real MAX1 = 1;
  parameter Real MIN1 = -1;
  parameter Real K3 = 2;
  parameter Real A3 = 0.1;
  parameter Real A4 = 0.1;
  parameter Real T3 = 0.2;
  parameter Real T4 = 0.4;
  parameter Real MAX3 = 1;
  parameter Real MIN3 = -1;
  parameter Real K5 = 4;
  parameter Real A5 = 0.1;
  parameter Real A6 = 0.5;
  parameter Real T5 = 0.1;
  parameter Real T6 = 0.2;
  parameter Real MAX5 = 4;
  parameter Real MIN5 = 0;
  Modelica.Blocks.Math.Add3 add31 annotation(Placement(visible = true, transformation(origin = {-50, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add3 add32(k1 = -1) annotation(Placement(visible = true, transformation(origin = {-50, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunctionNonWindup.LeadLag_NonWindupLimit leadlag_non_windup_limit1(T1 = T1 / A1, T2 = T2 / A2, K = K1 * A1 / A2, MIN = MIN1, MAX = MAX1, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = EFD_0 / (K5 * A5 / A6) / (K3 * A3 / A4)) annotation(Placement(visible = true, transformation(origin = {10, 40}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunctionNonWindup.LeadLag_NonWindupLimit leadlag_non_windup_limit2(T1 = T3 / A3, T2 = T4 / A4, K = K3 * A3 / A4, MIN = MIN3, MAX = MAX3, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = EFD_0 / (K5 * A5 / A6)) annotation(Placement(visible = true, transformation(origin = {10, 0}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiter1(uMax = MAX5, uMin = MIN5) annotation(Placement(visible = true, transformation(origin = {30, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.LeadLag lead_lag1(TA = T5 / A5, TB = T6 / A6, K = K5 * A5 / A6, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = EFD_0) annotation(Placement(visible = true, transformation(origin = {0, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 0) annotation(Placement(transformation(extent = {{59, 70}, {79, 90}})));
  Modelica.Blocks.Sources.Constant const1(k = VREF_0) annotation(Placement(transformation(extent = {{-136, 34}, {-116, 54}})));
  Modelica.Blocks.Math.Add add1 annotation(Placement(visible = true, transformation(origin = {-80, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression Ecomp(y = ETERM) annotation(Placement(visible = true, transformation(origin = {-86, 76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
protected
  parameter Real EFD_0(fixed = false);
  parameter Real VREF_0(fixed = false);
initial equation
  EFD_0 = EFD0;
  VREF_0 = EFD_0 * (A2 * A4 * A6) / (A1 * K1 * A3 * K3 * A5 * K5) + ETERM0;
  VUEL0 = 0;
  VOEL0 = 0;
equation
  connect(add1.u2, const1.y) annotation(Line(points={{-86,37},{-107.156,37},{
          -107.156,43.6697},{-115,43.6697},{-115,44}},                                                                                            color = {0, 0, 127}));
  connect(add1.u1, dVREF) annotation(Line(points={{-86,43},{-95.4128,43},{
          -95.4128,58},{-100,58}},                                                                                        color = {0, 0, 127}));
  connect(add32.u2, add1.y) annotation(Line(points={{-62,40},{-74.4954,40},{
          -74.4954,40},{-74.5,40}},                                                                               color = {0, 0, 127}));
  connect(VOTHSG, add31.u3) annotation(Line(points = {{-100, -36}, {-72.2096, -36}, {-72.2096, -18.9066}, {-62, -18.9066}, {-62, -18}}, color = {0, 0, 127}));
  connect(lead_lag1.y, limiter1.u) annotation(Line(points = {{10, -40}, {17.2113, -40}, {17.2113, -40}, {18, -40}}, color = {0, 0, 127}));
  connect(leadlag_non_windup_limit2.y, lead_lag1.u) annotation(Line(points = {{26.5, 0}, {33.5512, 0}, {33.5512, -19.8257}, {-20.4793, -19.8257}, {-20.4793, -40.305}, {-10, -40.305}, {-10, -40}}, color = {0, 0, 127}));
  connect(limiter1.y, EFD) annotation(Line(points = {{41, -40}, {59.6087, -40}, {59.6087, -0.764214}, {100, -0.764214}, {100, 0}}, color = {0, 0, 127}));
  connect(leadlag_non_windup_limit1.y, leadlag_non_windup_limit2.u) annotation(Line(points = {{26.5, 40}, {35.4086, 40}, {35.4086, 19.8696}, {-20.3791, 19.8696}, {-20.3791, -0.254738}, {-6.5, -0.254738}, {-6.5, 0}}, color = {0, 0, 127}));
  connect(leadlag_non_windup_limit1.u, add32.y) annotation(Line(points = {{-6.5, 40}, {-38.9749, 40}, {-38.9749, 40}, {-39, 40}}, color = {0, 0, 127}));
  connect(Ecomp.y, add32.u1) annotation(Line(points = {{-75, 76}, {-69, 76}, {-69, 48}, {-62, 48}}, color = {0, 0, 127}));
  connect(add31.y, add32.u3) annotation(Line(points = {{-39, -10}, {-30.2425, -10}, {-30.2425, 19.9715}, {-69.6148, 19.9715}, {-69.6148, 31.669}, {-62, 31.669}, {-62, 32}}, color = {0, 0, 127}));
  connect(add31.u1, VUEL) annotation(Line(points = {{-62, -2}, {-81.3153, -2}, {-81.3153, 19.7147}, {-100, 19.7147}, {-100, 20}}, color = {0, 0, 127}));
  connect(add31.u2, VOEL) annotation(Line(points = {{-62, -10}, {-83, -10}, {-83, -8}, {-100, -8}}, color = {0, 0, 127}));
  connect(const.y, VF) annotation(Line(points = {{80, 80}, {100, 80}}, color = {0, 0, 127}));
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1})), Documentation(info = "<html>

<p>
1- In this model, VS = VOTHSG+VUEL+VOEL
</p>
<img src=\"modelica://OpalRT/resource/Excitation/IVOEX.png\"
alt=\"IVOEX.png\"><br>


</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1})));
end IVOEX;
