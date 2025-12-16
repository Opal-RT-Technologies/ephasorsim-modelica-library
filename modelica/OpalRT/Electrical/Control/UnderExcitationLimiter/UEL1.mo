within OpalRT.Electrical.Control.UnderExcitationLimiter;
model UEL1
  extends OpalRT.Electrical.PartialModel.UnderExcitationLimiter;
  parameter Real KUR = 1 "UEL radius setting (pu)";
  parameter Real KUC = 1 "(pu) UEL center setting (pu)";
  parameter Real KUF = 1 "(pu) UEL excitation system stabilizergain (pu)";
  parameter Real VURMAX = 1 "UEL maximum limit for radius phasor magnitude (pu)";
  parameter Real VUCMAX = 1 "UEL maximum limit for operating point phasor magnitude (pu)";
  parameter Real KUI = 1 "UEL integral gain (>0,pu)";
  parameter Real KUL = 1 "UEL proportional gain (>0,pu)";
  parameter Real VUIMAX = 1 "UEL integrator output maximum limit (pu)";
  parameter Real VUIMIN = 1 "UEL integrator output minimum limit (pu)";
  parameter Real TU1 = 1 "UEL lead time constant (sec)";
  parameter Real TU2 = 1 "UEL lag time constant (sec)";
  parameter Real TU3 = 1 "UEL lead time constant (sec)";
  parameter Real TU4 = 1 "UEL lag time constant (sec)";
  parameter Real VULMAX = 1 "UEL output maximum limit (pu)";
  parameter Real VULMIN = 1 "UEL output minimum limit (pu)";
  Modelica.Blocks.Math.Gain gain2(k = KUF) annotation(Placement(visible = true, transformation(origin = {-60, 20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));

  OpalRT.Electrical.Control.UnderExcitationLimiter.Internal.VUC_calcualtion
    vuc_calcualtion1(KUC=KUC) annotation (Placement(visible=true,
        transformation(
        origin={-60,40},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Nonlinear.Limiter limiter1(uMax = VURMAX, uMin = -Modelica.Constants.inf) annotation(Placement(visible = true, transformation(origin = {-20, 80}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = KUR) annotation(Placement(visible = true, transformation(origin = {-60, 80}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiter2(uMax = VUCMAX, uMin = -Modelica.Constants.inf) annotation(Placement(visible = true, transformation(origin = {-20, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add3 add31(k1 = -1, k3 = -1) annotation(Placement(visible = true, transformation(origin = {20, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1 annotation(Placement(visible = true, transformation(origin = {0, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.LeadLag lead_lag1(TA = TU1, TB = TU2, y_start = VULMIN) annotation(Placement(visible = true, transformation(origin = {24, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.LeadLag lead_lag2(y_start = VULMIN, TA = TU3, TB = TU4) annotation(Placement(visible = true, transformation(origin = {64, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiter3(uMax = VULMAX, uMin = VULMIN) annotation(Placement(visible = true, transformation(origin = {86, -20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunctionNonWindup.PI_NonWindupLimit pi_nonwinduplimit1(KP = KUL, KI = KUI, MAX = VUIMAX, MIN = VUIMIN, y_start = V_integ_0) annotation(Placement(visible = true, transformation(origin = {60, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiter4(uMax = VUIMAX, uMin = VUIMIN) annotation(Placement(visible = true, transformation(origin = {-40, 0}, extent = {{-6.25, -6.25}, {6.25, 6.25}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = REFUEL_0) annotation(Placement(transformation(extent = {{-68, -40}, {-48, -20}})));
protected
  parameter Real Vmag_0(start = 1, fixed = false);
  parameter Real Vang_0(start = 1, fixed = false);
  parameter Real Imag_0(start = 1, fixed = false);
  parameter Real Iang_0(start = 1, fixed = false);
  parameter Real VUC_0(start = 1, fixed = false);
  parameter Real VUR_0(start = 1, fixed = false);
  parameter Real VUR_ini(start = 1, fixed = false);
  parameter Real VUC_ini(start = 1, fixed = false);
  parameter Real VERR_0(start = 1, fixed = false);
  parameter Real REFUEL_0(start = 1, fixed = false);
  parameter Real V_integ_0(start = 1, fixed = false) "initial value of the integrator inside non-windup PI block";
initial algorithm
  Vmag_0 := EX_AUX[5];
  Vang_0 := EX_AUX[6];
  Imag_0 := EX_AUX[7];
  Iang_0 := EX_AUX[8];
  VUC_0 :=Internal.calculateOperatingPoint(
    Vmag_0,
    Vang_0,
    Imag_0,
    Iang_0,
    KUC);
  VUR_0 := KUR * Vmag_0;
  VUR_ini := if VUR_0 <= VURMAX then VUR_0 else VURMAX;
  VUC_ini := if VUC_0 <= VUCMAX then VUC_0 else VUCMAX;
  VERR_0 := VUC_ini - VUR_ini;
  if KUI == 0 then
    V_integ_0 := 0;
    REFUEL_0 := VULMIN - VUIMIN;
  else
    if VERR_0 > 0 and KUI > 0 then
      V_integ_0 := VUIMAX;
      REFUEL_0 := VULMAX - VUIMAX;
    elseif VERR_0 > 0 and KUI < 0 then
      V_integ_0 := 0;
      REFUEL_0 := VULMAX - VUIMAX;
    elseif VERR_0 < 0 and KUI < 0 then
      V_integ_0 := 0;
      REFUEL_0 := VULMIN - VUIMIN;
    else
      V_integ_0 := VUIMIN;
      REFUEL_0 := VULMIN - VUIMIN;
    end if;
  end if;
equation
  connect(limiter4.u, pi_nonwinduplimit1.y) annotation(Line(points = {{-47.5, 0}, {-50.6089, 0}, {-50.6089, 15.1556}, {78.2138, 15.1556}, {78.2138, 40.0541}, {70, 40.0541}, {70, 40}}, color = {0, 0, 127}));
  connect(limiter4.y, add1.u1) annotation(Line(points = {{-33.125, 0}, {-19.7564, 0}, {-19.7564, -14.0731}, {-12, -14.0731}, {-12, -14}}, color = {0, 0, 127}));
  connect(add31.y, pi_nonwinduplimit1.u) annotation(Line(points = {{31, 40}, {50.7973, 40}, {50.7973, 40}, {50, 40}}, color = {0, 0, 127}));
  connect(limiter3.y, VUEL) annotation(Line(points = {{91.5, -20}, {96, -20}, {96, 0}, {100, 0}}, color = {0, 0, 127}));
  connect(lead_lag2.u, lead_lag1.y) annotation(Line(points = {{54, -20}, {34, -20}}, color = {0, 0, 127}));
  connect(add1.y, lead_lag1.u) annotation(Line(points = {{11, -20}, {14, -20}}, color = {0, 0, 127}));
  connect(gain2.y, add31.u3) annotation(Line(points = {{-54.5, 20}, {0.22779, 20}, {0.22779, 32.1185}, {8, 32.1185}, {8, 32}}, color = {0, 0, 127}));
  connect(limiter2.y, add31.u2) annotation(Line(points = {{-14.5, 40}, {7.0615, 40}, {7.0615, 40}, {8, 40}}, color = {0, 0, 127}));
  connect(limiter1.y, add31.u1) annotation(Line(points = {{-14.5, 80}, {-6.15034, 80}, {-6.15034, 46.9248}, {8, 46.9248}, {8, 48}}, color = {0, 0, 127}));
  connect(vuc_calcualtion1.VUC, limiter2.u) annotation(Line(points = {{-50, 40}, {-26.8793, 40}, {-26.8793, 40}, {-26, 40}}, color = {0, 0, 127}));
  connect(gain1.y, limiter1.u) annotation(Line(points = {{-54.5, 80}, {-26.4237, 80}, {-26.4237, 80}, {-26, 80}}, color = {0, 0, 127}));
  connect(EX_AUX[4], vuc_calcualtion1.Iang) annotation(Line(points = {{-98, 78.75}, {-76.3098, 78.75}, {-76.3098, 33.2574}, {-70, 33.2574}, {-70, 34}}, color = {0, 0, 127}));
  connect(EX_AUX[3], vuc_calcualtion1.Imag) annotation(Line(points = {{-98, 76.25}, {-75.8542, 76.25}, {-75.8542, 37.3576}, {-70, 37.3576}, {-70, 38}}, color = {0, 0, 127}));
  connect(EX_AUX[2], vuc_calcualtion1.Vang) annotation(Line(points = {{-98, 73.75}, {-75.8542, 73.75}, {-75.8542, 41.4579}, {-70, 41.4579}, {-70, 42}}, color = {0, 0, 127}));
  connect(EX_AUX[1], vuc_calcualtion1.Vmag) annotation(Line(points = {{-98, 71.25}, {-75.8542, 71.25}, {-75.8542, 47.1526}, {-69.8, 47.1526}, {-69.8, 46.8}}, color = {0, 0, 127}));
  connect(EX_AUX[1], gain1.u) annotation(Line(points = {{-98, 71.25}, {-83.8269, 71.25}, {-83.8269, 79.7267}, {-66, 79.7267}, {-66, 80}}, color = {0, 0, 127}));
  connect(gain2.u, VF) annotation(Line(points = {{-66, 20}, {-93.1663, 20}, {-93.1663, -40}, {-100, -40}}, color = {0, 0, 127}));
  connect(const.y, add1.u2) annotation(Line(points = {{-47, -30}, {-30, -30}, {-30, -26}, {-12, -26}}, color = {0, 0, 127}));
  connect(lead_lag2.y, limiter3.u) annotation(Line(points = {{74, -20}, {80, -20}}, color = {0, 0, 127}));
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Documentation(info = "<html>

<p>
1- VUIMIN and VULMIN should be set to 0.0 for excitation systems where VUEL is
added to the reference.
</p><p>
2- VF should be connected to the same signal in the connected exciter. If there is no such signal available in the exciter, its value would be zero.
</p><p>
<img src=\"modelica://OpalRT/resource/Under_Excitation_Limiter/UEL1.png\"
alt=\"UEL1.png\"><br>


</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
end UEL1;
