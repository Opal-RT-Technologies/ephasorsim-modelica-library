within OpalRT.ePHASORSIM.WrappedModels;
model SM_GENSAL "Single-machine FMU for GENSAL (partType=2)"
  final parameter Integer ephasorsim_minimum_major_version = 12 annotation(Evaluate=true, Dialog(enable=false));
  final parameter Integer ephasorsim_minimum_minor_version = 0 annotation(Evaluate=true, Dialog(enable=false));

  // Bus interface using PIN2INOUT pattern (avoids Kirchhoff zeroing)
  OpalRT.NonElectrical.Connector.PwPinFMU p annotation(Placement(transformation(extent={{-110,-10},{-90,10}}), iconTransformation(extent={{-110,-10},{-90,10}})));
  protected
  OpalRT.NonElectrical.SignalRouting.PIN2INOUT bus0_PIN2INOUT;

  public
  // Machine instance (composition)
  OpalRT.Electrical.Machine.SynchronousMachine.GENSAL machine(
    IBUS = IBUS,
    ID = ID,
    P_gen = P_gen,
    Q_gen = Q_gen,
    Vt_abs = Vt_abs,
    Vt_ang = Vt_ang,
    SB = SB,
    fn = fn,
    ZSOURCE_RE = ZSOURCE_RE,
    Tdo_p = Tdo_p,
    Tdo_s = Tdo_s,
    Tqo_s = Tqo_s,
    H = H,
    D = D,
    Xd = Xd,
    Xq = Xq,
    Xd_p = Xd_p,
    Xd_s = Xd_s,
    Xl = Xl,
    S1 = S1,
    S12 = S12) annotation(Placement(transformation(extent={{-40,-40},{40,40}})));

  // Controller routing pins (flat names for C++)
  Modelica.Blocks.Interfaces.RealInput EFD annotation(Placement(transformation(extent={{-110,18},{-90,38}}), iconTransformation(extent={{-110,18},{-90,38}})));
  Modelica.Blocks.Interfaces.RealInput PMECH annotation(Placement(transformation(extent={{-110,-70},{-90,-50}}), iconTransformation(extent={{-110,-70},{-90,-50}})));
  Modelica.Blocks.Interfaces.RealInput TRIP annotation(Placement(transformation(extent={{-10,-10},{10,10}}, rotation=-90, origin={0,100}), iconTransformation(extent={{-10,-10},{10,10}}, rotation=-90, origin={0,100})));
  Modelica.Blocks.Interfaces.RealOutput EFD0 annotation(Placement(transformation(extent={{90,70},{110,90}}), iconTransformation(extent={{90,70},{110,90}})));
  Modelica.Blocks.Interfaces.RealOutput PMECH0 annotation(Placement(transformation(extent={{90,50},{110,70}}), iconTransformation(extent={{90,50},{110,70}})));
  Modelica.Blocks.Interfaces.RealOutput SLIP annotation(Placement(transformation(extent={{90,30},{110,50}}), iconTransformation(extent={{90,30},{110,50}})));
  Modelica.Blocks.Interfaces.RealOutput XADIFD annotation(Placement(transformation(extent={{90,10},{110,30}}), iconTransformation(extent={{90,10},{110,30}})));
  Modelica.Blocks.Interfaces.RealOutput AccPower annotation(Placement(transformation(extent={{90,-10},{110,10}}), iconTransformation(extent={{90,-10},{110,10}})));
  Modelica.Blocks.Interfaces.RealOutput MBASE annotation(Placement(transformation(extent={{90,-30},{110,-10}}), iconTransformation(extent={{90,-30},{110,-10}})));
  Modelica.Blocks.Interfaces.RealOutput ETERM0 annotation(Placement(transformation(extent={{90,-50},{110,-30}}), iconTransformation(extent={{90,-50},{110,-30}})));
  Modelica.Blocks.Interfaces.RealOutput EX_AUX[4] annotation(Placement(transformation(extent={{90,-70},{110,-50}}), iconTransformation(extent={{90,-70},{110,-50}})));
  Modelica.Blocks.Interfaces.RealOutput VI[4] annotation(Placement(transformation(extent={{90,-90},{110,-70}}), iconTransformation(extent={{90,-90},{110,-70}})));

  // Monitoring outputs (internal machine variables exposed for data paths)
  Modelica.Blocks.Interfaces.RealOutput ANGLE "Rotor angle, rad";
  Modelica.Blocks.Interfaces.RealOutput TELEC "Electrical torque, pu";
  Modelica.Blocks.Interfaces.RealOutput EFD1 "Field voltage after trip logic";
  Modelica.Blocks.Interfaces.RealOutput PMECH1 "Mechanical power after trip logic";

  // Parameters forwarded to machine
  parameter Integer IBUS = 100 "Located system bus" annotation(Dialog(tab = "General"));
  parameter String ID = "M1" "Machine Identifier" annotation(Dialog(tab = "General"));
  parameter Real P_gen = 1100 "Bus Active Power, MW" annotation(Dialog(tab = "General"));
  parameter Real Q_gen = 342.702 "Bus Reactive Power, MVAR" annotation(Dialog(tab = "General"));
  parameter Real Vt_abs = 1.03 "Bus Voltage Magnitude, p.u." annotation(Dialog(tab = "General"));
  parameter Real Vt_ang = -10.96 "Bus Voltage Angle, deg." annotation(Dialog(tab = "General"));
  parameter Real SB = 1000 "Machine Base Power, MVA" annotation(Dialog(tab = "General"));
  parameter Real fn = 50 "Nominal frequency" annotation(Dialog(tab = "General"));
  parameter Real ZSOURCE_RE = 0 "Machine source impedance" annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real Tdo_p = 7 "d-axis transient time constant" annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real Tdo_s = 0.03 "d-axis sub-transient time constant, s" annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real Tqo_s = 0.04 "q-axis sub-transient time constant, s" annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real H = 50 "Inertia constant" annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real D = 0 "Speed damping" annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real Xd = 0.2 "d-axis reactance, p.u." annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real Xq = 0.19 "q-axis reactance, p.u." annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real Xd_p = 0.06 "d-axis transient reactance, p.u." annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real Xd_s = 0.02 "d-axis sub-transient reactance, p.u." annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real Xl = 0.03 "Leakage reactance, p.u." annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real S1 = 0.4 "Saturation at 1 p.u." annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real S12 = 0.8 "Saturation at 1.2 p.u." annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real partType = 2 "Component type: 2=Machine";

