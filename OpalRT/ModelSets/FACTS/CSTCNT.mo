within OpalRT.ModelSets.FACTS;
model CSTCNT
  extends ModelSets.InjectionVOTHSGVRef;

  parameter Real partType = 1;
  // GENROU Parameters
  constant Real pi = Modelica.Constants.pi;
  parameter Real Vt_abs = 1.03;
  parameter Real Vt_ang = -10.06;
  parameter Real P_gen = 0 "Bus Active Power, MW";
  parameter Real Q_gen = 100 "Bus Reactive Power, MVAR";
  parameter Real SB = 100 "Machine Base Power, MVA";
  parameter Real fn = 50 "Nominal frequency";
  parameter Real ZSOURCE_RE = 0 "Machine source impedence (NOT USED)" annotation(Dialog(tab = "CSVGN5 Parameters"));
  parameter Real ZSOURCE_IM = 999 "Machine source impedence (NOT USED)" annotation(Dialog(tab = "CSVGN5 Parameters"));
  parameter Real IB = 0 "ICONM : # for voltage control; 0 for local control" annotation(Dialog(tab = "ICONs"));
  parameter Real T1 = 0.1;
  parameter Real T2 = 0.2;
  parameter Real T3 = 0.3;
  parameter Real T4 = 0.4;
  parameter Real K = 40;
  parameter Real Droop = 0.025 "Droop";
  parameter Real Vmax = 999;
  parameter Real Vmin = -999;
  parameter Real ICMAX = 1.25 "MaX capacitive current";
  parameter Real ILMAX = 1.25 "MaX inductive current";
  parameter Real Vcutout = 0.2 "cut out voltage";
  parameter Real Elimit = 1.2;
  parameter Real Xt = 0.1 "transformer inductance";
  parameter Real Acc = 0;
  OpalRT.Electrical.FACTS.CSTCNT cstcnt(Remote_bus = IB, Vt_abs = Vt_abs, Vt_ang = Vt_ang, P_gen = P_gen, Q_gen = Q_gen, SB = SB, fn = fn, T1 = T1, T2 = T2, T3 = T3, T4 = T4, K = K, Droop = Droop, Vmax = Vmax, Vmin = Vmin, ICMAX = ICMAX, ILMAX = ILMAX, Vcutout = Vcutout, Elimit = Elimit, Xt = Xt, Acc = Acc) annotation(Placement(visible = true, transformation(origin={52,-2},    extent = {{-35, -35}, {35, 35}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 0) annotation(Placement(visible = true, transformation(origin={-88,-16},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1 annotation(Placement(visible = true, transformation(origin={-16,12},    extent = {{-5, -5}, {5, 5}}, rotation = 0)));
equation
  connect(add1.u2, dVREF) annotation(Line(points={{-22,9},{-28,9},{-28,-7},{-35,
          -7}},                                                                                                           color = {0, 0, 127}));
  connect(cstcnt.Vref0, add1.u1) annotation(Line(points={{87,12},{124,12},{124,60},
          {-32,60},{-32,16},{-22,16},{-22,15}},                                                                                                                                           color = {0, 0, 127}));
  connect(add1.y, cstcnt.Vref) annotation(Line(points={{-10.5,12},{17,12}},                                                                                                color = {0, 0, 127}));
  connect(bus0, cstcnt.p) annotation(Line(points={{106,-30},{87,-30}}));
  connect(const.y, cstcnt.Vmag_REMOTE) annotation(Line(points={{-77,-16},{17,-16}},                                                                               color = {0, 0, 127}));
  connect(cstcnt.othersignal, VOTHSG) annotation(Line(points={{17,-30},{-14,-30},
          {-14,-29},{-47,-29}},                                                                                                         color = {0, 0, 127}));
  connect(cstcnt.Vmag_local, cstcnt.Eterm) annotation(Line(points={{17,26},{8,26},
          {8,50},{100,50},{100,26},{87,26}},                                                                                                                                                          color = {0, 0, 127}));
end CSTCNT;
