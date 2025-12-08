within OpalRT.ModelSets.TypeD;
model GENROU_ST6B_IEEEG1
  extends GenUnitTypeD1(constVUEL(k=noVUEL), redeclare Electrical.Machine.SynchronousMachine.GENROU synchronousGenerator(
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
      Tqo_p=Tqo_p,
      Tqo_s=Tqo_s,
      H=H,
      D=D,
      Xd=Xd,
      Xq=Xq,
      Xd_p=Xd_p,
      Xq_p=Xq_p,
      Xd_s=Xd_s,
      Xl=Xl,
      S1=S1,
      S12=S12), redeclare Electrical.Control.Excitation.ST6B exciter(
      TR=TR_ex,
      KPA=KPA_ex,
      KIA=KIA_ex,
      KDA=KDA_ex,
      TDA=TDA_ex,
      VAMAX=VAMAX_ex,
      VAMIN=VAMIN_ex,
      KFF=KFF_ex,
      KM=KM_ex,
      KCI=KCI_ex,
      KLR=KLR_ex,
      ILR=ILR_ex,
      VRMAX=VRMAX_ex,
      VRMIN=VRMIN_ex,
      KG=KG_ex,
      TG=TG_ex,
      OEL=OEL_ex), redeclare Electrical.Control.TurbineGovernor.IEEEG1 turbineGovernor(
      IBUS=100,
      ID=M_ID,
      K=K_tg,
      T1=T1_tg,
      T2=T2_tg,
      T3=T3_tg,
      Uo=Uo_tg,
      Uc=Uc_tg,
      PMAX=PMAX_tg,
      PMIN=PMIN_tg,
      T4=T4_tg,
      K1=K1_tg,
      K2=K2_tg,
      T5=T5_tg,
      K3=K3_tg,
      K4=K4_tg,
      T6=T6_tg,
      K5=K5_tg,
      K6=K6_tg,
      T7=T7_tg,
      K7=K7_tg,
      K8=K8_tg,
      JBUS=JBUS_tg,
      M=M_tg));

  parameter Real partType = 1;
  // GENROU Parameters
  parameter Integer IBUS = 100 "Located system bus" annotation(Dialog(tab = "General"));
  parameter String M_ID = "M1" "Machine Identifier" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real P_gen = 1100 "Bus Active Power, MW" annotation(Dialog(tab = "General"));
  parameter Real Q_gen = 342.702 "Bus Reactive Power, MVAR" annotation(Dialog(tab = "General"));
  parameter Real Vt_abs = 1.03 "Bus Voltage Magnitude, p.u." annotation(Dialog(tab = "General"));
  parameter Real Vt_ang = -10.96 "Bus Voltage Angle, deg." annotation(Dialog(tab = "General"));
  parameter Real SB = 1000 "Machine Base Power, MVA" annotation(Dialog(tab = "General"));
  parameter Real fn = 50 "Nominal frequency" annotation(Dialog(tab = "General"));
  parameter Real ZSOURCE_RE = 0 "Machine source impedence" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Tdo_p = 7 "d-axis transient time constant" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Tdo_s = 0.03 "d-axis sub-transient time constant, s" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Tqo_p = 0.7 "q-axis transient time constant, s" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Tqo_s = 0.04 "d-axis sub-transient time constant, s" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real H = 50 "Inertia constant" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real D = 0 "Speed damping" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xd = 0.2 "d-axis reactance, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xq = 0.19 "q-axis reactance, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xd_p = 0.06 "d-axis transient reactance, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xq_p = 0.06 "q-axis transient reactance, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xd_s = 0.02 "d-axis sub-transient reactance, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xl = 0.03 "Reactance due to the leakage flux which does not cross the air gap, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real S1 = 0.4 "saturation function value for 1 p.u. input" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real S12 = 0.8 "saturation function value for 1.2 p.u. input" annotation(Dialog(tab = "GENROU Parameters"));
  // This Model is located at system bus IBUS
  parameter Real TR_ex = 0.012 "(sec)";
  parameter Real KPA_ex = 18.038;
  parameter Real KIA_ex = 45.094;
  parameter Real KDA_ex = 0;
  parameter Real TDA_ex = 0;
  parameter Real VAMAX_ex = 4.81;
  parameter Real VAMIN_ex = -3.85;
  parameter Real KFF_ex = 1;
  parameter Real KM_ex = 1;
  parameter Real KCI_ex = 1.0577;
  parameter Real KLR_ex = 17.33;
  parameter Real ILR_ex = 4.164;
  parameter Real VRMAX_ex = 4.81;
  parameter Real VRMIN_ex = -3.85;
  parameter Real KG_ex = 1;
  parameter Real TG_ex = 0.02;
  parameter Real OEL_ex = 1;
  // IEEEG1 Parameters
  parameter Real JBUS_tg = 0 "Bus Identifier (NOT USED)" annotation(Dialog(tab = "IEEEG1"));
  parameter Real M_tg = 0 "Machine Identifier (NOT USED)" annotation(Dialog(tab = "IEEEG1"));
  parameter Real K_tg = 15 annotation(Dialog(tab = "IEEEG1"));
  parameter Real T1_tg = 1.5 "(sec)" annotation(Dialog(tab = "IEEEG1"));
  parameter Real T2_tg = 0.3 "(sec)" annotation(Dialog(tab = "IEEEG1"));
  parameter Real T3_tg = 0.02 "(>0)(sec)" annotation(Dialog(tab = "IEEEG1"));
  parameter Real Uo_tg = 0.1 "(pu/sec)" annotation(Dialog(tab = "IEEEG1"));
  parameter Real Uc_tg = -0.5 "(<0)(pu/sec)" annotation(Dialog(tab = "IEEEG1"));
  parameter Real PMAX_tg = 0.5 "(pu on machine MVA rating)" annotation(Dialog(tab = "IEEEG1"));
  parameter Real PMIN_tg = 0 "(pu on machine MVA rating)" annotation(Dialog(tab = "IEEEG1"));
  parameter Real T4_tg = 0.1 "(sec)" annotation(Dialog(tab = "IEEEG1"));
  parameter Real K1_tg = 0.1 annotation(Dialog(tab = "IEEEG1"));
  parameter Real K2_tg = 0.1 annotation(Dialog(tab = "IEEEG1"));
  parameter Real T5_tg = 0.2 "(sec)" annotation(Dialog(tab = "IEEEG1"));
  parameter Real K3_tg = 0.5 annotation(Dialog(tab = "IEEEG1"));
  parameter Real K4_tg = 0.1 annotation(Dialog(tab = "IEEEG1"));
  parameter Real T6_tg = 0.1 "(sec)" annotation(Dialog(tab = "IEEEG1"));
  parameter Real K5_tg = 0.6 annotation(Dialog(tab = "IEEEG1"));
  parameter Real K6_tg = 0.2 annotation(Dialog(tab = "IEEEG1"));
  parameter Real T7_tg = 0.3 "(sec)" annotation(Dialog(tab = "IEEEG1"));
  parameter Real K7_tg = 0.2 annotation(Dialog(tab = "IEEEG1"));
  parameter Real K8_tg = 0.6 annotation(Dialog(tab = "IEEEG1"));
  //
  parameter Real noVUEL(fixed = false, start = 1) "Constant output value";
initial equation
  noVUEL = -Modelica.Constants.inf;

end GENROU_ST6B_IEEEG1;
