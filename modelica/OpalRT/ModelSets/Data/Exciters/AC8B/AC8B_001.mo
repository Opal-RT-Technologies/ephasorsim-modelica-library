within OpalRT.ModelSets.Data.Exciters.AC8B;
record AC8B_001
  extends OpalRT.ModelSets.Data.Exciters.AC8B.DataAC8B(
    TR_ex=0.02,
    KPR_ex=10,
    KIR_ex=0.01,
    KDR_ex=2,
    TDR_ex=2,
    VPIDMAX_ex=1,
    VPIDMIN_ex=-1,
    KA_ex=10,
    TA_ex=0.02,
    VRMAX_ex=10,
    VRMIN_ex=-10,
    KC_ex=0.02,
    KD_ex=0.02,
    KE_ex=1,
    TE_ex=0.02,
    VFEMAX_ex=10,
    VEMIN_ex=-10,
    E1_ex=4,
    SE_E1_ex=0.4,
    E2_ex=5,
    SE_E2_ex=0.5);
end AC8B_001;
