within OpalRT.ModelSets.TypeB;
model GENSAL_ESDC2A
  extends GenUnitTypeB1(constVUEL(k=noVUEL), redeclare Electrical.Machine.SynchronousMachine.GENSAL synchronousGenerator(
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
      S12=S12), redeclare Electrical.Control.Excitation.ESDC2A exciter(
      TR=TR_ex,
      KA=KA_ex,
      TA=TA_ex,
      TB=TB_ex,
      TC=TC_ex,
      VRMAX=VRMAX_ex,
      VRMIN=VRMIN_ex,
      KE=KE_ex,
      KF=KF_ex,
      TF1=TF1_ex,
      Switch=Switch_ex,
      E1=E1_ex,
      SE_E1=SE_E1_ex,
      E2=E2_ex,
      SE_E2=SE_E2_ex,
      TE=TE_ex));

  parameter Real partType = 1;
  //GENSAL
  parameter Integer IBUS = 100 "Located system bus";
  parameter String ID = "M1" "Machine Identifier";
  parameter Real P_gen = 1100 "Bus Active Power, MW";
  parameter Real Q_gen = 342.702 "Bus Reactive Power, MVAR";
  parameter Real Vt_abs = 1.03 "Bus Voltage Magnitude, p.u.";
  parameter Real Vt_ang = -10.96 "Bus Voltage Angle, deg.";
  parameter Real SB = 1000 "Machine Base Power, MVA";
  parameter Real fn = 50 "Nominal frequency";
  parameter Real ZSOURCE_RE = 0 "Machine source impedence";
  parameter Real Tdo_p = 7 "d-axis transient time constant";
  parameter Real Tdo_s = 0.03 "d-axis sub-transient time constant, s";
  parameter Real Tqo_s = 0.04 "d-axis sub-transient time constant, s";
  parameter Real H = 50 "Inertia constant";
  parameter Real D = 0 "Speed damping";
  parameter Real Xd = 0.2 "d-axis reactance, p.u.";
  parameter Real Xq = 0.19 "q-axis reactance, p.u.";
  parameter Real Xd_p = 0.06 "d-axis transient reactance, p.u.";
  parameter Real Xd_s = 0.02 "d-axis sub-transient reactance, p.u.";
  parameter Real Xl = 0.03 "Reactance due to the leakage flux which does not cross the air gap, p.u.";
  parameter Real S1 = 0.4 "saturation function value for 1 p.u. input";
  parameter Real S12 = 0.8 "saturation function value for 1.2 p.u. input";
  parameter Real ZSOURCE_IM = Xd_s "Machine source impedence";
  //ESDC1A
  parameter Real TR_ex = 0.1 "(sec)" annotation(Dialog(tab = "ESDC1A parameters"));
  parameter Real KA_ex = 400 annotation(Dialog(tab = "ESDC1A parameters"));
  parameter Real TA_ex = 5 "(sec)" annotation(Dialog(tab = "ESDC1A parameters"));
  parameter Real TB_ex = 12 "(sec)" annotation(Dialog(tab = "ESDC1A parameters"));
  parameter Real TC_ex = 10 "(sec)" annotation(Dialog(tab = "ESDC1A parameters"));
  parameter Real VRMAX_ex = 5 "or zero" annotation(Dialog(tab = "ESDC1A parameters"));
  parameter Real VRMIN_ex = -5 annotation(Dialog(tab = "ESDC1A parameters"));
  parameter Real KE_ex = 0.5 "or zero" annotation(Dialog(tab = "ESDC1A parameters"));
  parameter Real TE_ex = 0.08 "(sec)" annotation(Dialog(tab = "ESDC1A parameters"));
  parameter Real KF_ex = 0.2 annotation(Dialog(tab = "ESDC1A parameters"));
  parameter Real TF1_ex = 1.2 "(>0) (sec)" annotation(Dialog(tab = "ESDC1A parameters"));
  parameter Real Switch_ex = 0 annotation(Dialog(tab = "ESDC1A parameters"));
  parameter Real E1_ex = 4 annotation(Dialog(tab = "ESDC1A parameters"));
  parameter Real SE_E1_ex = 0.4 annotation(Dialog(tab = "ESDC1A parameters"));
  parameter Real E2_ex = 5 annotation(Dialog(tab = "ESDC1A parameters"));
  parameter Real SE_E2_ex = 0.5 annotation(Dialog(tab = "ESDC1A parameters"));
  //
  parameter Real noVUEL(fixed = false, start = 1) "Constant output value";
initial equation
  noVUEL = -Modelica.Constants.inf;
end GENSAL_ESDC2A;
