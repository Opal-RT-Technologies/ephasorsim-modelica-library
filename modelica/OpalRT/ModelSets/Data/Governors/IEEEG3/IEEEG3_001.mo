within OpalRT.ModelSets.Data.Governors.IEEEG3;
record IEEEG3_001
  extends DataIEEEG3(
    TG_tg = 1,
    TP_tg = 0.5,
    Uo_tg = 0.1,
    Uc_tg = -0.2,
    PMAX_tg = 1,
    PMIN_tg = 0,
    Sigma_tg = 0.4,
    Delta_tg = 0.4,
    TR_tg = 0.2,
    TW_tg = 0,
    a11_tg = 7,
    a13_tg = 0.1,
    a21_tg = 0,
    a23_tg = 0.6);
end IEEEG3_001;
