within OpalRT.ePHASORSIM.WrappedModels;
model SM_GENCLS "Single-machine FMU for GENCLS (partType=2)"
  final parameter Integer ephasorsim_minimum_major_version = 12 annotation(Evaluate=true, Dialog(enable=false));
  final parameter Integer ephasorsim_minimum_minor_version = 0 annotation(Evaluate=true, Dialog(enable=false));

  // Bus interface using PIN2INOUT pattern (avoids Kirchhoff zeroing)
  OpalRT.NonElectrical.Connector.PwPinFMU p annotation(Placement(transformation(extent={{-110,-10},{-90,10}}), iconTransformation(extent={{-110,-10},{-90,10}})));
  protected
  OpalRT.NonElectrical.SignalRouting.PIN2INOUT bus0_PIN2INOUT;

  public
  // Machine instance (composition)
  OpalRT.Electrical.Machine.SynchronousMachine.GENCLS machine(
    IBUS = IBUS,
    ID = ID,
    P_gen = P_gen,
    Q_gen = Q_gen,
    Vt_abs = Vt_abs,
    Vt_ang = Vt_ang,
    SB = SB,
    fn = fn,
    H = H,
    D = D,
    ZSOURCE_RE = ZSOURCE_RE,
    ZSOURCE_IM = ZSOURCE_IM,
    useInternalEFDLoop = false) annotation(Placement(transformation(extent={{-40,-40},{40,40}})));

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
  Modelica.Blocks.Interfaces.RealOutput PMECH1 "Mechanical power after trip logic";

  // Parameters forwarded to machine
  parameter Integer IBUS = 100 "Located system bus" annotation(Dialog(tab = "General"));
  parameter String ID = "M1" "Machine Identifier" annotation(Dialog(tab = "General"));
  parameter Real P_gen = 900 "Bus Active Power, MW" annotation(Dialog(tab = "General"));
  parameter Real Q_gen = 200 "Bus Reactive Power, MVAR" annotation(Dialog(tab = "General"));
  parameter Real Vt_abs = 1.03 "Bus Voltage Magnitude, p.u." annotation(Dialog(tab = "General"));
  parameter Real Vt_ang = -10.96 "Bus Voltage Angle, deg." annotation(Dialog(tab = "General"));
  parameter Real SB = 1000 "Machine Base Power, MVA" annotation(Dialog(tab = "General"));
  parameter Real fn = 50 "Nominal frequency" annotation(Dialog(tab = "General"));
  parameter Real H = 5 "Inertia constant" annotation(Dialog(tab = "GENCLS Parameters"));
  parameter Real D = 2 "Speed damping" annotation(Dialog(tab = "GENCLS Parameters"));
  parameter Real ZSOURCE_RE = 0 "Machine source resistance" annotation(Dialog(tab = "GENCLS Parameters"));
  parameter Real ZSOURCE_IM = 0 "Machine source reactance" annotation(Dialog(tab = "GENCLS Parameters"));
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
  PMECH1 = machine.PMECH1;

end SM_GENCLS;
