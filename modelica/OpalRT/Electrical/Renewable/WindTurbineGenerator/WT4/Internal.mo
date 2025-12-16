within OpalRT.Electrical.Renewable.WindTurbineGenerator.WT4;
package Internal
  extends Modelica.Icons.InternalPackage;
  block CurrentControlLogic
    parameter Real QMX "- V-regulator max limit";
    parameter Real ImaxTD "- Converter current limit";
    parameter Real Iphl "- Hard active current limit";
    parameter Real Iqhl "- Hard reactive current limit";
    parameter Real PQFLAG ":= 1 for P priority, =0 for Q priority";
    Modelica.Blocks.Interfaces.RealInput WIQCMD annotation(Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {60, 100}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    Modelica.Blocks.Interfaces.RealInput WIPCMD annotation(Placement(visible = true, transformation(origin = {-100, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {60, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
    Modelica.Blocks.Interfaces.RealOutput IQMAX annotation(Placement(visible = true, transformation(origin = {100, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
    Modelica.Blocks.Interfaces.RealOutput IQMIN annotation(Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-60, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
    Modelica.Blocks.Interfaces.RealOutput IPMAX annotation(Placement(visible = true, transformation(origin = {100, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-40, -100}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    Modelica.Blocks.Interfaces.RealInput ETERM annotation(Placement(visible = true, transformation(origin = {-100, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  protected
    Real Iqmxv;
  equation
    Iqmxv = QMX + (1.6 - QMX) * (1 - ETERM);
    if PQFLAG == 0 then
      IQMAX = min(Iqmxv, min(Iqhl, ImaxTD));
      IQMIN = -IQMAX;
      IPMAX = min(Iphl, (ImaxTD ^ 2 - WIQCMD ^ 2) ^ 0.5);
    else
      IQMAX = min(Iqmxv, min(Iqhl, (ImaxTD ^ 2 - WIPCMD ^ 2) ^ 0.5));
      IQMIN = -IQMAX;
      IPMAX = min(Iphl, ImaxTD);
    end if;
    annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1}), graphics={  Rectangle(origin = {0.192678, 0.192678}, extent = {{-99.6146, 99.6146}, {99.6146, -100.771}}), Text(origin = {-59.9236, -48.9388}, extent = {{-27.17, 10.02}, {27.17, -10.02}}, textString = "ETERM"), Text(origin = {-59.96, 75.88}, extent = {{-27.17, 10.02}, {27.17, -10.02}}, textString = "IQMIN"), Text(origin = {1.66, 75.84}, extent = {{-27.17, 10.02}, {27.17, -10.02}}, textString = "IQMAX"), Text(origin = {68.2918, 74.6439}, extent = {{-33.7211, 11.9468}, {27.17, -10.02}}, textString = "WIQCMD"), Text(origin = {63.24, -79.54}, extent = {{-33.72, 11.95}, {27.17, -10.02}}, textString = "WIPCMD"), Text(origin = {-36.61, -76.88}, extent = {{-33.72, 11.95}, {27.17, -10.02}}, textString = "IPMAX"), Text(origin = {40.6146, 30.7946}, extent = {{-104.241, 32.756}, {42.1989, -10.02}}, textString = "Converter"), Text(origin = {29.3997, 5.70428}, extent = {{-81.8864, 25.8197}, {37.1893, -16.9564}}, textString = "Current"), Text(origin = {35.1461, -26.7082}, extent = {{-82.2721, 25.4339}, {36.0332, -13.8736}}, textString = "Limiter")}));
  end CurrentControlLogic;

  block HVRCL "HVRCL block based on EPRI documentation"
    parameter Real VHVRCR = 1.2 "Threthod voltage for HVRCL";
    parameter Real CURHVRCR = 2 "Max. reactive current at VHVRCR";
    Modelica.Blocks.Interfaces.RealInput Iq annotation(Placement(visible = true, transformation(origin = {-40, 10}, extent = {{-9, -9}, {9, 9}}, rotation = 0), iconTransformation(origin = {-35, 0}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput Vt annotation(Placement(visible = true, transformation(origin = {-40, -20}, extent = {{-9, -9}, {9, 9}}, rotation = 0), iconTransformation(origin = {0, -35}, extent = {{-5, -5}, {5, 5}}, rotation = 90)));
    Modelica.Blocks.Interfaces.RealOutput Iq_HVRCL annotation(Placement(visible = true, transformation(origin = {50, 0}, extent = {{-9, -9}, {9, 9}}, rotation = 0), iconTransformation(origin = {50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Real dq;
    Real q;
    parameter Real accel = 1;
  equation
    if Vt > VHVRCR then
      dq = accel * (Vt - VHVRCR);
    else
      dq = 0;
    end if;
    q = if Iq * Vt - dq < (-CURHVRCR) then -CURHVRCR else Iq * Vt - dq;
    Iq_HVRCL = q / Vt;
    annotation(Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-40, -40}, {40, 40}}, grid = {1, 1}), graphics), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-40, -40}, {40, 40}}, grid = {1, 1}), graphics={  Rectangle(extent = {{-40, 40}, {40, -40}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 255},
              fillPattern =                                                                                                                                                                                                        FillPattern.Solid), Text(extent = {{-20, 40}, {20, 30}}, lineColor = {0, 0, 255}, textString = "HVRCL "), Line(points = {{14, 30}, {-6, 30}, {-16, 10}, {-16, 10}}, color = {0, 0, 255}, thickness = 0.5, smooth = Smooth.None), Text(extent = {{-28, 3}, {-20, -3}}, lineColor = {0, 0, 255}, textString = "I_q"), Text(extent = {{-5, -21}, {5, -29}}, lineColor = {0, 0, 255}, textString = "V"), Text(extent = {{19, 4}, {38, -4}}, lineColor = {0, 0, 255}, textString = "I_sorc")}));
  end HVRCL;

  block LVACL "LVACL block based on EPRI documentation"
    Modelica.Blocks.Interfaces.RealOutput Ip_LVACL annotation(Placement(transformation(extent = {{100, -8}, {118, 10}}), iconTransformation(extent = {{100, -10}, {120, 10}})));
    Modelica.Blocks.Interfaces.RealInput Vt annotation(Placement(transformation(extent = {{-9, -9}, {9, 9}}, rotation = 90, origin = {-3, -29}), iconTransformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin = {0, -90})));
    Modelica.Blocks.Interfaces.RealInput Ip_LVPL annotation(Placement(transformation(extent = {{-9, -9}, {9, 9}}, rotation = 0, origin = {-33, -3}), iconTransformation(extent = {{-100, -10}, {-80, 10}})));
    Real gain;
  equation
    if Vt < 0.4 then
      gain = 0;
    elseif Vt > 0.8 then
      gain = 1;
    else
      gain = 1 / 0.4 * (Vt - 0.4);
    end if;
    Ip_LVACL = gain * Ip_LVPL;
    annotation(Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-26, 18}, {20, -22}}, lineColor = {0, 0, 255})}), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(extent = {{-100, 100}, {100, -100}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 255},
              fillPattern =                                                                                                                                                                                                        FillPattern.Solid), Text(extent = {{-44, 114}, {44, 54}}, lineColor = {0, 0, 255}, textString = "LVACL"), Line(points = {{-60, -60}, {-42, -60}, {0, 20}, {20, 20}}, color = {0, 128, 255}, thickness = 0.5), Line(points = {{0, 20}, {0, -4}, {0, -60}}, color = {0, 0, 0}, pattern = LinePattern.Dot), Line(points = {{-60, 20}, {-30, 20}, {0, 20}}, color = {0, 0, 0}, pattern = LinePattern.Dot), Line(points = {{-60, 60}, {-60, -60}, {60, -60}}, color = {0, 0, 0}, thickness = 0.5, arrow = {Arrow.Filled, Arrow.Filled}), Text(extent = {{-98, -8}, {-68, -22}}, lineColor = {0, 0, 255}, textString = "OP_LVLP"), Text(extent = {{64, 6}, {98, -8}}, lineColor = {0, 0, 255}, textString = "Op_LVACL"), Text(extent = {{4, -78}, {22, -92}}, lineColor = {0, 0, 255}, textString = "V")}));
  end LVACL;

  block LVPL "Low voltage power logic"
    parameter Real VLVPL1 "LVPL voltage 1 (Low voltage power logic)";
    parameter Real VLVPL2 "LVPL voltage 2";
    parameter Real GLVPL "LVPL gain";
    Real K;
    Modelica.Blocks.Interfaces.RealInput Vt annotation(Placement(transformation(extent = {{-112, -18}, {-72, 22}}), iconTransformation(extent = {{-100, -10}, {-80, 10}})));
    Modelica.Blocks.Interfaces.RealOutput LVPL annotation(Placement(transformation(extent = {{100, -10}, {120, 10}}), iconTransformation(extent = {{100, -10}, {120, 10}})));
  equation
    K = GLVPL / (VLVPL2 - VLVPL1);
    if Vt < VLVPL1 then
      LVPL = 0;
    elseif Vt > VLVPL2 then
      LVPL = Modelica.Constants.inf;
    else
      LVPL = K * (Vt - VLVPL1);
    end if;
    annotation(Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-78, 30}, {92, -58}}, lineColor = {0, 0, 255})}), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(extent = {{-100, 100}, {100, -100}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 255},
              fillPattern =                                                                                                                                                                                                        FillPattern.Solid), Text(extent = {{44, -40}, {74, -58}}, lineColor = {0, 0, 255},
              lineThickness =                                                                                                                                                                                                        0.5, fillColor = {0, 0, 255},
              fillPattern =                                                                                                                                                                                                        FillPattern.Solid, textString = "V"), Text(extent = {{-54, 68}, {-24, 50}}, lineColor = {0, 0, 255},
              lineThickness =                                                                                                                                                                                                        0.5, fillColor = {0, 0, 255},
              fillPattern =                                                                                                                                                                                                        FillPattern.Solid, textString = "LVPL"), Line(points = {{-66, 20}, {-54, 20}, {-54, 20}}, color = {0, 0, 255}, thickness = 0.5, smooth = Smooth.None), Line(points = {{-60, 60}, {-60, -60}, {60, -60}}, color = {0, 0, 255}, thickness = 0.5, arrow = {Arrow.Filled, Arrow.Filled}), Line(points = {{-42, -60}}, color = {0, 0, 255}, thickness = 0.5), Line(points = {{-40, -60}, {20, 20}, {20, 40}}, color = {0, 0, 255}, thickness = 0.5), Text(extent = {{-102, 22}, {-72, 4}}, lineColor = {0, 0, 255},
              lineThickness =                                                                                                                                                                                                        0.5, fillColor = {0, 0, 255},
              fillPattern =                                                                                                                                                                                                        FillPattern.Solid, textString = "V"), Text(extent = {{66, 8}, {96, -10}}, lineColor = {0, 0, 255},
              lineThickness =                                                                                                                                                                                                        0.5, fillColor = {0, 0, 255},
              fillPattern =                                                                                                                                                                                                        FillPattern.Solid, textString = "LVLP")}));
  end LVPL;

  block PControl
    parameter Real Kpp "- T-regulator proportional gain";
    parameter Real Kip "- T-regulator integrator gain";
    parameter Real Kf "- Rate feedback gain";
    parameter Real Tf "- Rate feedback time constant";
    parameter Real dPMX "- Max limit in power PI controller (pu)";
    parameter Real dPMN "- Min limit in power PI controller (pu)";
    parameter Real T_POWER "- Power filter time constant";
    parameter Real PELEC0;
    parameter Real WIP0;
    parameter Real ETERM0;
    parameter Real VARL3(fixed = false) "Power reference";
    parameter Real VS0(fixed = false);
    parameter Real Pord0(fixed = false);
    OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag lag1(T = T_POWER, y_start = PELEC0) annotation(Placement(visible = true, transformation(origin = {-70, 60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    Modelica.Blocks.Math.Add3 add31(k1 = -1, k3 = -1) annotation(Placement(visible = true, transformation(origin = {-50, 60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    OpalRT.NonElectrical.Math.Continuous.TransferFunctionWindup.PI_WindupLimit pi_non_windup_limit1(KI = Kip, KP = Kpp, MAX = dPMX, MIN = dPMN, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = PELEC0 - Pord0) annotation(Placement(visible = true, transformation(origin = {-30, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction transferfunction1(b = {1, 0}, a = {Tf0, 1}, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = 0) annotation(Placement(visible = true, transformation(origin = {-31, 40}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
    Modelica.Blocks.Math.Gain gain1(k = Kf) annotation(Placement(visible = true, transformation(origin = {-50, 40}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
    Modelica.Blocks.Math.Add add1(k2 = -1) annotation(Placement(visible = true, transformation(origin = {0, 60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    Modelica.Blocks.Math.Division division1 annotation(Placement(visible = true, transformation(origin = {30, 60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    Modelica.Blocks.Nonlinear.Limiter limiter1(uMin = 0.01, uMax = Modelica.Constants.inf) annotation(Placement(visible = true, transformation(origin = {-50, 20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    Modelica.Blocks.Nonlinear.VariableLimiter variablelimiter1 annotation(Placement(visible = true, transformation(origin = {60, 60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput IPMAX annotation(Placement(visible = true, transformation(origin = {30, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 90}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    Modelica.Blocks.Sources.Constant constant1(k = -Modelica.Constants.inf) annotation(Placement(visible = true, transformation(origin = {40, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput WIPCMD annotation(Placement(visible = true, transformation(origin = {100, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput Pref annotation(Placement(visible = true, transformation(origin = {-90, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-90, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant const(k = VARL3) annotation(Placement(visible = true, transformation(origin = {-50, -20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput PELEC annotation(Placement(visible = true, transformation(origin = {-100, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput ETERM annotation(Placement(visible = true, transformation(origin = {-100, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput Pref0 annotation(Placement(visible = true, transformation(origin = {-10, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 50}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  protected
    parameter Real Tf0(start = 1, fixed = false);
  initial algorithm
    Tf0 := Tf;
  initial equation
    VS0 = max(0.01, ETERM0);
    Pord0 = VS0 * WIP0;
    VARL3 = if Kip <> 0 then PELEC0 else (Kpp * PELEC0 + Pord0) / (1 + Kpp);
  equation
    connect(const.y, Pref0) annotation(Line(points = {{-44.5, -20}, {-17.4292, -20}, {-17.4292, -20}, {-10, -20}}, color = {0, 0, 127}));
    connect(add1.u1, Pref) annotation(Line(points = {{-6, 63}, {-6.38298, 63}, {-6.38298, 69.9764}, {-90, 69.9764}, {-90, 70}}, color = {0, 0, 127}));
    connect(Pref, add31.u1) annotation(Line(points = {{-90, 70}, {-56.5012, 70}, {-56.5012, 64}, {-56, 64}}, color = {0, 0, 127}));
    connect(variablelimiter1.y, WIPCMD) annotation(Line(points = {{65.5, 60}, {92.4829, 60}, {92.4829, 60}, {100, 60}}, color = {0, 0, 127}));
    connect(IPMAX, variablelimiter1.limit1) annotation(Line(points = {{30, 90}, {49.6583, 90}, {49.6583, 63.7813}, {54, 63.7813}, {54, 64}}, color = {0, 0, 127}));
    connect(constant1.y, variablelimiter1.limit2) annotation(Line(points = {{45.5, 40}, {49.2027, 40}, {49.2027, 56.2642}, {54, 56.2642}, {54, 56}}, color = {0, 0, 127}));
    connect(division1.y, variablelimiter1.u) annotation(Line(points = {{35.5, 60}, {54.2141, 60}, {54.2141, 60}, {54, 60}}, color = {0, 0, 127}));
    connect(limiter1.y, division1.u2) annotation(Line(points = {{-44.5, 20}, {10.4784, 20}, {10.4784, 57.1754}, {24, 57.1754}, {24, 57}}, color = {0, 0, 127}));
    connect(ETERM, limiter1.u) annotation(Line(points = {{-100, 20}, {-56.492, 20}, {-56.492, 20}, {-56, 20}}, color = {0, 0, 127}));
    connect(add1.y, division1.u1) annotation(Line(points = {{5.5, 60}, {10.2506, 60}, {10.2506, 63.0979}, {24, 63.0979}, {24, 63}}, color = {0, 0, 127}));
    connect(pi_non_windup_limit1.y, add1.u2) annotation(Line(points = {{-20, 60}, {-15.7175, 60}, {-15.7175, 56.492}, {-6, 56.492}, {-6, 57}}, color = {0, 0, 127}));
    connect(add31.y, pi_non_windup_limit1.u) annotation(Line(points = {{-44.5, 60}, {-40.5467, 60}, {-40.5467, 60}, {-40, 60}}, color = {0, 0, 127}));
    connect(PELEC, lag1.u) annotation(Line(points = {{-100, 60}, {-74.9431, 60}, {-74.9431, 60}, {-75, 60}}, color = {0, 0, 127}));
    connect(lag1.y, add31.u2) annotation(Line(points = {{-65, 60}, {-56.492, 60}, {-56.492, 60}, {-56, 60}}, color = {0, 0, 127}));
    connect(transferfunction1.u, pi_non_windup_limit1.y) annotation(Line(points = {{-25, 40}, {-17, 40}, {-17, 60}, {-20, 60}}, color = {0, 0, 127}));
    connect(transferfunction1.y, gain1.u) annotation(Line(points = {{-36.5, 40}, {-44, 40}}, color = {0, 0, 127}));
    connect(gain1.y, add31.u3) annotation(Line(points = {{-55.5, 40}, {-58, 40}, {-58, 56}, {-56, 56}}, color = {0, 0, 127}));
    annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1}), graphics = {Text(origin = {14.3522, 67.4243}, lineColor = {255, 0, 0}, extent = {{-5.47, 2.73}, {5.47, -2.73}}, textString = "Pord"), Text(origin = {15.2409, 43.9412}, lineColor = {255, 0, 0}, extent = {{-5.47, 2.73}, {5.47, -2.73}}, textString = "Vs")}), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1}), graphics={  Rectangle(origin = {0.113895, 0}, extent = {{-99.8861, 99.7722}, {99.8861, -99.7722}}), Text(origin = {-65.4657, -58.5405}, extent = {{-23.12, 13.21}, {23.12, -13.21}}, textString = "PELEC"), Text(origin = {-65.49, 1.21}, extent = {{-23.12, 13.21}, {23.12, -13.21}}, textString = "ETERM"), Text(origin = {2.12, 71.48}, extent = {{-23.12, 13.21}, {23.12, -13.21}}, textString = "IPMAX"), Text(origin = {64.5091, -61.5702}, extent = {{-41.571, 17.3102}, {23.12, -13.21}}, textString = "WIPCMD"), Text(origin = {-7.21054, 46.6218}, lineColor = {255, 0, 0}, extent = {{-13.3161, -16.2018}, {15.15, -56.72}}, textString = "P"), Text(origin = {-78.9775, 18.7659}, lineColor = {255, 0, 0}, extent = {{3.67738, -21.8663}, {157.97, -66.29}}, textString = "CONTROL"), Text(origin = {-58.3437, 66.7448}, extent = {{-23.12, 13.21}, {9.17664, -5.149}}, textString = "Pref"), Text(origin = {-60.98, 43.19}, extent = {{-23.12, 13.21}, {9.18, -5.15}}, textString = "Pref0")}));
  end PControl;

  block QControl
    parameter Real Tfv "- V-regulator filter";
    parameter Real Kpv "- V-regulator proportional gain";
    parameter Real Kiv "- V-regulator integrator gain";
    parameter Real QMX "- V-regulator max limit";
    parameter Real QMN "- V-regulator min limit";
    parameter Real TRV "- V-sensor";
    parameter Real KQi "- MVAR/Volt gain";
    parameter Real VMINCL;
    parameter Real VMAXCL;
    parameter Real KVi "- Volt/MVAR gain";
    parameter Real Tv "- Lag time constant in WindVar controller";
    parameter Real Tp "- Pelec filter in fast PF controller";
    parameter Real PFAFLG ":= 1 if PF fast control enabled";
    parameter Real VARFLG ":= 1 if Qord is provided by WindVar";
    parameter Real ETERM0;
    parameter Real PELEC0;
    parameter Real QELEC0;
    parameter Real WIQ0;
    parameter Real VARL "Remote bus reference voltage";
    parameter Real VARL1(fixed = false) "Q reference if PFAFLG=0 & VARFLG=0";
    parameter Real VARL2(fixed = false) "PFangle reference if PFAFLG=1";
    Modelica.Blocks.Interfaces.RealInput Vmag_REMOTE annotation(Placement(visible = true, transformation(origin = {-100, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag lag1(T = TRV, y_start = ETERM0) annotation(Placement(visible = true, transformation(origin = {-70, 60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    Modelica.Blocks.Math.Add add1(k2 = -1) annotation(Placement(visible = true, transformation(origin = {-50, 60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant const(k = VARL) annotation(Placement(visible = true, transformation(origin = {-70, 80}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag lag2(K = Kpv, T = Tv) annotation(Placement(visible = true, transformation(origin = {-30, 60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    Modelica.Blocks.Math.Add add2 annotation(Placement(visible = true, transformation(origin = {-10, 60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant constant1(k = VARL2) annotation(Placement(visible = true, transformation(origin = {-70, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag lag4(T = Tp, y_start = PELEC0) annotation(Placement(visible = true, transformation(origin = {-70, 20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    Modelica.Blocks.Math.Tan tan1 annotation(Placement(visible = true, transformation(origin = {-50, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant constant2(k = VARL1) annotation(Placement(visible = true, transformation(origin = {-70, 0}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    OpalRT.NonElectrical.Math.Continuous.TransferFunction.Lag lag3(T = Tfv, y_start = QELEC0) annotation(Placement(visible = true, transformation(origin = {30, 60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    Modelica.Blocks.Nonlinear.Limiter limiter1(uMax = QMX, uMin = QMN) annotation(Placement(visible = true, transformation(origin = {10, 60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    Modelica.Blocks.Math.Product product1 annotation(Placement(visible = true, transformation(origin = {-30, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    OpalRT.NonElectrical.SignalRouting.Multiplexer multiplexer1(n = 2, s = PFAFLG + 1) annotation(Placement(visible = true, transformation(origin = {-10, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    OpalRT.NonElectrical.SignalRouting.Multiplexer multiplexer2(n = 2, s = VARFLG + 1) annotation(Placement(visible = true, transformation(origin = {50, 60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    Modelica.Blocks.Nonlinear.Limiter limiter2(uMax = QMX, uMin = QMN) annotation(Placement(visible = true, transformation(origin = {70, 60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    Modelica.Blocks.Math.Add add3(k2 = -1) annotation(Placement(visible = true, transformation(origin = {-60, -30}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    Modelica.Blocks.Math.Add add4(k2 = -1, k1 = +1) annotation(Placement(visible = true, transformation(origin = {0, -30}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput QELEC annotation(Placement(visible = true, transformation(origin = {-100, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    OpalRT.NonElectrical.Math.Continuous.TransferFunctionNonWindup.Integrator_NonWindupVariableLimit non_windup_integrator_var1(KI = KVi, y_init = WIQ0) annotation(Placement(visible = true, transformation(origin = {30, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput IQMAX annotation(Placement(visible = true, transformation(origin = {-10, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 90), iconTransformation(origin = {60, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
    Modelica.Blocks.Interfaces.RealInput IQMIN annotation(Placement(visible = true, transformation(origin = {30, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 90), iconTransformation(origin = {0, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
    Modelica.Blocks.Interfaces.RealOutput WIQCMD annotation(Placement(visible = true, transformation(origin = {100, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput PELEC annotation(Placement(visible = true, transformation(origin = {-100, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput ETERM annotation(Placement(visible = true, transformation(origin = {-100, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    OpalRT.NonElectrical.Math.Continuous.TransferFunctionNonWindup.Integrator_NonWindupLimit non_windup_integrator1(KI = KQi, VRMAX = VMAXCL, VRMIN = VMINCL, y_init = ETERM0) annotation(Placement(visible = true, transformation(origin = {-30, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.Integrator integrator1(y_start = QELEC0, k = Kiv) annotation(Placement(visible = true, transformation(origin = {-30, 80}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  initial equation
    VARL1 = QELEC0;
    VARL2 = atan(QELEC0 / PELEC0);
  equation
    connect(integrator1.u, add1.y) annotation(Line(points = {{-36, 80}, {-38.9522, 80}, {-38.9522, 59.9089}, {-44.5, 59.9089}, {-44.5, 60}}, color = {0, 0, 127}));
    connect(integrator1.y, add2.u1) annotation(Line(points = {{-24.5, 80}, {-21.1845, 80}, {-21.1845, 63.0979}, {-15.262, 63.0979}, {-15.262, 63}, {-16, 63}}, color = {0, 0, 127}));
    connect(non_windup_integrator1.y, add4.u1) annotation(Line(points = {{-25, -30}, {-13.2118, -30}, {-13.2118, -27.1071}, {-6, -27.1071}, {-6, -27}}, color = {0, 0, 127}));
    connect(add3.y, non_windup_integrator1.u) annotation(Line(points = {{-54.5, -30}, {-35.5353, -30}, {-35.5353, -30}, {-35, -30}}, color = {0, 0, 127}));
    connect(non_windup_integrator_var1.y, WIQCMD) annotation(Line(points = {{35, -30}, {92.0273, -30}, {92.0273, -30}, {100, -30}}, color = {0, 0, 127}));
    connect(non_windup_integrator_var1.VL, IQMIN) annotation(Line(points = {{31, -39}, {30.2961, -39}, {30.2961, -100}, {30, -100}}, color = {0, 0, 127}));
    connect(non_windup_integrator_var1.VU, IQMAX) annotation(Line(points = {{29, -21}, {28.4738, -21}, {28.4738, -17.5399}, {13.2118, -17.5399}, {13.2118, -50.1139}, {-10.9339, -50.1139}, {-10.9339, -100}, {-10, -100}}, color = {0, 0, 127}));
    connect(non_windup_integrator_var1.u, add4.y) annotation(Line(points = {{25, -30}, {5.46697, -30}, {5.46697, -30}, {5.5, -30}}, color = {0, 0, 127}));
    connect(add4.u2, ETERM) annotation(Line(points = {{-6, -33}, {-10.7062, -33}, {-10.7062, -44.4191}, {-95.4442, -44.4191}, {-95.4442, -70}, {-100, -70}}, color = {0, 0, 127}));
    connect(QELEC, add3.u2) annotation(Line(points = {{-100, -30}, {-84.2825, -30}, {-84.2825, -33.0296}, {-66, -33.0296}, {-66, -33}}, color = {0, 0, 127}));
    connect(limiter2.y, add3.u1) annotation(Line(points = {{75.5, 60}, {84.9658, 60}, {84.9658, 20.9567}, {-30.0683, 20.9567}, {-30.0683, -10.9339}, {-72.2096, -10.9339}, {-72.2096, -27.3349}, {-66, -27.3349}, {-66, -27}}, color = {0, 0, 127}));
    connect(multiplexer2.y, limiter2.u) annotation(Line(points = {{55, 60}, {63.5535, 60}, {63.5535, 60}, {64, 60}}, color = {0, 0, 127}));
    connect(lag3.y, multiplexer2.u[2]) annotation(Line(points = {{35, 60}, {45.1025, 60}, {45.1025, 60.25}, {45, 60.25}}, color = {0, 0, 127}));
    connect(multiplexer1.y, multiplexer2.u[1]) annotation(Line(points = {{-5, 40}, {44.4191, 40}, {44.4191, 59.75}, {45, 59.75}}, color = {0, 0, 127}));
    connect(product1.y, multiplexer1.u[2]) annotation(Line(points = {{-24.5, 40}, {-14.8064, 40}, {-14.8064, 40.25}, {-15, 40.25}}, color = {0, 0, 127}));
    connect(constant2.y, multiplexer1.u[1]) annotation(Line(points = {{-64.5, 0}, {-36.4465, 0}, {-36.4465, 31.8907}, {-14.8064, 31.8907}, {-14.8064, 39.75}, {-15, 39.75}}, color = {0, 0, 127}));
    connect(lag4.y, product1.u2) annotation(Line(points = {{-65, 20}, {-40.7745, 20}, {-40.7745, 36.9021}, {-36, 36.9021}, {-36, 37}}, color = {0, 0, 127}));
    connect(PELEC, lag4.u) annotation(Line(points = {{-100, 20}, {-74.7153, 20}, {-74.7153, 20}, {-75, 20}}, color = {0, 0, 127}));
    connect(tan1.y, product1.u1) annotation(Line(points = {{-44.5, 40}, {-41.0023, 40}, {-41.0023, 42.8246}, {-36, 42.8246}, {-36, 43}}, color = {0, 0, 127}));
    connect(constant1.y, tan1.u) annotation(Line(points = {{-64.5, 40}, {-56.7198, 40}, {-56.7198, 40}, {-56, 40}}, color = {0, 0, 127}));
    connect(limiter1.y, lag3.u) annotation(Line(points = {{15.5, 60}, {25.0569, 60}, {25.0569, 60}, {25, 60}}, color = {0, 0, 127}));
    connect(add2.y, limiter1.u) annotation(Line(points = {{-4.5, 60}, {4.32802, 60}, {4.32802, 60}, {4, 60}}, color = {0, 0, 127}));
    connect(lag2.y, add2.u2) annotation(Line(points = {{-25, 60}, {-21.1845, 60}, {-21.1845, 56.9476}, {-16, 56.9476}, {-16, 57}}, color = {0, 0, 127}));
    connect(add1.y, lag2.u) annotation(Line(points = {{-44.5, 60}, {-35.0797, 60}, {-35.0797, 60}, {-35, 60}}, color = {0, 0, 127}));
    connect(const.y, add1.u1) annotation(Line(points = {{-64.5, 80}, {-59.2255, 80}, {-59.2255, 63.3257}, {-56, 63.3257}, {-56, 63}}, color = {0, 0, 127}));
    connect(lag1.y, add1.u2) annotation(Line(points = {{-65, 60}, {-60.5923, 60}, {-60.5923, 56.492}, {-56, 56.492}, {-56, 57}}, color = {0, 0, 127}));
    connect(Vmag_REMOTE, lag1.u) annotation(Line(points = {{-100, 60}, {-75.3986, 60}, {-75.3986, 60}, {-75, 60}}, color = {0, 0, 127}));
    annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {1, 1}), graphics={  Rectangle(origin = {0.22779, 0.22779}, extent = {{-99.7722, 100}, {99.7722, -100}}), Text(origin = {-65.95, 86.9}, extent = {{-20.84, 9}, {49.09, -22.67}}, textString = "Vmag_REMOTE"), Text(origin = {-65.7645, -18.1114}, extent = {{-20.84, 9}, {24.4886, -9.68595}}, textString = "PELEC"), Text(origin = {-66.0377, -77.4302}, extent = {{-20.84, 9}, {24.49, -9.69}}, textString = "QELEC"), Text(origin = {-1.62314, -79.7492}, extent = {{-20.84, 9}, {24.49, -9.69}}, textString = "IQMIN"), Text(origin = {56.6412, -79.3403}, extent = {{-20.84, 9}, {24.49, -9.69}}, textString = "IQMAX"), Text(origin = {-35.97, 47.63}, lineColor = {255, 0, 0}, fillColor = {255, 0, 0},
              fillPattern =                                                                                                                                                                                                        FillPattern.Solid, extent = {{-20.84, 9}, {73.24, -67.55}}, textString = "Q"), Text(origin = {-62.67, 16.15}, lineColor = {255, 0, 0}, fillColor = {170, 0, 0},
              fillPattern =                                                                                                                                                                                                        FillPattern.Solid, extent = {{-19.7, -40.89}, {144.08, -85.32}}, textString = "CONTROL"), Text(origin = {62.6645, -3.39581}, extent = {{-34.2796, 16.2893}, {24.49, -9.69}}, textString = "WIQCMD"), Text(origin = {-66.24, 29.93}, extent = {{-20.84, 9}, {24.49, -9.69}}, textString = "ETERM")}));
  end QControl;
end Internal;
