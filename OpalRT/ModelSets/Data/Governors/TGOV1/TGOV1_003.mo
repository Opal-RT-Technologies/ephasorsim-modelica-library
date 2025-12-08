within OpalRT.ModelSets.Data.Governors.TGOV1;
record TGOV1_003
  extends DataTGOV1(
    R_tg = 0.01,
    T1_tg = 0.01,
    VMAX_tg = 1,
    VMIN_tg = -1,
    T2_tg = 0.01,
    T3_tg = 0.01,
    Dt_tg = 1);
end TGOV1_003;
