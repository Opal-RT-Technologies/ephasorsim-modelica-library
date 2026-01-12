within OpalRT.ModelSets.TypeC;
partial model GenUnitTypeC1
  "GenUnit with SynchronousMachine and Turbine-Governor models"
  extends ModelSets.GenUnitGov;
equation
  // No exciter in TypeC (short EFD0 -> EFD)
  connect(synchronousGenerator.EFD0, synchronousGenerator.EFD) annotation (Line(
        points={{61.64,10},{56,10},{56,15.04},{62,15.04}}, color={0,0,127}));
end GenUnitTypeC1;
