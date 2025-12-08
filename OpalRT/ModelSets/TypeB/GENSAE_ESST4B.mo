within OpalRT.ModelSets.TypeB;
model GENSAE_ESST4B
  extends GenUnitTypeB1(constVOEL(k=noVOEL), redeclare Electrical.Machine.SynchronousMachine.GENSAE synchronousGenerator(
      IBUS=IBUS,
      ID=M_ID,
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
      THETAP=THETAP_ex));

  parameter Real partType = 1;
  // GENSAL Parameters
  parameter Integer IBUS = 100 "Located system bus" annotation(Dialog(tab = "General"));
  parameter String M_ID = "M1" "Machine Identifier" annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real P_gen = 1100 "Bus Active Power, MW" annotation(Dialog(tab = "General"));
  parameter Real Q_gen = 342.702 "Bus Reactive Power, MVAR" annotation(Dialog(tab = "General"));
  parameter Real Vt_abs = 1.03 "Bus Voltage Magnitude, p.u." annotation(Dialog(tab = "General"));
  parameter Real Vt_ang = -10.96 "Bus Voltage Angle, deg." annotation(Dialog(tab = "General"));
  parameter Real SB = 1000 "Machine Base Power, MVA" annotation(Dialog(tab = "General"));
  parameter Real fn = 50 "Nominal frequency" annotation(Dialog(tab = "General"));
  parameter Real ZSOURCE_RE = 0 "Machine source impedence" annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real Tdo_p = 10 "d-axis transient time constant" annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real Tdo_s = 0.05 "d-axis sub-transient time constant, s" annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real Tqo_s = 0.01 "d-axis sub-transient time constant, s" annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real H = 50 "Inertia constant" annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real D = 0 "Speed damping" annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real Xd = 0.2 "d-axis reactance, p.u." annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real Xq = 0.19 "q-axis reactance, p.u." annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real Xd_p = 0.06 "d-axis transient reactance, p.u." annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real Xd_s = 0.02 "d-axis sub-transient reactance, p.u." annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real Xl = 0.03 "Reactance due to the leakage flux which does not cross the air gap, p.u." annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real S1 = 0.4 "saturation function value for 1 p.u. input" annotation(Dialog(tab = "GENSAL Parameters"));
  parameter Real S12 = 0.8 "saturation function value for 1.2 p.u. input" annotation(Dialog(tab = "GENSAL Parameters"));
  // ESST4B Parameters
  parameter Real TR_ex = 0.02 annotation(Dialog(tab = "ESST4B Parameters"));
  parameter Real KPR_ex = 1 annotation(Dialog(tab = "ESST4B Parameters"));
  parameter Real KIR_ex = 0.03 annotation(Dialog(tab = "ESST4B Parameters"));
  parameter Real VRMAX_ex = 10 annotation(Dialog(tab = "ESST4B Parameters"));
  parameter Real VRMIN_ex = -10 annotation(Dialog(tab = "ESST4B Parameters"));
  parameter Real TA_ex = 0.2 annotation(Dialog(tab = "ESST4B Parameters"));
  parameter Real KPM_ex = 0.02 annotation(Dialog(tab = "ESST4B Parameters"));
  parameter Real KIM_ex = 0.02 annotation(Dialog(tab = "ESST4B Parameters"));
  parameter Real VMMAX_ex = 0.02 annotation(Dialog(tab = "ESST4B Parameters"));
  parameter Real VMMIN_ex = 0.02 annotation(Dialog(tab = "ESST4B Parameters"));
  parameter Real KG_ex = 0.02 annotation(Dialog(tab = "ESST4B Parameters"));
  parameter Real KP_ex = 0.02 annotation(Dialog(tab = "ESST4B Parameters"));
  parameter Real KI_ex = 0.02 annotation(Dialog(tab = "ESST4B Parameters"));
  parameter Real VBMAX_ex = 0.02 annotation(Dialog(tab = "ESST4B Parameters"));
  parameter Real KC_ex = 0.02 annotation(Dialog(tab = "ESST4B Parameters"));
  parameter Real XL_ex = 0.02 annotation(Dialog(tab = "ESST4B Parameters"));
  parameter Real THETAP_ex = 0.52 annotation(Dialog(tab = "ESST4B Parameters"));
  //
  parameter Real noVOEL(fixed = false, start = 1) "Constant output value";
initial equation
  noVOEL = Modelica.Constants.inf;
end GENSAE_ESST4B;
