within OpalRT.Electrical.Renewable.PhotoVoltaic;
model PVEU1 "Electrical control model for PV."
  extends OpalRT.Electrical.Renewable.WindTurbineGenerator.WT4.WT4E1;
  annotation(Documentation(info = "<html>

<p>
The model is similar to WT4E1. However VAR(L+3), which is Pref signal can be changed externally by PANELU1.
</p>

<img src=\"modelica://OpalRT/resource/Electrical/Wind_Turbine/WT4/WT4E1.png\"


</html>"));
end PVEU1;
