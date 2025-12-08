within OpalRT.ModelSets.Data.Governors.WESGOV;
record WESGOV_001
  extends DataWESGOV(
    delTC_tg = 0.1,
    delTP_tg = 0.1,
    Droop_tg = 0.05,
    Kp_tg = 15,
    TI_tg = 1.0,
    T1_tg = 0.1,
    T2_tg = 0.25,
    ALIM_tg = 0.2,
    Tpe_tg = 0.1,
    DELTA_tg = 0.01);
end WESGOV_001;
