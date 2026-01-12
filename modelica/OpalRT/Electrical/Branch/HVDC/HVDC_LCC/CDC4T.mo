within OpalRT.Electrical.Branch.HVDC.HVDC_LCC;
model CDC4T "HVDC LCC type model"
  parameter Real RDC = 1 "The DC line resistance in ohms";
  parameter Real DELTI = 0.25 "Margin entred in per unit of desired power or current";
  parameter Real NBR = 1 "Number of bridges in series";
  parameter Real RCR = 0 "Commutating transformer resistance per bridge in ohms";
  parameter Real XCR = 0.57 "Commutating transformer reactance per bridge in ohms";
  parameter Real EBASR = 230 "Primary base ac voltage in kV";
  parameter Real TRR = 1 "Transformer ratio";
  parameter Real TAPR = 1 "Tap setting";
  parameter Real NBI = 1 "Number of bridges in series";
  parameter Real RCI = 0 "Commutating transformer resistance per bridge in ohms";
  parameter Real XCI = 0.57 "Commutating transformer reactance per bridge in ohms";
  parameter Real EBASI = 230 "Primary base ac voltage in kV";
  parameter Real TRI = 1 "Transformer ratio";
  parameter Real TAPI = 1 "Tap setting";
  parameter Real ALFDY = 0 "Minimum alpha for dynamics (degrees)" annotation(Dialog(tab = "Dynamic parameters"));
  parameter Real GAMDY = 0 "Minimum gamma for dynamics (degrees)" annotation(Dialog(tab = "Dynamic parameters"));
  parameter Real C0 = 20 "Minimum current demand (amps)" annotation(Dialog(tab = "Dynamic parameters"));
  parameter Real SB = 100 "Network base Power (MVA)";
  parameter Real GAMMX = 90 "Nominal maximum firing angle in degrees";
  parameter Real GAMMN = 0 "Nominal minimum firing angle in degrees";
  parameter Real Vmag_rec = 1 "inverter side injecting active power" annotation(Dialog(tab = "Power Flow"));
  parameter Real Vang_rec = -7.8102 "inverter side injecting reactive power" annotation(Dialog(tab = "Power Flow"));
  parameter Real Vmag_inv = 1 "inverter side injecting active power" annotation(Dialog(tab = "Power Flow"));
  parameter Real Vang_inv = -24.0517 "inverter side injecting reactive power" annotation(Dialog(tab = "Power Flow"));
  parameter Real SETVL = 800;
  parameter Real MDC = 2;
  parameter Real Tidc = 0.05;
  parameter Real Tvdc = 0.05;
  parameter Real C1 = 1000;
  parameter Real C2 = 1000;
  parameter Real C3 = 1000;
  parameter Real V1 = 300;
  parameter Real V2 = 400;
  parameter Real V3 = 500;
  parameter Real RCOMP = 0;
  parameter Real VSCHED = 124.2;
  constant Real pi = Modelica.Constants.pi;
  Modelica.Blocks.Math.Add add1 annotation(Placement(visible = true, transformation(origin = {-60, 60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = SETVL) annotation(Placement(visible = true, transformation(origin = {-85, 45}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant1(k = 0) annotation(Placement(visible = true, transformation(origin = {-40, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = 1000000) annotation(Placement(visible = true, transformation(origin = {-40, 60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain2(k = 1000000) annotation(Placement(visible = true, transformation(origin = {-20, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Abs abs1 annotation(Placement(visible = true, transformation(origin = {-20, 60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Division division2 annotation(Placement(visible = true, transformation(origin = {0, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Division division1 annotation(Placement(visible = true, transformation(origin = {0, 60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.SignalRouting.Multiplexer multiplexer1(n = 2, s = MDC) annotation(Placement(visible = true, transformation(origin = {20, 60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add2 annotation(Placement(visible = true, transformation(origin = {40, 60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Min min1 annotation(Placement(visible = true, transformation(origin = {60, 60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.SignalRouting.Multiplexer multiplexer2(n = 2, s = if SETVL < 0 then 1 else 2) annotation(Placement(visible = true, transformation(origin = {-60, 20}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add3 annotation(Placement(visible = true, transformation(origin = {-40, 0}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain3(k = RDC) annotation(Placement(visible = true, transformation(origin = {-20, 0}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag lag2(T = Tidc, y_start = Idc_init0) annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag Vlag(T = Tvdc, y_start = Vdci_init0) annotation(Placement(visible = true, transformation(origin = {0, 20}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  OpalRT.NonElectrical.Math.Nonlinear.PieceWiseLinear3 piecewise_linear1(C1 = C1, C2 = C2, C3 = C3, V1 = V1, V2 = V2, V3 = V3) annotation(Placement(visible = true, transformation(origin = {40, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain4(k = RCOMP) annotation(Placement(visible = true, transformation(origin = {80, 40}, extent = {{-5, -5}, {5, 5}}, rotation = -90)));
  Modelica.Blocks.Math.Gain gain5(k = 1000) annotation(Placement(visible = true, transformation(origin = {80, 0}, extent = {{-5, -5}, {5, 5}}, rotation = 90)));
  Modelica.Blocks.Math.Add add4(k1 = -1) annotation(Placement(visible = true, transformation(origin = {60, 20}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add5 annotation(Placement(visible = true, transformation(origin = {80, -20}, extent = {{-5, -5}, {5, 5}}, rotation = 90)));
  Modelica.Blocks.Sources.Constant voltage_setpoint(k = VSCHED) annotation(Placement(visible = true, transformation(origin = {60, -40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput d_SETVL annotation(Placement(visible = true, transformation(origin = {-100, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.Electrical.Branch.HVDC.HVDC_LCC.Auxiliary.BridgeLineSimulationLogic bridge_line_simulation_logic1(RDC = RDC, DELTI = DELTI, NBR = NBR, RCR = RCR, XCR = XCR, EBASR = EBASR, TRR = TRR, TAPR = TAPR, NBI = NBI, RCI = RCI, XCI = XCI, EBASI = EBASI, TRI = TRI, TAPI = TAPI, ALFDY = ALFDY, GAMDY = GAMDY, C0 = C0, SB = SB, GAMMX = GAMMX, GAMMN = GAMMN, Vmag_rec = Vmag_rec, Vang_rec = Vang_rec, Vmag_inv = Vmag_inv, Vang_inv = Vang_inv) annotation(Placement(visible = true, transformation(origin = {40, -80}, extent = {{15, -15}, {-15, 15}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput d_VSCHED annotation(Placement(visible = true, transformation(origin = {100, -60}, extent = {{10, -10}, {-10, 10}}, rotation = 0), iconTransformation(origin = {-100, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.Connector.PwPin inverterp annotation(Placement(visible = true, transformation(origin = {-100, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.Connector.PwPin rectifp annotation(Placement(visible = true, transformation(origin = {100, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Real SETVL0(fixed = false);
protected
  parameter Real Vdci_init0(fixed = false);
  parameter Real Idc_init0(fixed = false);
  parameter Real vdcr0(fixed = false);
initial equation
  SETVL0 = SETVL;
  (Vdci_init0, vdcr0, Idc_init0) = Auxiliary.initialize(RDC, DELTI, NBR, RCR, XCR, EBASR, TRR, TAPR, NBI, RCI, XCI, EBASI, TRI, TAPI, ALFDY, GAMDY, GAMMX, GAMMN, Vmag_rec, Vmag_inv, SETVL0, MDC, RCOMP, VSCHED, C0);
equation
  connect(bridge_line_simulation_logic1.Ipset, min1.y) annotation(Line(points = {{55, -71}, {65.8737, -71}, {65.8737, -56.0701}, {35.2588, -56.0701}, {35.2588, 30.6149}, {70.3456, 30.6149}, {70.3456, 59.5099}, {65.5, 59.5099}, {65.5, 60}}, color = {0, 0, 127}));
  connect(bridge_line_simulation_logic1.Vpset, add4.y) annotation(Line(points = {{55, -77}, {75.6774, -77}, {75.6774, -50.5663}, {42.9985, -50.5663}, {42.9985, 19.9513}, {54.1781, 19.9513}, {54.1781, 20}, {54.5, 20}}, color = {0, 0, 127}));
  connect(bridge_line_simulation_logic1.invp, inverterp) annotation(Line(points = {{25, -89}, {-34.0548, -89}, {-34.0548, -96.1447}, {-91.6728, -96.1447}, {-91.6728, -100}, {-100, -100}}));
  connect(bridge_line_simulation_logic1.recp, rectifp) annotation(Line(points = {{55, -89}, {75.3334, -89}, {75.3334, -95.1127}, {100, -95.1127}, {100, -100}}));
  connect(bridge_line_simulation_logic1.Idc, lag2.u) annotation(Line(points = {{25, -74}, {2.9239, -74}, {2.9239, -7.39574}, {9.80366, -7.39574}, {9.80366, -0.171994}, {5, -0.171994}, {5, 0}}, color = {0, 0, 127}));
  connect(bridge_line_simulation_logic1.VdcI, Vlag.u) annotation(Line(points = {{25, -68}, {13.7595, -68}, {13.7595, 19.6073}, {5, 19.6073}, {5, 20}}, color = {0, 0, 127}));
  connect(d_VSCHED, add5.u2) annotation(Line(points = {{100, -60}, {83.4403, -60}, {83.4403, -26}, {83, -26}}, color = {0, 0, 127}));
  connect(d_SETVL, add1.u1) annotation(Line(points = {{-100, 80}, {-75.4814, 80}, {-75.4814, 63.1579}, {-66, 63.1579}, {-66, 63}}, color = {0, 0, 127}));
  connect(voltage_setpoint.y, add5.u1) annotation(Line(points = {{65.5, -40}, {76.7651, -40}, {76.7651, -26}, {77, -26}}, color = {0, 0, 127}));
  connect(add5.y, gain5.u) annotation(Line(points = {{80, -14.5}, {80, -6.93196}, {80, -6.93196}, {80, -6}}, color = {0, 0, 127}));
  connect(gain5.y, add4.u2) annotation(Line(points = {{80, 5.5}, {80, 17.2015}, {66, 17.2015}, {66, 17}}, color = {0, 0, 127}));
  connect(gain4.y, add4.u1) annotation(Line(points = {{80, 34.5}, {80, 24.3902}, {66.4955, 24.3902}, {66.4955, 23}, {66, 23}}, color = {0, 0, 127}));
  connect(min1.y, gain4.u) annotation(Line(points = {{65.5, 60}, {80.6162, 60}, {80.6162, 46}, {80, 46}}, color = {0, 0, 127}));
  connect(piecewise_linear1.y, min1.u2) annotation(Line(points = {{45, 40}, {49.0372, 40}, {49.0372, 56.7394}, {54, 56.7394}, {54, 57}}, color = {0, 0, 127}));
  connect(piecewise_linear1.u, Vlag.y) annotation(Line(points = {{35, 40}, {30.2953, 40}, {30.2953, 29.525}, {-7.95892, 29.525}, {-7.95892, 20.0257}, {-5.13479, 20.0257}, {-5.13479, 20}, {-5, 20}}, color = {0, 0, 127}));
  connect(Vlag.y, multiplexer2.u[1]) annotation(Line(points = {{-5, 20}, {-54.9422, 20}, {-54.9422, 19.75}, {-55, 19.75}}, color = {0, 0, 127}));
  connect(add3.y, multiplexer2.u[2]) annotation(Line(points = {{-45.5, 0}, {-49.0372, 0}, {-49.0372, 20.0257}, {-55, 20.0257}, {-55, 20.25}}, color = {0, 0, 127}));
  connect(Vlag.y, add3.u1) annotation(Line(points = {{-5, 20}, {-30.0642, 20}, {-30.0642, 3.56868}, {-34, 3}, {-34, 3}}, color = {0, 0, 127}));
  connect(lag2.y, gain3.u) annotation(Line(points = {{-5, 0}, {-14.6598, 0}, {-14.6598, 0}, {-14, 0}}, color = {0, 0, 127}));
  connect(gain3.y, add3.u2) annotation(Line(points = {{-25.5, 0}, {-29.8074, 0}, {-29.8074, -2.84981}, {-34, -2.84981}, {-34, -3}}, color = {0, 0, 127}));
  connect(multiplexer2.y, division1.u2) annotation(Line(points = {{-65, 20}, {-68.2927, 20}, {-68.2927, 49.8074}, {-9.49936, 49.8074}, {-9.49936, 56.9961}, {-6, 56.9961}, {-6, 57}}, color = {0, 0, 127}));
  connect(multiplexer2.y, division2.u2) annotation(Line(points = {{-65, 20}, {-68.5494, 20}, {-68.5494, 29.525}, {-9.49936, 29.525}, {-9.49936, 37.2272}, {-6, 37.2272}, {-6, 37}}, color = {0, 0, 127}));
  connect(add2.y, min1.u1) annotation(Line(points = {{45.5, 60}, {48.0103, 60}, {48.0103, 62.6444}, {54, 62.6444}, {54, 63}}, color = {0, 0, 127}));
  connect(division2.y, add2.u2) annotation(Line(points = {{5.5, 40}, {26.9576, 40}, {26.9576, 56.7137}, {34, 56.7137}, {34, 57}}, color = {0, 0, 127}));
  connect(multiplexer1.y, add2.u1) annotation(Line(points = {{25, 60}, {28.7548, 60}, {28.7548, 63.1322}, {34, 63.1322}, {34, 63}}, color = {0, 0, 127}));
  connect(multiplexer1.u[1], division1.y) annotation(Line(points = {{15, 59.75}, {5.39153, 59.75}, {5.39153, 60}, {5.5, 60}}, color = {0, 0, 127}));
  connect(multiplexer1.u[2], add1.y) annotation(Line(points = {{15, 60.25}, {12.0668, 60.25}, {12.0668, 69.5507}, {-50.0642, 69.5507}, {-50.0642, 59.7946}, {-54.5, 59.7946}, {-54.5, 60}}, color = {0, 0, 127}));
  connect(abs1.y, division1.u1) annotation(Line(points = {{-14.5, 60}, {-11.2965, 60}, {-11.2965, 62.8755}, {-6, 62.8755}, {-6, 63}}, color = {0, 0, 127}));
  connect(gain2.y, division2.u1) annotation(Line(points = {{-14.5, 40}, {-9.49936, 40}, {-9.49936, 42.8498}, {-6, 42.8498}, {-6, 43}}, color = {0, 0, 127}));
  connect(abs1.u, gain1.y) annotation(Line(points = {{-26, 60}, {-35.1733, 60}, {-35.1733, 60}, {-34.5, 60}}, color = {0, 0, 127}));
  connect(gain2.u, constant1.y) annotation(Line(points = {{-26, 40}, {-34.3774, 40}, {-34.5, 40}, {-34.5, 40}}, color = {0, 0, 127}));
  connect(gain1.u, add1.y) annotation(Line(points = {{-46, 60}, {-54.6855, 60}, {-54.6855, 60}, {-54.5, 60}}, color = {0, 0, 127}));
  connect(add1.u2, const.y) annotation(Line(points = {{-66, 57}, {-76.4827, 57}, {-76.4827, 44.9037}, {-79.5, 44.9037}, {-79.5, 45}}, color = {0, 0, 127}));
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Documentation(info = "<html>
This model is similar to CDC4T in PSS/e, however not all the features are implemented in this version. The limitations are summerized below:

<ol>
<li>XCAPR and XCAPI are assumed to be zero.</li>
<li>For power control mode, i.e. MDC = 1, Inverter side voltage value is assumed to be always greater than VCMOD, therefore small value should be used for VCMOD in order to prevent switching from power control to current control mode.</li>
<li>No external two-winding transformer are defined to control firing angles within the limits. In this way IFR, ITR, IDR and IFI, ITI, IDI are all assumed to be zero.</li>
<li>The modulations mechanism is disabled.</li>
<li>The blocking, bypassing and recovering mechanism after fault is disabled. In this way, per unit ac voltage on the rectifier bus should be always greater than VBLOCK and VBYPAS.</li>
<li>Voltage Dependant Current Order Limit (VDCOL) block is considered disabled.</li>
<li>The initialization for power control mode, i.e MDC = 1, for the case where gamma_min=gamma_max is not implemented.</li>
<li>In both power and current control modes, when gamma_min<>gamma_max, the initialization for the case where gamma touches the limit, GAMDY, has not been implemented.</li>
</ol>
<img src=\"modelica://OpalRT/resource/Electrical/BRANCH/HVDC/HVDC_LCC/CDC4T.png\"


</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Rectangle(origin = {0.405954, -0.541272}, extent = {{-100, 99.594}, {100, -99.594}}), Text(origin = {1.76, 4.87}, extent = {{-72.94, 22.46}, {72.94, -22.46}}, textString = "CDC4T"), Text(origin = {-80.11, 60.89}, extent = {{-13.8, 6.22}, {13.8, -6.22}}, textString = "d_SETVL"), Text(origin = {-75.7795, 3.38636}, extent = {{-18.94, 8.25}, {14.0686, -3.37855}}, textString = "d_VSCHED"), Text(origin = {-75.5114, -92.5594}, extent = {{-17.86, 5.95}, {17.86, -5.95}}, textString = "inverterp"), Text(origin = {75.3714, -91.4794}, extent = {{-22.06, 6.5}, {22.06, -6.5}}, textString = "rectifp")}));
end CDC4T;
