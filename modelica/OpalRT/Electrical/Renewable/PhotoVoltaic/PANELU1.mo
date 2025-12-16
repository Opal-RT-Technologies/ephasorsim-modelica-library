within OpalRT.Electrical.Renewable.PhotoVoltaic;
model PANELU1 "PV I-P characteristics"
  parameter Real PDCMAX200 = 10 "maximum power of panel at an irradiance of 200 W/m2, pu on PDCMAX1000";
  parameter Real PDCMAX400 = 10 "maximum power of panel at an irradiance of 400 W/m2, pu on PDCMAX1000";
  parameter Real PDCMAX600 = 10 "maximum power of panel at an irradiance of 600 W/m2, pu on PDCMAX1000";
  parameter Real PDCMAX800 = 10 "maximum power of panel at an irradiance of 800 W/m2, pu on PDCMAX1000";
  parameter Real PDCMAX1000 = 10 "maximum power of panel at an irradiance of 1000 W/m2, pu on PDCMAX1000";
  Modelica.Blocks.Interfaces.RealOutput PDC annotation(Placement(visible = true, transformation(origin = {100, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Irad "Initial Iradiation" annotation(Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput Irad0 "Initial Iradiation" annotation(Placement(visible = true, transformation(origin = {-100, -20}, extent = {{10, -10}, {-10, 10}}, rotation = 0), iconTransformation(origin = {-100, 60}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput PDC0 annotation(Placement(visible = true, transformation(origin = {-100, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
protected
  parameter Real Irad_0(fixed = false);
initial algorithm
  if PDC0 > PDCMAX1000 then
    Irad_0 := 1000;
  elseif PDC0 > PDCMAX800 then
    Irad_0 := (PDC0 - PDCMAX800) / (PDCMAX1000 - PDCMAX800) * 200 + 800;
  elseif PDC0 > PDCMAX600 then
    Irad_0 := (PDC0 - PDCMAX600) / (PDCMAX800 - PDCMAX600) * 200 + 600;
  elseif PDC0 > PDCMAX400 then
    Irad_0 := (PDC0 - PDCMAX400) / (PDCMAX600 - PDCMAX400) * 200 + 400;
  elseif PDC0 > PDCMAX200 then
    Irad_0 := (PDC0 - PDCMAX200) / (PDCMAX400 - PDCMAX200) * 200 + 200;
  elseif PDC0 > 0 then
    Irad_0 := PDC0 / PDCMAX200 * 200;
  else
    Irad_0 := 0;
  end if;
equation
  Irad0 = Irad_0;
  if Irad > 1000 then
    PDC = PDCMAX1000;
  elseif Irad > 800 then
    PDC = (PDCMAX1000 - PDCMAX800) / 200 * (Irad - 800) + PDCMAX800;
  elseif Irad > 600 then
    PDC = (PDCMAX800 - PDCMAX600) / 200 * (Irad - 600) + PDCMAX600;
  elseif Irad > 400 then
    PDC = (PDCMAX600 - PDCMAX400) / 200 * (Irad - 400) + PDCMAX400;
  elseif Irad > 200 then
    PDC = (PDCMAX400 - PDCMAX200) / 200 * (Irad - 200) + PDCMAX200;
  elseif Irad > 0 then
    PDC = PDCMAX200 / 200 * Irad;
  else
    PDC = 0;
  end if;
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Documentation(info = "<html>

<img src=\"modelica://OpalRT/resource/Electrical/PV/PANELU1.png\"


</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Rectangle(origin = {0.276625, -0.138313}, extent = {{-99.8617, 100.277}, {99.8617, -100.277}}), Text(origin = {-73.9986, 80.9088}, extent = {{-17.29, 8.71}, {17.29, -8.71}}, textString = "Irad"), Text(origin = {-69.2137, 60.7966}, extent = {{-17.29, 8.71}, {17.29, -8.71}}, textString = "Irad0"), Text(origin = {-71.34, -81.03}, extent = {{-17.29, 8.71}, {17.29, -8.71}}, textString = "PDC0"), Text(origin = {70.9295, -0.723126}, extent = {{-11.2042, 8.98663}, {17.29, -8.71}}, textString = "PDC"), Text(origin = {-48.38, 15.79}, extent = {{-17.29, 8.71}, {94.19, -42.18}}, textString = "PANELU1")}));
end PANELU1;
