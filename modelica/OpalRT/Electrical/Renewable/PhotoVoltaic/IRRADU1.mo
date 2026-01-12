within OpalRT.Electrical.Renewable.PhotoVoltaic;
model IRRADU1 "PV Irradiance Profile"
  parameter Real TIME1 "Time of first data point, sec";
  parameter Real IRRADIANCE1 "Irradiance at first data point, W/m2";
  parameter Real TIME2 "Time of first data point, sec";
  parameter Real IRRADIANCE2 "Irradiance at first data point, W/m2";
  parameter Real TIME3 "Time of first data point, sec";
  parameter Real IRRADIANCE3 "Irradiance at first data point, W/m2";
  parameter Real TIME4 "Time of first data point, sec";
  parameter Real IRRADIANCE4 "Irradiance at first data point, W/m2";
  parameter Real TIME5 "Time of first data point, sec";
  parameter Real IRRADIANCE5 "Irradiance at first data point, W/m2";
  parameter Real TIME6 "Time of first data point, sec";
  parameter Real IRRADIANCE6 "Irradiance at first data point, W/m2";
  parameter Real TIME7 "Time of first data point, sec";
  parameter Real IRRADIANCE7 "Irradiance at first data point, W/m2";
  parameter Real TIME8 "Time of first data point, sec";
  parameter Real IRRADIANCE8 "Irradiance at first data point, W/m2";
  parameter Real TIME9 "Time of first data point, sec";
  parameter Real IRRADIANCE9 "Irradiance at first data point, W/m2";
  parameter Real TIME10 "Time of first data point, sec";
  parameter Real IRRADIANCE10 "Irradiance at first data point, W/m2";
  parameter Real In_Service_Flag "In Service Flag, 1: model is in-service, 0: model is OFF" annotation(Dialog(tab = "ICONs"));
  Modelica.Blocks.Interfaces.RealOutput Irad annotation(Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Irad0 annotation(Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Real t;
initial equation
  t = 0;
algorithm
  if t < TIME1 then
    Irad := (IRRADIANCE1 - Irad0) / TIME1 * t + Irad0;
  elseif TIME2 == 0 then
    Irad := IRRADIANCE1;
  elseif t < TIME2 then
    Irad := (IRRADIANCE2 - IRRADIANCE1) / (TIME2 - TIME1) * (t - TIME1) + IRRADIANCE1;
  elseif TIME3 == 0 then
    Irad := IRRADIANCE2;
  elseif t < TIME3 then
    Irad := (IRRADIANCE3 - IRRADIANCE2) / (TIME3 - TIME2) * (t - TIME2) + IRRADIANCE2;
  elseif TIME4 == 0 then
    Irad := IRRADIANCE3;
  elseif t < TIME4 then
    Irad := (IRRADIANCE4 - IRRADIANCE3) / (TIME4 - TIME3) * (t - TIME3) + IRRADIANCE3;
  elseif TIME5 == 0 then
    Irad := IRRADIANCE4;
  elseif t < TIME5 then
    Irad := (IRRADIANCE5 - IRRADIANCE4) / (TIME5 - TIME4) * (t - TIME4) + IRRADIANCE4;
  elseif TIME6 == 0 then
    Irad := IRRADIANCE5;
  elseif t < TIME6 then
    Irad := (IRRADIANCE6 - IRRADIANCE5) / (TIME6 - TIME5) * (t - TIME5) + IRRADIANCE5;
  elseif TIME7 == 0 then
    Irad := IRRADIANCE6;
  elseif t < TIME7 then
    Irad := (IRRADIANCE7 - IRRADIANCE6) / (TIME7 - TIME6) * (t - TIME6) + IRRADIANCE6;
  elseif TIME8 == 0 then
    Irad := IRRADIANCE7;
  elseif t < TIME8 then
    Irad := (IRRADIANCE8 - IRRADIANCE7) / (TIME8 - TIME7) * (t - TIME7) + IRRADIANCE7;
  elseif TIME9 == 0 then
    Irad := IRRADIANCE8;
  elseif t < TIME9 then
    Irad := (IRRADIANCE9 - IRRADIANCE8) / (TIME9 - TIME8) * (t - TIME8) + IRRADIANCE8;
  elseif TIME10 == 0 then
    Irad := IRRADIANCE9;
  elseif t < TIME10 then
    Irad := (IRRADIANCE10 - IRRADIANCE9) / (TIME10 - TIME9) * (t - TIME9) + IRRADIANCE9;
  else
    Irad := IRRADIANCE10;
  end if;
equation
  der(t) = 1;
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Documentation(info = "<html>

<p>
<b>Notes:</b>
<ul>
<li>A maximum of 10 pairs of time versus irradiance may be specified.</li>
<li>The unused pairs should be entered as zero.</li>
<li>TIME1 should be greater than 0.</li>
<li>Initial irradiance, Irad(0), is calculated from the load flow output.</li>
<li>Irradiance will be kept constant after last non-zero TIME value.</li>
<li>In_Service_Flag flag is disabled and does not affect the model.</li>
</ul>
<img src=\"modelica://OpalRT/resource/Electrical/PV/IRRADU1.png\"


</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Text(origin = {2.29654, 1.75618}, extent = {{-63.4616, 20.9724}, {57.7782, -16.9129}}, textString = "IRRADU1"), Text(origin = {-68.9106, -36.1625}, extent = {{-24.49, 7.17}, {25.845, -11.2266}}, textString = "Irad0"), Text(origin = {70.7084, -37.2713}, extent = {{-24.49, 7.17}, {25.84, -11.23}}, textString = "Irad"), Rectangle(origin = {0.135318, -14.2084}, extent = {{-99.7294, 56.9689}, {99.7294, -56.9689}})}));
end IRRADU1;
