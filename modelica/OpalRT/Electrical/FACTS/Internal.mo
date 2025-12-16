within OpalRT.Electrical.FACTS;
package Internal
  extends Modelica.Icons.InternalPackage;
  block FastOverride
    parameter Real DV;
    parameter Real KSD;
    parameter Real KSVS;
    parameter Real BpMAX;
    parameter Real BpMIN;
    Modelica.Blocks.Interfaces.RealInput BR annotation(Placement(visible = true, transformation(origin = {-100, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput VERR annotation(Placement(visible = true, transformation(origin = {-100, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput BpR annotation(Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  protected
    parameter Real DVLO(fixed = false);
    parameter Real DVHI(fixed = false);
  initial equation
    DVLO = if DV == 0 then BpMAX / KSVS else DV;
    DVHI = if DV == 0 then BpMIN / KSVS else -DV;
  equation
    BpR = if VERR > DVLO then BpMAX + KSD * (VERR - DV) elseif VERR < DVHI then BpMIN else BR;
    annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Rectangle(origin = {0.12837, 0.12837}, extent = {{-99.7433, 100}, {99.7433, -100}}), Text(origin = {-55.3315, 64.057}, extent = {{-33.76, 11.42}, {1.92431, -15.5278}}, textString = "BR"), Text(origin = {-56.64, -36.61}, extent = {{-33.76, 11.42}, {20.662, -13.4761}}, textString = "VERR"), Text(origin = {84.8202, 4.2063}, extent = {{-42.4891, 13.4739}, {1.92, -15.53}}, textString = "BpR")}));
  end FastOverride;

  function nonWindupLimitInitialization
    input Real ICMAX;
    input Real ILMAX;
    input Real Vcutout;
    input Real Xt;
    input Real Elimit;
    input Real Vt0;
    input Real InitialCurrent;
    output Real initialvalue;
    output Real VU0;
    output Real VL0;
  protected
    Real ICMAXf0;
    Real ILMAXf0;
    Real LimitVp0;
  algorithm
    if Vt0 >= Vcutout then
      ICMAXf0 := ICMAX;
    else
      ICMAXf0 := ICMAX * Vt0 / Vcutout;
    end if;
    if Vt0 >= Vcutout then
      ILMAXf0 := ILMAX;
    else
      ILMAXf0 := ILMAX * Vt0 / Vcutout;
    end if;
    if Vt0 + Xt * ICMAXf0 <= Elimit then
      VU0 := Vt0 + Xt * ICMAXf0;
    else
      VU0 := Elimit;
    end if;
    LimitVp0 := Vt0 + InitialCurrent * Xt * 1;
    VL0 := Vt0 - Xt * ILMAXf0;
    if LimitVp0 <= VU0 and LimitVp0 >= VL0 then
      initialvalue := LimitVp0;
    elseif LimitVp0 > VU0 then
      initialvalue := VU0;
    else
      initialvalue := VL0;
    end if;
  end nonWindupLimitInitialization;
end Internal;
