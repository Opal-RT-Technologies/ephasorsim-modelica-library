within OpalRT.ModelSets.Data.Exciters.ESAC8B;
record ESAC8B_001
  extends OpalRT.ModelSets.Data.Exciters.ESAC8B.DataESAC8B(
    TR_ex=0.02,
    KP_ex=100,
    KI_ex=0.8,
    KD_ex=0.8,
    TD_ex=1,
    KA_ex=100,
    TA_ex=0.5,
    VRMAX_ex=9,
    VRMIN_ex=-5,
    TE_ex=0.08,
    KE_ex=0.5,
    E1_ex=4,
    SE_E1_ex=0.4,
    E2_ex=5,
    SE_E2_ex=0.5);
end ESAC8B_001;
