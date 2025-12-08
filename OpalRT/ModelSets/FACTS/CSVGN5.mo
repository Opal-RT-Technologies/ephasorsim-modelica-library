within OpalRT.ModelSets.FACTS;
model CSVGN5
  extends ModelSets.InjectionVOTHSG;

  parameter Real partType = 1;
  // GENROU Parameters
  parameter Integer IBUS = 100 "Located system bus" annotation(Dialog(tab = "General"));
  parameter String M_ID = "M1" "Machine Identifier" annotation(Dialog(tab = "General"));
  parameter Real Vt_abs = 1.03 annotation(Dialog(tab = "General"));
  parameter Real Vt_ang = -10.06 annotation(Dialog(tab = "General"));
  parameter Real P_gen = 0 annotation(Dialog(tab = "General"));
  parameter Real Q_gen = 100 annotation(Dialog(tab = "General"));
  parameter Real SB = 1000 annotation(Dialog(tab = "General"));
  parameter Real fn = 50 "Nominal frequency" annotation(Dialog(tab = "General"));
  parameter Real ZSOURCE_RE = 0 "Machine source impedence (NOT USED)" annotation(Dialog(tab = "CSVGN5 Parameters"));
  parameter Real ZSOURCE_IM = 999 "Machine source impedence (NOT USED)" annotation(Dialog(tab = "CSVGN5 Parameters"));
  parameter Real TS1 = 0.01 annotation(Dialog(tab = "CSVGN5 Parameters"));
  parameter Real VEMAX = 0.15 annotation(Dialog(tab = "CSVGN5 Parameters"));
  parameter Real TS2 = 0.1 annotation(Dialog(tab = "CSVGN5 Parameters"));
  parameter Real TS3 = 5 ">0" annotation(Dialog(tab = "CSVGN5 Parameters"));
  parameter Real TS4 = 0.01 annotation(Dialog(tab = "CSVGN5 Parameters"));
  parameter Real TS5 = 0.01 annotation(Dialog(tab = "CSVGN5 Parameters"));
  parameter Real KSVS = 400 annotation(Dialog(tab = "CSVGN5 Parameters"));
  parameter Real KSD = 1 annotation(Dialog(tab = "CSVGN5 Parameters"));
  parameter Real BMAX = 1 annotation(Dialog(tab = "CSVGN5 Parameters"));
  parameter Real BpMAX = 1 annotation(Dialog(tab = "CSVGN5 Parameters"));
  parameter Real BpMIN = -0.5 annotation(Dialog(tab = "CSVGN5 Parameters"));
  parameter Real BMIN = -0.5 annotation(Dialog(tab = "CSVGN5 Parameters"));
  parameter Real TS6 = 0.05 ">0" annotation(Dialog(tab = "CSVGN5 Parameters"));
  parameter Real DV = 0.15 annotation(Dialog(tab = "CSVGN5 Parameters"));
  parameter Real ICONM = 0 "Remote bus Number (NOT USED)" annotation(Dialog(tab = "ICONS"));
  OpalRT.Electrical.FACTS.CSVGN5 csvgn5(Vt_abs = Vt_abs, Vt_ang = Vt_ang, P_gen = P_gen, Q_gen = Q_gen, SB = SB, fn = fn, ZSOURCE_RE = ZSOURCE_RE, ZSOURCE_IM = ZSOURCE_IM, TS1 = TS1, VEMAX = VEMAX, TS2 = TS2, TS3 = TS3, TS4 = TS4, TS5 = TS5, KSVS = KSVS, KSD = KSD, BMAX = BMAX, BpMAX = BpMAX, BpMIN = BpMIN, BMIN = BMIN, TS6 = TS6, DV = DV) annotation(Placement(visible = true, transformation(origin={14,-2},    extent = {{-35, -35}, {35, 35}}, rotation = 0)));
equation
  connect(csvgn5.VOTHSG, VOTHSG) annotation(Line(points={{-21,-26.5},{-34,-26.5},
          {-34,-30},{-48,-30},{-48,-29},{-47,-29}},                                                                                    color = {0, 0, 127}));
  connect(csvgn5.VREF0, csvgn5.VREF) annotation(Line(points={{-21,12},{-32,12},{
          -32,22.5},{-21,22.5}},                                                                                                     color = {0, 0, 127}));
  connect(csvgn5.p, bus0) annotation(Line(points={{49,-30},{106,-30}}));
end CSVGN5;
