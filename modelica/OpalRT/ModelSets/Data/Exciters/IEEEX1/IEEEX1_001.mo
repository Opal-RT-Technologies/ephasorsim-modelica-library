within OpalRT.ModelSets.Data.Exciters.IEEEX1;
record IEEEX1_001
  extends OpalRT.ModelSets.Data.Exciters.IEEEX1.DataIEEEX1(
    TR_ex=0.025,
    KA_ex=98,
    TA_ex=0.2,
    TB_ex=0.5,
    TC_ex=1,
    VRMAX_ex=9,
    VRMIN_ex=-5,
    KE_ex=0.5,
    TE_ex=0.35,
    KF_ex=0.01,
    TF1_ex=0.4,
    Switch_ex=0,
    E1_ex=4,
    SE_E1_ex=0.4,
    E2_ex=5,
    SE_E2_ex=0.5);
end IEEEX1_001;
