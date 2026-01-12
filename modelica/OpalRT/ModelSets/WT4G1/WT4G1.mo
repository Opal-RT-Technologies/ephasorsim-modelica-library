within OpalRT.ModelSets.WT4G1;
model WT4G1
  extends WT4G1Base;
equation
  connect(wt4g1_base1.Ipcmd00, wt4g1_base1.IPCMD) annotation(Line(points={{20,15},
          {19.7267,15},{19.7267,25.0114},{-5.7859,25.0114},{-5.7859,-3.0068},{5,
          -3.0068},{5,-3}},                                                                                                                                                                                         color = {0, 0, 127}));
  connect(wt4g1_base1.Iqcmd00, wt4g1_base1.IQCMD) annotation(Line(points={{11,15},
          {10,15},{10,20},{0,20},{0,6.7882},{5,6.7882},{5,6}},                                                                                                                                                    color = {0, 0, 127}));
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={ Rectangle(origin = {0.625, 0}, extent = {{-99.6875, 99.6875}, {99.6875, -99.6875}})}));
end WT4G1;
