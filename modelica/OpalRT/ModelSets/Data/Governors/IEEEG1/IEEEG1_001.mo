within OpalRT.ModelSets.Data.Governors.IEEEG1;
record IEEEG1_001
  extends DataIEEEG1(
    JBUS_tg = 0,
    M_tg = 0,
    K_tg = 15,
    T1_tg = 1.5,
    T2_tg = 0.3,
    T3_tg = 0.02,
    Uo_tg = 0.1,
    Uc_tg = -0.5,
    PMAX_tg = 0.5,
    PMIN_tg = 0,
    T4_tg = 0.1,
    K1_tg = 0.1,
    K2_tg = 0.1,
    T5_tg = 0.2,
    K3_tg = 0.5,
    K4_tg = 0.1,
    T6_tg = 0.1,
    K5_tg = 0.6,
    K6_tg = 0.2,
    T7_tg = 0.3,
    K7_tg = 0.2,
    K8_tg = 0.6);
end IEEEG1_001;
