within OpalRT.ModelSets.TypeD;
model GENSAL_ESST4B_WEHGOV
  extends GenUnitTypeD1(constVOEL(k=noVOEL), redeclare Electrical.Machine.SynchronousMachine.GENSAL synchronousGenerator(
      IBUS=IBUS,
      ID=ID,
      P_gen=P_gen,
      Q_gen=Q_gen,
      Vt_abs=Vt_abs,
      Vt_ang=Vt_ang,
      SB=SB,
      fn=fn,
      ZSOURCE_RE=ZSOURCE_RE,
      Tdo_p=Tdo_p,
      Tdo_s=Tdo_s,
      Tqo_s=Tqo_s,
      H=H,
      D=D,
      Xd=Xd,
      Xq=Xq,
      Xd_p=Xd_p,
      Xd_s=Xd_s,
      Xl=Xl,
      S1=S1,
      S12=S12), redeclare Electrical.Control.Excitation.ESST4B exciter(
      TR=TR_ex,
      KPR=KPR_ex,
      KIR=KIR_ex,
      VRMAX=VRMAX_ex,
      VRMIN=VRMIN_ex,
      TA=TA_ex,
      KPM=KPM_ex,
      KIM=KIM_ex,
      VMMAX=VMMAX_ex,
      VMMIN=VMMIN_ex,
      KG=KG_ex,
      KP=KP_ex,
      KI=KI_ex,
      VBMAX=VBMAX_ex,
      KC=KC_ex,
      XL=XL_ex,
      THETAP=THETAP_ex), redeclare Electrical.Control.TurbineGovernor.WEHGOV turbineGovernor(
      R_PERM_GATE=R_PERM_GATE_tg,
      R_PERM_PE=R_PERM_PE_tg,
      TPE=TPE_tg,
      KP=KP_tg,
      KI=KI_tg,
      KD=KD_tg,
      TD=TD_tg,
      TP=TP_tg,
      TDV=TDV_tg,
      Tg=Tg_tg,
      GTMXOP=GTMXOP_tg,
      GTMXCL=GTMXCL_tg,
      GMAX=GMAX_tg,
      GMIN=GMIN_tg,
      DTURB=DTURB_tg,
      TW=TW_tg,
      DBAND=DBAND_tg,
      DPV=DPV_tg,
      DICN=DICN_tg,
      GATE1=GATE1_tg,
      FLOWG1=FLOWG1_tg,
      GATE2=GATE2_tg,
      FLOWG2=FLOWG2_tg,
      GATE3=GATE3_tg,
      FLOWG3=FLOWG3_tg,
      GATE4=GATE4_tg,
      FLOWG4=FLOWG4_tg,
      GATE5=GATE5_tg,
      FLOWG5=FLOWG5_tg,
      FLOWP1=FLOWP1_tg,
      PMECH1=PMECH1_tg,
      FLOWP2=FLOWP2_tg,
      PMECH2=PMECH2_tg,
      FLOWP3=FLOWP3_tg,
      PMECH3=PMECH3_tg,
      FLOWP4=FLOWP4_tg,
      PMECH4=PMECH4_tg,
      FLOWP5=FLOWP5_tg,
      PMECH5=PMECH5_tg,
      FLOWP6=FLOWP6_tg,
      PMECH6=PMECH6_tg,
      FLOWP7=FLOWP7_tg,
      PMECH7=PMECH7_tg,
      FLOWP8=FLOWP8_tg,
      PMECH8=PMECH8_tg,
      FLOWP9=FLOWP9_tg,
      PMECH9=PMECH9_tg,
      FLOWP10=FLOWP10_tg,
      PMECH10=PMECH10_tg,
      M=M_tg));

  parameter Real partType = 1;
  // GENSAL Parameters
  parameter Integer IBUS = 100 "Located system bus" annotation(Dialog(tab = "General"));
  parameter String ID = "M1" "Machine Identifier" annotation(Dialog(tab = "GENSAL"));
  parameter Real P_gen = 1100 "Bus Active Power, MW" annotation(Dialog(tab = "General"));
  parameter Real Q_gen = 342.702 "Bus Reactive Power, MVAR" annotation(Dialog(tab = "General"));
  parameter Real Vt_abs = 1.03 "Bus Voltage Magnitude, p.u." annotation(Dialog(tab = "General"));
  parameter Real Vt_ang = -10.96 "Bus Voltage Angle, deg." annotation(Dialog(tab = "General"));
  parameter Real SB = 1000 "Machine Base Power, MVA" annotation(Dialog(tab = "General"));
  parameter Real fn = 50 "Nominal frequency" annotation(Dialog(tab = "General"));
  parameter Real ZSOURCE_RE = 0 "Machine source impedence" annotation(Dialog(tab = "GENSAL"));
  parameter Real Tdo_p = 7 "d-axis transient time constant" annotation(Dialog(tab = "GENSAL"));
  parameter Real Tdo_s = 0.03 "d-axis sub-transient time constant, s" annotation(Dialog(tab = "GENSAL"));
  parameter Real Tqo_s = 0.04 "d-axis sub-transient time constant, s" annotation(Dialog(tab = "GENSAL"));
  parameter Real H = 50 "Inertia constant" annotation(Dialog(tab = "GENSAL"));
  parameter Real D = 0 "Speed damping" annotation(Dialog(tab = "GENSAL"));
  parameter Real Xd = 0.2 "d-axis reactance, p.u." annotation(Dialog(tab = "GENSAL"));
  parameter Real Xq = 0.19 "q-axis reactance, p.u." annotation(Dialog(tab = "GENSAL"));
  parameter Real Xd_p = 0.06 "d-axis transient reactance, p.u." annotation(Dialog(tab = "GENSAL"));
  parameter Real Xd_s = 0.02 "d-axis sub-transient reactance, p.u." annotation(Dialog(tab = "GENSAL"));
  parameter Real Xl = 0.03 "Reactance due to the leakage flux which does not cross the air gap, p.u." annotation(Dialog(tab = "GENSAL"));
  parameter Real S1 = 0.4 "saturation function value for 1 p.u. input" annotation(Dialog(tab = "GENSAL"));
  parameter Real S12 = 0.8 "saturation function value for 1.2 p.u. input" annotation(Dialog(tab = "GENSAL"));
  //ESST4B parameter
  parameter Real TR_ex = 0.02 annotation(Dialog(tab = "ESST4B"));
  parameter Real KPR_ex = 1 annotation(Dialog(tab = "ESST4B"));
  parameter Real KIR_ex = 0.03 annotation(Dialog(tab = "ESST4B"));
  parameter Real VRMAX_ex = 10 annotation(Dialog(tab = "ESST4B"));
  parameter Real VRMIN_ex = -10 annotation(Dialog(tab = "ESST4B"));
  parameter Real TA_ex = 0.2 annotation(Dialog(tab = "ESST4B"));
  parameter Real KPM_ex = 0.02 annotation(Dialog(tab = "ESST4B"));
  parameter Real KIM_ex = 0.02 annotation(Dialog(tab = "ESST4B"));
  parameter Real VMMAX_ex = 0.02 annotation(Dialog(tab = "ESST4B"));
  parameter Real VMMIN_ex = 0.02 annotation(Dialog(tab = "ESST4B"));
  parameter Real KG_ex = 0.02 annotation(Dialog(tab = "ESST4B"));
  parameter Real KP_ex = 0.02 annotation(Dialog(tab = "ESST4B"));
  parameter Real KI_ex = 0.02 annotation(Dialog(tab = "ESST4B"));
  parameter Real VBMAX_ex = 0.02 annotation(Dialog(tab = "ESST4B"));
  parameter Real KC_ex = 0.02 annotation(Dialog(tab = "ESST4B"));
  parameter Real XL_ex = 0.02 annotation(Dialog(tab = "ESST4B"));
  parameter Real THETAP_ex = 0.52 "radian" annotation(Dialog(tab = "ESST4B"));
  //WEHGOV parameter
  parameter Real R_PERM_GATE_tg = 0.04 annotation(Dialog(tab = "WEHGOV"));
  parameter Real R_PERM_PE_tg = 0.05 annotation(Dialog(tab = "WEHGOV"));
  parameter Real TPE_tg = 1.0 annotation(Dialog(tab = "WEHGOV"));
  parameter Real KP_tg = 1.0 annotation(Dialog(tab = "WEHGOV"));
  parameter Real KI_tg = 0.1 annotation(Dialog(tab = "WEHGOV"));
  parameter Real KD_tg = 0.01 annotation(Dialog(tab = "WEHGOV"));
  parameter Real TD_tg = 0.01 annotation(Dialog(tab = "WEHGOV"));
  parameter Real TP_tg = 0.2 annotation(Dialog(tab = "WEHGOV"));
  parameter Real TDV_tg = 0.3 annotation(Dialog(tab = "WEHGOV"));
  parameter Real Tg_tg = 0.2 annotation(Dialog(tab = "WEHGOV"));
  parameter Real GTMXOP_tg = 0.01 annotation(Dialog(tab = "WEHGOV"));
  parameter Real GTMXCL_tg = -0.01 annotation(Dialog(tab = "WEHGOV"));
  parameter Real GMAX_tg = 1.0 annotation(Dialog(tab = "WEHGOV"));
  parameter Real GMIN_tg = 0.0 annotation(Dialog(tab = "WEHGOV"));
  parameter Real DTURB_tg = 0.01 annotation(Dialog(tab = "WEHGOV"));
  parameter Real TW_tg = 1.0 annotation(Dialog(tab = "WEHGOV"));
  parameter Real DBAND_tg = 0.01 annotation(Dialog(tab = "WEHGOV"));
  parameter Real DPV_tg = 0.0 annotation(Dialog(tab = "WEHGOV"));
  parameter Real DICN_tg = 0.04 annotation(Dialog(tab = "WEHGOV"));
  parameter Real GATE1_tg = 0.0 annotation(Dialog(tab = "WEHGOV"));
  parameter Real FLOWG1_tg = 0.0 annotation(Dialog(tab = "WEHGOV"));
  parameter Real GATE2_tg = 1.0 annotation(Dialog(tab = "WEHGOV"));
  parameter Real FLOWG2_tg = 1.0 annotation(Dialog(tab = "WEHGOV"));
  parameter Real GATE3_tg = 1.0 annotation(Dialog(tab = "WEHGOV"));
  parameter Real FLOWG3_tg = 1.0 annotation(Dialog(tab = "WEHGOV"));
  parameter Real GATE4_tg = 1.0 annotation(Dialog(tab = "WEHGOV"));
  parameter Real FLOWG4_tg = 1.0 annotation(Dialog(tab = "WEHGOV"));
  parameter Real GATE5_tg = 1.0 annotation(Dialog(tab = "WEHGOV"));
  parameter Real FLOWG5_tg = 1.0 annotation(Dialog(tab = "WEHGOV"));
  parameter Real FLOWP1_tg = 0.0 annotation(Dialog(tab = "WEHGOV"));
  parameter Real PMECH1_tg = 0.0 annotation(Dialog(tab = "WEHGOV"));
  parameter Real FLOWP2_tg = 0.1 annotation(Dialog(tab = "WEHGOV"));
  parameter Real PMECH2_tg = 0.1 annotation(Dialog(tab = "WEHGOV"));
  parameter Real FLOWP3_tg = 0.2 annotation(Dialog(tab = "WEHGOV"));
  parameter Real PMECH3_tg = 0.1 annotation(Dialog(tab = "WEHGOV"));
  parameter Real FLOWP4_tg = 0.3 annotation(Dialog(tab = "WEHGOV"));
  parameter Real PMECH4_tg = 0.3 annotation(Dialog(tab = "WEHGOV"));
  parameter Real FLOWP5_tg = 0.4 annotation(Dialog(tab = "WEHGOV"));
  parameter Real PMECH5_tg = 0.4 annotation(Dialog(tab = "WEHGOV"));
  parameter Real FLOWP6_tg = 0.5 annotation(Dialog(tab = "WEHGOV"));
  parameter Real PMECH6_tg = 0.5 annotation(Dialog(tab = "WEHGOV"));
  parameter Real FLOWP7_tg = 0.6 annotation(Dialog(tab = "WEHGOV"));
  parameter Real PMECH7_tg = 0.6 annotation(Dialog(tab = "WEHGOV"));
  parameter Real FLOWP8_tg = 0.7 annotation(Dialog(tab = "WEHGOV"));
  parameter Real PMECH8_tg = 0.7 annotation(Dialog(tab = "WEHGOV"));
  parameter Real FLOWP9_tg = 0.8 annotation(Dialog(tab = "WEHGOV"));
  parameter Real PMECH9_tg = 0.8 annotation(Dialog(tab = "WEHGOV"));
  parameter Real FLOWP10_tg = 1.00 annotation(Dialog(tab = "WEHGOV"));
  parameter Real PMECH10_tg = 1.00 annotation(Dialog(tab = "WEHGOV"));
  parameter Real M_tg = 0 annotation(Dialog(tab = "WEHGOV"));
  //
  parameter Real noVOEL(fixed = false) "Constant output value";
initial equation
  noVOEL = Modelica.Constants.inf;

end GENSAL_ESST4B_WEHGOV;
