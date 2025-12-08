within OpalRT.ModelSets.PVGU1;
model PVGU1
  extends PVGU1Base;

  OpalRT.Electrical.Load.ConstantImpedance2 rx_load1(R = ZSOURCE_RE, X = 999999) annotation(Placement(visible = true, transformation(origin = {80, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(rx_load1.p, machine2net_base_change1.p) annotation(Line(points={{70,-80},
          {29.77,-80},{29.77,-46},{50,-46}}));
  connect(pvgu1.Ipcmd00, pvgu1.IPCMD) annotation(Line(points={{20,15},{20,34},{
          -14,34},{-14,-2},{5,-2},{5,-3}},                                                                                                                                                              color = {0, 0, 127}));
  connect(pvgu1.Iqcmd00, pvgu1.IQCMD) annotation(Line(points={{11,15},{10,15},{
          10,28},{-8,28},{-8,6},{5,6}},
                      color = {0, 0, 127}));
end PVGU1;