equation
  // Connect machine to PIN2INOUT (handles flow properly — no boundary zeroing)
  connect(machine.p, bus0_PIN2INOUT.p);

  // Feed bus voltage through PIN2INOUT from PwPinFMU input
  bus0_PIN2INOUT.vr = p.vr;
  bus0_PIN2INOUT.vi = p.vi;

  // Read current from PIN2INOUT
  p.ir = bus0_PIN2INOUT.ir;
  p.ii = bus0_PIN2INOUT.ii;

  // Controller routing
  connect(EFD, machine.EFD);
  connect(PMECH, machine.PMECH);
  connect(TRIP, machine.TRIP);
  connect(machine.EFD0, EFD0);
  connect(machine.PMECH0, PMECH0);
  connect(machine.SLIP, SLIP);
  connect(machine.XADIFD, XADIFD);
  connect(machine.AccPower, AccPower);
  connect(machine.MBASE, MBASE);
  connect(machine.ETERM0, ETERM0);
  connect(machine.EX_AUX, EX_AUX);

  // VI array
  VI[1] = machine.VI[1];
  VI[2] = machine.VI[2];
  VI[3] = machine.VI[3];
  VI[4] = machine.VI[4];

  // Monitoring outputs
  ANGLE = machine.ANGLE;
  TELEC = machine.TELEC;
  EFD1 = machine.EFD1;
  PMECH1 = machine.PMECH1;

end SM_GENSAL;
