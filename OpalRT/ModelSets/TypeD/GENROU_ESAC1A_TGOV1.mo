within OpalRT.ModelSets.TypeD;
model GENROU_ESAC1A_TGOV1
  extends GenUnitTypeD1(constVUEL(k=noVUEL), constVOEL(k=noVOEL), redeclare Electrical.Machine.SynchronousMachine.GENROU synchronousGenerator(
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
      S12=S12), redeclare Electrical.Control.Excitation.ESAC1A exciter(
      TR=TR_ex,
      TB=TB_ex,
      TC=TC_ex,
      KA=KA_ex,
      TA=TA_ex,
      VAMAX=VAMAX_ex,
      VAMIN=VAMIN_ex,
      TE=TE_ex,
      KF=KF_ex,
      TF=TF_ex,
      KC=KC_ex,
      KD=KD_ex,
      KE=KE_ex,
      E1=E1_ex,
      SE_E1=SE_E1_ex,
      E2=E2_ex,
      SE_E2=SE_E2_ex,
      VRMAX=VRMAX_ex,
      VRMIN=VRMIN_ex), redeclare Electrical.Control.TurbineGovernor.TGOV1 turbineGovernor(
      R=R_tg,
      T1=T1_tg,
      VMAX=VMAX_tg,
      VMIN=VMIN_tg,
      T2=T2_tg,
      T3=T3_tg,
      Dt=Dt_tg));

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
  // ESAC1A Parameters
  parameter Real TR_ex = 0.1 "(sec)" annotation(Dialog(tab = "ESAC1A Parameters"));
  parameter Real TB_ex = 12 "(sec)" annotation(Dialog(tab = "ESAC1A Parameters"));
  parameter Real TC_ex = 10 "(sec)" annotation(Dialog(tab = "ESAC1A Parameters"));
  parameter Real KA_ex = 400 annotation(Dialog(tab = "ESAC1A Parameters"));
  parameter Real TA_ex = 5 "(sec)" annotation(Dialog(tab = "ESAC1A Parameters"));
  parameter Real VAMAX_ex = 5 annotation(Dialog(tab = "ESAC1A Parameters"));
  parameter Real VAMIN_ex = -5 annotation(Dialog(tab = "ESAC1A Parameters"));
  parameter Real TE_ex = 0.08 "(sec)" annotation(Dialog(tab = "ESAC1A Parameters"));
  parameter Real KF_ex = 0.4 annotation(Dialog(tab = "ESAC1A Parameters"));
  parameter Real TF_ex = 0.2 "(sec)" annotation(Dialog(tab = "ESAC1A Parameters"));
  parameter Real KC_ex = 0.4 annotation(Dialog(tab = "ESAC1A Parameters"));
  parameter Real KD_ex = 0.4 annotation(Dialog(tab = "ESAC1A Parameters"));
  parameter Real KE_ex = 0.5 annotation(Dialog(tab = "ESAC1A Parameters"));
  parameter Real E1_ex = 4 annotation(Dialog(tab = "ESAC1A Parameters"));
  parameter Real SE_E1_ex = 0.4 annotation(Dialog(tab = "ESAC1A Parameters"));
  parameter Real E2_ex = 5 annotation(Dialog(tab = "ESAC1A Parameters"));
  parameter Real SE_E2_ex = 0.5 annotation(Dialog(tab = "ESAC1A Parameters"));
  parameter Real VRMAX_ex = 5 annotation(Dialog(tab = "ESAC1A Parameters"));
  parameter Real VRMIN_ex = -5 annotation(Dialog(tab = "ESAC1A Parameters"));
  // TGOV1 Parameters
  parameter Real R_tg = 0.05 annotation(Dialog(tab = "TGOV1 Parameters"));
  parameter Real T1_tg = 0.5 "(>0) (sec)" annotation(Dialog(tab = "TGOV1 Parameters"));
  parameter Real VMAX_tg = 3 annotation(Dialog(tab = "TGOV1 Parameters"));
  parameter Real VMIN_tg = 0 annotation(Dialog(tab = "TGOV1 Parameters"));
  parameter Real T2_tg = 2.1 annotation(Dialog(tab = "TGOV1 Parameters"));
  parameter Real T3_tg = 7 "(>0) (sec)" annotation(Dialog(tab = "TGOV1 Parameters"));
  parameter Real Dt_tg = 0 annotation(Dialog(tab = "TGOV1 Parameters"));
  //****************************
  parameter Real noVOEL(fixed = false, start = 1) "Constant output value";
  parameter Real noVUEL(fixed = false, start = 1) "Constant output value";
initial equation
  noVOEL = Modelica.Constants.inf;
  noVUEL = -Modelica.Constants.inf;

end GENROU_ESAC1A_TGOV1;
