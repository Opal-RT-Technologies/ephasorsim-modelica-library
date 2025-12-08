within OpalRT.ModelSets.Data.Exciters.ESDC2A;
record ESDC2A_001
  extends OpalRT.ModelSets.Data.Exciters.ESDC2A.DataESDC2A(
    TR_ex=0.1,
    KA_ex=400,
    TA_ex=5,
    TB_ex=12,
    TC_ex=10,
    VRMAX_ex=5,
    VRMIN_ex=-5,
    KE_ex=0.5,
    TE_ex=0.08,
    KF_ex=0.2,
    TF1_ex=1.2,
    Switch_ex=0,
    E1_ex=4,
    SE_E1_ex=0.4,
    E2_ex=5,
    SE_E2_ex=0.5);
end ESDC2A_001;
