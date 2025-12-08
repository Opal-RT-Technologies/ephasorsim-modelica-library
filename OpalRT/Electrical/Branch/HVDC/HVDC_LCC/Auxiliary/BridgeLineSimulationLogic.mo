within OpalRT.Electrical.Branch.HVDC.HVDC_LCC.Auxiliary;
model BridgeLineSimulationLogic
  parameter Real RDC = 1 "The DC line resistance in ohms";
  parameter Real DELTI = 0.25 "Margin entred in per unit of desired power or current";
  parameter Real NBR = 1 "Number of bridges in series";
  parameter Real RCR = 0 "Commutating transformer resistance per bridge in ohms";
  parameter Real XCR = 0.57 "Commutating transformer reactance per bridge in ohms";
  parameter Real EBASR = 230 "Primary base ac voltage in kV";
  parameter Real TRR = 1 "Transformer ratio";
  parameter Real TAPR = 1 "Tap setting";
  parameter Real NBI = 1 "Number of bridges in series";
  parameter Real RCI = 0 "Commutating transformer resistance per bridge in ohms";
  parameter Real XCI = 0.57 "Commutating transformer reactance per bridge in ohms";
  parameter Real EBASI = 230 "Primary base ac voltage in kV";
  parameter Real TRI = 1 "Transformer ratio";
  parameter Real TAPI = 1 "Tap setting";
  parameter Real ALFDY = 0 "Minimum alpha for dynamics (degrees)" annotation(Dialog(tab = "Dynamic parameters"));
  parameter Real GAMDY = 0 "Minimum gamma for dynamics (degrees)" annotation(Dialog(tab = "Dynamic parameters"));
  parameter Real C0 = 20 "Minimum current demand (amps)" annotation(Dialog(tab = "Dynamic parameters"));
  parameter Real SB = 100 "Network base Power (MVA)";
  parameter Real GAMMX = 90 "Nominal maximum firing angle in degrees";
  parameter Real GAMMN = 0 "Nominal minimum firing angle in degrees";
  parameter Real Vmag_rec = 1 "inverter side injecting active power" annotation(Dialog(tab = "Power Flow"));
  parameter Real Vang_rec = -7.8102 "inverter side injecting reactive power" annotation(Dialog(tab = "Power Flow"));
  parameter Real Vmag_inv = 1 "inverter side injecting active power" annotation(Dialog(tab = "Power Flow"));
  parameter Real Vang_inv = -24.0517 "inverter side injecting reactive power" annotation(Dialog(tab = "Power Flow"));
  constant Real pi = Modelica.Constants.pi;
  parameter Real Idc0 = 800;
  Real EacI;
  Real EacR;
  Real gamma;
  Real cosalpha;
  Real cosgamma;
  Real alpha;
  Real mui;
  Real mur;
  Real Paci;
  Real Pacr;
  Real tanfi;
  Real tanfr;
  Real Qaci;
  Real Qacr;
  Real t;
  Modelica.Blocks.Interfaces.RealInput Ipset(start = Idc0) annotation(Placement(visible = true, transformation(origin = {-100, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput Idc annotation(Placement(visible = true, transformation(origin = {100, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.Connector.PwPin recp(vr(start = recvr0), vi(start = recvi0)) annotation(Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpalRT.NonElectrical.Connector.PwPin invp(vr(start = invvr0), vi(start = invvi0)) annotation(Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Vpset annotation(Placement(visible = true, transformation(origin = {-100, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput VdcR annotation(Placement(visible = true, transformation(origin = {100, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput VdcI annotation(Placement(visible = true, transformation(origin = {100, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
protected
  parameter Real recvr0(fixed = false);
  parameter Real recvi0(fixed = false);
  parameter Real invvr0(fixed = false);
  parameter Real invvi0(fixed = false);
  parameter Real Alphamin(fixed = false);
  parameter Real Gammamin(fixed = false);
  parameter Real GAMMX0(fixed = false);
  parameter Real GAMMN0(fixed = false);
initial equation
  t = 0;
  Alphamin = ALFDY / 180 * pi;
  Gammamin = GAMDY / 180 * pi;
  recvr0 = Vmag_rec * cos(Vang_rec * pi / 180);
  recvi0 = Vmag_rec * sin(Vang_rec * pi / 180);
  invvr0 = Vmag_inv * cos(Vang_inv * pi / 180);
  invvi0 = Vmag_inv * sin(Vang_inv * pi / 180);
  GAMMX0 = GAMMX;
  GAMMN0 = GAMMN;
algorithm
  EacI := if t < Modelica.Constants.eps then sqrt(invvi0 ^ 2 + invvr0 ^ 2) * EBASI * 1e3 * TRI / TAPI else sqrt(invp.vi ^ 2 + invp.vr ^ 2) * EBASI * 1e3 * TRI / TAPI;
  EacR := if t < Modelica.Constants.eps then sqrt(recvi0 ^ 2 + recvr0 ^ 2) * EBASR * 1e3 * TRR / TAPR else sqrt(recp.vi ^ 2 + recp.vr ^ 2) * EBASR * 1e3 * TRR / TAPR;
  VdcI := Vpset;
  Idc := Ipset;
  VdcR := VdcI + Idc * RDC;
  if abs(GAMMX0 - GAMMN0) < Modelica.Constants.eps then
    gamma := GAMMX0 / 180 * pi;
    VdcI := NBI * (3 * sqrt(2) * EacI * cos(gamma) / pi - 3 * XCI * Idc / pi + 2 * RCI * Idc);
    VdcR := VdcI + Idc * RDC;
    cosalpha := (VdcR / NBR + 3 * XCR * Idc / pi + 2 * RCR * Idc) / (3 * sqrt(2) * EacR / pi);
    if cosalpha > cos(Alphamin) then
      alpha := Alphamin;
      Idc := Ipset - DELTI * Ipset;
      if Idc <= C0 then
        Idc := C0;
      end if;
      VdcR := NBR * (3 * sqrt(2) * EacR / pi * cos(alpha) - 3 * XCI * Idc / pi - 2 * RCR * Idc);
      VdcI := VdcR - Idc * RDC;
      gamma := acos((VdcI / NBI + 3 * XCI * Idc / pi - 2 * RCI * Idc) / (3 * sqrt(2) * EacI / pi));
    else
      alpha := acos(cosalpha);
    end if;
  else
    cosalpha := (VdcR / NBR + 3 * XCR * Idc / pi + 2 * RCR * Idc) / (3 * sqrt(2) * EacR / pi);
    cosgamma := (VdcI / NBI + 3 * XCI * Idc / pi - 2 * RCI * Idc) / (3 * sqrt(2) * EacI / pi);
    if cosalpha >= cos(Alphamin) then
      Idc := Ipset - DELTI * Ipset;
      if Idc <= C0 then
        Idc := C0;
      end if;
      alpha := Alphamin;
      VdcR := NBR * (3 * sqrt(2) * EacR / pi * cos(alpha) - 3 * XCI * Idc / pi - 2 * RCR * Idc);
      VdcI := VdcR - Idc * RDC;
      cosgamma := (VdcI / NBI + 3 * XCI * Idc / pi - 2 * RCI * Idc) / (3 * sqrt(2) * EacI / pi);
    else
      alpha := acos(cosalpha);
    end if;
    if noEvent(cosgamma >= cos(Gammamin)) then
      gamma := Gammamin;
      VdcI := NBI * (3 * sqrt(2) * EacI * cos(gamma) / pi - 3 * XCI * Idc / pi + 2 * RCI * Idc);
      VdcR := VdcI + Idc * RDC;
      alpha := acos((VdcR / NBR + 3 * XCR * Idc / pi + 2 * RCR * Idc) / (3 * sqrt(2) * EacR / pi));
    else
      gamma := acos(cosgamma);
    end if;
  end if;
equation
  mui = acos(cos(gamma) - sqrt(2) * Idc * XCI / EacI) - gamma;
  Paci = (-VdcI * Idc) + 2 * RCI * Idc ^ 2;
  tanfi = (2 * mui + sin(2 * gamma) - sin(2 * (mui + gamma))) / (cos(2 * gamma) - cos(2 * (mui + gamma)));
  Qaci = -Paci * tanfi;
  mur = acos(cos(alpha) - sqrt(2) * Idc * XCR / EacR) - alpha;
  Pacr = VdcR * Idc + 2 * RCR * Idc ^ 2;
  tanfr = (2 * mur + sin(2 * alpha) - sin(2 * (mur + alpha))) / (cos(2 * alpha) - cos(2 * (mur + alpha)));
  Qacr = Pacr * tanfr;
  recp.ir = if t < Modelica.Constants.eps then -1 * (recvr0 * Pacr + recvi0 * Qacr) / (SB * 1000000 * (recvr0 ^ 2 + recvi0 ^ 2)) else -1 * (recp.vr * Pacr + recp.vi * Qacr) / (SB * 1000000 * (recp.vr ^ 2 + recp.vi ^ 2));
  recp.ii = if t < Modelica.Constants.eps then -1 * (recvi0 * Pacr - recvr0 * Qacr) / (SB * 1000000 * (recvr0 ^ 2 + recvi0 ^ 2)) else -1 * (recp.vi * Pacr - recp.vr * Qacr) / (SB * 1000000 * (recp.vr ^ 2 + recp.vi ^ 2));
  invp.ir = if t < Modelica.Constants.eps then -1 * (invvr0 * Paci + invvi0 * Qaci) / (SB * 1000000 * (invvr0 ^ 2 + invvi0 ^ 2)) else -1 * (invp.vr * Paci + invp.vi * Qaci) / (SB * 1000000 * (invp.vr ^ 2 + invp.vi ^ 2));
  invp.ii = if t < Modelica.Constants.eps then -1 * (invvi0 * Paci - invvr0 * Qaci) / (SB * 1000000 * (invvr0 ^ 2 + invvi0 ^ 2)) else -1 * (invp.vi * Paci - invp.vr * Qaci) / (SB * 1000000 * (invp.vr ^ 2 + invp.vi ^ 2));
  der(t) = 1;
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Documentation(info = "<html>

<p>
Bridge_Line_Simulation_Logic: Mathematical model of Inverter,
Converter and also DC line for LCC type HVDC.
</p>
<p>
For the first version of the HVDC_LCC model, the angle limits are not
considered and Nr = 1. In the future version,these will be considered. In
addition, we assume that the HVDC model could find a operation point at
the desired current and voltage values.
</p>
<p>
Description of Inputs:
<li> vR: AC voltage at the rectifier connected bus (p.u.)
<li> vI: AC voltage at the inverter connected bus (p.u.)
<li> Ipset: Reference DC current on the dc link (A)
<li> Vpset: Reference DC voltage on the dc side of the inverter (kV)
<p> Description of Parameters:
</p>
<li> RDC: The dc line resistance; entered in ohms.
<li> DELTI: Margin entered in per unit of desired dc power or current.
  This is the fraction by which the order is reduced when ALPHA is
  at its minimum and the inverter is controlling the line current.
<li> NBR: Number of bridges in series (rectifier). No default allowed.
<li> RCR: Rectifier commutating transformer resistance per bridge;
 entered in ohms.
<li> XCR: Rectifier commutating transformer reactance per bridge;
  entered in ohms.
<li> EBASR: Rectifier primary base ac voltage; entered in kV.
<li> TRR: Rectifier transformer ratio.
<li> TAPR: Rectifier tap setting.
<li> NBI: Number of bridges in series (inverter).
<li> RCI: Inverter commutating transformer resistance per bridge;
  entered in ohms.
<li> XCI: Inverter commutating transformer reactance per bridge;
  entered in ohms.
<li> EBASI: Inverter primary base ac voltage; entered in kV.
<li> TRI: Inverter transformer ratio.
<li> TAPI: Inverter tap setting.
<li> ALFDY: minimum alpha for dynamics (degrees).
<li> GAMDY: minimum alpha for dynamics (degrees).
<li> C0: minimum current demand (amps).
<li> SB: Network base power (MVA).
<li> GAMMX: Maximum gamma firing angle (degrees).
<li> GAMMN: Minimum gamma firing angle (degrees).
<p> Description of Outputs:
</p>
<li> iR: Injected AC current to the rectifier connected bus (p.u.)
<li> iI: Injected AC current to the inverter connected bus (p.u.)
<li> VdcI: DC voltage on the dc side of the inverter (kV)
<li> VdcR: DC voltage on the dc side of the rectifier (kV)
<li> Idc: DC current on the dc link (A)
<li> alpha: Firing angle of the rectifier (rad.)
<li> gamma: Firing angle of the inverter (rad.)


</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Rectangle(origin = {0.455581, -0.911162}, extent = {{-99.7722, 100}, {99.7722, -100}}), Text(origin = {-90.2065, 48.8595}, extent = {{-10.93, 4.67}, {10.93, -4.67}}, textString = "Ipset"), Text(origin = {-84.282, 3.18722}, extent = {{-16.4, 6.61}, {3.41595, -3.19314}}, textString = "Vpset"), Text(origin = {86.67, 59.45}, extent = {{-9.91, 4.78}, {9.91, -4.78}}, textString = "VdcI"), Text(origin = {93.3962, 19.701}, extent = {{-11.16, 6.26}, {0.45385, -6.03221}}, textString = "Idc"), Text(origin = {91.1135, -21.8686}, extent = {{-12.07, 5.92}, {8.65314, -5.23663}}, textString = "VdcR"), Text(origin = {-85.1954, -69.4687}, extent = {{-15.49, -4.78}, {15.49, 4.78}}, textString = "recpin"), Text(origin = {88.5009, -75.512}, extent = {{-11.28, 4.9}, {11.28, -4.9}}, textString = "invpin"), Text(origin = {0.167496, 2.0266}, extent = {{-69.2, 24.7}, {69.2, -24.7}}, textString = "Line_logic")}));
end BridgeLineSimulationLogic;
