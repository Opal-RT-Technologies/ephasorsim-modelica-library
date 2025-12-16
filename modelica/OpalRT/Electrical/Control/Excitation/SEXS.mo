within OpalRT.Electrical.Control.Excitation;
model SEXS
  extends OpalRT.Electrical.PartialModel.Exciter;
  parameter Integer IBUS = 100 "Located Bus No.";
  parameter String ID = "M1" "Machine Identifier";
  parameter Real TA_TB = 0.1;
  parameter Real TB = 10;
  parameter Real K = 100;
  parameter Real TE = 0.1;
  parameter Real EMIN = 0.0;
  parameter Real EMAX = 3.0;
  Modelica.Blocks.Math.Add3 add32(k2 = +1) annotation(Placement(visible = true, transformation(origin = {-44, -4}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add3 add31(k1 = -1) annotation(Placement(visible = true, transformation(origin = {-8, 0}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.LeadLag lead_lag1(TA = TA, TB = TB, y_start = LEADLAG0) annotation(Placement(visible = true, transformation(origin = {22, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunctionNonWindup.Lag_NonWindupLimit lag_non_windup_limit2(KI = K, TI = TE, VRMAX = EMAX, VRMIN = EMIN, y_init = EFD_0) annotation(Placement(visible = true, transformation(origin = {56, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = VREF_0) annotation(Placement(transformation(extent = {{-153, 34}, {-133, 54}})));
  Modelica.Blocks.Sources.Constant const1(k = 0) annotation(Placement(transformation(extent = {{49, 70}, {69, 90}})));
  Modelica.Blocks.Math.Add add1 annotation(Placement(visible = true, transformation(origin = {-100, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression Ecomp(y = ETERM) annotation(Placement(visible = true, transformation(origin = {-53, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
protected
  parameter Real TA(fixed = false);
  parameter Real EFD_0(fixed = false);
  parameter Real LEADLAG0(fixed = false);
  parameter Real ECOMP0(fixed = false);
  parameter Real VREF_0(fixed = false);
initial equation
  TA = TA_TB * TB;
  EFD_0 = EFD0;
  LEADLAG0 = EFD_0 / K;
  ECOMP0 = ETERM0;
  VREF_0 = ECOMP0 + LEADLAG0;
  VUEL0 = 0;
  VOEL0 = 0;
equation
  connect(lag_non_windup_limit2.y, EFD) annotation(Line(points = {{67, 0}, {100, 0}}, color = {0, 0, 127}));
  connect(lead_lag1.y, lag_non_windup_limit2.u) annotation(Line(points = {{32, 0}, {45, 0}}, color = {0, 0, 127}));
  connect(add31.y, lead_lag1.u) annotation(Line(points = {{-2.5, 0}, {12, 0}}, color = {0, 0, 127}));
  connect(add32.u1, VUEL) annotation(Line(points = {{-50, 0}, {-88, 0}, {-88, 20}, {-100, 20}}, color = {0, 0, 127}));
  connect(VOEL, add32.u2) annotation(Line(points = {{-100, -8}, {-92, -8}, {-92, -4}, {-50, -4}}, color = {0, 0, 127}));
  connect(VOTHSG, add32.u3) annotation(Line(points = {{-100, -36}, {-88, -36}, {-88, -8}, {-50, -8}}, color = {0, 0, 127}));
  connect(add32.y, add31.u3) annotation(Line(points = {{-38.5, -4}, {-14, -4}}, color = {0, 0, 127}));
  connect(Ecomp.y, add31.u1) annotation(Line(points = {{-42, 14}, {-20, 14}, {-20, 4}, {-14, 4}}, color = {0, 0, 127}));
  connect(dVREF, add1.u1) annotation(Line(points={{-100,58},{-111.568,58},{
          -111.568,43.1877},{-106,43.1877},{-106,43}},                                                                                          color = {0, 0, 127}));
  connect(add1.y, add31.u2) annotation(Line(points={{-94.5,40},{-23.9075,40},{
          -23.9075,-0.257069},{-14,-0.257069},{-14,0}},                                                                                                  color = {0, 0, 127}));
  connect(const.y, add1.u2) annotation(Line(points={{-132,44},{-115.167,44},{
          -115.167,37.2751},{-106,37.2751},{-106,37}},                                                                                            color = {0, 0, 127}));
  connect(const1.y, VF) annotation(Line(points = {{70, 80}, {100, 80}}, color = {0, 0, 127}));
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Documentation(info = "<html>

<img src=\"modelica://OpalRT/resource/Excitation/SEXS.png\"


</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
end SEXS;
