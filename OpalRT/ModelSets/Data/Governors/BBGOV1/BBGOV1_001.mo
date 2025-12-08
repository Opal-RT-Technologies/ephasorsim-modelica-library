within OpalRT.ModelSets.Data.Governors.BBGOV1;
record BBGOV1_001
  extends DataBBGOV1(
    fcut_tg = 1,
    KS_tg = 1,
    KLS_tg = 1,
    KG_tg = 1,
    KP_tg = 1,
    TN_tg = 1,
    KD_tg = 0.5,
    TD_tg = 0.5,
    T4_tg = 0.5,
    K2_tg = 1,
    T5_tg = 0.5,
    K3_tg = 1,
    T6_tg = 0.5,
    T1_tg = 0.5,
    SWITCH_tg = 1,
    PMAX_tg = 1,
    PMIN_tg = -1);
end BBGOV1_001;
