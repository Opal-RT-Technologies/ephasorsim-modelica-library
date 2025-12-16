within OpalRT.Electrical.Control.TurbineGovernor;
model DEGOV1 "Woodward Diesel Governor"
  extends OpalRT.Electrical.PartialModel.TurbineGovernor;
  parameter Real M = 1 "Feedback signal flag. 0: Throttle feedback, 1: Electrical power feedback";
  parameter Real T1 = 0 "(sec)";
  parameter Real T2 = 0 "(sec)";
  parameter Real T3 = 1 "(sec)";
  parameter Real K = 0.8;
  parameter Real T4 = 0.1 "(sec)";
  parameter Real T5 = 0.8 "(sec)";
  parameter Real T6 = 0.25 "(sec)";
  parameter Real TD = 0.04 "(0<=TD<=12*DELT)(sec)";
  parameter Real TMAX = 0.4;
  parameter Real TMIN = 0.0;
  parameter Real DROOP = 0.2;
  parameter Real TE = 1;
  Modelica.Blocks.Math.Gain gain1(k = DROOP) annotation(Placement(visible = true, transformation(origin = {-40, 0}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Product product1 annotation(Placement(visible = true, transformation(origin = {80, 0}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1 annotation(Placement(visible = true, transformation(origin = {55, -15}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.SignalRouting.Multiplexer multiplexer1(n = 2, s = M + 1) annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag lag1(T = TE, y_start = PELEC_0) annotation(Placement(visible = true, transformation(origin = {-60, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = GREF_0) annotation(Placement(visible = true, transformation(origin = {-80, 60}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant1(k = 1) annotation(Placement(visible = true, transformation(origin = {40, -20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant2(k = 0) annotation(Placement(visible = true, transformation(origin = {80, -60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add3 add31(k2 = -1, k3 = -1) annotation(Placement(visible = true, transformation(origin = {-60, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.TransferFunction2 transferfunction21(b = if T1 <> 0 then {T3, 1} else {0, 1}, a = {T1 * T2, T1, 1}) annotation(Placement(visible = true, transformation(origin = {-20, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  OpalRT.Electrical.Control.TurbineGovernor.Internal.Actuator actuator1(
    K=K,
    T4=T4,
    T5=T5,
    T6=T6,
    TMAX=TMAX,
    TMIN=TMIN,
    y_init=PMECH_0) annotation (Placement(visible=true, transformation(
        origin={20,40},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.TransferFunction2 transferfunction22(b = {T_pade1, -T_pade2, 1}, a = {T_pade1, T_pade2, 1}, y_start = PMECH_0) annotation(Placement(visible = true, transformation(origin = {60, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add2 annotation(Placement(visible = true, transformation(origin = {-80, 80}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
protected
  parameter Real PMECH_0(fixed = false);
  parameter Real PELEC_0(fixed = false);
  parameter Real GREF_0(fixed = false);
  parameter Real T_pade1(fixed = false);
  parameter Real T_pade2(fixed = false);
initial equation
  T_pade1 = if TD <> 0 then TD ^ 2 / 12 else 0;
  T_pade2 = if TD <> 0 then TD / 2 else 0;
  PMECH_0 = PMECH0;
  PELEC_0 = PELEC;
  GREF_0 = if M == 0 then DROOP * PMECH_0 else DROOP * PELEC_0;
equation
  connect(transferfunction22.y, product1.u1) annotation(Line(points={{70,40},{
          87.7934,40},{87.7934,12.6761},{68.5446,12.6761},{68.5446,2.8169},{74,
          2.8169},{74,3}},                                                                                                                                                                        color = {0, 0, 127}));
  connect(actuator1.y, transferfunction22.u) annotation(Line(points={{30,40},{
          48.8263,40},{48.8263,40},{50,40}},                                                                                             color = {0, 0, 127}));
  connect(actuator1.y, multiplexer1.u[1]) annotation(Line(points={{30,40},{
          37.0809,40},{37.0809,0},{10,0},{10,-0.5}},                                                                                    color = {0, 0, 127}));
  connect(actuator1.u, transferfunction21.y) annotation(Line(points={{10,40},{
          -9.07298,40},{-9.07298,40},{-10,40}},                                                                                             color = {0, 0, 127}));
  connect(transferfunction21.u, add31.y) annotation(Line(points={{-30,40},{
          -54.6125,40},{-54.6125,40},{-54.5,40}},                                                                                        color = {0, 0, 127}));
  connect(add31.u3, gain1.y) annotation(Line(points={{-66,36},{-70.7148,36},{
          -70.7148,-0.308798},{-45.5,-0.308798},{-45.5,0}},                                                                                             color = {0, 0, 127}));
  connect(add2.y, add31.u1) annotation(Line(points={{-74.5,80},{-70.6395,80},{
          -70.6395,43.8953},{-66,43.8953},{-66,44}},                                                                                               color = {0, 0, 127}));
  connect(dGREF, add2.u1) annotation(Line(points={{-100,80},{-89.2442,80},{
          -89.2442,82.5581},{-86,82.5581},{-86,83}},                                                                                            color = {0, 0, 127}));
  connect(add31.u2, SLIP) annotation(Line(points={{-66,40},{-96.5827,40},{
          -96.5827,0},{-102,0}},                                                                                          color = {0, 0, 127}));
  connect(constant2.y, PMECH_LP) annotation(Line(points={{85.5,-60},{98.5067,
          -60},{98.5067,-60},{104,-60}},                                                                                           color = {0, 0, 127}));
  connect(add1.u2, constant1.y) annotation(Line(points={{49,-18},{46.9374,-18},
          {46.9374,-19.7631},{45.5,-19.7631},{45.5,-20}},                                                                                            color = {0, 0, 127}));
  connect(const.y, add2.u2) annotation(Line(points={{-85.5,60},{-88.3721,60},{
          -88.3721,77.0349},{-86,77.0349},{-86,77}},                                                                                               color = {0, 0, 127}));
  connect(add1.u1, SLIP) annotation(Line(points={{49,-12},{-96.3333,-12},{
          -96.3333,0},{-102,0}},                                                                              color = {0, 0, 127}));
  connect(multiplexer1.u[2], lag1.y) annotation(Line(points={{10,0.5},{18.6667,
          0.5},{18.6667,-60.6667},{-50,-60.6667},{-50,-60}},                                                                                  color = {0, 0, 127}));
  lag1.u = PELEC;
  connect(multiplexer1.y, gain1.u) annotation(Line(points={{-10,0},{-33.6667,0},
          {-33.6667,0},{-34,0}},                                                                                                   color = {0, 0, 127}));
  connect(add1.y, product1.u2) annotation(Line(points={{60.5,-15},{69.0146,-15},
          {69.0146,-3.27441},{74,-3.27441},{74,-3}},                                                                                                  color = {0, 0, 127}));
  connect(PMECH, product1.y) annotation(Line(points={{104,0},{85.1348,0},{
          85.1348,0},{85.5,0}},                                                                                             color = {0, 0, 127}));
  annotation(Documentation(info = "<html>
<p>
1. The Governor gain K = 1/R is in pu of generator MVA base.
</p>
<p>
2. The block SBASE/MBASE is not modeled because PELEC is always in generator MVA base (MBASE).
</p>
<p>
3. The Actuator block applies anti-windup limit to the actuator output using clamping concept. When output cosses limits (TMIN,TMAX), the input to the block is forced to zero.</p>
<p>   
4. The delay block [e <sup> -T<sub> D </sub> s </sup>] is approximated by a second order Pade transfer function:
</p>
<pre>
              Tpade_1*s^2 - Tpade_2*s + 1
&nbsp; &nbsp; &nbsp;   e <sup> -T<sub> D </sub> s </sup> &cong; ----------------------------
              Tpade_1*s^2 + Tpade_2*s + 1
</pre>

5. Pade approximation does not work when TD < 2* Step Time. </p><p>
6. If T<sub> D </sub> = 0 then Tpade_1=Tpade_2 = 0 and Pade transfer Function is bypassed. </p><p> 
7. If T1 = 0, then T3 = 0. </p><p>
<img src=\"modelica://OpalRT/resource/Turbine-Governor/DEGOV1.png\"
alt=\"DEGOV1.png\"><br>

</html>"),   Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
end DEGOV1;
