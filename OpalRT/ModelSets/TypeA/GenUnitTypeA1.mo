within OpalRT.ModelSets.TypeA;
partial model GenUnitTypeA1 "GenUnit only with SynchronousMachine model"
  extends ModelSets.GenUnitCore;
equation
  connect(synchronousGenerator.PMECH, synchronousGenerator.PMECH0) annotation (
      Line(points={{62,-0.8},{54,-0.8},{54,-4.4},{62,-4.4}},         color={0,0,
          127}));
end GenUnitTypeA1;
