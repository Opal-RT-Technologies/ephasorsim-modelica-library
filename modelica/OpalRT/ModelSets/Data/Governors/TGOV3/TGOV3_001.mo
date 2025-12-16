within OpalRT.ModelSets.Data.Governors.TGOV3;
record TGOV3_001
  extends DataTGOV3(
    K_tg = 25,
    T1_tg = 0.2,
    T2_tg = 0.00,
    T3_tg = 0.3,
    Uo_tg = 0.1,
    Uc_tg = -0.1,
    PMAX_tg = 1.0,
    PMIN_tg = 0.2,
    T4_tg = 1.0,
    K1_tg = 0.3,
    T5_tg = 0.7,
    K2_tg = 0.2,
    T6_tg = 0.2,
    K3_tg = 0.2,
    TA_tg = 0.2,
    TB_tg = 1.0,
    TC_tg = 4.0,
    PRMAX_tg = 1.1);
end TGOV3_001;
