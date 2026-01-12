within OpalRT.Electrical.Control.Excitation;
model ESST4B
  extends OpalRT.Electrical.PartialModel.Exciter;
  parameter Real TR = 0.02;
  parameter Real KPR = 1;
  parameter Real KIR = 0.03;
  parameter Real VRMAX = 10;
  parameter Real VRMIN = -10;
  parameter Real TA = 0.2;
  parameter Real KPM = 0.02;
  parameter Real KIM = 0.02;
  parameter Real VMMAX = 0.02;
  parameter Real VMMIN = 0.02;
  parameter Real KG = 0.02;
  parameter Real KP = 0.02;
  parameter Real KI = 0.02;
  parameter Real VBMAX = 0.02;
  parameter Real KC = 0.02;
  parameter Real XL = 0.02;
  parameter Real THETAP = 0.52 "radian";
  constant Real pi = Modelica.Constants.pi;
  import OpalRT.Electrical.Control.Excitation.Common.compoundedTransformerFunction;
  import OpalRT.Electrical.Control.Excitation.Common.currentNormalizationFunction;
  import OpalRT.Electrical.Control.Excitation.Common.rectifierFunction;
  Modelica.Blocks.Math.Add3 add31(k2 = +1, k1 = -1) annotation(Placement(visible = true, transformation(origin = {-62, 64}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag lag1(T = TR, y_start = ECOMP_0) annotation(Placement(visible = true, transformation(origin = {-78, 68}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1 annotation(Placement(visible = true, transformation(origin = {-42, 74}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag lag2(T = TA, y_start = VR0) annotation(Placement(visible = true, transformation(origin = {4, 74}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add2(k2 = -1) annotation(Placement(visible = true, transformation(origin = {26, 68}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunctionWindup.PI_WindupLimit pi_non_windup_limit2(KI = KIM, KP = KPM, MAX = VMMAX, MIN = VMMIN, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = VA0) annotation(Placement(visible = true, transformation(origin = {48, 68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Product product1 annotation(Placement(visible = true, transformation(origin = {68, 20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = KG) annotation(Placement(visible = true, transformation(origin = {56, -32}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiter1(uMax = VBMAX, uMin = -Modelica.Constants.inf) annotation(Placement(visible = true, transformation(origin = {40, 0}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunctionWindup.PI_WindupLimit pi_non_windup_limit1(KI = KIR, KP = KPR, MAX = VRMAX, MIN = VRMIN, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = VR0) annotation(Placement(visible = true, transformation(origin = {-18, 74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = VREF_0) annotation(Placement(visible = true, transformation(origin = {-126.5, 44.5}, extent = {{-12.5, -12.5}, {12.5, 12.5}}, rotation = 0)));
  Common.CompoundTransAndRectifer trans_rectifier_normalization_function1(KC = KC, KI = KI, KPmag = KP, KPang = THETAP, XL = XL) annotation(Placement(visible = true, transformation(origin = {-20, -20}, extent = {{-25, -25}, {25, 25}}, rotation = 0)));
  Modelica.Blocks.Math.Min min1 annotation(Placement(visible = true, transformation(origin = {75, 55}, extent = {{-5, -5}, {5, 5}}, rotation = -90)));
  Modelica.Blocks.Sources.Constant const1(k = 0) annotation(Placement(transformation(extent = {{58, 84}, {78, 104}})));
  Modelica.Blocks.Math.Add add3 annotation(Placement(visible = true, transformation(origin = {-120, 80}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression Ecomp(y = ETERM) annotation(Placement(visible = true, transformation(origin = {-109, 92}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
protected
  parameter Real EFD_0(fixed = false);
  parameter Real ECOMP_0(fixed = false);
  parameter Real VREF_0(fixed = false);
  parameter Real ITERM_0(fixed = false);
  parameter Real ETERM_0(fixed = false);
  parameter Real IFD_0(fixed = false);
  parameter Real VB0(fixed = false);
  parameter Real VA0(fixed = false);
  parameter Real TETAV0(fixed = false);
  parameter Real TETAI0(fixed = false);
  parameter Real VR0(fixed = false);
  parameter Real VE0(fixed = false);
  parameter Real IN0(fixed = false);
  parameter Real FEX0(fixed = false);
initial algorithm
  ETERM_0 := EX_AUX[1];
  TETAV0 := EX_AUX[2];
  ITERM_0 := EX_AUX[3];
  TETAI0 := EX_AUX[4];
  IFD_0 := XADIFD;
  EFD_0 := EFD0;
  ECOMP_0 := ETERM0;
  VE0 := compoundedTransformerFunction(ETERM_0, TETAV0, ITERM_0, TETAI0, XL, KP, THETAP, KI);
  IN0 := KC * currentNormalizationFunction(IFD_0, VE0);
  FEX0 := rectifierFunction(IN0);
  VB0 := if VE0 * FEX0 > VBMAX then VBMAX else VE0 * FEX0;
  VA0 := EFD_0 / VB0;
  VR0 := if KIM <> 0 then KG * EFD_0 else KG * EFD_0 + VA0 / KPM;
  VREF_0 := if KIR <> 0 then ECOMP_0 else ECOMP_0 + VR0 / KPR;
  VOEL0 := Modelica.Constants.inf;
  VUEL0 := 0;
equation
  connect(min1.y, product1.u1) annotation(Line(points = {{75, 49.5}, {75, 36.8564}, {56.0976, 36.8564}, {56.0976, 23.3062}, {62, 23.3062}, {62, 23}}, color = {0, 0, 127}));
  connect(min1.u1, VOEL) annotation(Line(points = {{78, 61}, {78, 79.1328}, {-100, 79.1328}, {-100, -8}}, color = {0, 0, 127}));
  connect(pi_non_windup_limit2.y, min1.u2) annotation(Line(points = {{58, 68}, {72.3577, 68}, {72.3577, 61}, {72, 61}}, color = {0, 0, 127}));
  connect(trans_rectifier_normalization_function1.Iimg, VI[4]) annotation(Line(points={{-45,-40},
          {-45,-39.8458},{-60,-39.8458},{-60,-92.5}},                                                                                                               color = {0, 0, 127}));
  connect(trans_rectifier_normalization_function1.Ire, VI[3]) annotation(Line(points={{-45,-30},
          {-45,-30.3342},{-60,-30.3342},{-60,-97.5}},                                                                                                              color = {0, 0, 127}));
  connect(trans_rectifier_normalization_function1.Vimg, VI[2]) annotation(Line(points={{-45,-20},
          {-45,-20.0514},{-60,-20.0514},{-60,-102.5}},                                                                                                              color = {0, 0, 127}));
  connect(trans_rectifier_normalization_function1.Vre, VI[1]) annotation(Line(points={{-45,-10},
          {-45,-9.76864},{-60,-9.76864},{-60,-107.5}},                                                                                                             color = {0, 0, 127}));
  connect(trans_rectifier_normalization_function1.VB, limiter1.u) annotation(Line(points = {{6.25, -21.25}, {24.3499, -21.25}, {24.3499, -0.472813}, {34, -0.472813}, {34, 0}}, color = {0, 0, 127}));
  connect(trans_rectifier_normalization_function1.IFD, XADIFD) annotation(Line(points = {{-45, 1.19209e-07}, {-63.9811, 1.19209e-07}, {-63.9811, -64}, {-100, -64}}, color = {0, 0, 127}));
  connect(pi_non_windup_limit1.y, lag2.u) annotation(Line(points = {{-8, 74}, {-1.2837, 74}, {-1.2837, 74}, {-1, 74}}, color = {0, 0, 127}));
  connect(VUEL, add31.u3) annotation(Line(points = {{-100, 20}, {-72.6651, 20}, {-72.6651, 59.9089}, {-68, 59.9089}, {-68, 60}}, color = {0, 0, 127}));
  connect(add1.y, pi_non_windup_limit1.u) annotation(Line(points = {{-36.5, 74}, {-29.8405, 74}, {-28, 73.8041}, {-28, 74}}, color = {0, 0, 127}));
  connect(gain1.u, EFD) annotation(Line(points = {{62, -32}, {92.7107, -32}, {92.7107, 0}, {100, 0}}, color = {0, 0, 127}));
  connect(limiter1.y, product1.u2) annotation(Line(points = {{45.5, 0}, {56.492, 0}, {56.492, 16.6287}, {62, 16.6287}, {62, 17}}, color = {0, 0, 127}));
  connect(gain1.y, add2.u2) annotation(Line(points = {{50.5, -32}, {16.5285, -32}, {16.5285, 64.6925}, {20, 64.6925}, {20, 65}}, color = {0, 0, 127}));
  connect(lag2.y, add2.u1) annotation(Line(points = {{9, 74}, {12.5285, 74}, {12.5285, 71.0706}, {20, 71.0706}, {20, 71}}, color = {0, 0, 127}));
  connect(product1.y, EFD) annotation(Line(points = {{73.5, 20}, {92.2551, 20}, {92.2551, 0}, {100, 0}}, color = {0, 0, 127}));
  connect(add2.y, pi_non_windup_limit2.u) annotation(Line(points = {{31.5, 68}, {37.3576, 68}, {37.3576, 68}, {38, 68}}, color = {0, 0, 127}));
  connect(add31.y, add1.u2) annotation(Line(points = {{-56.5, 64}, {-53.303, 64}, {-53.303, 70.8428}, {-48, 70.8428}, {-48, 71}}, color = {0, 0, 127}));
  connect(dVREF, add3.u2) annotation(Line(points={{-100,58},{-104.884,58},{
          -104.884,70.9512},{-129.82,70.9512},{-129.82,76.8638},{-126,76.8638},
          {-126,77}},                                                                                                                                                                   color = {0, 0, 127}));
  connect(add3.y, add1.u1) annotation(Line(points={{-114.5,80},{-52.9563,80},{
          -52.9563,76.8638},{-48,76.8638},{-48,77}},                                                                                               color = {0, 0, 127}));
  connect(lag1.y, add31.u1) annotation(Line(points = {{-73, 68}, {-72.4374, 68}, {-72.4374, 68.1093}, {-68, 68.1093}, {-68, 68}}, color = {0, 0, 127}));
  connect(Ecomp.y, lag1.u) annotation(Line(points = {{-98, 92}, {-92, 92}, {-92, 68}, {-82, 68}}, color = {0, 0, 127}));
  connect(VOTHSG, add31.u2) annotation(Line(points = {{-100, -36}, {-68.3371, -36}, {-68.3371, 64}, {-68, 64}}, color = {0, 0, 127}));
  connect(const1.y, VF) annotation(Line(points = {{79, 94}, {82, 94}, {82, 78}, {100, 78}, {100, 80}}, color = {0, 0, 127}));
  connect(add3.u1, const.y) annotation(Line(points={{-126,83},{-109.769,83},{
          -109.769,58.3548},{-136.247,58.3548},{-136.247,83.2905},{-112.75,
          83.2905},{-112.75,44.5}},                                                                                                                                                                color = {0, 0, 127}));
  annotation(Documentation(info = "<html>


<img
src=\"modelica://OpalRT/resource/Excitation/ESST4B.png\"
alt=\"ESST4B.png\"><br>
<p>
IMPORTANT!
</p>
<p>
<b>In the present model, the LV Gate is not implemented.</b>
</p>

<p>
In this model, the filter block is as following:
</p>
<img src=\"modelica://OpalRT/resource/Excitation/EXAC1_FILTER.png\"
alt=\"EXAC1.png\"><br>
</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = false, initialScale = 0.1, grid = {2, 2}), graphics={  Text(origin = {-2.6243, 58.4253}, lineColor = {255, 85, 127}, extent = {{-3.08, 3.99}, {3.08, -3.99}}, textString = "VR"), Text(origin = {52.91, 9.85977}, lineColor = {255, 85, 127}, extent = {{-3.08, 3.99}, {3.08, -3.99}}, textString = "VB"), Text(origin = {14.91, -46.1402}, lineColor = {255, 85, 127}, extent = {{-3.08, 3.99}, {3.08, -3.99}}, textString = "IN")}));
end ESST4B;
