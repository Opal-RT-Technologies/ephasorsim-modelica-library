within OpalRT.ModelSets.Data.Governors.IEESGO;
record IEESGO_001
  extends DataIEESGO(
    T1_tg = 1,
    T2_tg = 1,
    T3_tg = 1,
    T4_tg = 1,
    T5_tg = 1,
    T6_tg = 1,
    K1_tg = 0.5,
    K2_tg = 0.5,
    K3_tg = 0.5,
    PMAX_tg = 1,
    PMIN_tg = -1);
end IEESGO_001;
