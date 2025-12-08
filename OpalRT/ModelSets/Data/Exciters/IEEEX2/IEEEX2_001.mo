within OpalRT.ModelSets.Data.Exciters.IEEEX2;
record IEEEX2_001
  extends OpalRT.ModelSets.Data.Exciters.IEEEX2.DataIEEEX2(
    TR_ex=0.025,
    KA_ex=98,
    TA_ex=0.2,
    TB_ex=0.1,
    TC_ex=0.2,
    VRMAX_ex=9,
    VRMIN_ex=-5,
    KE_ex=0.5,
    TE_ex=0.35,
    KF_ex=0.03,
    TF1_ex=0.4,
    TF2_ex=0.4,
    E1_ex=4,
    SE_E1_ex=0.4,
    E2_ex=5,
    SE_E2_ex=0.5);
end IEEEX2_001;
