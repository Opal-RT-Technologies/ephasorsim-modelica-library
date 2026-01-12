within OpalRT.ModelSets.TypeE;
partial model GenUnitTypeE1
  "GenUnit with SynchronousMachine, Excitation System and Power System Stabilizer models"
  extends ModelSets.GenUnitExcPss;

  // === Utility constants
  Modelica.Blocks.Sources.Constant constVUEL(k=0)
    annotation (Placement(transformation(extent={{-94,54},{-86,62}})));
  Modelica.Blocks.Sources.Constant constVOEL(k=0)
    annotation (Placement(transformation(extent={{-108,42},{-100,50}})));
equation
  // No governor in TypeB (short PMECH0 -> PMECH)
  connect(synchronousGenerator.PMECH, synchronousGenerator.PMECH0) annotation (Line(
        points={{62,-0.8},{56,-0.8},{56,-4.4},{62,-4.4}}, color={0,0,0}));
  // Defaults where no UEL/OEL is present
  connect(constVUEL.y, exciter.VUEL) annotation (Line(points={{-85.6,58},{-60,58},
          {-60,13.6},{-18,13.6}}, color={0,0,127}));
  connect(constVOEL.y, exciter.VOEL) annotation (Line(points={{-99.6,46},{-68,46},
          {-68,8.56},{-18,8.56}}, color={0,0,127}));
end GenUnitTypeE1;
