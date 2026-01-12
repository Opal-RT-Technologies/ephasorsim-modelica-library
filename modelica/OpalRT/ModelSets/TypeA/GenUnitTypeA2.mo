within OpalRT.ModelSets.TypeA;
partial model GenUnitTypeA2
  extends GenUnitTypeA1;
equation
  connect(synchronousGenerator.EFD0, synchronousGenerator.EFD) annotation (Line(
        points={{61.64,10},{54,10},{54,15.04},{62,15.04}}, color={0,0,127}));
end GenUnitTypeA2;
