within OpalRT.Electrical.Control.Excitation;
model REXSYS "General-Purpose Rotating Excitation System Model"
  extends OpalRT.Electrical.PartialModel.Exciter;
  parameter Integer IBUS = 100 "Located Bus No.";
  parameter String ID = "M1" "Machine Identifier";
  parameter Real TR = 0.02 "voltage transducer time constant (sec) ";
  parameter Real KVP = 600 "voltage regulator proportional gain ";
  parameter Real KVI = 0.5 "voltage regulator integral gain ";
  parameter Real VIMAX = 0.2 "voltage regulator input limit (pu) ";
  parameter Real TA = 0.02 "voltage regulator time constant (sec) ";
  parameter Real TB1 = 1 "lag-time constant (sec) ";
  parameter Real TC1 = 10 "lead-time constant (sec) ";
  parameter Real TB2 = 1.0 "lag-time constant (sec) ";
  parameter Real TC2 = 1.0 "lead-time constant (sec) ";
  parameter Real VRMAX = 10 "maximum controller output (pu) ";
  parameter Real VRMIN = -10 "minimum controller output (pu) ";
  parameter Real KF = 0.045 "rate feedback gain ";
  parameter Real TF = 5 "rate feedback >0 time constant (sec) ";
  parameter Real TF1 = 1 "feedback lead-time constant (sec) ";
  parameter Real TF2 = 1 "feedback lag-time constant (sec) ";
  parameter Real FBF = 1 "rate feedback signal flag ";
  parameter Real KIP = 5.0 "field current regulator proportional gain ";
  parameter Real KII = 0.5 "field current regulator integral gain ";
  parameter Real TP = 0.5 "field current bridge time constant (sec) ";
  parameter Real VFMAX = 99 "maximum exciter field current (pu ";
  parameter Real VFMIN = -99 "minimum exciter field current (pu) ";
  parameter Real KH = 0.5 "field voltage controller feedback gain ";
  parameter Real KE = 0.4 "exciter field proportional constant";
  parameter Real TE = 1.2 "exciter field time constant (sec >0)";
  parameter Real KC = 0.5 "rectifier regulation factor (pu)";
  parameter Real KD = 0.7 "exciter regulation factor (pu)";
  parameter Real E1 = 2.4 "exciter flux at knee of curve (pu) ";
  parameter Real SE_E1 = 0.05 "saturation factor at knee";
  parameter Real E2 = 3.2 "maximum exciter (pu)";
  parameter Real SE_E2 = 0.3 "saturation factor at maximum flux";
  parameter Real F1IMF = 0.5 "power supply limit factor";
  import sat_q = OpalRT.NonElectrical.Math.Nonlinear.computeSaturationQuadratic;
  import OpalRT.Electrical.Control.Excitation.Common.rectifierFunction;

  OpalRT.Electrical.Control.Excitation.Internal.CurrentRegulatorAndRotatingExciter
    current_regulator_and_roating_exciter1(
    KIP=KIP,
    KII=KII,
    TP=TP,
    VFMAX=VFMAX,
    VFMIN=VFMIN,
    KH=KH,
    KE=KE,
    TE=TE,
    KC=KC,
    KD=KD,
    E1=E1,
    SE_E1=SE_E1,
    E2=E2,
    SE_E2=SE_E2,
    F1IMF=F1IMF,
    IFE0=IFE0,
    VE0=VE0) annotation (Placement(visible=true, transformation(
        origin={0,40},
        extent={{-27.5,-27.5},{27.5,27.5}},
        rotation=0)));
  OpalRT.Electrical.Control.Excitation.Internal.VoltageRegulator
    voltage_regulator1(
    TR=TR,
    KVP=KVP,
    KVI=KVI,
    VIMAX=VIMAX,
    TA=TA,
    TB1=TB1,
    TC1=TC1,
    TB2=TB2,
    TC2=TC2,
    VRMAX=VRMAX,
    VRMIN=VRMIN,
    KF=KF,
    TF=TF,
    TF1=TF1,
    TF2=TF2,
    FBF=FBF,
    ECOMP0=ECOMP0,
    VR0=VR0) annotation (Placement(visible=true, transformation(
        origin={0,-40},
        extent={{-32.5,-32.5},{32.5,32.5}},
        rotation=0)));
  Modelica.Blocks.Math.Add3 add31 annotation(Placement(visible = true, transformation(origin = {-58, -32}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 1) annotation(Placement(visible = true, transformation(origin = {-60, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const1(k = VREF_0) annotation(Placement(transformation(extent = {{-139, 34}, {-119, 54}})));
  Modelica.Blocks.Math.Add add1 annotation(Placement(visible = true, transformation(origin = {-120, 20}, extent = {{-5, -5}, {5, 5}}, rotation = -90)));
  Modelica.Blocks.Sources.RealExpression Ecomp(y = ETERM) annotation(Placement(visible = true, transformation(origin = {-59, -46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
protected
  parameter Real IFE0(fixed = false);
  parameter Real VE0(fixed = false, start = 1);
  parameter Real ECOMP0(fixed = false);
  parameter Real LadIfd0(fixed = false);
  parameter Real VR0(fixed = false);
  parameter Real IN0(fixed = false);
  parameter Real SE0(fixed = false);
  parameter Real FEX0(fixed = false);
  parameter Real VS0(fixed = false);
  parameter Real VREF_0(fixed = false);
initial equation
  ECOMP0 = ETERM0;
  LadIfd0 = XADIFD;
  IN0 = KC * LadIfd0 / VE0;
  EFD0 = VE0 * FEX0;
  SE0 = sat_q(EFD0, E1, E2, SE_E1, SE_E2);
  VS0 = VOTHSG + VUEL + VOEL;
initial algorithm
  FEX0 := rectifierFunction(IN0);
  IFE0 := LadIfd0 * KD + (KE + SE0) * VE0;
  if KII == 0 then
    VR0 := (KH + 1 / KIP) * IFE0;
  else
    VR0 := KH * IFE0;
  end if;
  if KVI == 0 then
    VREF_0 := VR0 / KVP + ECOMP0 - VS0;
  else
    VREF_0 := ECOMP0 - VS0;
  end if;
  VUEL0 := 0;
  VOEL0 := 0;
equation
  connect(VF, voltage_regulator1.VF) annotation(Line(points = {{100, 80}, {78.5877, 80}, {78.5877, -33.4852}, {32.5, -33.4852}, {32.5, -33.5}}, color = {0, 0, 127}));
  connect(current_regulator_and_roating_exciter1.F, const.y) annotation(Line(points = {{-27.5, 40}, {-48.9749, 40}, {-49, 40}}, color = {0, 0, 127}));
  connect(voltage_regulator1.F, const.y) annotation(Line(points = {{-32.5, -20.5}, {-40.3189, -20.5}, {-40.3189, 40.3189}, {-49, 40.3189}, {-49, 40}}, color = {0, 0, 127}));
  connect(Ecomp.y, voltage_regulator1.ECOMP) annotation(Line(points = {{-48, -46}, {-32, -46}}, color = {0, 0, 127}));
  connect(add1.y, voltage_regulator1.VREF) annotation(Line(points={{-120,14.5},{
          -120,-59.6401},{-32.5,-59.6401},{-32.5,-59.5}},                                                                                         color = {0, 0, 127}));
  connect(dVREF, add1.u1) annotation(Line(points={{-100,58},{-109.769,58},{-109.769,
          30.0771},{-116.71,30.0771},{-116.71,26},{-117,26}},                                                                                                     color = {0, 0, 127}));
  connect(add31.y, voltage_regulator1.VS) annotation(Line(points = {{-52.5, -32}, {-44.8802, -32}, {-44.8802, -33.1155}, {-32.5, -33.1155}, {-32.5, -33.5}}, color = {0, 0, 127}));
  connect(voltage_regulator1.EFD, current_regulator_and_roating_exciter1.EFD) annotation(Line(points = {{32.5, -59.5}, {64.7059, -59.5}, {64.7059, 39.8693}, {27.5, 39.8693}, {27.5, 40}}, color = {0, 0, 127}));
  connect(current_regulator_and_roating_exciter1.IFE, voltage_regulator1.IFE) annotation(Line(points = {{27.5, 23.5}, {41.8301, 23.5}, {41.8301, 11.329}, {54.6841, 11.329}, {54.6841, -39.4336}, {32.5, -39.4336}, {32.5, -40}}, color = {0, 0, 127}));
  connect(current_regulator_and_roating_exciter1.VR, voltage_regulator1.VR) annotation(Line(points = {{-27.5, 23.5}, {-34.6405, 23.5}, {-34.6405, 4.13943}, {49.0196, 4.13943}, {49.0196, -21.1329}, {32.5, -21.1329}, {32.5, -20.5}}, color = {0, 0, 127}));
  connect(EFD, current_regulator_and_roating_exciter1.EFD) annotation(Line(points = {{100, 0}, {84, 0}, {84, 40.5954}, {27.5, 40.5954}, {27.5, 40}}, color = {0, 0, 127}));
  connect(XADIFD, current_regulator_and_roating_exciter1.LadIfd) annotation(Line(points = {{-100, -64}, {-82, -64}, {-82, 62}, {-27.5, 62}}, color = {0, 0, 127}));
  connect(VOTHSG, add31.u3) annotation(Line(points = {{-100, -36}, {-64, -36}}, color = {0, 0, 127}));
  connect(add31.u2, VOEL) annotation(Line(points = {{-64, -32}, {-80, -32}, {-80, -8}, {-100, -8}}, color = {0, 0, 127}));
  connect(add31.u1, VUEL) annotation(Line(points = {{-64, -28}, {-76, -28}, {-76, 20}, {-100, 20}}, color = {0, 0, 127}));
  connect(const1.y, add1.u2) annotation(Line(points={{-118,44},{-116.195,44},{-116.195,
          31.8766},{-122.622,31.8766},{-122.622,26},{-123,26}},                                                                                                         color = {0, 0, 127}));
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Documentation(info = "<html>
<p>
This model is a simplified version of GE General purpose excitation model.
<p>
<b>Note</b>: The model works only for FBF = 1.
<img src=\"modelica://OpalRT/resource/Excitation/REXSYS_ROATING_EXCITER_EXCITER_FIELD_CURRENT_REGULATOR.png\"
alt=\"REXSYS_ROATING_EXCITER_EXCITER_FIELD_CURRENT_REGULATOR.png\"><br>
<img src=\"modelica://OpalRT/resource/Excitation/REXSYS_VOLTAGE_REGULATOR.png\"
alt=\"REXSYS_VOLTAGE_REGULATOR.png\"><br>

</html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
end REXSYS;
