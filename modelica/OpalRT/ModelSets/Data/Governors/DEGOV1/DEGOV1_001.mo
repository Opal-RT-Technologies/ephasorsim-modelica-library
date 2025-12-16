within OpalRT.ModelSets.Data.Governors.DEGOV1;
record DEGOV1_001
  extends DataDEGOV1(
    M_tg = 1,
    T1_tg = 0,
    T2_tg = 0,
    T3_tg = 1,
    K_tg = 0.8,
    T4_tg = 0.1,
    T5_tg = 0.8,
    T6_tg = 0.25,
    TD_tg = 0.04,
    TMAX_tg = 2.0,
    TMIN_tg = 0.5,
    DROOP_tg = 0.2,
    TE_tg = 0.007);
end DEGOV1_001;
