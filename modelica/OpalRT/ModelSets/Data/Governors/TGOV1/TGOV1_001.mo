within OpalRT.ModelSets.Data.Governors.TGOV1;
record TGOV1_001
  extends DataTGOV1(
    R_tg = 0.05,
    T1_tg = 0.5,
    VMAX_tg = 3,
    VMIN_tg = 0,
    T2_tg = 2.1,
    T3_tg = 7,
    Dt_tg = 0);
end TGOV1_001;
