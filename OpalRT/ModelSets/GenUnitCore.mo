within OpalRT.ModelSets;
partial model GenUnitCore "Core GenUnit model"
  extends InjectionTrip;
  // === Replaceable core components ===
  replaceable Electrical.PartialModel.SynchronousGenerator synchronousGenerator
    annotation (Placement(transformation(extent={{62,-8},{98,28}})));
equation
  // Core plant I/O
  connect(TRIP, synchronousGenerator.TRIP)
    annotation (Line(points={{80,46},{80,28}}, color={115,170,0}));
  connect(synchronousGenerator.p, bus0)
    annotation (Line(points={{80,-8},{80,-30},{106,-30}}, color={255,0,0}));
    annotation (Placement(transformation(extent={{-154,86},{-146,94}})),
                Placement(transformation(extent={{-154,106},{-146,114}})));
end GenUnitCore;
