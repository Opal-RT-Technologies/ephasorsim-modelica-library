within OpalRT.ModelSets.TypeE;
model GENROU_ESST3A_PSS2A
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
      S12=S12), redeclare Electrical.Control.Excitation.ESST3A exciter(
      TR=TR_ex,
      VIMAX=VIMAX_ex,
      VIMIN=VIMIN_ex,
      KM=KM_ex,
      TC=TC_ex,
      TB=TB_ex,
      KA=KA_ex,
      TA=TA_ex,
      VRMAX=VRMAX_ex,
      VRMIN=VRMIN_ex,
      KG=KG_ex,
      KP=KP_ex,
      KI=KI_ex,
      VBMAX=VBMAX_ex,
      KC=KC_ex,
      XL=XL_ex,
      VGMAX=VGMAX_ex,
      THETAP=THETAP_ex,
      TM=TM_ex,
      VMMAX=VMMAX_ex,
      VMMIN=VMMIN_ex), redeclare Electrical.Control.Stabilizer.PSS2A stabilizer(
      TW1=TW1_pss,
      TW2=TW2_pss,
      T6=T6_pss,
      TW3=TW3_pss,
      TW4=TW4_pss,
      T7=T7_pss,
      KS2=KS2_pss,
      KS3=KS3_pss,
      T8=T8_pss,
      T9=T9_pss,
      KS1=KS1_pss,
      T1=T1_pss,
      T2=T2_pss,
      T3=T3_pss,
      T4=T4_pss,
      VSTMAX=VSTMAX_pss,
      VSTMIN=VSTMIN_pss,
      M0=M0_pss,
      M1=M1_pss,
      M2=M2_pss,
      M3=M3_pss,
      M4=M4_pss,
      M5=M5_pss));

  parameter Real partType = 1;
  // GENROU Parameters
  parameter Integer IBUS = 100 "Located system bus" annotation(Dialog(tab = "General"));
  parameter String M_ID = "M1" "Machine Identifier" annotation(Dialog(tab = "GENROU"));
  parameter Real P_gen = 900 "Bus Active Power, MW" annotation(Dialog(tab = "General"));
  parameter Real Q_gen = 200 "Bus Reactive Power, MVAR" annotation(Dialog(tab = "General"));
  parameter Real Vt_abs = 1.03 "Bus Voltage Magnitude, p.u." annotation(Dialog(tab = "General"));
  parameter Real Vt_ang = -10.96 "Bus Voltage Angle, deg." annotation(Dialog(tab = "General"));
  parameter Real SB = 1000 "Machine Base Power, MVA" annotation(Dialog(tab = "General"));
  parameter Real fn = 50 "Nominal frequency" annotation(Dialog(tab = "General"));
  parameter Real ZSOURCE_RE = 0 "Machine source impedence" annotation(Dialog(tab = "GENROU"));
  //parameter Real ZSOURCE_IM = Xq_s "Machine source impedence" annotation(Dialog(tab = "GENROU"));
  parameter Real Tdo_p = 7 "d-axis transient time constant" annotation(Dialog(tab = "GENROU"));
  parameter Real Tdo_s = 0.3 "d-axis sub-transient time constant, s" annotation(Dialog(tab = "GENROU"));
  parameter Real Tqo_p = 0.04 "q-axis transient time constant, s" annotation(Dialog(tab = "GENROU"));
  parameter Real Tqo_s = 0.4 "d-axis sub-transient time constant, s" annotation(Dialog(tab = "GENROU"));
  parameter Real H = 2.6 "Inertia constant" annotation(Dialog(tab = "GENROU"));
  parameter Real D = 0 "Speed damping" annotation(Dialog(tab = "GENROU"));
  parameter Real Xd = 0.67 "d-axis reactance, p.u." annotation(Dialog(tab = "GENROU"));
  parameter Real Xq = 0.62 "q-axis reactance, p.u." annotation(Dialog(tab = "GENROU"));
  parameter Real Xd_p = 0.3 "d-axis transient reactance, p.u." annotation(Dialog(tab = "GENROU"));
  parameter Real Xq_p = 0.3 "q-axis transient reactance, p.u." annotation(Dialog(tab = "GENROU"));
  parameter Real Xd_s = 0.01 "d-axis sub-transient reactance, p.u." annotation(Dialog(tab = "GENROU"));
  //parameter Real Xq_s = Xd_s "q-axis sub-transient reactance, p.u." annotation(Dialog(tab = "GENROU"));
  parameter Real Xl = 0.04 "Reactance due to the leakage flux which does not cross the air gap, p.u." annotation(Dialog(tab = "GENROU"));
  parameter Real S1 = 0.1 "saturation function value for 1 p.u. input" annotation(Dialog(tab = "GENROU"));
  parameter Real S12 = 0.2 "saturation function value for 1.2 p.u. input" annotation(Dialog(tab = "GENROU"));
  // ESST3A parameters
  parameter Real TR_ex = 0.02 "(sec) regulator input filter time constant" annotation(Dialog(tab = "ESST3A"));
  parameter Real VIMAX_ex = 10 "(pu) Voltage regulator input maximum limit" annotation(Dialog(tab = "ESST3A"));
  parameter Real VIMIN_ex = -10 "(pu) Voltage regulator input minimum limit" annotation(Dialog(tab = "ESST3A"));
  parameter Real KM_ex = 0.02 "Forward gain constant of the inner loop field regulator" annotation(Dialog(tab = "ESST3A"));
  parameter Real TC_ex = 1 " lead time constant of voltage regulator (s)" annotation(Dialog(tab = "ESST3A"));
  parameter Real TB_ex = 0.1 " lag time constant of voltage regulator (s)" annotation(Dialog(tab = "ESST3A"));
  parameter Real KA_ex = 10 "(pu) voltage regulator gain" annotation(Dialog(tab = "ESST3A"));
  parameter Real TA_ex = 0.02 "(sec) regulator time constant" annotation(Dialog(tab = "ESST3A"));
  parameter Real VRMAX_ex = 10 "(pu) regulator output maximum limit" annotation(Dialog(tab = "ESST3A"));
  parameter Real VRMIN_ex = -10 "(pu) regulator output minimum limit" annotation(Dialog(tab = "ESST3A"));
  parameter Real KG_ex = 1 "Feedback gain constant of the inner loop field regulator" annotation(Dialog(tab = "ESST3A"));
  parameter Real KP_ex = 1 "Potential circuit gain coefficient" annotation(Dialog(tab = "ESST3A"));
  parameter Real KI_ex = 0.02 "Potential circuit gain coefficient" annotation(Dialog(tab = "ESST3A"));
  parameter Real VBMAX_ex = 10 "(pu) regulator output maximum limit" annotation(Dialog(tab = "ESST3A"));
  parameter Real KC_ex = 1 "Rectifier loading factor proportional to commutating reactance" annotation(Dialog(tab = "ESST3A"));
  parameter Real XL_ex = 0.02 "Reactance associated with potential source" annotation(Dialog(tab = "ESST3A"));
  parameter Real VGMAX_ex = 10 "(pu) regulator output maximum limit" annotation(Dialog(tab = "ESST3A"));
  parameter Real THETAP_ex = 0.52 "Potential circuit phase angle (degrees)" annotation(Dialog(tab = "ESST3A"));
  parameter Real TM_ex = 0.02 "Forward time constant of the inner loop field regulator" annotation(Dialog(tab = "ESST3A"));
  parameter Real VMMAX_ex = 10 "(pu) regulator output maximum limit" annotation(Dialog(tab = "ESST3A"));
  parameter Real VMMIN_ex = -10 "(pu) regulator output minimum limit" annotation(Dialog(tab = "ESST3A"));
  //PSS2A parameters
  parameter Real TW1_pss = 10 ">0" annotation(Dialog(tab = "PSS2A"));
  parameter Real TW2_pss = 10 "To bypass second washout, first signal: set Tw2 = 0" annotation(Dialog(tab = "PSS2A"));
  parameter Real T6_pss = 0 "To bypass first signal transducer: set T6 = 0" annotation(Dialog(tab = "PSS2A"));
  parameter Real TW3_pss = 10 ">0" annotation(Dialog(tab = "PSS2A"));
  parameter Real TW4_pss = 0 "To bypass second washout, second signal: set Tw4 = 0" annotation(Dialog(tab = "PSS2A"));
  parameter Real T7_pss = 10 "To bypass second signal transducer: set T7 = 0" annotation(Dialog(tab = "PSS2A"));
  parameter Real KS2_pss = 1.13 annotation(Dialog(tab = "PSS2A"));
  parameter Real KS3_pss = 1 annotation(Dialog(tab = "PSS2A"));
  parameter Real T8_pss = 0.3;
  parameter Real T9_pss = 0.15 ">0" annotation(Dialog(tab = "PSS2A"));
  parameter Real KS1_pss = 20 annotation(Dialog(tab = "PSS2A"));
  parameter Real T1_pss = 0.16 "To bypass first lead-lag: set T1 = T2 = 0" annotation(Dialog(tab = "PSS2A"));
  parameter Real T2_pss = 0.02 annotation(Dialog(tab = "PSS2A"));
  parameter Real T3_pss = 0.16 "To bypass first lead-lag: set T1 = T2 = 0" annotation(Dialog(tab = "PSS2A"));
  parameter Real T4_pss = 0.02 annotation(Dialog(tab = "PSS2A"));
  parameter Real VSTMAX_pss = 0.2 annotation(Dialog(tab = "PSS2A"));
  parameter Real VSTMIN_pss = -0.066 annotation(Dialog(tab = "PSS2A"));
  parameter Real M0_pss = 1 annotation(Dialog(tab = "PSS2A", group = "ICONs"));
  parameter Real M1_pss = 0 "currently disabled" annotation(Dialog(tab = "PSS2A", group = "ICONs"));
  parameter Real M2_pss = 1 annotation(Dialog(tab = "PSS2A", group = "ICONs"));
  parameter Real M3_pss = 0 "currently disabled" annotation(Dialog(tab = "PSS2A", group = "ICONs"));
  parameter Real M4_pss = 8 ">= 0, To bypass Ramp Tracking Filter: set M = N = 0" annotation(Dialog(tab = "PSS2A", group = "ICONs"));
  parameter Real M5_pss = 8 ">= 0, M*N <= 8" annotation(Dialog(tab = "PSS2A", group = "ICONs"));
  parameter Modelica.Blocks.Types.Init initType = Modelica.Blocks.Types.Init.InitialOutput "Type of initialization (1: no init, 2: steady state, 3,4: initial output)";
  parameter Real y_start = 0 "Initial or guess value of output (= state)";
  //
  parameter Real noVOEL(fixed = false, start = 1);
  parameter Real noVUEL(fixed = false, start = 1) "Constant output value";
initial equation
  noVOEL = 0;
  noVUEL = -Modelica.Constants.inf;

end GENROU_ESST3A_PSS2A;
