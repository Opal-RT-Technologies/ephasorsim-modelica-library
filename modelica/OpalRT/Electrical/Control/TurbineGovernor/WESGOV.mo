within OpalRT.Electrical.Control.TurbineGovernor;
model WESGOV "Westinghouse Digital Governor for Gas Turbine"
  extends OpalRT.Electrical.PartialModel.TurbineGovernor;
  parameter Integer IBUS = 100 "Located Bus No.";
  parameter String ID = "M1" "Machine Identifier";
  parameter Real delTC = 0.1 "(sec), delta_t sample for controls";
  parameter Real delTP = 0.1 "(sec), delta_t sample for PE";
  parameter Real Droop = 0.05 "Droop";
  parameter Real Kp = 15;
  parameter Real TI = 1.0 "(>0)(sec)";
  parameter Real T1 = 0.1 "(sec)";
  parameter Real T2 = 0.25 "(sec)";
  parameter Real ALIM = 0.2;
  parameter Real Tpe = 0.1 "(sec)";
  parameter Real DELTA = 0.01 "Simulation sample time, sec.";

  Modelica.Blocks.Sources.Constant const(k = GREF_0) annotation(Placement(visible = true, transformation(origin = {-80, 60}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant1(k = 0) annotation(Placement(visible = true, transformation(origin = {80, -60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag lag1(T = Tpe, y_start = PELEC_0) annotation(Placement(visible = true, transformation(origin = {-100, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag lag3(T = T2, y_start = PMECH_0) annotation(Placement(visible = true, transformation(origin = {100, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = Kp) annotation(Placement(visible = true, transformation(origin = {0, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator integrator1(k = 1 / TI, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = PMECH_0) annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1 annotation(Placement(visible = true, transformation(origin = {20, 20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add3 add31(k1 = -1, k3 = -1) annotation(Placement(visible = true, transformation(origin = {-20, 20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.Electrical.Control.TurbineGovernor.Internal.SampleHold samplehold1(
      Period=delTC, DELT=DELTA) annotation (Placement(visible=true,
        transformation(
        origin={-60,40},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag lag2(T = T1, y_start = PMECH_0) annotation(Placement(visible = true, transformation(origin = {60, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.Electrical.Control.TurbineGovernor.Internal.Alimit Alimit1(
    ALIM=ALIM,
    Period=delTC,
    DELT=DELTA) annotation (Placement(visible=true, transformation(
        origin={40,20},
        extent={{-5,-5},{5,5}},
        rotation=0)));
  OpalRT.Electrical.Control.TurbineGovernor.Internal.SampleHold samplehold2(
      Period=delTP, DELT=DELTA) annotation (Placement(visible=true,
        transformation(
        origin={-60,-20},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Math.Gain gain2(k = Droop) annotation(Placement(visible = true, transformation(origin = {-40, -20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add2 annotation(Placement(visible = true, transformation(origin = {-80, 80}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
protected
  parameter Real PMECH_0(fixed = false);
  parameter Real PELEC_0(fixed = false);
  parameter Real GREF_0 = PELEC_0 * Droop;
initial equation
  PMECH_0 = PMECH0;
  PELEC_0 = PELEC;
equation
  connect(lag2.u, Alimit1.y) annotation(Line(points={{50,20},{44.5923,20},{
          44.5923,20},{45,20}},                                                                                          color = {0, 0, 127}));
  connect(Alimit1.u, add1.y) annotation(Line(points={{35,20},{24.9584,20},{
          24.9584,20},{25.5,20}},                                                                                        color = {0, 0, 127}));
  connect(add1.u2, integrator1.y) annotation(Line(points={{14,17},{10.1478,17},
          {10.1478,0.171996},{5.5,0.171996},{5.5,0}},                                                                                                color = {0, 0, 127}));
  connect(samplehold2.u, lag1.y) annotation(Line(points={{-70,-20},{-89.7019,
          -20},{-89.7019,-20},{-90,-20}},                                                                                            color = {0, 0, 127}));
  connect(gain2.u, samplehold2.y) annotation(Line(points={{-46,-20},{-50.1355,
          -20},{-50.1355,-20},{-50,-20}},                                                                                             color = {0, 0, 127}));
  connect(gain2.y, add31.u3) annotation(Line(points={{-34.5,-20},{-29.7994,-20},
          {-29.7994,16.0458},{-26,16.0458},{-26,16}},                                                                                               color = {0, 0, 127}));
  connect(add31.u1, samplehold1.y) annotation(Line(points={{-26,24},{-29.7319,
          24},{-29.7319,39.7133},{-50,39.7133},{-50,40}},                                                                                               color = {0, 0, 127}));
  connect(samplehold1.u, SLIP) annotation(Line(points={{-70,40},{-96.6286,40},{
          -96.6286,0},{-102,0}},                                                                                               color = {0, 0, 127}));
  connect(lag3.u, lag2.y) annotation(Line(points={{90,20},{70.7736,20},{70.7736,
          20},{70,20}},                                                                                               color = {0, 0, 127}));
  connect(gain1.y, add1.u1) annotation(Line(points={{5.5,40},{10.0287,40},{
          10.0287,22.6361},{14,22.6361},{14,23}},                                                                                            color = {0, 0, 127}));
  connect(integrator1.u, add31.y) annotation(Line(points={{-6,0},{-10.6017,0},{
          -10.6017,20.0573},{-14.5,20.0573},{-14.5,20}},                                                                                            color = {0, 0, 127}));
  connect(gain1.u, add31.y) annotation(Line(points={{-6,40},{-10.3152,40},{
          -10.3152,20.0573},{-14.5,20.0573},{-14.5,20}},                                                                                        color = {0, 0, 127}));
  connect(add2.y, add31.u2) annotation(Line(points={{-74.5,80},{-36.7609,80},{
          -36.7609,19.7943},{-26,19.7943},{-26,20}},                                                                                             color = {0, 0, 127}));
  connect(dGREF, add2.u1) annotation(Line(points={{-100,80},{-91.7738,80},{
          -91.7738,83.0334},{-86,83.0334},{-86,83}},                                                                                            color = {0, 0, 127}));
  connect(lag3.y, PMECH) annotation(Line(points={{110,20},{119.771,20},{119.771,
          -0.286533},{104,-0.286533},{104,5.55112e-16}},                                                                                        color = {0, 0, 127}));
  lag1.u = PELEC;
  connect(const.y, add2.u2) annotation(Line(points={{-85.5,60},{-89.9743,60},{
          -89.9743,76.8638},{-86,76.8638},{-86,77}},                                                                                               color = {0, 0, 127}));
  connect(constant1.y, PMECH_LP) annotation(Line(points={{85.5,-60},{95.393,-60},
          {95.393,-60},{104,-60}},                                                                                              color = {0, 0, 127}));
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Documentation(info = "<html>

<p>
1. The block diagram of the Westinghouse Digital Governor model for Gas Turbine is as shown below. </p>
<p>
2. The sample period of both sample hold block for speed deviation and PELEC are simulation time-step dependent and are defined by &#916TC and &#916TP parameter, respectively.
</p>
<p>
3. The change of the digital control block output for every sample defined by &#916TC is limited to a value based on ALIM and simulation time-step.
</p>
<p>
4. This model represents WESGOV as best possible based on the available information during modelling. Some result mismatch with corresponding PSS/e model exists; however, the mismatch varies randomly with time-step. The best results are obtained for time-step of 3ms.
</p>
<p>
5. Droop is in pu on generator MVA base.
</p>
<img src=\"modelica://OpalRT/resource/Turbine-Governor/WESGOV.png\"
alt=\"WESGOV.png\"><br>
<p>
</html>"));
end WESGOV;
