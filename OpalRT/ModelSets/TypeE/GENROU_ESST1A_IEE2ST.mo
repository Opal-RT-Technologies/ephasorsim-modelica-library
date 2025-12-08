within OpalRT.ModelSets.TypeE;
model GENROU_ESST1A_IEE2ST
  extends GenUnitTypeE1(constVUEL(k=noVUEL), constVOEL(k=noVOEL), redeclare Electrical.Machine.SynchronousMachine.GENROU synchronousGenerator(
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
      S12=S12), redeclare Electrical.Control.Excitation.ESST1A exciter(
      UEL=UEL_ex,
      VOS=VOS_ex,
      TR=TR_ex,
      VIMAX=VIMAX_ex,
      VIMIN=VIMIN_ex,
      TC=TC_ex,
      TB=TB_ex,
      TC1=TC1_ex,
      TB1=TB1_ex,
      KA=KA_ex,
      TA=TA_ex,
      VAMAX=VAMAX_ex,
      VAMIN=VAMIN_ex,
      VRMAX=VRMAX_ex,
      VRMIN=VRMIN_ex,
      KC=KC_ex,
      KF=KF_ex,
      TF=TF_ex,
      KLR=KLR_ex,
      ILR=ILR_ex), redeclare Electrical.Control.Stabilizer.IEE2ST stabilizer(
      K1=K1_pss,
      K2=K2_pss,
      T1=T1_pss,
      T2=T2_pss,
      T3=T3_pss,
      T4=T4_pss,
      T5=T5_pss,
      T6=T6_pss,
      T7=T7_pss,
      T8=T8_pss,
      T9=T9_pss,
      T10=T10_pss,
      LSMAX=LSMAX_pss,
      LSMIN=LSMIN_pss,
      VCU=VCU_pss,
      VCL=VCL_pss,
      M0=M0_pss,
      M1=M1_pss,
      M2=M2_pss,
      M3=M3_pss));

  parameter Real partType = 1;
  // GENROU Parameters
  parameter Integer IBUS = 100 "Located system bus" annotation(Dialog(tab = "General"));
  parameter String M_ID = "M1" "Machine Identifier" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real P_gen = 1000 "Bus Active Power, MW" annotation(Dialog(tab = "General"));
  parameter Real Q_gen = 100 "Bus Reactive Power, MVAR" annotation(Dialog(tab = "General"));
  parameter Real Vt_abs = 0.95 "Bus Voltage Magnitude, p.u." annotation(Dialog(tab = "General"));
  parameter Real Vt_ang = -2 "Bus Voltage Angle, deg." annotation(Dialog(tab = "General"));
  parameter Real SB = 1200 "Machine Base Power, MVA" annotation(Dialog(tab = "General"));
  parameter Real fn = 60 "Nominal frequency" annotation(Dialog(tab = "General"));
  parameter Real ZSOURCE_RE = 0 "Machine source impedence" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Tdo_p = 10.2 "d-axis transient time constant" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Tdo_s = 0.5 "d-axis sub-transient time constant, s" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Tqo_p = 1.02 "q-axis transient time constant, s" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Tqo_s = 0.01 "d-axis sub-transient time constant, s" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real H = 8.2 "Inertia constant" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real D = 0 "Speed damping" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xd = 3 "d-axis reactance, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xq = 0.5 "q-axis reactance, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xd_p = 0.5231 "d-axis transient reactance, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xq_p = 0.361 "q-axis transient reactance, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xd_s = 0.41 "d-axis sub-transient reactance, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real Xl = 0.2 "Reactance due to the leakage flux which does not cross the air gap, p.u." annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real S1 = 0.5 "saturation function value for 1 p.u. input" annotation(Dialog(tab = "GENROU Parameters"));
  parameter Real S12 = 0.6 "saturation function value for 1.2 p.u. input" annotation(Dialog(tab = "GENROU Parameters"));
  // ESST1A parameters
  parameter Real TR_ex = 0.02 "(sec)" annotation(Dialog(tab = "ESST1A Parameters"));
  parameter Real VIMAX_ex = 10 annotation(Dialog(tab = "ESST1A Parameters"));
  parameter Real VIMIN_ex = -10 annotation(Dialog(tab = "ESST1A Parameters"));
  parameter Real TC_ex = 1 "(sec)" annotation(Dialog(tab = "ESST1A Parameters"));
  parameter Real TB_ex = 1 "(sec)" annotation(Dialog(tab = "ESST1A Parameters"));
  parameter Real TC1_ex = 0 "(sec)" annotation(Dialog(tab = "ESST1A Parameters"));
  parameter Real TB1_ex = 0 "(sec)" annotation(Dialog(tab = "ESST1A Parameters"));
  parameter Real KA_ex = 210 annotation(Dialog(tab = "ESST1A Parameters"));
  parameter Real TA_ex = 0 "(sec)" annotation(Dialog(tab = "ESST1A Parameters"));
  parameter Real VAMAX_ex = 10 annotation(Dialog(tab = "ESST1A Parameters"));
  parameter Real VAMIN_ex = -10 annotation(Dialog(tab = "ESST1A Parameters"));
  parameter Real VRMAX_ex = 6.43 annotation(Dialog(tab = "ESST1A Parameters"));
  parameter Real VRMIN_ex = -6 annotation(Dialog(tab = "ESST1A Parameters"));
  parameter Real KC_ex = 0.038 annotation(Dialog(tab = "ESST1A Parameters"));
  parameter Real KF_ex = 0 annotation(Dialog(tab = "ESST1A Parameters"));
  parameter Real TF_ex = 0 "> 0 (sec)" annotation(Dialog(tab = "ESST1A Parameters"));
  parameter Real KLR_ex = 4.54 annotation(Dialog(tab = "ESST1A Parameters"));
  parameter Real ILR_ex = 4.4 annotation(Dialog(tab = "ESST1A Parameters"));
  // ICONS
  parameter Real UEL_ex = 1 "1,2 or 3" annotation(Dialog(tab = "ESST1A Parameters"));
  parameter Real VOS_ex = 1 "1 or 2" annotation(Dialog(tab = "ESST1A Parameters"));
  // IEE2ST Parameters
  parameter Real K1_pss = 1 annotation(Dialog(tab = "IEE2ST Parameters"));
  parameter Real K2_pss = 1 annotation(Dialog(tab = "IEE2ST Parameters"));
  parameter Real T1_pss = 0.1 "(sec)" annotation(Dialog(tab = "IEE2ST Parameters"));
  parameter Real T2_pss = 0.1 "(sec)" annotation(Dialog(tab = "IEE2ST Parameters"));
  parameter Real T3_pss = 0.1 "(sec)" annotation(Dialog(tab = "IEE2ST Parameters"));
  parameter Real T4_pss = 0.1 "(>0) (sec)" annotation(Dialog(tab = "IEE2ST Parameters"));
  parameter Real T5_pss = 0.1 "(sec)" annotation(Dialog(tab = "IEE2ST Parameters"));
  parameter Real T6_pss = 0.1 "(sec)" annotation(Dialog(tab = "IEE2ST Parameters"));
  parameter Real T7_pss = 0.1 "(sec)" annotation(Dialog(tab = "IEE2ST Parameters"));
  parameter Real T8_pss = 0.1 "(sec)" annotation(Dialog(tab = "IEE2ST Parameters"));
  parameter Real T9_pss = 0.1 "(sec)" annotation(Dialog(tab = "IEE2ST Parameters"));
  parameter Real T10_pss = 0.1 "(sec)" annotation(Dialog(tab = "IEE2ST Parameters"));
  parameter Real LSMAX_pss = 1 annotation(Dialog(tab = "IEE2ST Parameters"));
  parameter Real LSMIN_pss = -1 annotation(Dialog(tab = "IEE2ST Parameters"));
  parameter Real VCU_pss = 1 "(pu)(if equal zero, ignored.)" annotation(Dialog(tab = "IEE2ST Parameters"));
  parameter Real VCL_pss = -1 "(pu)(if equal zero, ignored.)" annotation(Dialog(tab = "IEE2ST Parameters"));
  // ICONs
  parameter Real M0_pss = 1 "ICS1, first stabilizer input code" annotation(Dialog(tab = "IEE2ST Parameters", group = "ICONs"));
  parameter Real M1_pss = 2 "IB1, first remote bus number. CURRENLY DISABLED" annotation(Dialog(tab = "IEE2ST Parameters", group = "ICONs"));
  parameter Real M2_pss = 3 "ICS2, second stabilizer input code" annotation(Dialog(tab = "IEE2ST Parameters", group = "ICONs"));
  parameter Real M3_pss = 0 "B2, second remote bus number CURRENLY DISABLED" annotation(Dialog(tab = "IEE2ST Parameters", group = "ICONs"));
  //
  parameter Real noVOEL(fixed = false, start = 1) "Constant output value";
  parameter Real noVUEL(fixed = false, start = 1);

initial equation
  noVOEL = Modelica.Constants.inf;
  noVUEL = if UEL_ex <> 1 then -Modelica.Constants.inf else 0;

end GENROU_ESST1A_IEE2ST;
