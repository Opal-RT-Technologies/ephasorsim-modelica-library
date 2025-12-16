within OpalRT.ModelSets.PVGU1;
model PVGU1_PVEU1_PANELU1_IRRADU1
  extends PVGU1_PVEU1Base;

  // PANELU1 parameters
  parameter Real PDCMAX200 = 10 "maximum power of panel at an irradiance of 200 W/m2, pu on PDCMAX1000" annotation(Dialog(tab = "PANELU1 parameters"));
  parameter Real PDCMAX400 = 10 "maximum power of panel at an irradiance of 400 W/m2, pu on PDCMAX1000" annotation(Dialog(tab = "PANELU1 parameters"));
  parameter Real PDCMAX600 = 10 "maximum power of panel at an irradiance of 600 W/m2, pu on PDCMAX1000" annotation(Dialog(tab = "PANELU1 parameters"));
  parameter Real PDCMAX800 = 10 "maximum power of panel at an irradiance of 800 W/m2, pu on PDCMAX1000" annotation(Dialog(tab = "PANELU1 parameters"));
  parameter Real PDCMAX1000 = 10 "maximum power of panel at an irradiance of 1000 W/m2, pu on PDCMAX1000" annotation(Dialog(tab = "PANELU1 parameters"));
  //IRRADU1 parameters
  parameter Real TIME1 = 1 "Time of first data point, sec" annotation(Dialog(tab = "IRRADU1 parameters"));
  parameter Real IRRADIANCE1 = 100 "Irradiance at first data point, W/m2" annotation(Dialog(tab = "IRRADU1 parameters"));
  parameter Real TIME2 = 2 "Time of first data point, sec" annotation(Dialog(tab = "IRRADU1 parameters"));
  parameter Real IRRADIANCE2 = 100 "Irradiance at first data point, W/m2" annotation(Dialog(tab = "IRRADU1 parameters"));
  parameter Real TIME3 = 3 "Time of first data point, sec" annotation(Dialog(tab = "IRRADU1 parameters"));
  parameter Real IRRADIANCE3 = 100 "Irradiance at first data point, W/m2" annotation(Dialog(tab = "IRRADU1 parameters"));
  parameter Real TIME4 = 4 "Time of first data point, sec" annotation(Dialog(tab = "IRRADU1 parameters"));
  parameter Real IRRADIANCE4 = 100 "Irradiance at first data point, W/m2" annotation(Dialog(tab = "IRRADU1 parameters"));
  parameter Real TIME5 = 5 "Time of first data point, sec" annotation(Dialog(tab = "IRRADU1 parameters"));
  parameter Real IRRADIANCE5 = 100 "Irradiance at first data point, W/m2" annotation(Dialog(tab = "IRRADU1 parameters"));
  parameter Real TIME6 = 6 "Time of first data point, sec" annotation(Dialog(tab = "IRRADU1 parameters"));
  parameter Real IRRADIANCE6 = 100 "Irradiance at first data point, W/m2" annotation(Dialog(tab = "IRRADU1 parameters"));
  parameter Real TIME7 = 7 "Time of first data point, sec" annotation(Dialog(tab = "IRRADU1 parameters"));
  parameter Real IRRADIANCE7 = 100 "Irradiance at first data point, W/m2" annotation(Dialog(tab = "IRRADU1 parameters"));
  parameter Real TIME8 = 8 "Time of first data point, sec" annotation(Dialog(tab = "IRRADU1 parameters"));
  parameter Real IRRADIANCE8 = 100 "Irradiance at first data point, W/m2" annotation(Dialog(tab = "IRRADU1 parameters"));
  parameter Real TIME9 = 9 "Time of first data point, sec" annotation(Dialog(tab = "IRRADU1 parameters"));
  parameter Real IRRADIANCE9 = 100 "Irradiance at first data point, W/m2" annotation(Dialog(tab = "IRRADU1 parameters"));
  parameter Real TIME10 = 10 "Time of first data point, sec" annotation(Dialog(tab = "IRRADU1 parameters"));
  parameter Real IRRADIANCE10 = 100 "Irradiance at first data point, W/m2" annotation(Dialog(tab = "IRRADU1 parameters"));
  parameter Real In_Service_Flag = 1 "In Service Flag, 1: model is in-service, 0: model is OFF" annotation(Dialog(tab = "IRRADU1 parameters"));
  parameter Real Positive_sequence = 1 "1: positive sequence, 0: Unbalanced 3-phase" annotation(Dialog(tab = "3-phase network parameters"));
  parameter Real Vbase = 1 "Base Voltage of connected bus, used for 3-phase network" annotation(Dialog(tab = "3-phase network parameters"));
  parameter Real Sbase_network = 1 "Network base power, used for 3-phase network" annotation(Dialog(tab = "3-phase network parameters"));
  OpalRT.Electrical.Renewable.PhotoVoltaic.PANELU1 panelu11(PDCMAX200 = PDCMAX200, PDCMAX400 = PDCMAX400, PDCMAX600 = PDCMAX600, PDCMAX800 = PDCMAX800, PDCMAX1000 = PDCMAX1000) annotation(Placement(visible = true, transformation(origin = {-20, -50}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = PMX / SB) annotation(Placement(visible = true, transformation(origin = {10, -50}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain2(k = SB / PMX) annotation(Placement(visible = true, transformation(origin = {-10, -80}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  OpalRT.Electrical.Renewable.PhotoVoltaic.IRRADU1 irradu11(TIME1 = TIME1, IRRADIANCE1 = IRRADIANCE1, TIME2 = TIME2, IRRADIANCE2 = IRRADIANCE2, TIME3 = TIME3, IRRADIANCE3 = IRRADIANCE3, TIME4 = TIME4, IRRADIANCE4 = IRRADIANCE4, TIME5 = TIME5, IRRADIANCE5 = IRRADIANCE5, TIME6 = TIME6, IRRADIANCE6 = IRRADIANCE6, TIME7 = TIME7, IRRADIANCE7 = IRRADIANCE7, TIME8 = TIME8, IRRADIANCE8 = IRRADIANCE8, TIME9 = TIME9, IRRADIANCE9 = IRRADIANCE9, TIME10 = TIME10, IRRADIANCE10 = IRRADIANCE10, In_Service_Flag = In_Service_Flag) annotation(Placement(visible = true, transformation(origin = {-70, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(irradu11.Irad, panelu11.Irad) annotation(Line(points = {{-60,-20},{
          -52.7233,-20},{-52.7233,-37.9085},{-35,-37.9085},{-35,-38}}, color = {0, 0, 127}));
  connect(panelu11.Irad0, irradu11.Irad0) annotation(Line(points = {{-35,-41},{
          -85.4031,-41},{-85.4031,-20.4793},{-80,-20.4793},{-80,-20}}, color = {0, 0, 127}));
  connect(gain2.y, panelu11.PDC0) annotation(Line(points = {{-15.5,-80},{
          -42.2658,-80},{-42.2658,-61.6558},{-35,-61.6558},{-35,-62}}, color = {0, 0, 127}));
  connect(pveu1.Pref0, gain2.u) annotation(Line(points = {{-34.375,21.25},{
          -34.6405,21.25},{-34.6405,-23.0937},{26.7974,-23.0937},{26.7974,
          -79.9564},{-3.7037,-79.9564},{-3.7037,-80},{-4,-80}}, color = {0, 0, 127}));
  connect(gain1.y, pveu1.Pref) annotation(Line(points = {{15.5,-50},{18.0828,
          -50},{18.0828,-27.0153},{-41.3943,-27.0153},{-41.3943,20.2614},{
          -41.875,20.2614},{-41.875,21.25}}, color = {0, 0, 127}));
  connect(panelu11.PDC, gain1.u) annotation(Line(points = {{-5,-50},{4.57516,
          -50},{4.57516,-50},{4,-50}}, color = {0, 0, 127}));
end PVGU1_PVEU1_PANELU1_IRRADU1;
